package com.example.nachojang.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.BoardService;
import com.example.nachojang.service.OrdersService;
import com.example.nachojang.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrdersController {
	@Autowired OrdersService ordersService;
	@Autowired BoardService boardService;
	
	// 세영) 고객의 전체 주문 목록
	@GetMapping("/customer/on/ordersList")
	public String ordersListByCustomerMail(Model model
			, @RequestParam String customerMail
			, @RequestParam(defaultValue = "10") Integer rowPerPage
			, @RequestParam(defaultValue = "1") Integer currentPage) {
		
		log.debug("customerMail : "+customerMail);
		
		// 오더리스트 가져오기
		Map<String, Object> resultMap = ordersService.getOrdersListByCustomerMail(currentPage, rowPerPage, customerMail);
		
		log.debug(resultMap+"<---resultMap");
		
		Integer lastPage = ordersService.getLastPageByCustomerMail(customerMail, rowPerPage);
		
		// 모델에 오더리스트 추가
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("customerMail", customerMail);
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));
		model.addAttribute("ordersList", resultMap.get("ordersList"));
		
		// 고객의 주문 내역 페이지로 이동	
		return "customer/on/ordersList";
	}
	
	// 세영) 전체 주문 목록
	@GetMapping("/staff/on/ordersList")
	public String ordersList(Model model
							, @RequestParam(defaultValue = "10") Integer rowPerPage
							, @RequestParam(defaultValue = "1") Integer currentPage) {
		
		// 오더리스트 가져오기
		Map<String, Object> resultMap = ordersService.getOrdersList(currentPage, rowPerPage);
		
		log.debug(resultMap+"<---resultMap");
		
		Integer lastPage = ordersService.getLastPage(rowPerPage);
		
		// 모델에 오더리스트 추가
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));
		model.addAttribute("ordersList", resultMap.get("ordersList"));
		
		return "staff/on/ordersList";
	}
	
	// 세영) 댓글 추가
	@PostMapping("/customer/on/ordersOne")
	public String addComment(Board board
							, @RequestParam String boardContent
							, @RequestParam Integer ordersNo
							, @RequestParam Integer paymentNo) {
		// 댓글 추가
		boardService.insertBoard(board);
		
		// 주문 상세 페이지로 이동
		return "redirect:/customer/on/ordersOne?paymentNo="+paymentNo;
	}
	
	// 세영) payment 안에 있는 주문목록
	@GetMapping("/customer/on/ordersOne")
	public String orderOne(Model model, @RequestParam Integer paymentNo) {
	    
		log.debug("paymentNo : " + paymentNo);
	    
	    // 서비스에서 주문 상세 내역
	    List<Map<String, Object>> ordersList = ordersService.getSelectOrderListByPayment(paymentNo);
	    
	    log.debug("ordersList : " + ordersList);

	    // 댓글 관련 정보 준비
	    List<Map<String, Object>> comments = new ArrayList<>();
	    List<Integer> rowList = new ArrayList<>();
	    
	    
	    // 각 주문에 대해 댓글 정보와 댓글 수를 가져오기
	    for (Map<String, Object> order : ordersList) {
	        Integer ordersNo = (Integer) order.get("ordersNo");
	        
	        // 'ordersNo'에 해당하는 댓글 정보를 가져오기
	        Map<String, Object> comment = boardService.selectBoardByOrdersNo(ordersNo);
	        comments.add(comment);
	    }
	    
	    log.debug("rowList : " + rowList);
	    log.debug("comments : " + comments.toString());
	    log.debug("comments : " + comments.get(0));

	    // 모델에 주문 상세 정보, 댓글, 댓글 개수 정보 추가
	    log.debug("ordersList : " + ordersList.toString());
	    
	    model.addAttribute("ordersList", ordersList);
	    model.addAttribute("comments", comments.get(0));
	    model.addAttribute("rowList", rowList);

	    // 주문 상세 페이지로 이동
	    return "customer/on/ordersOne";  // JSP 페이지로 전달
	}
	
}
