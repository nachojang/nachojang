package com.example.nachojang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaffController {

	@GetMapping("/staff/off/staffLogin")
	public String getMethodName() {
		return "staff/off/staffLogin";
	}
}
