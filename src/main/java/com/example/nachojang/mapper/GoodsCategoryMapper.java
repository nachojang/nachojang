package com.example.nachojang.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.GoodsCategory;

@Mapper
public interface GoodsCategoryMapper {
	
	// 우림_상품 추가 시 카테고리 추가 : staff/on/addGoods
	Integer insertGoodsByCategory(GoodsCategory goodsCategory);

}
