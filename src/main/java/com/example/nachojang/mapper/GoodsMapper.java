package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Goods;

@Mapper
public interface GoodsMapper {
	
	// 우림) 상품리스트 : customer/goodsList
	List<Map<String, Object>> selectCategoryGoodsList(Integer categoryNo);
	
	// 우림) 신규상품 리스트 : customer/main
	List<Map<String, Object>> selectNewGoodsList();
	
	// 우림) 인기상품 리스트 : customer/main
	List<Map<String, Object>> selectBestGoodsList();
	
	// 우림) 상품 추가 : staff/on/addGoods
	int insertGoods(Goods goods);
	
	//나정우
	List<Map<String , Object>> selectGoodsList(Map <String , Object > params);//굿즈리스트
	
    int selectGoodsCount(String search); // 페이징
}
