<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>마이페이지</title>

<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	padding: 20px;
}

.container {
	max-width: 1200px;
	margin: auto;
}

.header-menu {
	text-align: center;
	padding: 15px;
	background-color: #c71585;
	color: white;
	font-size: 18px;
	margin-bottom: 20px;
}

.member-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 30px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.member-info img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

.member-info .info-text {
	flex-grow: 1;
	padding-left: 20px;
}

.member-info a, .blue-button {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 4px;
	margin-top: 10px;
	display: inline-block;
	transition: background-color 0.3s ease;
}

.member-info a:hover, .blue-button:hover {
	background-color: #0056b3;
	text-decoration: none;
}

.table-container {
	margin-top: 30px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: collapse;
}

table th, table td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
}

table th {
	background-color: #f2f2f2;
}

.details-link {
	display: inline-block;
	margin-top: 10px;
	color: #007bff;
	text-decoration: none;
}

.details-link:hover {
	text-decoration: underline;
}

.footer-info {
	margin-top: 50px;
	text-align: center;
	padding: 10px;
	background-color: #f8f9fa;
	font-size: 14px;
}
</style>
</head>
<body>

	<div class="container">

		<!-- 헤더 -->
		<div>
			<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
		</div>

		<!-- 회원 정보 -->
		<br>
		<div class="member-info">
			<img src="${pageContext.request.contextPath}/css/a.jpg" alt="회원 이미지">
			<div class="info-text">
				<div>
					<strong>이메일:</strong> ${customer.customerMail}
				</div>
				<div>
					<strong>성별:</strong> ${customer.customerGender}
				</div>
				<div>
					<strong>주문건수:</strong> ${totalOrederCount}
				</div>
				<a href="${pageContext.request.contextPath}/customer/on/modifyMyByPw">수정</a>
			</div>
		</div>
		<br>
		<!-- 주문내역 리스트 -->
		<div class="table-container">
			<h3>주문내역 리스트</h3>
			<table>
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문일자</th>
						<th>개수</th>
						<th>총 주문 가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${latestOrdersList}">
						<tr>
							<td>${o.ordersNo}</td>
							<td>${o.createDate}</td>
							<td>${o.paymentPrice}</td>
							<td>${o.paymentState}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a
				href="${pageContext.request.contextPath}/customer/on/ordersList?customerMail=${customerMail}"
				class="blue-button">상세보기</a>
		</div>

		<!-- 회사 정보 -->
		<div>
			<c:import url="/WEB-INF/view/company.jsp"></c:import>
		</div>

	</div>

</body>
</html>
