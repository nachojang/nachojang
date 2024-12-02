package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	@Autowired
	PaymentService paymentService;

	// 세영) 고객 배송 상태 변경
	@GetMapping("/customer/on/modifyState")
	public String modifyStateByCustomerMail(@RequestParam Integer paymentNo
										, @RequestParam String customerMail
										, @RequestParam String paymentState
										,Model model) {
		
		log.debug("paymentNo : " + paymentNo);
		log.debug("customerMail : " + customerMail);
		log.debug("paymentState : " + paymentState);
		
		if( paymentState.equals("배송중")) {
		paymentState = "배송완료";
		}
	
	paymentService.getModifyPaymentState(paymentNo, paymentState);  // Service 호출
	
	model.addAttribute("customerMail", customerMail);
	
	
	// 업데이트 후 페이지 리디렉션 또는 다른 페이지로 이동
	return "redirect:/customer/on/ordersList?customerMail=" + customerMail;
	}

	// 세영) 스태프 배송 상태 변경
	@GetMapping("/staff/on/modifyState")
	public String modifyState(@RequestParam Integer paymentNo, @RequestParam String paymentState) {

		if (paymentState.equals("결제완료")) {
			paymentState = "배송중";
		} else if (paymentState.equals("배송중")) {
			paymentState = "배송완료";
		}

		paymentService.getModifyPaymentState(paymentNo, paymentState); // Service 호출

		// 업데이트 후 페이지 리디렉션 또는 다른 페이지로 이동
		return "redirect:/staff/on/ordersList";
	}
}