<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>회사정보</title>
    <style>
        body {
            padding-bottom: 60px; /* 하단 고정 영역의 높이만큼 여백 추가 */
        }
        .fixed-bottom {
            padding: 20px 0;
            box-shadow: 0 -2px 5px rgba(0,0,0,0.1);
        }
        .fixed-bottom .col-4 {
            padding: 10px;
        }
        .fixed-bottom strong {
            font-size: 18px;
            display: block;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <!-- 페이지 내용 -->
    <div class="container-fluid">
        <!-- 다른 콘텐츠가 여기 들어올 수 있음 -->
    </div>

    <!-- 하단 고정 영역 -->
    <div class="fixed-bottom bg-light text-dark">
        <div class="container">
            <div class="row text-center">
                <!-- 첫 번째 항목 -->
                <div class="col-4">
                    <strong>연락처</strong>
                    02-000-0000
                </div>
                <!-- 두 번째 항목 -->
                <div class="col-4">
                    <strong>계좌번호</strong>
                    000-0000-00000-00
                </div>
                <!-- 세 번째 항목 -->
                <div class="col-4">
                    <strong>주소</strong>
                    서울시 구로구 KM 타워
                </div>
            </div>
        </div>
    </div>
</body>
</html>