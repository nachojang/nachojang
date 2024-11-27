package com.example.nachojang.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller	
public class BoardController {
	@Autowired BoardService boardService;
	
	@GetMapping("/staff/on/boardList")
	public String boardList(Model model
						, @RequestParam(defaultValue = "1") Integer currentPage
						, @RequestParam(defaultValue = "5") Integer rowPerPage) {
		
		Map<String, Object> resultMap = boardService.getBoardList(currentPage, rowPerPage);
		
		log.debug(resultMap.toString());
		
		Integer lastPage = boardService.getLastPage(rowPerPage);
		
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));

		model.addAttribute("boardList", resultMap.get("boardList"));
		
		return "staff/on/boardList";
	}
	
}
