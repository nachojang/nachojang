package com.example.nachojang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.AddressMapper;
import com.example.nachojang.vo.Address;

@Service
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMapper;
	
	// 세영) 고객의 주소 리스트
	//
	public List<Address> getAddressListByCustomerMail(String customerMail) {
		return addressMapper.addressListByCustomerMail(customerMail);
	}

	public int insertAddress(Address address) {		
		return addressMapper.insertAddress(address);
	}
}
