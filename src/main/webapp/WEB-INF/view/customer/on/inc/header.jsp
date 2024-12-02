<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>

	<!-- 헤더 고정 -->
		<!-- 로그인, 마이페이지, 장바구니 -->
		&nbsp;
		<c:if test="${loginCustomer == null}">
			<a href="${pageContext.request.contextPath}/customer/off/customerLogin">로그인</a> &nbsp;ㅣ
		</c:if>
		<c:if test="${loginCustomer != null}">
			<a href="${pageContext.request.contextPath}/customer/on/customerLogout">로그아웃</a> &nbsp;ㅣ
		</c:if>
		<a href="${pageContext.request.contextPath}/customer/on/my?customerMail=${loginCustomer}">마이페이지</a> &nbsp;ㅣ
		<a href="${pageContext.request.contextPath}/customer/on/cartList?customerMail=${loginCustomer}">장바구니</a> &nbsp;
		
		<!-- 검색기능 (일단보류)-->
		
		<!-- 쇼핑몰 로고 -->
		<div class="mt-4 text-center ">
			<h1><a href="${pageContext.request.contextPath}/customer/main" style="text-decoration: none; color: black;">NACHOJANG</a></h1>
		</div>			
		<!-- 상품 카테고리 -->
		<div>
			
		</div>
		
</div>