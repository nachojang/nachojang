<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>NA CHO JANG</title>

</head>
<body>

	<!-- 헤더 고정 -->
	<div class="header-menu">
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- 인기상품 -->
	<div class="mt-5">
	<h1 class="text-center"> 인기상품 </h1>
	<c:forEach var="bg" items="${bestGoodsList}">
		<table class="table table-bordered">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/customer/goodsOne?goodsNo=${bg.goodsNo}">
					<img src="${pageContext.request.contextPath}/upload/${bg.goodsFileName}.${bg.goodsFileExt}" 
					alt="상품 이미지" width="80" height="80" style="object-fit: cover;">
					</a>              
				</td>
			</tr>
			<tr>
				<td>${bg.goodsTitle}</td>
			</tr>
			<tr>
				<td>${bg.goodsPrice}</td>
			</tr>
		</table>
	</c:forEach>
	</div>	
		
	   <!-- 신규상품 -->
	<div class="mt-3">
	<h1 class="text-center"> 신규상품 </h1>
	<c:forEach var="ng" items="${newGoodsList}">
		<table class="table table-bordered">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/customer/goodsOne?goodsNo=${ng.goodsNo}">
					<img src="${pageContext.request.contextPath}/upload/${ng.goodsFileName}.${ng.goodsFileExt}" 
					alt="상품 이미지" width="80" height="80" style="object-fit: cover;">
					</a>
				</td>
			</tr>
			<tr>
				<td>${ng.goodsTitle}</td>
			</tr>
			<tr>
				<td>${ng.goodsPrice}</td>
			</tr>
		</table>
	</c:forEach>
	</div>
	
	<!-- 고정 (회사정보) -->
    <div>	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
	
</body>
</html>