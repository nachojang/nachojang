package com.example.nachojang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.CartMapper;
import com.example.nachojang.mapper.OrdersMapper;
import com.example.nachojang.mapper.PaymentMapper;
import com.example.nachojang.vo.Orders;
import com.example.nachojang.vo.Payment;

@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired CartMapper cartMapper;
	@Autowired OrdersMapper ordersMapper;
	
	// 세영) 결제 완료 시 orders payment 생성, cart 삭제
	// /customer/on/addPayemnt
	public Integer addPayment(Payment payment, List<Integer> cartNo) {
		Integer paymentRow = paymentMapper.insertPayment(payment);
		Integer paymentNo = payment.getPaymentNo();
		if( paymentRow == 1) {
			Integer count = 0;
			for(Integer c : cartNo) {
				// 장바구니에서 선택된 항목들의 정보를 가져와서 Orders 객체에 저장
				Map<String, Object> cart = cartMapper.selectSelectedCart(c);
				Orders orders = new Orders();
				orders.setGoodsNo((Integer)cart.get("goodsNo"));
				orders.setOrdersAmount((Integer)cart.get("cartAmount"));
				orders.setPaymentNo(paymentNo);
				// orders 테이블에 결제 정보 추가
				count += ordersMapper.insertOrders(orders);
			}
			if(count == cartNo.size()) {
				count = 0;
				for(Integer c : cartNo) {
					count += cartMapper.getRemoveCart(c);
				}
			}
		}
		
		return paymentNo;
	}
	
	// 세영) 결제 완료 창
	// /customer/on/completePayment
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
