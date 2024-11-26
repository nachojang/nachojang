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
	
	@PostMapping("/staff/on/addCategory")
	public String addCategory(Category category) {
		
		Integer row = categoryService.insertCategory(category);
		
		return "staff/on/categoryList";
	}
	
	@GetMapping("/staff/on/addCategory")
	public String addCategory() {
		return "staff/on/addCategory";
	}
	
	@GetMapping("/staff/on/deleteCategory")
	public String deleteCategory(Category category) {
		
		Integer row = categoryService.deleteCategory(category);
			
		return "redirect:/staff/on/categoryList";
	}
	
	@GetMapping("/staff/on/categoryList")
	public String categoryList(Model model) {
		List<Category> categoryList = categoryService.getCategoryList();
		
		model.addAttribute("categoryList", categoryList);
		
		return "staff/on/categoryList";
	}
	
	
}
