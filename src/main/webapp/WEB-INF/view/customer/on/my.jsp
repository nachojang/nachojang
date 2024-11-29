<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>

	<!-- 헤더 고정 -->
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- 우림) 회원정보 (주문건수, 메일, 성별) -->	
	<div>
		
	</div>
	
	
	<!-- 세영) 주문내역 리스트 -->
	<h2>주문내역 리스트</h2>
	<div class="col-sm-10">
		<table class="table">
			<tr>
				<td>주문 번호</td>
				<td>주문 일자</td>
				<td>상품 개수</td>
				<td>총 주문 가격</td>
			</tr>
			<c:forEach var="o" items="${latestOrdersList}">
				<tr>
					<td>${o.ordersNo}</td>
					<td>${o.createDate}</td>
					<td>${o.paymentPrice}</td>
					<td>${o.paymentState}</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/customer/on/ordersList?customerMail=${customerMail}">
				상세보기
			</a>
		</div>
	</div>
	<!-- 고정 (회사정보) -->
    <div>	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
    
</body>
</html>