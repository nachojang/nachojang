package com.example.nachojang;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
// 세영) 세션이 있을 시 리디렉션
public class OffInterceptor implements HandlerInterceptor {
	
	/*
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.debug(request.getRequestURI().toString()+ "요청 Interceptor");
		
		// 로그인이 되어 있다면
		HttpSession session = request.getSession();
		
		// staff
		if(session.getAttribute("loginstaff") != null) { // staff 세션이 있다면
			response.sendRedirect(request.getContextPath() + "/staff/on/main");
			return false;
		} else if (session.getAttribute("loginCustomer") != null) { // customer 세션이 있다면
			response.sendRedirect(request.getContextPath() + "/customer/on/main");
			return false;
		}
		
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	*/
}
