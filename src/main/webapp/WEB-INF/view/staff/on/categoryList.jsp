<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>카테고리 리스트</title>

</head>
<body>

	<!-- 고정 (스테프 메뉴) -->	
	<div>
		<c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
	</div>
	
	<!-- main -->
	<div class="col-sm-10">
		<!-- main content -->
		<h1>카테고리 관리</h1>
		<table class="table">
			<tr>
				<td>카테고리 번호</td>
				<td>카테고리명</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="c" items="${categoryList}">
				<tr>
					<td>${c.categoryNo}</td>
					<td>${c.categoryTitle}</td>
					<td>
						<a href="${pageContext.request.contextPath}/staff/on/deleteCategory?categoryNo=${c.categoryNo}" class="btn btn-custom">
							삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div>
			<a href="${pageContext.request.contextPath}/staff/on/addCategory">
				카테고리 추가
			</a>
		</div>
	</div>
	
	<!-- 고정 (회사정보) -->
    <div>
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
	
</body>
</html>