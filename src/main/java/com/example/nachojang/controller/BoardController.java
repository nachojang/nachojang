package com.example.nachojang.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.BoardService;
import com.example.nachojang.vo.Board;

@Slf4j
@Controller	
public class BoardController {
	@Autowired BoardService boardService;
	
	// 세영) 댓글 추가
	@PostMapping("/staff/on/addBoard")
	public String addBoard(Board board) {
		
		// 삽입 메서드 호출
		Integer row = boardService.insertBoard(board);
	
		// 삽입되면 주문상세페이지로 이동
		return "redirect:/customer/on/ordersList";
	}
	
	// 세영) 댓글 추가
	@GetMapping("/staff/on/addBoard")
	public String addBoard() {
		
		return "customer/on/ordersOne";
	}
	
	// 세영) 댓글 삭제
	@GetMapping("/staff/on/deleteBoard")
	public String deleteBoard(Board board) {
		
		// 삭제 메소드 호출
		Integer row = boardService.deleteBoard(board);
		
		// 삭제가 완료되면 댓글 목록 페이지로 리다이
		return "redirect:/staff/on/boardList";
	}
	
	// 세영) 댓글 목록(페이징)
	@GetMapping("/staff/on/boardList")
	public String boardList(Model model
						, @RequestParam(defaultValue = "1") Integer currentPage
						, @RequestParam(defaultValue = "5") Integer rowPerPage) {
		
		// 페이징 처리하여 서비스에서 댓글 목록 가져옴
		Map<String, Object> resultMap = boardService.getBoardList(currentPage, rowPerPage);
		
		// 디버깅
		log.debug(resultMap.toString());
		
		// 마지막 페이지 가져옴
		Integer lastPage = boardService.getLastPage(rowPerPage);
		
		// 페이징 관련 번호 모델에 추가
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));

		// 댓글 목록을 모델에 추가
		model.addAttribute("boardList", resultMap.get("boardList"));
		
		// jsp 페이지로 이동
		return "staff/on/boardList";
	}
	
}
