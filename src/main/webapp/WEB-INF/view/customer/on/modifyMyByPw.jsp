<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>회원정보수정_비밀번호</title>

</head>
<body>
	<!-- 헤더 고정 -->
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>

	<h1>비밀번호 변경</h1>
	${errMsg}
	<form id="formModifyPw" method="post" action="${pageContext.request.contextPath}/customer/on/modifyMyByPw">
		<table border="1">
			<tr>
				<td>변경 전 비밀번호</td>
				<td><input type="password" name="prePw" id="prePw"></td>
			</tr>
			<tr>
				<td>변경 할 비밀번호</td>
				<td><input type="password" name="newPw" id="newPw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="rePw" id="rePw"></td>
			</tr>
		</table>
		<button type="button" id="btnModifyPw">정보 수정</button>
	</form>
	
	

</body>

<script>
	$('#btnModifyPw').click(function() {
		if($('#prePw').val() == '') {
			alert('변경 전 비밀번호를 입력하세요');
		} else if($('#newPw').val() == '') {
			alert('변경할 비밀번호를 입력하세요');
		} else if($('#newPw').val() != $('#rePw').val()) {
			alert('변경 비밀번호가 잘못 입력되었습니다');
		} else {
			$('#formModifyPw').submit();
		}
	});
</script>

</html>