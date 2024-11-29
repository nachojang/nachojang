package com.example.nachojang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AddressController {

	// 고객의 주소 리스트
	@GetMapping("/customer/on/addressList")
	public String addressList(Model model, @RequestParam String customerMail) {
		
		// List<Map<String, Object>> add
		
		return "customer/on/addressList";
	}
}
