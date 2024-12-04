<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>LOGIN</title>

</head>
<body class="d-flex flex-column min-vh-100">

	<!-- 헤더 고정 -->
	<div class="header-menu">
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- 로그인 폼 -->
	<h1 class="text-center mt-5"> LOGIN </h1>
	
	<div class="container card card-header">
    	<div class="row justify-content-center">
			
			<!-- 로그인 오류 메세지 -->
			<span>${msg}</span>
			
			<form id="formLogin" action="${pageContext.request.contextPath}/customer/off/customerLogin" method="post" style="width : 300px" class="form-container;"><!-- 폼 너비 설정 300px -->
				<div class="mb-3 mt-3">
					<label for="customerMail" class="form-label"> MAIL </label> 
					<input id="customerMail" type="email" name="customerMail" class="form-control" value="goodee@naver.com">
				</div>
				<div class="mb-3">
					<label for="customerPw" class="form-label"> PW </label> 
					<input id="customerPw" type="password" name="customerPw" class="form-control" value="1234">
				</div>
				<button id="btnLogin" type="button" class="btn btn-primary w-100 mb-3"> 로그인 </button><!-- 버튼 너비 설정 w-100 -->
			</form>
			
			<!-- 회원가입 버튼 -->
			<div class="d-flex justify-content-center w-100">
				<a href="${pageContext.request.contextPath}/customer/off/addCustomer" class="w-50">
                <button id="btnAddCustomer" type="button" class="btn btn-primary">회원가입</button>
            	</a>
			</div>
		</div>	
	</div>
	
    <!-- 고정 (회사정보) -->
    <div>	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
    
</body>

<script> // body보다 늦게 진행
	// btn 버튼 클릭 시 폼 값 유효성 검사
	$('#btnLogin').click(function(){
		console.log('click');
		// 이메일은 위에 폼에서 걸러줌
		if ($('#customerPw').val().length < 4) {
			alert('PW는 4자 이상 가능합니다');
		} else {
			$('#formLogin').submit();
		}
	});
</script>

</html>