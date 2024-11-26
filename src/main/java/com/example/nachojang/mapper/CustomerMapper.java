package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Customer;

@Mapper
public interface CustomerMapper {
    
    List<Customer> selectCustomerList(Map<String, Object> paramMap);
    
    int countCustomer(Map<String, Object> paramMap);
    
 
}