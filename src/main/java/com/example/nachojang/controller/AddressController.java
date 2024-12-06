package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.AddressService;
import com.example.nachojang.service.CustomerService;
import com.example.nachojang.vo.Address;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AddressController {

	@Autowired CustomerService customerService;
	@Autowired AddressService addressService;
	
	
	// 고객의 주소 리스트
	@GetMapping("/customer/on/addressList")
	public String addressList(Model model, @RequestParam String customerMail) {
		
		// List<Map<String, Object>> add
		
		return "customer/on/addressList";
	}
	
	
	@GetMapping ("/customer/on/insertAddress")
	public String addAddress(HttpSession session , Model model) {
		String customerMail =(String)session.getAttribute("loginCustomer");
		model.addAttribute("customerMail", customerMail);
		return "customer/on/addAddress";
	}
	
	
	@PostMapping ("/customer/on/addAddress")
	public String insertAddress(Address address) {
		int row = addressService.insertAddress(address);
		if(row == 0) {
			return "customer/on/addAddress";
		}		
		return "redirect:/customer/on/ordersPayment";
	}
}