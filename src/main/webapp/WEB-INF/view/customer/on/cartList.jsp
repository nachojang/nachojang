<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        /* 여기에 CSS 복사 */
        body {
            background: #ddd;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: sans-serif;
            font-size: 1rem;  /* 폰트 크기 키우기 */
            font-weight: bold;
        }
        .title {
            margin-bottom: 6vh;
            text-align: center;
        }
        .card {
            margin: 3vh auto;
            max-width: 1200px; /* 카드 크기 확장 */
            width: 95%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            background-color: #fff;
            padding: 30px; /* 카드 내 여백 확대 */
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            text-align: center;
            padding: 1.5rem; /* 테이블 셀 크기 확대 */
        }
        img {
            width: 120px; /* 이미지 크기 확대 */
            height: 120px;
            object-fit: cover;
        }
        .btn {
            background-color: #000;
            border-color: #000;
            color: white;
            font-size: 1rem;  /* 버튼 폰트 크기 확대 */
            padding: 1rem 2rem; /* 버튼 패딩 확대 */
            margin: 1rem;
            width: auto;
            display: inline-block;
            border-radius: 5px;
        }
        .btn:hover {
            color: white;
            background-color: #333;
        }
        #totalPrice {
            font-size: 1.5rem; /* 총 금액 글자 크기 확대 */
            font-weight: bold;
            color: #333;
        }
        footer {
            margin-top: 5vh;
        }
    </style>
</head>
<body>

    <!-- 헤더 고정 -->
    <header>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </header>

    <!-- 장바구니 -->
    <div class="card">
        <h2 class="title">회원님 장바구니</h2>
        <form method="post" id="cartForm" action="${pageContext.request.contextPath}/customer/on/ordersPayment">
            <input type="hidden" name="customerMail" value="${customerMail}">
            <table border="1" cellspacing="1" cellpadding="5">
                <thead>
                    <tr>
                        <th>선택</th>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>금액</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cartList}" var="c">
                        <tr>
                            <td><input type="checkbox" name="selectedCartNos" value="${c.cartNo}"></td>
                            <td><img src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" alt="${c.goodsTitle}"></td>
                            <td>${c.goodsTitle}</td>
                            <td>${c.cartAmount}</td>
                            <td>${c.totalPrice}</td>
                            <td><a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/customer/cart/delete?cartNo=${c.cartNo}">삭제</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="text-end mt-3">
                <p>총 결제 금액: <span id="totalPrice">0</span> 원</p>
            </div>
            <div class="text-center">              
                <button type="button" id="checkoutAllBtn" class="btn btn-primary">전체 주문</button>
                 <button type="button" id="checkoutSelectedBtn" class="btn btn-primary">선택 주문</button>
            </div>
        </form>
    </div>

    <!-- 고정 (회사정보) -->
    <footer class="mt-5">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

<script>
    $(document).ready(function () {
        function calculateTotalPrice() {
            let totalPrice = 0;
            $('input[name="selectedCartNos"]:checked').each(function () {
                const price = parseInt($(this).closest('tr').find('td').eq(4).text().trim());
                totalPrice += isNaN(price) ? 0 : price;
            });
            $('#totalPrice').text(totalPrice.toLocaleString());
        }
        $('input[name="selectedCartNos"]').on('change', calculateTotalPrice);
        calculateTotalPrice();
        $('#checkoutSelectedBtn').on('click', function () {
            if ($('input[name="selectedCartNos"]:checked').length === 0) {
                alert('선택된 상품이 없습니다. 체크박스를 선택해주세요.');
            } else {
                $('#cartForm').submit();
            }
        });
        $('#checkoutAllBtn').on('click', function () {
            $('input[name="selectedCartNos"]').prop('checked', true);
            $('#cartForm').submit();
        });
    });
</script>
</body>
</html>