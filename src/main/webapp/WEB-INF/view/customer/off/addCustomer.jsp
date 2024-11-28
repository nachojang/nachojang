<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ADD CUSTOMER</title>

</head>
<body>
	
	<!-- 헤더 고정 -->
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- 회원가입 폼 -->
	<div>
		${msg}
		<form method="post" action="${pageContext.request.contextPath}/customer/off/mailCheck">
			<table class="table table-bordered" style="width : 80%">
				<tr>
					<td>MAIL</td>
					<td><input type="email" name="mailCheck" id="mailCheck"></td>
				</tr>
			</table>
			<button>중복확인</button>
		</form>
		
		<form method="post" action="${pageContext.request.contextPath}/">
			<table class="table table-bordered" style="width : 80%">
				<tr>
					<td>메일</td>
					<td><input type="email" name="customerMail" id="customerMail" value="${mailCheck}" readonly></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="customerMail" id="customerMail"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="repw" id="repw"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" class="gender" value="남자">남자<br>
						<input type="radio" name="gender" class="gender" value="여자">여자<br>
					</td>
				</tr>
			</table>
			<button>회원가입</button>
		</form>
	</div>

</body>
</html>