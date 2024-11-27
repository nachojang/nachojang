<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>후기 리스트</title>

</head>
<body>

	<!-- 고정 (스테프 메뉴) -->	
	<div>
		<c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
	</div>
	
	<!-- main -->
	<div class="col-sm-10">
		<!-- main content -->
		<h1>댓글 관리</h1>
		<table class="table">
			<tr>
				<td>상품 번호</td>
				<td>댓글 번호</td>
				<td>작성자 메일</td>
				<td>작성 후기</td>
				<td>작성 일자</td>
				<td></td>
			</tr>
			<c:forEach var="b" items="${boardList}">
				<tr>
					<td>${b.goodsNo}</td>
					<td>${b.ordersNo}</td>
					<td>${b.customerMail}</td>
					<td>${b.boardContent}</td>
					<td>${b.createDate}</td>
					<td>
						<a href="${pageContext.request.contextPath}/staff/on/deleteBoard?ordersNo=${b.ordersNo}" class="btn btn-custom">
							삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<!-- 페이징 -->
		<!-- 이전 11 12 13 14 15 다음 -->
		<c:if test="${currentPage > 5}">
			<a href="${pageContext.request.contextPath}/staff/on/boardList?currentPage=${currentPage-5}">
				[이전] 
			</a>
		</c:if>
		
		<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
			
			<c:if test = "${num == currentPage}">
				${num}&nbsp;
			</c:if	>
			<c:if test = "${num != currentPage}">
				<a href="${pageContext.request.contextPath}/staff/on/boardList?currentPage=${num}">
					${num}
				</a>
				&nbsp;
			</c:if>
			
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/staff/on/boardList?currentPage=${currentPage+5}">
				[다음] 
			</a>
		</c:if>
	</div>
	
	<!-- 고정 (회사정보) -->
    <div>
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
</body>
</html>