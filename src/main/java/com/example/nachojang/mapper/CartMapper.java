package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Cart;

@Mapper
public interface CartMapper {

	public List<Map<String, Object>> selectCartList(String customerMail);

	public int insertCart(Cart cart);
	
	
}
