<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>결제창</title>

</head>
<body>
	<h1>결제</h1>
	<form id="formPayment" method="post" action="${pageContext.request.contextPath}/customer/on/addPayment">
		<table>
			<tr>
				<td>주문자</td>
				<td>${customerMail}</td>
			</tr>
			<tr>
				<td>배송지</td>
				<td>
					<select name = "addressNo" id="addressNo">
					<option value="0">:::선택:::</option>
					<c:forEach  var="a" items="${addressList}">
						<option value="${a.addressNo}">${a.addressDetail}</option>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>주문상품</td>
				<td>
					<table>
					<tr>
						<td>이미지</td>
						<td>상품명</td>					
						<td>수량</td>					
						<td>금액</td>					
					</tr>
					<c:forEach var="c" items="${cartList}">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" width="100" height="100">
							</td>
							<td>${c.goodsTitle}</td>					
							<td>${c.cartAmount}</td>					
							<td>${c.totalPrice}</td>					
						</tr>
					</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td>${paymentPrice}</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td>
					페이 : <input name="paymentMethod" type="radio" value="페이">
					카드 : <input name="paymentMethod" type="radio" value="카드">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 결제버튼 -->
	<button id="btnPayment" type="button" class="btn btn-primary">결제하기</button>
	
</body>
<script>
	$('#btnPayment').click(function() {
		if($('#addressNo').val() == '0'){
			alert('주소를 선택해주세요');
			return;
		} else if(!$('input[name="paymentMethod"]:checked').val()){
			alert('결제수단을 선택해주세요');
			return;
		}	
		$('#formPayment').submit();
	});
	
	
</script>
</html>