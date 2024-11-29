package com.example.nachojang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nachojang.mapper.CartMapper;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;

 // 고객의 장바구니 리스트
 	public List<Map<String,Object>> getSelectCartList(String customerMail){
 		return cartMapper.selectCartList(customerMail);
 	}

 // 장바구니 총합 액수
 	public long getCartByPayment(List<Map<String, Object>> cartList) {
 		long payment = cartList.stream().mapToLong(c ->(long)c.get("totalPrice")).sum();
 		return payment;
 	}

	// 장바구니 상품 삭제
		public int getRemoveCart(int cartNo) {
			return cartMapper.getRemoveCart(cartNo);

		}
}