package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressMapper {
	
	// 세영) 고객의 주소 리스트
	List<Map<String, Object>> addressListByCustomerMail(String customerMail);
}
