package com.example.nachojang.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.AddressService;
import com.example.nachojang.service.CartService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {

	// 페이지 호출
	@Autowired CartService cartService;
	@Autowired AddressService addressService;
	
	// 세영) 결제 창 뷰
	@GetMapping("/customer/on/ordersPayment")
	public String ordersPayment(@RequestParam("customerMail") String customerMail, Model model) {

		List<Map<String, Object>> addressList = addressService.getAddressListByCustomerMail(customerMail);
		
		List<Map<String, Object>> cartList = cartService.getSelectCartList(customerMail);
		
		long paymentPrice = cartService.getCartByPayment(cartList);
		
		model.addAttribute("addressList", addressList);
		model.addAttribute("cartList", cartList);
		model.addAttribute("paymentPrice", paymentPrice);
		
		return "customer/on/ordersPayment";
	}
	
	// 전체 주문 처리
	@PostMapping("/customer/payment")
	public String processAllOrder(@RequestParam("paymentNo") int paymentNo,
			@RequestParam("customerMail") String customerMail, Model model) {
		try {
			// 전체 주문 서비스 호출
			int totalPayment = cartService.processAllOrder(customerMail);

			model.addAttribute("message", "전체 주문이 완료되었습니다.");
			model.addAttribute("totalPayment", totalPayment);
		} catch (Exception e) {
			model.addAttribute("message", "전체 주문 중 오류가 발생했습니다.");
		}
		return "redirect:/customer/cart"; // 주문 완료 후 장바구니 페이지로 리다이렉트
	}

	// 선택 주문 처리
	@PostMapping("/customer/cart/checkoutSelected")
	public String processSelectedOrder(@RequestParam("selectedCartNos") List<Integer> selectedCartNos,
			@RequestParam("customerMail") String customerMail, Model model) {
		try {
			// 선택 주문 서비스 호출
			int totalPayment = cartService.processSelectedOrder(selectedCartNos, customerMail);

			model.addAttribute("message", "선택 주문이 완료되었습니다.");
			model.addAttribute("totalPayment", totalPayment);
		} catch (Exception e) {
			model.addAttribute("message", "선택 주문 중 오류가 발생했습니다.");
		}
		return "redirect:/customer/cart"; // 주문 완료 후 장바구니 페이지로 리다이렉트
	}

	@PostMapping("/checkout")
	public String checkoutAll(@RequestParam("customerMail") String customerMail, Model model) {
		try {
			// Cart 데이터를 Orders로 이동
			cartService.processCartToOrders(customerMail);
			return "redirect:/customer/orders"; // 결제 완료 후 주문 목록 페이지로 리다이렉트
		} catch (Exception e) {
			model.addAttribute("error", "결제 처	리 중 오류가 발생했습니다.");
			return "cart"; // 장바구니 페이지로 다시 이동
		}
	}

	@GetMapping("/customer/on/cartList")
	public String cartList(Model model, @RequestParam String customerMail) {

		List<Map<String, Object>> cartList = cartService.getSelectCartList(customerMail);

		long paymentPrice = cartService.getCartByPayment(cartList);

		log.debug("paymentPrice :" + paymentPrice);

		model.addAttribute("cartList", cartList);
		model.addAttribute("customerMail", customerMail);
		model.addAttribute("paymentPrice", paymentPrice);
		return "/customer/on/cartList";

	}

	@GetMapping("/customer/cart/delete")
	public String deleteCart(@RequestParam int cartNo, HttpSession session) {
		String customerMail = (String) session.getAttribute("loginCustomer");
		log.debug(cartNo + "<< cartNo");
		int row = cartService.getRemoveCart(cartNo);

		if (row == 1) {
			log.debug("삭제 성공");
			return "redirect:/customer/on/cartList?customerMail=" + customerMail;
		}
		log.debug("삭제 실패");
		return "redirect:/customer/on/cartList?customerMail=" + customerMail;
	}
}
