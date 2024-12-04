<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>스태프 전체 주문내역</title>

    <style>
     @import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300);
        body {
            background-color: #808080; /* 배경색을 회색으로 설정 */
            color: #ffffff; /* 기본 텍스트 색상을 흰색으로 설정 */
            font-family: 'Open Sans', sans-serif;
        }
        h1 {
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
            font-weight: 700;
            text-align: center; /* 제목 중앙 정렬 */
            color: #ffffff; /* 제목 색상 흰색으로 설정 */
        }

        .col-sm-2 {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            overflow-y: auto;
        }

        .col-sm-10 {
            margin-left: 16.666667%;
            padding-left: 15px;
            padding-right: 15px;
        }

        table {
            margin-top: 20px;
            width: 100%; /* 테이블 너비를 100%로 설정 */
        }

        .table-dark th {
            background-color: #000000; /* 헤더 배경색을 검정으로 설정 */
            color: #ffffff; /* 헤더 글씨 색상을 흰색으로 설정 */
        }

        .table tbody tr {
            background-color: #A9A9A9; /* 각 행의 배경색을 어두운 회색으로 설정 */
        }

        .table tbody tr:hover {
            background-color: #888888; /* 마우스 오버 시 색상 변경 */
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #000;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="row">
        <!-- 관리 사이드바 고정 -->
        <div class="col-sm-2 bg-light">
            <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
        </div>

        <!-- Main Content -->
        <div class="col-sm-10">
            <h2 class="text-center mt-4">스태프 전체 주문내역</h2> 
            
            <!-- 주문 리스트 테이블 -->
            <table class="table table-bordered table-hover mt-4">
                <thead class="table-dark"> 
                    <tr>
                        <th>결제 번호</th>
                        <th>주문 일자</th>
                        <th>상품 개수</th>
                        <th>총 주문 가격</th>
                        <th>배송 상태</th>
                    </tr>
                </thead>
                <tbody>
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
                                <c:if test="${o.paymentState == '결제완료' || o.paymentState == '배송중'}">
                                    <a href="${pageContext.request.contextPath}/staff/on/modifyState?paymentNo=${o.paymentNo}&paymentState=${o.paymentState}">
                                        ${o.paymentState}
                                    </a>
                                </c:if>
                                <c:if test="${o.paymentState == '배송완료'}">
                                    ${o.paymentState}
                                </c:if>						
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${totalPages}" var="page">
                        <li class="page-item ${page == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${page}">${page}</a> <!-- 페이지 링크 추가 -->
                        </li>
                    </c:forEach>
                </ul>
            </nav>

        </div>
    </div>

    <!-- 고정 (회사정보) -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

</body>
</html>