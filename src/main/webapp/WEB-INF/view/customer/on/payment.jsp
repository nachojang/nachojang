<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>결제완료</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Space+Mono:700" rel="stylesheet">
    
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        $font-head: "Space Mono", sans-serif;
        $font-txt: "Lato", sans-serif;
        $small: 0.8rem;
        $blue: dodgerblue;
        $violet: lighten(rebeccapurple, 20%);
        $yellow: lemonchiffon;

        html, body { 
            height: 100%; 
            font-size: 16px; 
            font-weight: 400; 
        }

        html, body, button, input[type="text"] { font-family: $font-txt; }

        .header-menu {
            padding: 1rem;
            background-color: $blue;
            color: white;
        }

        h1 {
            font-size: 2rem;
            margin: 1rem 0;
            font-weight: bold;
            text-align: center;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            margin-bottom: 2rem;
        }

        td {
            padding: 0.8rem;
            border: 1px solid #ddd;
            text-align: left;
        }

        td:first-child {
            font-weight: bold;
        }

        .blue-button {
    display: inline-block;
    margin-top: 2rem;
    padding: 0.8rem 2rem;
    text-decoration: none;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    text-align: center;
    transition: background-color 0.3s ease;
}

.blue-button:hover {
    background-color: #0056b3;
}

        .content {
            margin: 0 auto;
            max-width: 800px;
            padding: 2rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .footer-info {
            text-align: center;
            padding: 2rem;
            background-color: #f8f9fa;
        }
        
        .footer-info a {
            text-decoration: none;
            color: $violet;
        }

        .footer-info a:hover {
            text-decoration: underline;
        }

        .muted {
            color: grey;
        }
        
        html {
            background: repeating-linear-gradient(
                -45deg,
                $yellow,
                $yellow 10px,
                darken($yellow, 10%) 10px,
                darken($yellow, 10%) 20px
            );
        }
    </style>

</head>
<body>

    <!-- 헤더 고정 -->
    <div class="header-menu">
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>

    <!-- 결제 완료 내용 -->
    <br>
    <div class="content">
        <h1>결제완료</h1>
        <c:forEach var="o" items="${ordersList}">
            <table>
                <tr>
                    <td>주문번호</td>
                    <td>${o.ordersNo}</td>
                </tr>
                <tr>
                    <td>주문일자</td>
                    <td>${o.createDate}</td>
                </tr>
                <tr>
                    <td>배송지</td>
                    <td>${o.addressDetail}</td>
                </tr>
                <tr>
                    <td>주문금액</td>
                    <td>${o.paymentPrice}</td>
                </tr>
                <tr>
                    <td>결제방법</td>
                    <td>${o.paymentMethod}</td>
                </tr>
            </table>
        </c:forEach>

        <!-- 홈으로 링크 -->
       <div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/customer/main" class="blue-button">
        홈으로
    </a>
</div>
    </div>
    
    <br>
    <!-- 고정 (회사정보) -->
    <div>
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>

</body>
</html>
