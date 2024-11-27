package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Board;


@Mapper
public interface BoardMapper {
	
	// 세영) 댓글 추가
	Integer insertBoard(Board board);
	
	// 세영) 댓글 삭제
	Integer deleteBoard(Board board);
	
	// 세영) 댓글 총 갯수
	Integer selectTotalBoard(Integer rowPerPage);
	
	// 세영) 댓글 목록
	List<Map<String, Object>> selectBoardList(Map<String, Object> paramMap);
	
}
