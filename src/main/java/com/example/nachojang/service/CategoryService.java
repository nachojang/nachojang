package com.example.nachojang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.CategoryMapper;
import com.example.nachojang.vo.Category;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// 세영) 카테고리 삽입
	// staff/on/addCategory
	public Integer insertCategory(Category paramCategory) {
		return categoryMapper.insertCategory(paramCategory);
	}
	
	// 세영) 카테고리 삭제
	// staff/on/deleteCategory
	public Integer deleteCategory(Category paramCategory) {
		return categoryMapper.deleteCategory(paramCategory);
	}
	
	// 세영) 카테고리 목록
	// /staff/on/categoryList
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
}
