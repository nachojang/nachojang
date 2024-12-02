

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<ul class="list-group">
	     <li class="list-group-item">
	         ::: ${loginStaff.staffId}님 ::: </li>
	     
	     <li class="list-group-item">
	           <a href="${pageContext.request.contextPath}/staff/on/logout" class="btn">로그아웃</a></li> 
	           
	     <li class="list-group-item">
	           <a href="${pageContext.request.contextPath}/staff/on/customerList" class="btn">회원 관리</a></li> 
	           
	     <li class="list-group-item">   
	           <a href="${pageContext.request.contextPath}/staff/on/goodsList" class="btn">상품 관리</a></li>
	  
	     <li class="list-group-item">   
	           <a href="${pageContext.request.contextPath}/staff/on/ordersList" class="btn">주문 관리</a></li>
	   
	     <li class="list-group-item">
	           <a href="${pageContext.request.contextPath}/staff/on/boardList" class="btn">댓글 관리</a></li>
	           
	     <li class="list-group-item">
	           <a href="${pageContext.request.contextPath}/staff/on/categoryList" class="btn">카테고리 관리</a></li> 
	</ul>
