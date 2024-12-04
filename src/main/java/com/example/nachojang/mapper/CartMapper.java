package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nachojang.vo.Cart;

@Mapper
public interface CartMapper {
	
	// 우림) 상품상세 -> 장바구니 추가 : /customer/on/addCart
	Integer addCart(Cart cart);
	
	// 세영) 장바구니에서 선택된 항목만 조회
	Map<String, Object> selectSelectedCart(Integer cartNo);
	
	public int getRemoveCart(int cartNo);
	
	public List<Map<String, Object>> selectCartList(String customerMail);

	public int insertCart(Cart cart);
	
	List<Integer> getAllCartNos(String customerMail);

	// 주문 생성 (리스트로 처리)
	int createOrder(@Param("cartNos") List<Integer> cartNos);
	
	//  장바구니 비우기
	int clearCart(String customerMail);
	
	//  삭제
	int deleteSelectedCartItems(@Param("cartNos") List<Integer> selectedCartNos);

	   
	
	
	
}