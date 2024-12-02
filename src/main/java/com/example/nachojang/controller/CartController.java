package com.example.nachojang.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
	@GetMapping("/customer/on/checkoutAll")
	public String ordersPayment(Model model, @RequestParam String customerMail) {

		List<Map<String, Object>> addressList = addressService.getAddressListByCustomerMail(customerMail);
		
		log.debug("addressList : " + addressList);
		
		List<Map<String, Object>> cartList = cartService.getSelectCartList(customerMail);
		
		log.debug("cartList : " + cartList);

		long paymentPrice = cartService.getCartByPayment(cartList);
		
		log.debug("paymentPrice : " + paymentPrice);		
		
		model.addAttribute("customerMail", customerMail);
		model.addAttribute("addressList", addressList);
		model.addAttribute("cartList", cartList);
		model.addAttribute("paymentPrice", paymentPrice);
		
		return "customer/on/ordersPayment";
	}
	
	// 전체 주문 처리
    // @PostMapping("/customer/on/checkoutAll")
    // public String allOrder(@RequestParam("customerMail") String customerMail, Model model) {
    //    cartService.allOrder(customerMail);
    //    return "/customer/on/ordersPayment";
    // }
    
    // 선택 주문 처리
    @PostMapping("/customer/on/checkoutSelected")
    public String selectedOrder(@RequestParam("customerMail") String customerMail, Model model) {
    	cartService.selectedOrder(customerMail);   	    	
    	return "/customer/on/ordersPayment";
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
