package com.example.nachojang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nachojang.mapper.CustomerMapper;
import com.example.nachojang.vo.Customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

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