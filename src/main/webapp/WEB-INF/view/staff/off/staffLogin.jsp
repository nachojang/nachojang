<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

  <!-- 부트스트랩 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- 부트스트랩 JS 및 Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <meta charset="UTF-8">
  <title>스탭 로그인</title>

</head>
<body class="d-flex flex-column min-vh-100"> <!-- d-flex와 flex-column을 사용하여 flex 레이아웃을 설정 -->

  <!-- 메인 영역 -->
	

  <!-- 고정 푸터 -->
  <footer class="text-center py-3 mt-auto bg-dark text-white">
    <!-- 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>
  </footer>

</body>
</html>
