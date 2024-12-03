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
	<form method="post" action="${pageContext.request.contextPath}/customer/on/checkAll" id="cartForm">
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
				총 결제 금액: <strong id="totalPrice">0</strong> 원
			</p>
		</div>
		<button type="button" id="checkoutSelectedBtn" class="btn btn-primary">선택 주문</button>
	</form>
	<!-- 버튼 영역 -->
		<button type="submit" id="checkoutAllBtn"
			formaction="${pageContext.request.contextPath}/customer/on/checkAll?customerMail=${customerMail}"
			class="btn btn-primary">전체 주문</button>
</body>
<script>
	$(document).ready(function() {
		// 선택 주문 버튼 클릭 이벤트
		$('#checkoutSelectedBtn').on('click', function(e) {
			// 체크된 체크박스가 있는지 확인
			const selected = $('input[name="selectedCartNos"]:checked');
			if (selected.length === 0) {
				e.preventDefault(); // 폼 제출 중지
				alert('선택된 상품이 없습니다. 체크박스를 선택해주세요.');
			} else {
				$('#cartForm').submit();
			}
		});
	});

	$(document).ready(function() {
		// 전체 주문 버튼 클릭 이벤트
		$('#checkoutAllBtn').on('click', function(e) {
			// 장바구니에 상품이 있는지 확인
			const cartItems = $('input[name="selectedCartNos"]'); // 모든 체크박스 가져오기
			if (cartItems.length === 0) {
				e.preventDefault(); // 폼 제출 중지
				alert('장바구니에 상품이 없습니다.');
			}
		});
	});

	$(document).ready(
			function() {
				// 총 금액 계산 함수
				function calculateTotalPrice() {
					let totalPrice = 0;

					// 선택된 체크박스의 금액 합산
					$('input[name="selectedCartNos"]:checked').each(
							function() {
								const price = parseInt($(this).closest('tr')
										.find('td').eq(4).text().trim());
								totalPrice += isNaN(price) ? 0 : price;
							});

					// 총 금액 표시
					$('#totalPrice').text(totalPrice);
				}

				// 체크박스 클릭 시 총 금액 업데이트
				$('input[name="selectedCartNos"]').on('change', function() {
					calculateTotalPrice();
				});

				// 페이지 로드 시 초기 총 금액 계산
				calculateTotalPrice();
			});
</script>
</html>