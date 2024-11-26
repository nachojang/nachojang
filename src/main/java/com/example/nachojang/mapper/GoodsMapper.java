package com.example.nachojang.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Goods;

@Mapper
public interface GoodsMapper {

	// 상품 추가 : staff/on/addGoods
	int addGoods(Goods goods);
}
