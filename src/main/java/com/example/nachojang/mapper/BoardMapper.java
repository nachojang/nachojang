package com.example.nachojang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.nachojang.vo.Board;


@Mapper
public interface BoardMapper {
	
	// 우림) 상품상세 -> 댓글 목록 : customer/goodsOne
	List<Map<String, Object>> selectBoardListByGoodsOne(Integer goodsNo);
	
	// 세영) 세영) 고객의 주문 상품 댓글 출력
	Map<String, Object> selectBoardByOrdersNo(Integer boardNo);
	
	// 세영) 댓글 추가
	Integer insertBoard(Board board);
	
	// 세영) 댓글 삭제
	Integer deleteBoard(Integer orderNo);
	
	// 세영) 댓글 총 갯수
	Integer selectTotalBoard(Integer rowPerPage);
	
	// 세영) 댓글 목록
	List<Map<String, Object>> selectBoardList(Map<String, Object> paramMap);
	
}
