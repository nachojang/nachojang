package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersMapper {

	// 세영) payment 안에 있는 주문목록
	Map<String, Object> selectOrderListByPayment(Integer paymentNo);
	
	// 세영) 고객의 최신 주문 내역 3개
	List<Map<String, Object>> selectLatestOrdersByCustomerMail(String customerMail);
	
	// 세영) 고객의 총 주문 내역 개수
	Integer selectTotalOrdersByCustomerMail(String customerMail);
	
	// 세영) 고객의 전체 주문 내역
	List<Map<String, Object>> selectOrdersListByCustomerMail(String customerMail);
}
	