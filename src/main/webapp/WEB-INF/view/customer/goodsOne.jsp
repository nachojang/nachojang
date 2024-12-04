<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 상세</title>

</head>
<body>

	<!-- 헤더 고정 -->
	<div class="header-menu">
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- 상품 상세정보 -->
	<div class="row my-4">	
		<h3 class="text-center mb-4"></h3>
		<div class="col-md-4">
			<img src="${pageContext.request.contextPath}/upload/${goodsOne.goodsFileName}.${goodsOne.goodsFileExt}"
				 alt="상품 이미지" style="max-width: 200px; max-height: 200px; object-fit: contain;">
		</div>

		<div class="col-md-8">
			<form id="formCart" method="post" action="${pageContext.request.contextPath}/customer/on/addCart">
				<table class="table">
					<tr>
						<td><h4>${goodsOne.goodsTitle}</h4><td>
					</tr>	
					<tr>
						<td>카테고리</td>
						<td>${goodsOne.categoryTitle}</td>
					</tr>
					<tr>
						<td>판매가</td>
						<td>${goodsOne.goodsPrice} 원</td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input type="number" name="cartAmount" id="cartAmount" value="1"></td>
					</tr>
				</table>
				<c:if test="${goodsOne.goodsState == '재고있음'}">
					<button type="button" id="btnCart">장바구니</button>
				</c:if>
					<input type="hidden" name="goodsNo" value="${goodsOne.goodsNo}">
					<input type="hidden" name="customerMail" value="${customerMail}">
			</form>
			<c:if test="${goodsOne.goodsState == '재고없음'}">
				<button type="button">품절</button>
			</c:if>
		
		</div>
		<!-- 상품 설명 -->
        <div class="my-4">
          <h5>상품 설명</h5>
          	${goodsOne.goodsMemo}
        </div>
		
		<!-- 상품 후기 -->
		<div>
			<table class="table table-bordered text-center">
				<tr>
					<td>후기번호</td>
					<td>작성자</td>
					<td>내용</td>
					<td>작성일자</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="bl" items="${boardList}">
					<tr>
						<td>${bl.ordersNo}</td>
						<td>${bl.customerMail}</td>
						<td>${bl.boardContent}</td>
						<td>${bl.createDate}</td>
						<td>
							<c:if test="${bl.customerMail != customerMail}">
								삭제
							</c:if>
							<c:if test="${bl.customerMail eq customerMail}">
								<a href="${pageContext.request.contextPath}/customer/on/deleteBoard?goodsNo=${goodsOne.goodsNo}&ordersNo=${bl.ordersNo}">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
    <!-- 고정 (회사정보) -->
    <div>	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
    
</body>

<script>
	// 상품 수량 체크
	$('#btnCart').click(function() {
		var cartAmount = $('#cartAmount').val();
		
		if(cartAmount < 1 || isNaN(cartAmount))  {
			alert('수량을 확인해주세요');
		} else {
			$('#formCart').submit();
		}
	});
</script>

</html>