package com.example.nachojang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Address;

@Mapper
public interface AddressMapper {
	
	// 세영) 고객의 주소 리스트
	List<Address> addressListByCustomerMail(String customerMail);

	int insertAddress(Address address);

}
