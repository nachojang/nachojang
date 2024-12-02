
package com.example.nachojang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nachojang.mapper.CustomerMapper;
import com.example.nachojang.mapper.OrdersMapper;
import com.example.nachojang.vo.Customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerService {

    @Autowired CustomerMapper customerMapper;
    @Autowired OrdersMapper ordersMapper;
    
    // 우림) 고객 회원정보 수정 : customer/on/modifyMyByPw
    public Integer modifyMyByPw(Map<String, Object> loginCustomer) {
    	return customerMapper.updateCustomer(loginCustomer);
    }
    
    // 우림) 고객 총 주문 건수 : customer/on/my
    public Integer selectTotalOrdersByCustomerMail(String customerMail) {
    	return ordersMapper.selectTotalOrdersByCustomerMail(customerMail);
    }
    
    // 우림) 고객 회원정보 조회 : customer/on/my
    public Customer selectCustomer(String loginCustomer) {
    	return customerMapper.selectCustomer(loginCustomer);
    }
    
    // 우림) 고객 회원가입 메일 중복체크 : customer/off/mailCheck
    public String mailCheck(String mailCheck) {
    	return customerMapper.mailCheck(mailCheck);
    }
    
    // 우림) 고객 회원가입 : customer/off/addCustomer
    public int addCustomer(Customer customer) {
    	return customerMapper.insertCustomer(customer);
    }
    
    // 우림) 고객 로그인 : customer/off/customerLogin
    public Customer customerLogin(Customer customer) {
    	return customerMapper.customerLogin(customer);
    }

    // 정우) 스태프 로그인
    public Map<String, Object> getCustomerList(int currentPage, int rowPerPage, String searchMail) {
        int beginRow = (currentPage - 1) * rowPerPage;

        // Prepare parameters for the mapper
        Map<String, Object> params = new HashMap<>();
        params.put("beginRow", beginRow);
        params.put("rowPerPage", rowPerPage);
        params.put("searchMail", searchMail); // Use the search parameter

        List<Customer> customerList = null;
        if (searchMail == null || searchMail.isEmpty()) {
            customerList = customerMapper.selectCustomerList(params); // 모든 고객 조회
        }
     
      
        
        int totalCustomers = customerMapper.countCustomer(params); // 총 고객 수 조회

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("customerList", customerList);
        resultMap.put("totalPages", (int) Math.ceil((double) totalCustomers / rowPerPage));
        resultMap.put("currentPage", currentPage);

        return resultMap;
    }
}