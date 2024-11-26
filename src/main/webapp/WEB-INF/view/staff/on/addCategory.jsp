<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>카테고리 추가</title>	

</head>
<body>
	<!-- 고정 헤더 -->
	<div>
		<c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
	</div>
	
	<!-- main -->
	<h1>카테고리 추가</h1>
	<form id="formCategory" method="post" action="${pageContext.request.contextPath}/staff/on/addCategory">
		<table class="table">
			<tr>
				<td>카테고리 번호</td>
				<td><input type="hidden" name="categoryNo" value="자동생성값 또는 null"></td>
			</tr>
			<tr>
				<td>카테고리명</td>
				<td><input type="text" name="categoryTitle" id="categoryTitle"></td>
			</tr>
		</table>
		<button type="button" id="btnAddCategory" class="btn btn-primary"> 추가 </button>
	</form>
	
	<!-- 고정 푸터 -->
    <div>
    	<footer class="text-center py-3 mt-auto bg-dark text-white">
    		<!-- 회사정보 -->
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
	    </footer>
    </div>
</body>
<script>

	$('#btnAddCategory').click(function() {
		if($('#categoryTitle').val() == '') {
			alert('카테고리명을 입력하세요');
		} else {
			$('#formCategory').submit();
		}
	});
	
</script>
</html>