<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상품리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

    <!-- 헤더 고정 -->
    <header>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </header>

    <!-- 상품리스트 -->
    <div class="container mt-5">
        <h1 class="text-center mb-5">상품목록</h1>
        <div class="row">
            <c:forEach var="g" items="${goodsList}">
                <div class="col-md-3">
                    <div class="card mb-4">
                        <a href="${pageContext.request.contextPath}/customer/goodsOne?goodsNo=${g.goodsNo}">
                            <img src="${pageContext.request.contextPath}/upload/${g.goodsFileName}.${g.goodsFileExt}" 
                                 alt="상품 이미지" class="card-img-top" style="object-fit: cover; height: 150px;">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title">${g.goodsTitle}</h5>
                            <p class="card-text">${g.goodsPrice} 원</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 페이징 -->
        <div class="text-center mt-5">
            <c:if test="${currentPage > 1}">
                <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/customer/goodsList?currentPage=1">처음</a>
                <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/customer/goodsList?currentPage=${currentPage - 1}">이전</a>
            </c:if>
            <span class="mx-2">[${currentPage}]</span>
            <c:if test="${currentPage < lastPage}">
                <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/customer/goodsList?currentPage=${currentPage + 1}">다음</a>
                <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/customer/goodsList?currentPage=${lastPage}">마지막</a>
            </c:if>
        </div>
    </div>

    <!-- 고정 (회사정보) -->
    <footer class="mt-5">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

</body>
</html>
