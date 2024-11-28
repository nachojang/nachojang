<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>상품 리스트</title>
    <style>
        table {
            margin-top: 20px;
        }
        .pagination {
            justify-content: center;
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
                   

              <a
		href="${pageContext.request.contextPath}/staff/on/addGoods" class="btn" class="btn">상품 추가</a> <
                </form>
                
                <table class="table table-bordered table-hover mt-4">
                    <thead>
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
                                <td><img src="${pageContext.request.contextPath}/upload/${goods.goodsFileNo}.${goods.goodsFileExt}" 
                         alt="상품 이미지" width="80" height="80" style="object-fit: cover;"></td>
                                <td>${goods.goodsPrice} 원</td>
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