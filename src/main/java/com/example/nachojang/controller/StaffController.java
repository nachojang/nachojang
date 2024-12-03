package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.nachojang.service.StaffService;
import com.example.nachojang.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
    @Autowired StaffService staffService;
    
    // 정우) 스테프 홈
    @GetMapping("/staff/on/main")
    public String main(HttpSession session, Model model) {
        String staffLogin = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
        		
    	model.addAttribute("staffLogin", staffLogin);
    	return "staff/on/main"; 
    }
    
}