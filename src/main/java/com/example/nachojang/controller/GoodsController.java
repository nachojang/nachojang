package com.example.nachojang.controller;

import org.springframework.stereotype.Controller;

<<<<<<< HEAD
import com.example.nachojang.service.GoodsService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

=======
import lombok.extern.slf4j.Slf4j;
>>>>>>> branch 'master' of https://github.com/nachojang/nachojang.git

@Slf4j
@Controller
public class GoodsController {
<<<<<<< HEAD
	@Autowired GoodsService goodsService;
	
	// 상품 추가 액션
	@PostMapping("/staff/on/addGoods")
	public String addGoods(HttpSession session) {
		return "staff/on/goodsList";
	}
	
	// 상품 추가 폼
	@GetMapping("/staff/on/addGoods")
	public String addGoods() {
		return "staff/on/addGoods";
	}
	
=======

>>>>>>> branch 'master' of https://github.com/nachojang/nachojang.git
	
}
