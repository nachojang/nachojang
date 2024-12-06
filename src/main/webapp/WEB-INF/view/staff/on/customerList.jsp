<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <style>
        table {
            margin-top: 20px;
        }
        .pagination {
            justify-content: center;
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
        .container {
            max-width: 800px; /* 최대 너비 설정 */
            margin: auto; /* 중앙 정렬 */
        }
        h1 {
            font-size: 2.5rem; /* 제목 크기 조정 */
            color: #ffffff; /* 제목 색상 흰색으로 설정 */
            text-align: center; /* 제목 중앙 정렬 */
        }
        .table-dark th {
            background-color: #000000; /* 헤더 배경색을 검정으로 설정 */
            color: #ffffff; /* 헤더 글씨 색상을 흰색으로 설정 */
        }
        .table tbody tr {
            background-color: #A9A9A9; /* 각 행의 배경색을 어두운 회색으로 설정 */
        }
    </style>
</head>
<body>
    <!-- 사이드바 -->
    <div class="row">
        <div class="col-sm-2 bg-light">
            <!-- leftMenu.jsp include -->
            <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
        </div>
        <div class="col-sm-10">
            <div class="container">
                <h1 class="mt-4 mb-4">회원 관리</h1>

                <!-- 회원 리스트 테이블 -->
                <table class="table table-bordered text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>메일</th>
                            <th>생일</th>
                            <th>성별</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td>${customer.customerMail}</td>
                                <td>${customer.customerBirth}</td>
                                <!-- 성별 출력 수정 -->
                                <td>${customer.customerGender == '남자' ? '남자' : (customer.customerGender == '여자' ? '여자' : '정보없음')}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- 페이징 -->
                <nav>
                    <ul class="pagination">
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i}</a> <!-- 페이지 링크 추가 -->
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>
</body>
</html>