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
	
	public Integer getLastPage(Integer rowPerPage) {
		Integer totalCount = boardMapper.selectTotalBoard(rowPerPage);
		
		Integer lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	public Map<String, Object> getBoardList(Integer currentPage, Integer rowPerPage) {
		
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		Integer numPerPage = 10;
		Integer startPagingNum = (currentPage-1)/10*10+1;
		Integer endPagingNum = startPagingNum + (numPerPage - 1);
		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		
		List<Map<String, Object>> boardList = boardMapper.selectBoardList(paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("boardList", boardList);
		
		return resultMap;
	}
}
