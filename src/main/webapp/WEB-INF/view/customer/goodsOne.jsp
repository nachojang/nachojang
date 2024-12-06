<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>상품 상세</title>

    <!-- 스타일 추가 -->
    <style>
        /* Body */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        .header-menu {
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        /* 상품 상세 정보 */
        .product-detail {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .product-detail h3 {
            margin-bottom: 20px;
        }

        .product-detail img {
            max-width: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .product-detail .table td {
            vertical-align: middle;
        }

        /* 장바구니 버튼 스타일 */
        .btn-cart {
            background-color: #007bff !important; /* Blue color with high priority */
            color: white !important;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }

        .btn-cart:hover {
            background-color: #0056b3 !important; /* Darker blue when hovered */
        }

        .btn-out-of-stock {
            background-color: #e74c3c;
            color: white;
            border: none;
        }

        .btn-out-of-stock:hover {
            background-color: #c0392b;
        }

        /* 상품 설명 */
        .product-description {
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        /* 후기 테이블 */
        .reviews-table td {
            vertical-align: middle;
        }

        .reviews-table .delete-btn {
            color: #e74c3c;
            cursor: pointer;
            text-decoration: none;
        }

        .reviews-table .delete-btn:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>

    <!-- 헤더 고정 -->
    <div class="header-menu">
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>
    
    <!-- 상품 상세정보 -->
    <br>
    <div class="container product-detail">
        <h3 class="text-center mb-4">${goodsOne.goodsTitle}</h3>
        <div class="row">
            <!-- 상품 이미지 -->
            <div class="col-md-4 text-center">
                <img src="${pageContext.request.contextPath}/upload/${goodsOne.goodsFileName}.${goodsOne.goodsFileExt}"
                    alt="상품 이미지" class="img-fluid">
            </div>

            <!-- 상품 정보 및 장바구니 버튼 -->
            <div class="col-md-8">
                <form id="formCart" method="post" action="${pageContext.request.contextPath}/customer/on/addCart">
                    <table class="table table-bordered">
                        <tr>
                            <td><strong>카테고리</strong></td>
                            <td>${goodsOne.categoryTitle}</td>
                        </tr>
                        <tr>
                            <td><strong>판매가</strong></td>
                            <td>${goodsOne.goodsPrice} 원</td>
                        </tr>
                        <tr>
                            <td><strong>수량</strong></td>
                            <td><input type="number" name="cartAmount" id="cartAmount" value="1" class="form-control" min="1"></td>
                        </tr>
                    </table>
                    <c:if test="${goodsOne.goodsState == '재고있음'}">
                        <button type="button" id="btnCart" class="btn-cart">장바구니</button>
                    </c:if>
                    <input type="hidden" name="goodsNo" value="${goodsOne.goodsNo}">
                    <input type="hidden" name="customerMail" value="${customerMail}">
                </form>
                <c:if test="${goodsOne.goodsState == '재고없음'}">
                    <button type="button" class="btn btn-out-of-stock">품절</button>
                </c:if>
            </div>
        </div>

        <!-- 상품 설명 -->
        <div class="product-description">
            <h5>상품 설명</h5>
            <p>${goodsOne.goodsMemo}</p>
        </div>
        
        <!-- 상품 후기 -->
        <div class="my-4">
            <h5>상품 후기</h5>
            <table class="table table-bordered reviews-table text-center">
                <tr>
                    <th>후기번호</th>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성일자</th>
                    <th>삭제</th>
                </tr>
                <c:forEach var="bl" items="${boardList}">
                    <tr>
                        <td>${bl.ordersNo}</td>
                        <td>${bl.customerMail}</td>
                        <td>${bl.boardContent}</td>
                        <td>${bl.createDate}</td>
                        <td>
                            <c:if test="${bl.customerMail != customerMail}">
                                <span>-</span>
                            </c:if>
                            <c:if test="${bl.customerMail eq customerMail}">
                                <a href="${pageContext.request.contextPath}/customer/on/deleteBoard?goodsNo=${goodsOne.goodsNo}&ordersNo=${bl.ordersNo}" class="delete-btn">삭제</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <br>
    <!-- 고정 (회사정보) -->
    <br>
    <div>  
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>

</body>

<script>
    // 상품 수량 체크
    $('#btnCart').click(function() {
        var cartAmount = $('#cartAmount').val();
        
        if(cartAmount < 1 || isNaN(cartAmount))  {
            alert('수량을 확인해주세요');
        } else {
            $('#formCart').submit();
        }
    });
</script>

</html>
