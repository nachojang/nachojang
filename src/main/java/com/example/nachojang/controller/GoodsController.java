package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.nachojang.service.GoodsService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	
	// 상품 추가 폼
	@GetMapping("/staff/on/addGoods")
	public String addGoods() {
		return "staff/on/addGoods";
	}
	
	
}
