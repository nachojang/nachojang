package com.example.nachojang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.OrdersMapper;

@Service
@Transactional
public class OrdersService {
	@Autowired OrdersMapper ordersMapper;
	
	// 세영) 전체 주문 목록
	public List<Map<String, Object>> getOrdersList() {
		
		return ordersMapper.selectOrdersList();
	}
	
	// 세영) payment 안에 있는 주문목록
	// /customer/on/ordersOne
	public List<Map<String, Object>> getSelectOrderListByPayment(Integer paymentNo) {
		
		return ordersMapper.selectOrderListByPayment(paymentNo); 
	}
	
	
	// 세영) 고객의 최신 주문 내역 3개
	// /customer/on/my
	public List<Map<String, Object>> getLatestOrdersList(String customerMail) {
		
		return ordersMapper.selectLatestOrdersByCustomerMail(customerMail);
	}
	
	// 세영) 마지막 페이지
	// /customer/on/ordersList
	public Integer getLastPage(String customerMail) {
		Integer totalCount = ordersMapper.selectTotalOrdersByCustomerMail(customerMail);
		
		// 계산된 마지막 페이지 번호로 반환
		return totalCount;
	}
	
	// 세영) 고객의 전체 주문 목록
		// /customer/on/ordersList
		public List<Map<String, Object>> getOrdersListByCustomerMail(String customerMail) {
			
			return ordersMapper.selectOrdersListByCustomerMail(customerMail);
		}

}
