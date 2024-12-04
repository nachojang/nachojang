<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>카테고리 추가</title>

    <style>
     @import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300);
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
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            overflow-y: auto;
        }

        .col-sm-10 {
            margin-left: 16.666667%;
            padding-left: 15px;
            padding-right: 15px;
        }

        table {
            margin-top: 20px;
            width: 80%; /* 테이블 너비 설정 */
        }

        .table {
            background-color: #A9A9A9; /* 테이블 배경색을 어두운 회색으로 설정 */
        }

        .table-dark th {
            background-color: #000000; /* 헤더 배경색을 검정으로 설정 */
            color: #ffffff; /* 헤더 글씨 색상을 흰색으로 설정 */
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

    <!-- 고정 헤더 -->
    <div class="row">
        <div class="col-sm-2 bg-light">
            <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
        </div>

        <!-- Main Content -->
        <div class="col-sm-10">
            <h1>카테고리 추가</h1>
            
            <form id="formCategory" method="post" action="${pageContext.request.contextPath}/staff/on/addCategory">
                <table class="table table-bordered">
                    <tr>
                        <td>카테고리 번호</td>
                        <td><input type="text" name="categoryNo" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>카테고리명</td>
                        <td><input type="text" name="categoryTitle" id="categoryTitle" class="form-control"></td>
                    </tr>
                </table>
                <button type="button" id="btnAddCategory" class="btn btn-primary">추가</button> <!-- 추가 버튼 -->
            </form>

        </div>
    </div>

    <!-- 고정 푸터 -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import> 
    </footer>

    <script>
        // 카테고리 추가 버튼 클릭 이벤트
        $('#btnAddCategory').click(function() {
            if ($('#categoryTitle').val() == '') {
                alert('카테고리명을 입력하세요');
            } else {
                $('#formCategory').submit();
            }
        });
    </script>

</body>
</html>