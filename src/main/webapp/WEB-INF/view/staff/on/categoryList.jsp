<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>카테고리 리스트</title>

    <style>
        body {
            background-color: #808080; /* 배경색을 회색으로 설정 */
            color: #ffffff; /* 기본 텍스트 색상을 흰색으로 설정 */
            font-family: 'Open Sans', sans-serif;
        }

        h1 {
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
            font-weight: 700;
            text-align: center; /* 제목 중앙 정렬 */
            color: #ffffff; /* 제목 색상 흰색으로 설정 */
        }

        .col-sm-2 {
           margin-top: 20px; /* 표 상단 여백 */
            width: 100%; /* 표 너비를 페이지 가로에 맞게 100%로 설정 */
            border-collapse: collapse; /* 테이블 셀 간의 경계선 합침 */
        }

        .col-sm-10 {
            margin-left: 16.666667%;
            padding-left: 15px;
            padding-right: 15px;
        }

        table {
            margin-top: 20px;
            width: 100%; /* 테이블 너비를 100%로 설정 */
        }

        .table-dark th {
            background-color: #000000; /* 헤더 배경색을 검정으로 설정 */
            color: #ffffff; /* 헤더 글씨 색상을 흰색으로 설정 */
        }

        .table tbody tr {
            background-color: #A9A9A9; /* 각 행의 배경색을 어두운 회색으로 설정 */
        }

        .table tbody tr:hover {
            background-color: #888888; /* 마우스 오버 시 색상 변경 */
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #000;
            color: #fff;
        }
    </style>
</head>
<body>

    <!-- 고정 (스태프 메뉴) -->	
    <div class="row">
        <div class="col-sm-2 bg-light">
            <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
        </div>

        <!-- Main Content -->
        <div class="col-sm-10">
            <h1>카테고리 관리</h1>
            
            <table class="table table-bordered table-hover mt-4">
                <thead class="table-dark"> 
                    <tr>
                        <th>카테고리 번호</th>
                        <th>카테고리명</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${categoryList}">
                        <tr>
                            <td>${c.categoryNo}</td>
                            <td>${c.categoryTitle}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/staff/on/deleteCategory?categoryNo=${c.categoryNo}" class="btn btn-danger">삭제</a> <!-- 삭제 버튼 -->
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 카테고리 추가 링크 -->
            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/staff/on/addCategory" class="btn btn-primary">카테고리 추가</a> <!-- 카테고리 추가 버튼 -->
            </div>

        </div>

    </div>

    <!-- 고정 (회사정보) -->
    <footer>
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

</body>
</html>	