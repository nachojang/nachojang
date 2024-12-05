<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NA CHO JANG</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

    <!-- 헤더 -->
    <header>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </header>

    <!-- 인기상품 -->
    <section class="mt-5 container">
        <h1 class="text-center">인기상품</h1>
        <div class="row">
            <c:forEach var="bg" items="${bestGoodsList}">
                <div class="col-md-3">
                    <div class="card mb-4">
                        <a href="${pageContext.request.contextPath}/customer/goodsOne?goodsNo=${bg.goodsNo}">
                            <img src="${pageContext.request.contextPath}/upload/${bg.goodsFileName}.${bg.goodsFileExt}" 
                                 alt="상품 이미지" class="card-img-top" style="object-fit: cover; height: 150px;">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title">${bg.goodsTitle}</h5>
                            <p class="card-text">${bg.goodsPrice} 원</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- 신규상품 -->
    <section class="mt-3 container">
        <h1 class="text-center">신규상품</h1>
        <div class="row">
            <c:forEach var="ng" items="${newGoodsList}">
                <div class="col-md-3">
                    <div class="card mb-4">
                        <a href="${pageContext.request.contextPath}/customer/goodsOne?goodsNo=${ng.goodsNo}">
                            <img src="${pageContext.request.contextPath}/upload/${ng.goodsFileName}.${ng.goodsFileExt}" 
                                 alt="상품 이미지" class="card-img-top" style="object-fit: cover; height: 150px;">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title">${ng.goodsTitle}</h5>
                            <p class="card-text">${ng.goodsPrice} 원</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- 회사정보 -->
    <footer class="mt-5">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

</body>
</html>
