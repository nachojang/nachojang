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
	
	public Integer insertCategory(Category parmaCategory) {
		return categoryMapper.insertCategory(parmaCategory);
	}
	
	public Integer deleteCategory(Category paramCategory) {
		return categoryMapper.deleteCategory(paramCategory);
	}
	
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
}
