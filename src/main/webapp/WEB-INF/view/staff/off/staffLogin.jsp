<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 부트스트랩 JS 및 Bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Staff Login</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato:400,300"
	rel="stylesheet">
<style>
*, *:before, *:after {
	box-sizing: border-box;
	position: relative;
}

body {
	font-family: Lato, sans-serif;
	font-weight: 300;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	background: #000000;
	margin: 0;
	height: 100vh;
}

#app {
	width: 50vh;
	height: 90vh;
	padding: 6vh;
	background: white;
	box-shadow: 0 0 2rem rgba(255, 255, 255, 0.1);
	border-radius: 10px;
}

.app-header {
	padding: 6vh 0;
	text-align: center;
}

.app-header h1 {
	font-size: 4.8vh;
	font-weight: 400;
	margin-bottom: 2vh;
}

.app-header h2 {
	font-size: 3vh;
	color: rgba(0, 0, 0, 0.45);
}

input {
	font-size: 2.5vh;
	width: calc(100% - 13vh);
	height: 7.5vh;
	margin-bottom: 2vh;
	background: transparent;
	border: none;
	box-shadow: inset 0 -0.5vh rgba(0, 0, 0, 0.1);
	outline: none;
	padding: 14px 16px;
}

input:focus {
	box-shadow: inset 0 -0.5vh transparent;
}

.app-button {
	text-decoration: none;
	color: #FFFFFF;
	font-size: 2.5vh;
	padding: 10px 20px;
	display: inline-block;
	margin-top: 2vh;
	border: 1px solid #FFFFFF;
	background: #000000;
	font-weight: 400;
	cursor: pointer;
	transition: background 0.3s, color 0.3s;
}

.app-button:hover {
	background: #FFFFFF;
	color: #000000;
}

footer {
	text-align: center;
	padding: 10px;
	background-color: #000;
	color: #fff;
	position: absolute;
	bottom: 0;
	width: 100%;
}

footer c\\:import {
	color: #fff;
}
</style>
</head>
<body>
	<div id="app">
		<div class="app-header">
			<h1>STAFF LOGIN</h1>
		</div>
		<form id="loginForm"
			action="${pageContext.request.contextPath}/staff/off/staffLogin"
			method="post">
			<input type="text" id="staffId" name="staffId" placeholder="Staff ID"
				required> <input type="password" id="staffPw" name="staffPw"
				placeholder="Password" required>
			<button type="button" id="loginButton" class="app-button">Login</button>
		</form>
	</div>

	<!-- 고정 푸터 -->
	<footer>
		<c:import url="/WEB-INF/view/company.jsp"></c:import>
	</footer>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		$('#loginButton').click(function() {
			const staffId = $('#staffId').val();
			const staffPw = $('#staffPw').val();

			if (!staffId.trim()) {
				alert('Staff ID를 입력하세요.');
			} else if (!staffPw.trim()) {
				alert('Password를 입력하세요.');
			} else {
				$('#loginForm').submit();
			}
		});
	</script>
</body>
</html>