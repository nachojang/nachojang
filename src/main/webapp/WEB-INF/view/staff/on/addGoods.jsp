<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 추가</title>

</head>
<body>
	<!-- 사이드바 고정 -->
	<c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
	
	<form id="formAddGoods" method="post" action="${pageContext.request.contextPath}/staff/on/goodsList">
		<table class="table table-bordered" style="width : 80%">
			<tr>
				<td>카테고리</td>
				<td>
					<select>
						<option value="">::: 선택 :::</option>
						<option value="상의">상의</option>
						<option value="하의">하의</option>
						<option value="겉옷">겉옷</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
	
	 <!-- 회사정보 고정 -->
 	<footer>
    	<c:import url="/WEB-INF/view/company.jsp"></c:import>
 	</footer>
	
</body>
</html>