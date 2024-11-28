package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.CustomerService;

import java.util.Map;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    
    // 우림) 고객 회원가입
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