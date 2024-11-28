<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>주문내역</title>

</head>
<body>

	<!-- 헤더 고정 -->
	
	<!-- main -->
	<div class="col-sm-10">
		<!-- main content -->
		<table class="table">
			<tr>
				<td>주문 번호</td>
				<td>주문 일자</td>
				<td>상품 개수</td>
				<td>총 주문 가격</td>
				<td>배송 상태</td>
			</tr>
			<c:forEach var="o" items="${ordersdList}">
				<tr>
					<td>${o.ordersNo}</td>
					<td>${o.createDate}</td>
					<td>${o.ordersAmount}</td>
					<td>${o.paymentPrice}</td>
					<td>${o.paymentState}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<!-- 페이징 -->
		<!-- 이전 11 12 13 14 15 다음 -->
		<c:if test="${currentPage > 5}">
			<a href="${pageContext.request.contextPath}/customer/on/orderList?currentPage=${currentPage-5}">
				[이전] 
			</a>
		</c:if>
			
		<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
			
			<c:if test = "${num == currentPage}">
				${num}&nbsp;
			</c:if	>
			<c:if test = "${num != currentPage}">
				<a href="${pageContext.request.contextPath}/customer/on/orderList?currentPage=${num}">
					${num}
				</a>
				&nbsp;
			</c:if>
			
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/customer/on/orderList?currentPage=${currentPage+5}">
				[다음] 
			</a>
		</c:if>
	</div>

	<!-- 고정 (회사정보) -->
    <div>
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
</body>
</html>