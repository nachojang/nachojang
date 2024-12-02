package com.example.nachojang.controller;

import java.util.List;
import java.util.Map;

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
	@Autowired PaymentService paymentService;

	// 세영) 결제 완료 창
	@GetMapping("/customer/on/payment")
	public String completePayment(@RequestParam Integer paymentNo
								, Model model) {
		
		// 결제리스트 가져오기
		List<Map<String, Object>> paymentList = paymentService.completePayment(paymentNo);
		
		// 디버깅
		log.debug("paymentList : " + paymentList);
		
		// 모델에 추가
		model.addAttribute("paymentList", paymentList);
		
		return "customer/on/payment";
	}
	
	// 세영) 고객 배송 상태 변경
	@GetMapping("/customer/on/modifyState")
	public String modifyStateByCustomerMail(@RequestParam Integer paymentNo
										, @RequestParam String customerMail
										, @RequestParam String paymentState
										,Model model) {
		
		// 파라미터값 디버깅
		log.debug("paymentNo : " + paymentNo);
		log.debug("customerMail : " + customerMail);
		log.debug("paymentState : " + paymentState);
		
		if( paymentState.equals("배송중")) { // 배송중일시 --> 배송완료로 변환
		paymentState = "배송완료";
		}
	
		// 수정 메서드 실행
		paymentService.getModifyPaymentState(paymentNo, paymentState);
		
		// 모델에 추가
		model.addAttribute("customerMail", customerMail);
		
		// 업데이트 후 페이지 리디렉션 또는 다른 페이지로 이동
		return "redirect:/customer/on/ordersList?customerMail=" + customerMail;
	}

	// 세영) 스태프 배송 상태 변경
	@GetMapping("/staff/on/modifyState")
	public String modifyState(@RequestParam Integer paymentNo, @RequestParam String paymentState) {

		if (paymentState.equals("결제완료")) { // 결제완료시 배송중으로 
			paymentState = "배송중";
		} else if (paymentState.equals("배송중")) { // 배송중일시 배송완료로
			paymentState = "배송완료";
		}
		
		// 수정 메서드 실행
		paymentService.getModifyPaymentState(paymentNo, paymentState); // Service 호출

		// 업데이트 후 페이지 리디렉션 또는 다른 페이지로 이동
		return "redirect:/staff/on/ordersList";
	}
}