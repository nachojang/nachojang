package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Orders;

@Mapper
public interface OrdersMapper {
	// 세영) 전체 주문 내역 총 개수
	Integer selectTotalOrders();
	
	// 세영) 결체 완료시 주문 내역 추가
	Integer insertOrders(Orders orders);
	
	// 세영) 전체 주문 내역
	List<Map<String, Object>> selectOrdersList(Map<String,Object> paramap);
	
	// 세영) payment 안에 있는 주문목록
	List<Map<String, Object>> selectOrderListByPayment(Integer paymentNo);
	
	// 세영) 고객의 최신 주문 내역 3개
	List<Map<String, Object>> selectLatestOrdersByCustomerMail(String customerMail);
	
	// 세영) 고객의 총 주문 내역 개수
	Integer selectTotalOrdersByCustomerMail(String customerMail);
	
	// 세영) 고객의 전체 주문 내역
	List<Map<String, Object>> selectOrdersListByCustomerMail(Map<String,Object> paramap);
}