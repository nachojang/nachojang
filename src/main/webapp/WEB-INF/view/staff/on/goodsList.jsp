<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 리스트</title>
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
<div class="row">
        <div class="col-sm-2 bg-light">
            <!-- leftMenu.jsp include -->
            <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
        </div>
        </div>
	 <!-- 푸터 -->
    <footer class="text-center py-3 bg-dark text-white">
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </footer>
</body>
</html>