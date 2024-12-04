package com.example.nachojang.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.nachojang.service.BoardService;
import com.example.nachojang.service.CategoryService;
import com.example.nachojang.service.GoodsService;
import com.example.nachojang.vo.Category;
import com.example.nachojang.vo.GoodsForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired
	GoodsService goodsService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	BoardService boardService;

	// 나정우

	@GetMapping("/staff/on/goodsList") 
	public String selectGoodsList(@RequestParam(defaultValue = "10") int rowPerPage,
			@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session) {
		int pageSize = 10; // 한 페이지에 표시할 상품 개수

		List<Map<String, Object>> goodsList = goodsService.selectGoodsList(currentPage, rowPerPage);
		log.debug("goodsList =====================> " + goodsList);

		model.addAttribute("goodsList", goodsList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);

		return "/staff/on/goodsList";
	}
	
	// 우림) 상품상세
	@GetMapping("/customer/goodsOne")
	public String goodsOne(HttpSession session, Model model, Integer goodsNo
							, @RequestParam(defaultValue = "1") Integer currentPage
							, @RequestParam(defaultValue = "12") Integer rowPerPage) {
		// 작성자 확인용
		String customerMail = (String)session.getAttribute("loginCustomer");
		model.addAttribute("customerMail", customerMail);
		
		// 상품 상세정보
		Map<String, Object> goodsOne = goodsService.selectGoodsOne(goodsNo);
		model.addAttribute("goodsOne", goodsOne);
		
		// 댓글 목록
		List<Map<String, Object>> boardList = boardService.selectBoardListByGoodsOne(goodsNo);
		log.debug("boardList ==================> " + boardList);
		model.addAttribute("boardList", boardList);
		return "customer/goodsOne";
	}
	
	// 우림) 전체, 카테고리별 상품리스트
	@GetMapping("/customer/goodsList")
	public String goodsList(Model model
							, @RequestParam(required = false) Integer categoryNo
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "12") int rowPerPage) {
		// 상품리스트
		List<Map<String, Object>> goodsList = goodsService.selectCategoryGoodsList(categoryNo, currentPage, rowPerPage);
		log.debug("goodsList ===========> " + goodsList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("currentPage", currentPage);
		return "customer/goodsList";
	}
	
	// 우림) 고객 홈 인기상품, 신규상품
	@GetMapping("/customer/main")
	public String main(Model model) {
		// 인기상품 리스트
		List<Map<String, Object>> bestGoodsList = goodsService.selectBestGoodsList();
		model.addAttribute("bestGoodsList", bestGoodsList);
		// 신규상품 리스트
		List<Map<String, Object>> newGoodsList = goodsService.selectNewGoodsList();            
	    model.addAttribute("newGoodsList", newGoodsList);
		return "customer/main";
	}
	
	// 우림) 상품관리 수정 액션
	@PostMapping("/staff/on/modifyGoods")
	public String modifyGoods(HttpSession session, Model model, GoodsForm goodsForm) {
		
		// 파일업로드
		List<MultipartFile> list = goodsForm.getGoodsFile();
		if (list != null && list.size() != 0) { // 첨부된 파일이 있다면
			for (MultipartFile mf : list) {
				if (mf.getContentType().equals("image/jpeg") == false
						&& mf.getContentType().equals("image/png") == false) {
					model.addAttribute("msg", "이미지 파일만 입력 가능합니다");
					return "staff/on/addGoods"; // jpeg, png가 아니면 폼으로 이동
				}
			}
		}

		String path = session.getServletContext().getRealPath("/upload/");
		log.debug(path);
		
		return "redirect:/staff/on/goodsList";
	}
	
	// 우림) 상품관리 수정 뷰
	@GetMapping("/staff/on/modifyGoods")
	public String modifyGoods(Model model, Integer goodsNo) {
		// 상품추가에서 입력한 값
		Map<String, Object> goodsform = goodsService.selectGoodsOne(goodsNo);
		model.addAttribute("form", goodsform);
		log.debug("goodsform ================>" + goodsform);
		
		
		
		// 카테고리 리스트
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "staff/on/modifyGoods";
	}

	
	// 우림) 상품관리 추가 액션
	@PostMapping("/staff/on/addGoods")
	public String addGoods(HttpSession session, Model model, GoodsForm goodsForm) {
		log.debug("GoodsNo : " + goodsForm.getGoodsNo());
		log.debug("GoodsTitle : " + goodsForm.getGoodsTitle());
		log.debug("GoodsMemo : " + goodsForm.getGoodsMemo());
		log.debug("GoodsPrice : " + goodsForm.getGoodsPrice());
		log.debug("GoodsState : " + goodsForm.getGoodsState());
		log.debug("CategoryNo : " + goodsForm.getCategoryNo());
		log.debug("CategoryTitle : " + goodsForm.getCategoryTitle());
		log.debug("GoodsFile : " + goodsForm.getGoodsFile());
		if (goodsForm.getGoodsFile() != null) {
			log.debug("goodsFile size : " + goodsForm.getGoodsFile().size());
		}

		// 파일업로드
		List<MultipartFile> list = goodsForm.getGoodsFile();
		if (list != null && list.size() != 0) { // 첨부된 파일이 있다면
			for (MultipartFile mf : list) {
				if (mf.getContentType().equals("image/jpeg") == false
						&& mf.getContentType().equals("image/png") == false) {
					model.addAttribute("msg", "이미지 파일만 입력 가능합니다");
					return "staff/on/addGoods"; // jpeg, png가 아니면 폼으로 이동
				}
			}
		}

		String path = session.getServletContext().getRealPath("/upload/");
		log.debug(path);

		goodsService.addGoods(goodsForm, path);

		return "redirect:/staff/on/goodsList";
	}

	// 우림) 상품관리 추가 폼
	@GetMapping("/staff/on/addGoods")
	public String addGoods(Model model) {
		// 뷰 -> 카테고리 리스트 전달
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "staff/on/addGoods";
	}
}
