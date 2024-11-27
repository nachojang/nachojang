<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>홈</title>
    <style>
        /* leftMenu 고정 위치 */
        .left-menu {
            position: fixed;
            top: 0;
            left: 0;
            width: 200px;  /* 적당한 width 설정 */
            height: 100vh; /* 화면 높이 전체를 차지 */
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        /* 콘텐츠 중앙 정렬 */
        .main-content {
            margin-left: 220px;  /* leftMenu 너비만큼 여백을 둔다 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 높이 전체 차지 */
        }
    </style>
</head>
<body>

    <!-- Left menu 고정 -->
    <div class="left-menu">
        <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
    </div>

    <!-- Main content 중앙 정렬 -->
    <div class="main-content">
        <h1>관리자님 환영합니다</h1>
    </div>

    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>
</body>
</html>