<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>상품 리스트</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300);

        body {
            background-color: #808080; /* 배경색을 회색으로 설정 */
            color: #ffffff; /* 기본 텍스트 색상을 흰색으로 설정 */
            overflow-x: hidden;
            font-family: 'Open Sans', sans-serif;
            -webkit-font-smoothing: antialiased !important;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
            font-weight: 700;
        }

        .col-sm-2 {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 16.666667%;
            z-index: 1000;
            overflow-y: auto;
        }

        .col-sm-10 {
            margin-left: 16.666667%;
            width: calc(100% - 16.666667%);
            padding-left: 15px;
            padding-right: 15px;
        }

        .container-fluid {
            padding-left: 0;
            padding-right: 0;
        }

        table {
            margin-top: 20px;
        }

        .table-dark th {
            background-color: #000000; /* 헤더 배경색을 검정으로 설정 */
            color: #ffffff; /* 헤더 글씨 색상을 흰색으로 설정 */
        }

        .table tbody tr {
            background-color: #A9A9A9; /* 각 행의 배경색을 어두운 회색으로 설정 */
        }

        .pagination {
            justify-content: center;
        }

        .app-button {
            text-decoration: none;
            color: #FFFFFF;
            font-size: 2vh;
            padding: 10px 25px;
            display: inline-block;
            margin-top: 2vh;
            border: 1px solid #FFFFFF;
            background: #000000;
            font-weight: 400;
            cursor: pointer;
            transition: background 0.3s, color 0.3s;
        }

        .app-button:hover {
            background: #FFFFFF; /* Hover 시 배경색 변경 */
            color: #000000; /* Hover 시 글씨 색상 변경 */
        }
    </style>
</head>
<body>
    <!-- 전체 레이아웃 -->
    <div class="container-fluid">
        <div class="row">
            <!-- Left Menu -->
            <div class="col-sm-2 bg-light">
                <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
            </div>

            <!-- Main Content -->
            <div class="col-sm-10">
                <h2 class="text-center mt-4">상품 관리</h2> 
                <form class="d-flex justify-content-between align-items-center">
                    <a href="${pageContext.request.contextPath}/staff/on/addGoods" class="app-button">상품 추가</a> <!-- 상품 추가 버튼 -->
                </form>

                <table class="table table-bordered table-hover mt-4">
                    <thead class="table-dark"> 
                        <tr>
                            <th>상품 번호</th>
                            <th>카테고리</th>
                            <th>상품명</th>
                            <th>상품 이미지</th>
                            <th>상품 가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="goods" items="${goodsList}">
                            <tr>
                                <td>${goods.goodsNo}</td>
                                <td>${goods.category}</td>
                                <td>${goods.goodsTitle}</td>
                                <td><img src="${pageContext.request.contextPath}/upload/${goods.goodsFileName}.${goods.goodsFileExt}" 
                                         alt="상품 이미지" width="80" height="80" style="object-fit: cover;"></td>
                                <td>${goods.goodsPrice}원</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                 <nav>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPages}" var="page">
                            <li class="page-item ${page == currentPage ? 'active' : ''}">
                                <a class="page-link" href="goodsList?page=${page}">${page}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>
</body>
</html>