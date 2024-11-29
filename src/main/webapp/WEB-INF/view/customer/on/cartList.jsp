<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="header-menu">
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>

    <div class="container mt-5">
        <h2>장바구니</h2>
        <table class="table table-bordered">
            
                <tr>
                	
                    <td>이미지</td>
                    <td>상품명</td>
                    <td>수량</td>
                    <td>금액</td>
                    <td>삭제</td>
                </tr>
            
            
                <c:forEach items="${cartList}" var="c">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/upload/${goods.goodsFileName}.${goods.goodsFileExt}" alt="${c.goodsTitle}"
                         style="width:100px;"></td>
                        <td>${c.goodsTitle}</td>
                        <td>${c.cartAmount}</td>
                        <td>${c.goodsPrice}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/customer/cart/delete?cartNo=${c.cartNo}">삭제</a>
                        </td>
                   	</tr>
		</c:forEach>
	</table>
	<form method="post" id="formPayment" action="${pageContext.request.contextPath}/customer/payment?paymentNo=${paymentNo}">
		<table class="table table-bordered">
			<tr>
				
				<td>
					<input type = "hidden" name = "paymentPrice" id = "paymentPrice" value="${paymentPrice}" readonly>
					총결제금액 ${paymentPrice} 
				</td>
				<td>원</td>
			</tr>
			<tr>
			
		</table>
		<button id="btnPayment" type="button">전체주문</button>
		<button id="btnPayment" type="button">선택주문</button>
		</form>
	</div>
</body>
</html>