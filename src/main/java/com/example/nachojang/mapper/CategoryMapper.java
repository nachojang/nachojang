package com.example.nachojang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Category;

@Mapper
public interface CategoryMapper {
	
	Integer insertCategory(Category category);
	
	Integer deleteCategory(Category category);
	
	List<Category> selectCategoryList();
}
