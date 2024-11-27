package com.example.nachojang.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.nachojang.service.CategoryService;
import com.example.nachojang.service.GoodsService;
import com.example.nachojang.vo.Category;
import com.example.nachojang.vo.GoodsForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired GoodsService goodsService;
	@Autowired CategoryService categoryService;
	
	//나정우
	
	
	@GetMapping("/staff/on/goodsList") // 기존 "/goodsList"를 "/staff/on/goodsList"로 수정
	public String goodsList(@RequestParam( defaultValue = "3")int rowPerPage,
	                        @RequestParam(defaultValue = "1") int currentPage,
	                        Model model) {
	    int pageSize = 10; // 한 페이지에 표시할 상품 개수
	 
		List<Map<String, Object>> goodsList = goodsService.getGoodsList(currentPage, rowPerPage);

	    model.addAttribute("goodsList", goodsList);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("rowPerPage", rowPerPage);

	    return "/staff/on/goodsList";
	}
	
	// 상품 추가 액션
	@PostMapping("/staff/on/addGoods")
	public String addGoods(HttpSession session, Model model, GoodsForm goodsForm) {
		log.debug("GoodsNo : " + goodsForm.getGoodsNo());
		log.debug("GoodsTitle : " + goodsForm.getGoodsTitle());
		log.debug("GoodsMemo : " + goodsForm.getGoodsMemo());
		log.debug("GoodsPrice : " + goodsForm.getGoodsPrice());
		log.debug("GoodsState : " + goodsForm.getGoodsState());
		log.debug("GoodsState : " + goodsForm.getCategory());
		log.debug("GoodsState : " + goodsForm.getGoodsFile());
		
		List<MultipartFile> list = goodsForm.getGoodsFile();
		if(list != null && list.size() != 0) { // 첨부된 파일이 있다면
			for(MultipartFile mf : list) {
				if(mf.getContentType().equals("image/jpeg") == false
						&& mf.getContentType().equals("image/png") == false) {
					model.addAttribute("msg", "이미지 파일만 입력이 가능합니다");
					return "on/addGoods"; // 폼으로 다시 이동
				}
			}
		}
		
		String path = session.getServletContext().getRealPath("/upload/");
		log.debug(path);
		
		goodsService.addGoods(goodsForm, path);
		
		return "redirect:/staff/on/goodsList";
	}
	
	// 상품 추가 폼
	@GetMapping("/staff/on/addGoods")
	public String addGoods(Model model) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "staff/on/addGoods";
	}
	

	
}
