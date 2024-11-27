package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	
	Integer deleteBoardByKey(Integer ordersNo);
	
	Integer selectTotalBoard(Integer rowPerPage);
	
	List<Map<String, Object>> selectBoardList(Map<String, Object> paramMap);
	
}
