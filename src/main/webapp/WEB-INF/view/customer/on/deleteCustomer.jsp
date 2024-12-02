<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>회원탈퇴</title>

</head>
<body>
	<!-- 헤더 고정 -->
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<h1> 회원탈퇴 </h1>
	<h5>회원탈퇴를 진행하시겠습니까?</h5>
		<input type="checkbox" id="confirmCheckbox" onchange="yes()" class="mb-5"> 예
	
	<form id="formPassword" style="display:none;" method="post" action="${pageContext.request.contextPath}/customer/on/deleteCustomer">
		<table class="table table-bordered" style="width : 80%">
			<tr>
				<td>PW</td>
				<td><input type="password" name="customerPw" id="customerPw"></td>
			</tr>
		</table>
		<button type="button" id="btnDeleteCustomer">회원탈퇴</button>
	</form>
</body>

<script>
    // 체크박스를 클릭 시 비밀번호 입력 폼 보여줌
    function yes() {
        var checkbox = document.getElementById('confirmCheckbox');
        var formPassword = document.getElementById('formPassword');
        if (checkbox.checked) {
        	formPassword.style.display = 'block';  // 폼을 보여줌
        } else {
        	formPassword.style.display = 'none';   // 폼을 숨김
        }
    }
    
    // 비밀번호 유효성 검사
    $('#btnDeleteCustomer').click(function() {
		if($('#customerPw').val() == '') {
			alert('비밀번호를 입력해주세요');
		} else {
			$('#formPassword').submit();
		}
	});
</script>

</html>