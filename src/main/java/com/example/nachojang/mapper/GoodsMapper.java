package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Goods;
import com.example.nachojang.vo.GoodsForm;

@Mapper
public interface GoodsMapper {
	
	// 우림) 상품수정 : staff/on/modifyGoods
	Integer updateGoods(GoodsForm goodsform);

	// 우림) 상품상세 : customer/goodsOne
	Map<String, Object> selectGoodsOne(Integer goodsNo);
	
	// 우림) 카테고리별 총 상품 수 : customer/goodsList
	Integer selectCategoryGoodsCount();
	
	// 우림) 상품리스트 : customer/goodsList
	List<Map<String, Object>> selectCategoryGoodsList(Map<String, Object> params);
	
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
