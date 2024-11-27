package com.example.nachojang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Category;

@Mapper
public interface CategoryMapper {
	
	// 세영) 카테고리 삽입
	Integer insertCategory(Category category);
	
	// 세영) 카테고리 삭제
	Integer deleteCategory(Category category);
	
	// 세영) 카테고리 목록
	List<Category> selectCategoryList();
}
