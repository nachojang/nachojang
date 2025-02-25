package com.example.nachojang.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nachojang.mapper.CartMapper;
import com.example.nachojang.vo.Cart;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;
    
    // 우림) 상품상세 -> 장바구니 추가 : /customer/on/addCart
    public Integer addCart(Cart cart) {
    	return cartMapper.addCart(cart);
    }
    	
    // 세영) 체크된 카트 불러오기
    // /customer/on/checkAll
    public List<Map<String, Object>> getCartListOne(List<Integer> selectedCartNos) {
    	List<Map<String, Object>> cartList = new ArrayList<>();
    	for (Integer cartNo : selectedCartNos) {
    		cartList.add(cartMapper.selectSelectedCart(cartNo));
    	}
    	return cartList;
    }
    
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
	
	public int processCartToOrders(String customerMail) {
		return cartMapper.clearCart(customerMail);
	}
			
	/*
	 * public int allOrder(String customerMail) { return
	 * cartMapper.getAllOrder(customerMail); }
	 * 
	 * public int selectedOrder(String customerMail) { return
	 * cartMapper.selectedOrder(customerMail); }
	 */
}