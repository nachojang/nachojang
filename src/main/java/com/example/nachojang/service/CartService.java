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
	
	public int processCartToOrders(String customerMail) {
		return cartMapper.clearCart(customerMail);
	}
			
	public int processAllOrder(String customerMail) {
        
		// 전체 장바구니 목록을 조회
        List<Integer> cartNos = cartMapper.getAllCartNos(customerMail);

        // 주문 생성
        int totalPayment = cartMapper.createOrder(cartNos);

        // 주문 완료 후 장바구니 비우기
        cartMapper.clearCart(customerMail);

        return totalPayment;
    }

    // 선택 주문 처리
    public int processSelectedOrder(List<Integer> selectedCartNos, String customerMail) {
        // 선택된 항목으로 주문 생성
        int totalPayment = cartMapper.createOrder(selectedCartNos);

        // 선택된 항목만 장바구니에서 삭제
        cartMapper.deleteSelectedCartItems(selectedCartNos);

        return totalPayment;
    }


		
}