package com.example.nachojang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.PaymentMapper;
import com.example.nachojang.vo.Payment;

@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;

	// 세영) 결제 완료 창
	// /customer/on/payment
	public List<Map<String, Object>> completePayment(Integer paymentNo) {
		
		return paymentMapper.completePayment(paymentNo);
	}
	
	// 세영) 배송 상태 변경
	// 세영) /staff/on/modifyState"
	public Integer getModifyPaymentState(Integer paymentNo, String paymentState) {
				
		Payment payment = new Payment();
		payment.setPaymentNo(paymentNo);
		payment.setPaymentState(paymentState);
		
		return paymentMapper.updatePaymentState(payment);
	}
	
	
}
