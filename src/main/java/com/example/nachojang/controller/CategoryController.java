package com.example.nachojang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.nachojang.service.CategoryService;
import com.example.nachojang.vo.Category;
	
@Slf4j
@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	// 세영) 카테고리 삽입
	@PostMapping("/staff/on/addCategory")
	public String addCategory(Category category) {
		
		// 삽입 메소드 실행
		Integer row = categoryService.insertCategory(category);
		
		return "redirect:/staff/on/categoryList";
	}
	
	// 세영) 카테고리 삽입
	@GetMapping("/staff/on/addCategory")
	public String addCategory() {
		return "staff/on/addCategory";
	}
	
	// 세영) 카테고리 삭제
	@GetMapping("/staff/on/deleteCategory")
	public String deleteCategory(Category category) {
		
		// 삭제 메소드 실행
		Integer row = categoryService.deleteCategory(category);
			
		return "redirect:/staff/on/categoryList";
	}
	
	// 세영) 카테고리 목록
	@GetMapping("/staff/on/categoryList")
	public String categoryList(Model model) {
		// 카테고리 목록 조회
		List<Category> categoryList = categoryService.getCategoryList();
		
		// 카테고리 목록을 모델에 추가
		model.addAttribute("categoryList", categoryList);
		
		return "staff/on/categoryList";
	}
	
	
}
