<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="header-menu">
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>

	<!-- 장바구니 -->
	<div></div>
	<h2>회원님 장바구니</h2>
	<form method="post"
		action="${pageContext.request.contextPath}/customer/cart/checkoutSelected">
		<input type="hidden" name="customerMail" value="${customerMail}">

		<table border="1" cellspacing="1" cellpadding="5"
			style="width: 100%; margin-top: 20px;">
			<thead>
				<tr>
					<th>선택</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="c">
					<tr>
						<td style="text-align: center;"><input type="checkbox"
							name="selectedCartNos" value="${c.cartNo}"></td>
						<td style="text-align: center;"><img
							src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}"
							alt="${c.goodsTitle}" style="width: 100px;"></td>
						<td>${c.goodsTitle}</td>
						<td style="text-align: center;">${c.cartAmount}</td>
						<td style="text-align: center;">${c.goodsPrice}</td>
						<td style="text-align: center;"><a
							href="${pageContext.request.contextPath}/customer/cart/delete?cartNo=${c.cartNo}">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="text-align: right; margin-top: 10px;">
			<p>
				총 결제 금액: <strong>${paymentPrice} 원</strong>
			</p>
		</div>


		<!-- 버튼 영역 -->
		<button type="submit" id="checkoutAllBtn"
			formaction="${pageContext.request.contextPath}/customer/on/checkoutAll?customerMail=${customerMail}"
			class="btn btn-primary">전체 주문</button>

		<button type="button" id="checkoutSelectedBtn"
			formaction="${pageContext.request.contextPath}/customer/on/checkoutSelected?customerMail=${customerMail}"
			class="btn btn-primary">선택 주문</button>
	</form>
</body>
<script>
</script>
</html>