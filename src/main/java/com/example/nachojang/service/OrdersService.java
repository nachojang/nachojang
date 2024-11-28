package com.example.nachojang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.OrdersMapper;

@Service
@Transactional
public class OrdersService {
	@Autowired OrdersMapper ordersMapper;
	
	// 세영) payment 안에 있는 주문목록
	// /customer/on/ordersOne
	public Map<String, Object> getSelectOrderListByPayment(Integer paymentNo) {
		
		return ordersMapper.selectOrderListByPayment(paymentNo); 
	}
	
	
	// 세영) 고객의 최신 주문 내역 3개
	// /customer/on/my
	public Map<String, Object> getLatestOrdersList(String customerMail) {
		
		// 파라미터 맵을 전달하여 실제 데이터 목록을 조회
		List<Map<String, Object>> latestOredersList = ordersMapper.selectLatestOrdersByCustomerMail(customerMail);
		
		// 결과를 담을 맵 생성
		Map<String, Object> resultMap = new HashMap<>();
		
		// 주문 목록을 결과 맵에 담기
		resultMap.put("latestOredersList", latestOredersList);
		
		return resultMap;
	}
	
	// 세영) 마지막 페이지
	// /customer/on/ordersList
	public Integer getLastPage(Integer rowPerPage) {
		Integer totalCount = ordersMapper.selectTotalOrdersByCustomerMail(rowPerPage);
		
		// 전체 페이지 수 계산
		Integer lastPage = totalCount / rowPerPage;
		
		// 나머지 있으면 한 페이지 추가
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		// 계산된 마지막 페이지 번호로 반환
		return lastPage;
	}
	
	// 세영) 전체 주문 목록
	// /customer/on/ordersList
	public Map<String, Object> getOrdersList(Integer currentPage, Integer rowPerPage, String customerMail) {
			
		// 시작페이지
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		// 파라미터 맵을 생성하여, 쿼리에서 사용될 페이지 시작 위치와 페이지당 레코드 수를 전달
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// 파라미터 맵을 전달하여 실제 데이터 목록을 조회
		List<Map<String, Object>> ordersList = ordersMapper.selectOrdersListByCustomerMail(customerMail);

		Integer numPerPage = 10;
		// 현재 페이지에 해당하는 시작 번호
		Integer startPagingNum = (currentPage-1)/10*10+1;
		// 현재 페이지에 해당하는 끝 번호
		Integer endPagingNum = startPagingNum + (numPerPage - 1	);
		// 전체 페이지 수를 구하는 메서드를 호출하여 마지막 페이지를 계산
		Integer lastPage = this.getLastPage(rowPerPage);
		// 끝 번호가 마지막 페이지를 넘지 않도록 
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		
		// 결과를 담을 맵 생성
		Map<String, Object> resultMap = new HashMap<>();
		
		// 페이지네이션 번호와 주문 목록을 결과 맵에 담기
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("ordersList", ordersList);
		
		return resultMap;
	}
}
