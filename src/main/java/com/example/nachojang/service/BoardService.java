package com.example.nachojang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nachojang.mapper.BoardMapper;
import com.example.nachojang.mapper.OrdersMapper;
import com.example.nachojang.vo.Board;

@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;	
	
	// 세영) 댓글 추가
	// customer/on/ordersList
	public Integer insertBoard(Board paramBoard) {
		return boardMapper.insertBoard(paramBoard);
	}
	
	// 세영) 댓글 삭제
	// staff/on/deleteBoard
	public Integer deleteBoard(Board paramBoard) {
		return boardMapper.deleteBoard(paramBoard);
	}
	
	// 세영) 마지막 페이지
	// /staff/on/boardList
	public Integer getLastPage(Integer rowPerPage) {
		Integer totalCount = boardMapper.selectTotalBoard(rowPerPage);
		
		// 전체 페이지 수 계산
		Integer lastPage = totalCount / rowPerPage;
		
		// 나머지 있으면 한 페이지 추가
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		// 계산된 마지막 페이지 번호로 반환
		return lastPage;
	}
	
	// 세영) 전체 댓글 목록 
	// /staff/on/boardList
	public Map<String, Object> getBoardList(Integer currentPage, Integer rowPerPage) {
		
		// 시작페이지
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		// 파라미터 맵을 생성하여, 쿼리에서 사용될 페이지 시작 위치와 페이지당 레코드 수를 전달
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		Integer numPerPage = 10;
		// 현재 페이지에 해당하는 시작 번호
		Integer startPagingNum = (currentPage-1)/10*10+1;
		// 현재 페이지에 해당하는 끝 번호
		Integer endPagingNum = startPagingNum + (numPerPage - 1	);
		// 전체 페이지 수를 구하는 메서드를 호출하여 마지막 페이지를 계산
		Integer lastPage = this.getLastPage(rowPerPage);
		 // 끝 번호가 마지막 페이지를 넘지 않도록 
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		 // 파라미터 맵을 전달하여 실제 데이터 목록을 조회
		List<Map<String, Object>> boardList = boardMapper.selectBoardList(paramMap);
		
		// 결과를 담을 맵 생성
		Map<String, Object> resultMap = new HashMap<>();
		
		// 페이지네이션 번호와 댓글 목록을 결과 맵에 담기
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("boardList", boardList);
		
		return resultMap;
	}
}
