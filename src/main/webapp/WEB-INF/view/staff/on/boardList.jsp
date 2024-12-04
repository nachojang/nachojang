<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>후기 리스트</title>

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
            width: 100%; /* 테이블 너비를 100%로 설정 */
            border-collapse: collapse; /* 테이블 경계선을 단순화 */
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

        .pagination {
            justify-content: center;
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
        
        <!-- main -->
        <div class="col-sm-10">
            <!-- main content -->
            <h1>댓글 관리</h1>
            
              <table class="table table-bordered table-hover mt-4">
                <thead class="table-dark">
                    <tr>
                        <th>상품 번호</th>
                        <th>댓글 번호</th>
                        <th>작성자 메일</th>
                        <th>작성 후기</th>
                        <th>작성 일자</th>
                        <th>삭제</th> <!-- 삭제 칸 포함 -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${boardList}">
                        <tr>
                            <td>${b.goodsNo}</td>
                            <td>${b.ordersNo}</td>
                            <td>${b.customerMail}</td>
                            <td>${b.boardContent}</td>
                            <td>${b.createDate}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/staff/on/deleteBoard?ordersNo=${b.ordersNo}" class="btn btn-danger">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

         
            <!-- 페이징 -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?currentPage=${currentPage - 1}">이전</a> <!-- 이전 페이지 링크 -->
                        </li>
                    </c:if>

                    <!-- 페이지 번호 반복 출력 -->
                    <c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
                        <li class="page-item ${num == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?currentPage=${num}">${num}</a> 
                        </li>
                    </c:forEach>

                    <c:if test="${currentPage < lastPage}">
                        <li class="page-item">
                            <a class="page-link" href="?currentPage=${currentPage + 1}">다음</a> <!-- 다음 페이지 링크 -->
                        </li>
                    </c:if>
                </ul>
            </nav>

        </div>

    </div>

    <!-- 고정 (회사정보) -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>

</body>
</html>