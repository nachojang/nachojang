package com.example.nachojang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.GoodsMapper;
import com.example.nachojang.vo.Goods;
import com.example.nachojang.vo.GoodsForm;

@Service
@Transactional
public class GoodsService {
	@Autowired GoodsMapper goodsMapper;
	
	// 상품 추가 : staff/on/addGoods
	public void addGoods(GoodsForm goodsForm, String path) {
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(null);
	}
	
}
