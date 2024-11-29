package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	// 우림) 고객 회원정보 조회 : customer/on/my
	Customer selectCustomer(String loginCustomer);
	
	// 우림) 고객 회원가입 시 메일 중복체크 : customer/off/mailCheck
	String mailCheck(String mailCheck);
	
	// 우림) 고객 회원가입 : customer/off/addCustomer
	int insertCustomer(Customer customer);
	
	// 우림) 고객 로그인 : customer/off/customerLogin
	Customer customerLogin(Customer customer);
    
    List<Customer> selectCustomerList(Map<String, Object> paramMap);
    
    int countCustomer(Map<String, Object> paramMap);
    
 
}