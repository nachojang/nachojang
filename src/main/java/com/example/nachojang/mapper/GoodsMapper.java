package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Goods;

@Mapper
public interface GoodsMapper {

	// 우림_상품 추가 : staff/on/addGoods
	int insertGoods(Goods goods);
	
	//나정우
	List<Map<String , Object>> selectGoodsList(Map <String , Object > params);//굿즈리스트
	
    int selectGoodsCount(String search); // 페이징
}
