<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>고객 주문내역</title>

</head>
<body>

	<!-- 헤더 고정 -->
	<div class="header-menu">
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>

	<!-- main -->
	<div class="col-sm-10">
		<!-- main content -->
		<table class="table">
			<tr>
				<td>결제 번호</td>
				<td>주문 일자</td>
				<td>상품 개수</td>
				<td>총 주문 가격</td>
				<td>배송 상태</td>
			</tr>
			<c:forEach var="o" items="${ordersList}">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/customer/on/ordersOne?paymentNo=${o.paymentNo}">
							${o.paymentNo}
						</a>	
					</td>
					<td>${o.createDate}</td>
					<td>${o.ordersAmount}</td>
					<td>${o.paymentPrice}</td>
					<td>
						<c:if test="${o.paymentState == '배송중'}">
							<a href="${pageContext.request.contextPath}/customer/on/modifyState?paymentNo=${o.paymentNo}&paymentState=${o.paymentState}&customerMail=${customerMail}">
								${o.paymentState}
							</a>
						</c:if>
						<c:if test="${o.paymentState == '결제완료' || o.paymentState == '배송완료'}">
							${o.paymentState}
						</c:if>					
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- 페이징 -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/customer/on/ordersList?customerMail=${customerMail}&currentPage=${currentPage - 1}">이전</a> <!-- 이전 페이지 링크 -->
                </li>
            </c:if>

            <!-- 페이지 번호 반복 출력 -->
            <c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
                <li class="page-item ${num == currentPage ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/customer/on/ordersList?customerMail=${customerMail}&currentPage=${num}">${num}</a> 
                </li>
            </c:forEach>

            <c:if test="${currentPage < lastPage}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/customer/on/ordersList?customerMail=${customerMail}&currentPage=${currentPage + 1}">다음</a> <!-- 다음 페이지 링크 -->
                </li>
            </c:if>
        </ul>
    </nav>

	<!-- 고정 (회사정보) -->
    <div>	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
    
</body>
</html>	