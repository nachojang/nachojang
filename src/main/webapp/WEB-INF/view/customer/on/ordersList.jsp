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

<style>
    /* 기본 설정 */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .header-menu {
        background-color: #343a40;
        color: #fff;
        padding: 1rem 0;
        text-align: center;
    }

    .header-menu a {
        color: #fff;
        text-decoration: none;
        padding: 10px 20px;
        font-size: 1.1rem;
    }

    .header-menu a:hover {
        background-color: #495057;
        border-radius: 5px;
    }

    .col-sm-10 {
        margin: 3rem auto;
        padding: 2rem;
        max-width: 960px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
        font-size: 2rem;
        color: #333;
        margin-bottom: 1.5rem;
        text-align: center;
    }

    /* 테이블 디자인 */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    table th, table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
    }

    table td {
        background-color: #f9f9f9;
    }

    table td a {
        color: #007bff;
        text-decoration: none;
    }

    table td a:hover {
        text-decoration: underline;
    }

    /* 페이지네이션 스타일 */
    .pagination {
        justify-content: center;
        margin-top: 2rem;
    }

    .pagination .page-item {
        margin: 0 5px;
    }

    .pagination .page-link {
        background-color: #007bff;
        color: white;
        border: none;
        font-size: 1rem;
    }

    .pagination .page-link:hover {
        background-color: #0056b3;
    }

    .pagination .active .page-link {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .pagination .page-item.disabled .page-link {
        background-color: #ddd;
        color: #aaa;
    }

    /* 회사 정보 (하단) */
    .footer {
        background-color: #f1f1f1;
        padding: 1rem;
        text-align: center;
        font-size: 0.9rem;
        color: #333;
    }

</style>

</head>
<body>

	<!-- 헤더 고정 -->	
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>

	<!-- main -->
	<br>
	<div class="col-sm-10">
		<!-- main content -->
		<h1>고객 주문내역</h1>
		<table class="table">
			<tr>
				<th>결제 번호</th>
				<th>주문 일자</th>
				<th>상품 개수</th>
				<th>총 주문 가격</th>
				<th>배송 상태</th>
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
        <ul class="pagination">
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
    <div class="footer">	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
    
</body>
</html>
