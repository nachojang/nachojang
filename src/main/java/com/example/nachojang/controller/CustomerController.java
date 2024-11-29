package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.CustomerService;
import com.example.nachojang.service.OrdersService;
import com.example.nachojang.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrdersService ordersService;
    
    // 우림) 고객 마이페이지
    @GetMapping("/customer/on/my")
    public String myPage(Model model, @RequestParam String customerMail) {
        	
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