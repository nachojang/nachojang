package com.example.nachojang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.PaymentMapper;
import com.example.nachojang.vo.Payment;

@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;

	// 세영) 고객 배송 상태 변경
	// 세영) customer
	
	// 세영) 관리자 배송 상태 변경
	// 세영)/staff/on/modifyState"
	public Integer getModifyPaymentState(Integer paymentNo, String paymentState) {
				
		Payment payment = new Payment();
		payment.setPaymentNo(paymentNo);
		payment.setPaymentState(paymentState);
		
		return paymentMapper.updatePaymentState(payment);
	}
	
	
}
