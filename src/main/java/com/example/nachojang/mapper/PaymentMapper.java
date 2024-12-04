package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Payment;
	
@Mapper
public interface PaymentMapper {
	
	// 세영) 결제 완료
	Integer insertPayment(Payment payment);
	
	// 세영) 결제완료창
	List<Map<String, Object>> completePayment(Integer paymentNo); 
	
	// 세영) 배송현황 수정
	Integer updatePaymentState(Payment payment);
	
}
