package com.example.nachojang;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component // new OnInterceptor(); 해서 bin에 저장
// 세영 ) customer 세션이 없을 시 리디렉션
public class customerInterceptor implements HandlerInterceptor {
	
	/*
	//특정 컨트롤러 실행전에 request, response를 가로채 먼저 실행됨
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		log.debug(request.getRequestURL().toString() + "요청 Interceptor");
		
		// 로그인을 하지 않았다면 session.setAttribute("loginCustomer")
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) { // 사용자가 로그인하지 않은 경우
			response.sendRedirect(request.getContextPath()+"/staff/off/customerLogin"); // staffLogin.jsp
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	*/
}
