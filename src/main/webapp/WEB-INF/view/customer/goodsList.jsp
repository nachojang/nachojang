<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품리스트</title>

</head>
<body>

	<div class="row">
		<!-- 헤더 고정 -->
		<div>
			<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
		</div>
			
		<div class="mt-5">
			<!-- 상품리스트 -->	
			<h1 class="text-center mb-5"> 상품목록 </h1>
			<c:forEach var="g" items="${goodsList}">
				<table class="table table-bordered">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/customer/goodsOne?goodsNo=${g.goodsNo}">
								<img src="${pageContext.request.contextPath}/upload/${g.goodsFileName}.${g.goodsFileExt}" 
						                  alt="상품 이미지" width="80" height="80" style="object-fit: cover;">
							</a>
					    </td>
					</tr>
					<tr>
					    <td>${g.goodsTitle}</td>
					</tr>
					<tr>
					    <td>${g.goodsPrice}</td>
					</tr>
				</table>
			</c:forEach>
				
			<!-- 페이징 -->
			<div class="text-center mt-5">
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=1">처음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage - 1}">이전</a> &nbsp;
				</c:if>
				[${currentPage}] &nbsp;
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage + 1}">다음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${lastPage}">마지막</a> &nbsp;
				</c:if>
			</div>
		</div>	
	</div>
	
    <!-- 고정 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>


</body>
</html>