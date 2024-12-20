package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.mapper.CustomerMapper;
import com.example.nachojang.service.CustomerService;
import com.example.nachojang.service.OrdersService;
import com.example.nachojang.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrdersService ordersService;
    
    
    // 우림) 회원탈퇴
    @PostMapping("/customer/on/deleteCustomer")
    public String deleteCustomer(HttpSession session, String customerPw) {
    	String customerMail = (String)session.getAttribute("loginCustomer");
    	Map<String, Object> loginCustomer = new HashMap<>();
    	loginCustomer.put("customerMail", customerMail);
    	loginCustomer.put("customerPw", customerPw);
    	customerService.deleteCustomer(loginCustomer);
    	return "redirect:/customer/off/customerLogin";
    }
    
    // 우림) 고객 마이페이지 -> 회원탈퇴
    @GetMapping("/customer/on/deleteCustomer")
    public String deleteCustomer() {
    	return "customer/on/deleteCustomer";
    }
    
    // 우림) 회원정보수정(비밀번호)
    @PostMapping("/customer/on/modifyMyByPw")
    public String modifyMyByPw(HttpSession session, String newPw, String prePw) {
    	String customerMail = (String)session.getAttribute("loginCustomer");
    	Map<String, Object> loginCustomer = new HashMap<>();
    	loginCustomer.put("newPw", newPw);
    	loginCustomer.put("prePw", prePw);
    	loginCustomer.put("customerMail", customerMail);
    	customerService.modifyMyByPw(loginCustomer);
    	return "redirect:/customer/on/my?customerMail=" + customerMail;
    }
    
    // 우림) 고객 마이페이지 -> 회원정보수정(비밀번호)
    @GetMapping("/customer/on/modifyMyByPw")
    public String modifyMyByPw() {
    	return "customer/on/modifyMyByPw";
    }
    
    // 고객 마이페이지
    @GetMapping("/customer/on/my")
    public String myPage(Model model, HttpSession session, @RequestParam String customerMail) {
    	
    	// 우림) 고객 총 주문 건수
    	Integer totalOrederCount = customerService.selectTotalOrdersByCustomerMail(customerMail);
    	model.addAttribute("totalOrederCount", totalOrederCount);
    	
    	// 우림) 고객 정보 조회 (메일, 성별), 정보 수정(비밀번호)
    	session.getAttribute("loginCustomer");
    	Customer customer = customerService.selectCustomer((String)session.getAttribute("loginCustomer"));
    	model.addAttribute("customer", customer);
        	
    	// 세영) 최신 주문 목록 가져오기
    	List<Map<String, Object>> latestOrdersList = ordersService.getLatestOrdersList(customerMail);
    	log.debug("latestOrdersList : "+ latestOrdersList);
    	
    	// 세영) 최신 주문 목록을 모델에 추가
    	model.addAttribute("latestOrdersList", latestOrdersList);
    	model.addAttribute("customerMail", customerMail);
    	
    	return "customer/on/my";
    }
    
    // 우림) 고객 회원가입 메일 중복체크 : customer/off/mailCheck
    @PostMapping("/customer/off/mailCheck")
    public String mailCheck(Model model, @RequestParam String mailCheck) {
    	
    	// 메일 중복 시
    	String check = customerService.mailCheck(mailCheck);
    	if(check != null) {
    		model.addAttribute("msg", "중복입니다");
    		return "customer/off/addCustomer";
    	}
    	
    	// 메일 중복 아닐 시
    	model.addAttribute("mailCheck", mailCheck);
    	return "customer/off/addCustomer";
    }
    
    // 우림) 고객 회원가입 액션
    @PostMapping("/customer/off/addCustomer")
    public String addCustomer(Customer customer) {
    	// 서비스 호출
    	int row = customerService.addCustomer(customer);
    	if(row == 0) { // 추가 안됐으면 다시 입력페이지로
    		return "customer/off/addCustomer";
    	}
    	return "redirect:/customer/off/customerLogin";
    }
    
    // 우림) 고객 회원가입 뷰
    @GetMapping("/customer/off/addCustomer")
    public String addCustomer() {
    	return "customer/off/addCustomer";
    }
    
    //리스트 페이징
    @GetMapping("/staff/on/customerList")
    public String customerList(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int rowPerPage,
            @RequestParam(defaultValue = "") String searchMail,
            Model model) {

        Map<String, Object> resultMap = customerService.getCustomerList(page, rowPerPage, searchMail);

        model.addAttribute("customers", resultMap.get("customerList"));
        model.addAttribute("totalPages", resultMap.get("totalPages"));
        model.addAttribute("currentPage", resultMap.get("currentPage"));
        model.addAttribute("searchMail", searchMail); // Update to reflect the new search parameter

        return "staff/on/customerList"; // JSP 페이지 경로
    }
}