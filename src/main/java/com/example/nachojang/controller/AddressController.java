package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping ("/customer/on/insertAddress")
	public String addAddress(HttpSession session, Model model) {
		String customerMail =(String)session.getAttribute("loginCustomer");
		model.addAttribute("customerMail", customerMail);
		return "customer/on/addAddress";
	}
	
	@PostMapping ("/customer/on/addAddress")
	public String insertAddress(Address address, HttpSession session) {
		String customerMail =(String)session.getAttribute("loginCustomer");
		int row = addressService.insertAddress(address);
		if(row == 0) {
			return "customer/on/addAddress";
		}		
		return "redirect:/customer/on/my?customerMail="+customerMail;
	}
}