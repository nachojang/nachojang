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

    <style>
        /* Reset & Global */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.5;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        /* 헤더 스타일 */
        .header-menu {
            padding: 1rem;
            background-color: dodgerblue;
            color: white;
        }

        /* 메인 컨텐츠 */
        .content {
            margin: 0 auto;
            max-width: 800px;
            padding: 2rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
            flex: 1; /* 남은 공간을 채우기 위해 설정 */
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            font-weight: bold;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
        }

        td {
            padding: 0.8rem;
            border: 1px solid #ddd;
            text-align: left;
        }

        td:first-child {
            font-weight: bold;
        }

        /* 버튼 스타일 */
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

        /* 하단 고정 푸터 */
        .footer-info {
            text-align: center;
            padding: 1rem;
            background-color: #343a40;
            color: white;
            font-size: 0.9rem;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }

        .footer-info a {
            text-decoration: none;
            color: lightblue;
        }

        .footer-info a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- 헤더 -->
    <div>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>

    <!-- 결제 완료 내용 -->
    <br>
    <div class="content" >
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

    <!-- 푸터 고정 -->
    <br>
    <div class="footer-info">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </div>

</body>
</html>
