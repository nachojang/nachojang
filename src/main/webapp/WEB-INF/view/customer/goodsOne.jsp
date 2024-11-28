<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 수정</title>

</head>
<body>
	<div class="row">
		<!-- 관리 사이드바 고정 -->
		<div class="col-sm-2 mt-5">
			<c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
		</div>
		
	
	</div>
	
	
	
    <!-- 고정 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>
 
</body>
</html>