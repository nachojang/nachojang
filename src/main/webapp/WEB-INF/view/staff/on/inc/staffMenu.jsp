<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>스탭 메뉴</title>

</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="list-group">
     <li class="list-group-item">
         ::: staffId :::</li>
     <li class="list-group-item">
           <a href="${pageContext.request.contextPath}/on/logout" class="btn">로그아웃</a></li> 
     <li class="list-group-item">
           <a href="${pageContext.request.contextPath}/on/customerList" class="btn">회원 관리</a></li> 
     <li class="list-group-item">   
           <a href="${pageContext.request.contextPath}/on/goodsList" class="btn">상품 관리</a></li> 
     <li class="list-group-item">
           <a href="${pageContext.request.contextPath}/on/ordersList" class="btn">주문 관리</a></li> 
     <li class="list-group-item">
           <a href="${pageContext.request.contextPath}/on/boardList" class="btn">댓글 관리</a></li> 
     <li class="list-group-item">
           <a href="${pageContext.request.contextPath}/on/categoryList" class="btn">카테고리 관리</a></li> 
</ul>
</body>
</html>
