package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.CustomerService;
import com.example.nachojang.service.StaffService;
import com.example.nachojang.vo.Customer;
import com.example.nachojang.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	@Autowired StaffService staffService;
	@Autowired CustomerService customerService;
	
	// 우림) 고객 로그아웃
    @GetMapping("/customer/on/customerLogout")
    public String customerLogout(HttpSession session) {
        session.invalidate();

        return "redirect:/customer/off/customerLogin";
    }
    
	// 우림) 고객 로그인 액션
    @PostMapping("/customer/off/customerLogin")
    public String customerLogin(Model model
			    				, HttpSession session
			    				, @RequestParam(name = "customerMail") String customerMail
			    				, @RequestParam(name = "customerPw") String customerPw) {

        // 입력값을 Customer로 맵핑
        Customer customer = new Customer();
        customer.setCustomerMail(customerMail);
        customer.setCustomerPw(customerPw);

        // 서비스 호출
        Customer loginCustomer = customerService.customerLogin(customer);

        // 로그인 실패 시
        if (loginCustomer == null) {
            log.debug("로그인 실패: 잘못된 ID 또는 비밀번호");
            model.addAttribute("msg", "잘못된 ID 또는 비밀번호입니다.");
            return "customer/off/customerLogin";
        }

        // 로그인 성공 시 세션 저장 후 홈 이동
        session.setAttribute("loginCustomer", loginCustomer);
        log.debug("로그인 성공 ---> " + loginCustomer.getCustomerMail());
        
        return "redirect:/customer/main";
    }
    
    // 우림) 고객 로그인 폼
    @GetMapping("/customer/off/customerLogin")
    public String customerLogin() {
        
        return "customer/off/customerLogin";
    }
	
	// 정우) 스태프 로그아웃
    @GetMapping("/staff/on/logout")
    public String staffLogout(HttpSession session) {
        session.invalidate();

        return "redirect:/staff/off/staffLogin";
    }
	
	// 정우) 스태프 로그인 처리 (POST 요청)
    @PostMapping("/staff/off/staffLogin")
    public String staffLogin(Model model
    				, HttpSession session
    				, @RequestParam(name = "staffId") String staffId
    				, @RequestParam(name = "staffPw") String staffPw) {
        
    	log.debug("로그인 시도: staffId={}", staffId);

        // 입력값을 Staff 객체로 매핑
        Staff paramStaff = new Staff();
        paramStaff.setStaffId(staffId);
        paramStaff.setStaffPw(staffPw);

        // 서비스 호출
        Staff loginStaff = staffService.login(paramStaff);

        // 로그인 실패 시 처리
        if (loginStaff == null) {
            log.debug("로그인 실패: 잘못된 ID 또는 비밀번호");
            model.addAttribute("msg", "잘못된 ID 또는 비밀번호입니다.");
            return "staff/off/staffLogin";
        }

        // 로그인 성공 시 세션에 저장 (속성명: loginStaff)
        session.setAttribute("loginStaff", loginStaff);
        log.debug("로그인 성공: staffId={}, 세션 loginStaff 속성 추가", loginStaff.getStaffId());

        // 로그인 성공 후 메인 페이지로 리다이렉트
        return "redirect:/staff/on/main";
    }
    
    // 정우) 스태프 로그인 폼 (GET 요청)
    @GetMapping("/staff/off/staffLogin")
    public String staffLogin() {
        
        return "staff/off/staffLogin";
    }
}
