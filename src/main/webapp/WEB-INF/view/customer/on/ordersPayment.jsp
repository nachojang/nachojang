<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제창</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Space+Mono:700" rel="stylesheet">
    
    <style>
        /* 기본 스타일 */
        * { margin: 0; padding: 0; box-sizing: border-box; }

        html, body {
            height: 100%;
            font-size: 16px;
            font-weight: 400;
            font-family: 'Lato', sans-serif;
            background: #f8f9fa;
            display: flex;
            flex-direction: column;
        }

        .content {
            margin: 3rem auto;
            max-width: 800px;
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            flex: 1; /* 남은 공간 채우기 */
        }

        h1 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 1rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            font-weight: 600;
            color: #555;
        }

        select, input[type="radio"] {
            margin-top: 0.5rem;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            text-align: left;
            padding: 0.75rem;
            background-color: #f1f1f1;
        }

        .product-img {
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
        }

        .btn-primary {
            background-color: #5c6bc0;
            border: none;
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 4px;
            width: 100%;
            text-align: center;
            font-size: 1.2rem;
        }

        .btn-primary:hover {
            background-color: #3f4d9f;
        }

        .payment-method {
            display: flex;
            align-items: center;
            margin-top: 1rem;
        }

        .payment-method label {
            margin-right: 1rem;
        }

        footer {
            background-color: #f1f1f1;
            padding: 1rem 0;
            text-align: center;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }

        /* 반응형 디자인 */
        @media (max-width: 767px) {
            .content {
                margin: 1rem;
                padding: 1.5rem;
            }

            .btn-primary {
                padding: 1rem;
                font-size: 1rem;
            }

            table td {
                padding: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header class="header-menu">
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </header>

    <!-- 메인 콘텐츠 -->
    <div class="content">
        <h1>결제</h1>
        <form id="formPayment" method="post" action="${pageContext.request.contextPath}/customer/on/addPayment">
            <input type="hidden" name="paymentPrice" value="${totalPrice}">

            <!-- 주문자 정보 -->
            <div class="form-group">
                <label for="customerMail">주문자</label>
                <p id="customerMail">${customerMail}</p>
            </div>

            <!-- 주소 선택 -->
            <div class="form-group">
                <label for="address">주소</label>
                <c:if test="${addressList == null}">
                    <p>등록된 주소가 없습니다.</p>
                </c:if>
                <c:if test="${addressList != null}">
                    <select name="addressNo" class="form-control">
                        <c:forEach var="a" items="${addressList}">
                            <option value="${a.addressNo}" <c:if test="${a == addressList[0]}">selected</c:if>>${a.addressDetail}</option>
                        </c:forEach>
                    </select>
                </c:if>
            </div>

            <!-- 주문상품 -->
            <div class="form-group">
                <label>주문상품</label>
                <table>
                    <tr>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>금액</th>
                    </tr>
                    <c:forEach var="c" items="${cartList}">
                        <input type="hidden" name="cartNo" value="${c.cartNo}">
                        <tr>
                            <td><img class="product-img" src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" alt="${c.goodsTitle}"></td>
                            <td>${c.goodsTitle}</td>
                            <td>${c.cartAmount}</td>
                            <td>${c.totalPrice}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- 결제금액 -->
            <div class="form-group">
                <label for="totalPrice">결제금액</label>
                <p id="totalPrice">${totalPrice}</p>
            </div>

            <!-- 결제수단 -->
            <div class="form-group payment-method">
                <label>결제수단:</label>
                <label>
                    페이 <input type="radio" name="paymentMethod" value="페이">
                </label>
                <label>
                    카드 <input type="radio" name="paymentMethod" value="카드">
                </label>
            </div>

            <!-- 결제 버튼 -->
            <button id="btnPayment" type="button" class="btn btn-primary">결제하기</button>
        </form>
    </div>

    <!-- 푸터 -->
    <footer>
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>

    <script>
        $('#btnPayment').click(function() {
            if (!$('select[name="addressNo"]').val()) {
                alert('주소를 선택해주세요');
                return;
            } else if (!$('input[name="paymentMethod"]:checked').val()) {
                alert('결제수단을 선택해주세요');
                return;
            }
            $('#formPayment').submit();
        });
    </script>
</body>
</html>
