<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <!-- header menu 고정 -->
    <div class="header-menu">
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>

    <div class="container mt-5">
        <h2>장바구니</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>이미지</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th><button>삭제</button></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cart" items="${cartList}">
                    <tr>
                        <td>${goodsFile.goodsFileExt}</td>
                        <td>${cart.goodsTitle}</td>
                        <td>${cart.cartAmount}</td>
                        <td>${cart.goodsPrice}</td>
                        <td>${cart.cartAmount * cart.goodsPrice}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/customer/on/cart/delete" method="post" style="display: inline;">
                                <input type="hidden" name="cartNo" value="${cart.cartNo}">
                                <input type="hidden" name="customerMail" value="${cart.customerMail}">
                                <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/customer/on/cart/update" method="post" style="display: inline;">
                                <input type="hidden" name="cartNo" value="${cart.cartNo}">
                                <input type="hidden" name="customerMail" value="${cart.customerMail}">
                                <input type="number" name="cartAmount" value="${cart.cartAmount}" min="1" style="width: 50px;">
                                <button type="submit" class="btn btn-primary btn-sm">수정</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h4>총 금액: ${totalAmount} 원</h4>
        <form action="${pageContext.request.contextPath}/customer/on/cart/orderAll" method="post">
            <input type="hidden" name="customerMail" value="${customerMail}">
            <button type="submit" class="btn btn-success">전체 주문</button>
        </form>
    </div>

    <footer class="text-center py-3 bg-dark text-white mt-5">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>