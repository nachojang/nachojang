package com.example.nachojang;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component // new OnInterceptor(); 해서 bin에 저장
// 세영 ) staff 세션이 없을 시 리디렉션
public class StaffOnInterceptor implements HandlerInterceptor {
	
	//특정 컨트롤러 실행전에 request, response를 가로채 먼저 실행됨
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		
		// 로그인이 되지 않았다면 session.setAttribute("loginStaff")
		HttpSession session = request.getSession();
		if(session.getAttribute("loginStaff") == null) { // 사용자 로그인이 되지 않음
			log.debug(request.getRequestURL().toString() + ", 로그인이 되지 않음");
			response.sendRedirect(request.getContextPath()+"/staff/off/staffLogin");
			return false;
		}
		
		return true;
	}
}
