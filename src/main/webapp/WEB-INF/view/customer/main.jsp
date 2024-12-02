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
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- 인기상품 -->
	<div class="mt-5">
	<h1 class="text-center"> 인기상품 </h1>
	<form>
		<table>
			<tr>
				<c:forEach var="bg" items="${bestGoodsList}">
					<td>
						<img src="${pageContext.request.contextPath}/upload/${bg.goodsFileName}.${bg.goodsFileExt}" 
				                  alt="상품 이미지" width="80" height="80" style="object-fit: cover;">
				    </td>
				    <td>${bg.goodsTitle}</td>
				    <td>${bg.goodsPrice}</td>
				</c:forEach>
			</tr>
		</table>
	</form>	
	</div>	
	
	<!-- 신규상품 -->
	
	
</body>
</html>