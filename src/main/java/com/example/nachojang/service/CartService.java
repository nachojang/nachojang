package com.example.nachojang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nachojang.mapper.CartMapper;
import com.example.nachojang.vo.Cart;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;

    public List<Cart> getCartList(String customerMail) {
        return cartMapper.selectCartList(customerMail);
    }

    public void deleteCartItem(Integer cartNo, String customerMail) {
        cartMapper.deleteCartGoods(cartNo, customerMail);
    }

    public void deleteAllCartItems(String customerMail) {
        cartMapper.deleteAllCartGoods(customerMail);
    }

    public int getTotalAmount(String customerMail) {
        return cartMapper.getTotalAmount(customerMail);
    }

    public void updateCartAmount(Integer cartNo, Integer cartAmount) {
        cartMapper.updateGoodsAmount(cartNo, cartAmount);
    }

    public void processOrder(String customerMail) {
    	
        cartMapper.addToOrders(customerMail);
        cartMapper.deleteAllCartGoods(customerMail);
    }
}