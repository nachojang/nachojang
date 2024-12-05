package com.example.nachojang.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {

	// 우림_상품추가 시 파일추가 : staff/on/addGoods
	int insertGoodsFile(GoodsFile goodsFile);
	
	// 우림_상품수정 시 파일삭제를 위한 파일정보조회 : staff/on/modifyGoods
	GoodsFile selectGoodsFile(int goodsNo);
	
	int updateGoodsFile(GoodsFile goodsFile);
}
