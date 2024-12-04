<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>결제완료</title>

</head>
<body>

	<!-- 헤더 -->

	<!-- 오더리스트 -->
	<h1>결제완료</h1>
	<c:forEach var="o" items="${ordersList}">		
	<table>
		<tr>
			<td>주문번호</td>
			<td>${o.ordersNo }</td>
		</tr>
		<tr>
			<td>주문일자</td>
			<td>${o.createDate }</td>
		</tr>
		<tr>
			<td>배송지</td>
			<td>${o.addressDetail }</td>
		</tr>
		<tr>
			<td>주문금액</td>
			<td>${o.paymentPrice }</td>
		</tr>
		<tr>
			<td>결제방법</td>
			<td>${o.paymentMethod }</td>
		</tr>
	</table>
	</c:forEach>
	
	<!-- 홈으로 -->
	<a href="${pageContext.request.contextPath}/customer/main">
		홈으로
	</a>
			
	<!-- 고정 (회사정보) -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>
    
</body>
</html>