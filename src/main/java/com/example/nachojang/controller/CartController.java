package com.example.nachojang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nachojang.service.CartService;

@Controller

public class CartController {
	
	 @Autowired  CartService cartService;
	 
	  @GetMapping("/customer/on/cartList")
	    public String cartList() {
	        return "/customer/on/cartList";
	    }
	  
	  @PostMapping("/delete")
	    public String deleteCartItem(@RequestParam Integer cartNo, @RequestParam String customerMail) {
	        cartService.deleteCartItem(cartNo, customerMail);
	        return "redirect:/customer/on/cartList?customerMail=" + customerMail;
	    }

	    @PostMapping("/update")
	    public String updateCartAmount(@RequestParam Integer cartNo, @RequestParam Integer cartAmount, @RequestParam String customerMail) {
	        cartService.updateCartAmount(cartNo, cartAmount);
	        return "redirect:/customer/on/cartList?customerMail=" + customerMail;
	    }

	    @PostMapping("/orderAll")
	    public String orderAll(@RequestParam String customerMail) {
	        cartService.processOrder(customerMail);
	        return "redirect:/customer/on/cartList?customerMail=" + customerMail;
	    }
	}

