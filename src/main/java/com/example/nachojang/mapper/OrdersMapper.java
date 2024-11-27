package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersMapper {
	
	// 세영) customerMail의 전체 주문 내역
	List<Map<String, Object>> selectOrdersListByCustomerMail(String customerMail);
}
