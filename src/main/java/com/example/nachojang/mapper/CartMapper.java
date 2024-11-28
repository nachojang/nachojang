package com.example.nachojang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Cart;

@Mapper
public interface CartMapper {

	List<Cart> selectCartList(String customerMail);

	Integer deleteCartGoods(Integer cartNo, String customerMail);

	void deleteAllCartGoods(String customerMail);

	Integer getTotalAmount(String customerMail);

	void updateGoodsAmount(Integer cartNo, Integer cartAmount);

	void addToOrders(String customerMail);
}
