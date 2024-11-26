<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <style>
        table {
            margin-top: 20px;
        }
        .pagination {
            justify-content: center;
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
                <h1 class="mt-4 mb-4 text-center">회원 관리</h1>

      
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
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>
</body>
</html>