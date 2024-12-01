package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nachojang.vo.Cart;

@Mapper
public interface CartMapper {
	
	public int getRemoveCart(int cartNo);

	public List<Map<String, Object>> selectCartList(String customerMail);

	public int insertCart(Cart cart);

	public List<Map<String, Object>> insertOrders(String customerMail);
	
	 List<Integer> getAllCartNos(String customerMail);

	    // 주문 생성 (리스트로 처리)
	    int createOrder(@Param("cartNos") List<Integer> cartNos);

	    // 전체 장바구니 비우기
	    int clearCart(String customerMail);

	    // 선택된 항목만 삭제
	    int deleteSelectedCartItems(@Param("cartNos") List<Integer> selectedCartNos);
	
	
	
}