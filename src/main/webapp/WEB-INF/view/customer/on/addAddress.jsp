<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 주문 주소 추가</title>
</head>
<body class="container-flud">
	<div>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>
    	
	<div>	
	    <h1>주소 추가</h1>
			<form id="addAddressform" method = "post" action="${pageContext.request.contextPath}/customer/on/addAddress">	
				<table>
					<tr>
						<td><label for="customerMail">이메일</label></td>
						<td><input id="customerMail" type="email" name="customerMail" value="${customerMail}" readonly></td>	
					</tr>
					<tr>
						<td><label for="newaddress">추가 할 주소</label></td>
						<td><input type="text" name="addressDetail" id="addressDetail"></td>		
					</tr>
				</table>
				<button type="button" id="btnaddAddress">주소추가</button>	
			</form>	
	</div>		
	
	<div>
		<footer>
        	<c:import url="/WEB-INF/view/company.jsp"></c:import>
    	</footer>	
	</div>		
<script>
	$('#btnaddAddress').click(function(){
		if($('#addressDetail').val() == ''){
			alert('주소를 입력해주세요');
		} else {
			$('#addAddressform').submit();
		}
	});
	
</script>
	  
</body>
</html>