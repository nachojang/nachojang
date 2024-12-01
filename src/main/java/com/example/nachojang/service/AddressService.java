package com.example.nachojang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.AddressMapper;

@Service
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMapper;
	
	// 세영) 고객의 주소 리스트
	//
	public List<Map<String,Object>> getAddressListByCustomerMail(String customerMail) {
		return addressMapper.addressListByCustomerMail(customerMail);
	}
	
}
