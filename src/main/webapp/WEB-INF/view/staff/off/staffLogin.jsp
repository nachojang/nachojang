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
  <title>Staff Login</title>
</head>
<body class="d-flex flex-column min-vh-100">

  <!-- 로그인 폼 -->
  <div class="login-container text-center mt-5">
    <!-- 실패 메시지 표시 -->
    <c:if test="${not empty msg}">
      <div class="alert alert-danger text-center">
        ${msg}
      </div>
    </c:if>

    <h1>Staff Login</h1>
    <form id="form" action="${pageContext.request.contextPath}/staff/off/staffLogin" method="post" class="mt-4">
      <div class="mb-3">
        <label for="loginS" class="form-label">Staff ID</label>
        <input id="loginS" name="loginS" type="text" class="form-control text-center" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input id="password" name="password" type="password" class="form-control text-center" required>
      </div>
      <button id="btn" type="button" class="btn btn-primary w-100">Login</button>
    </form>
  </div>

  <!-- 고정 푸터 -->
  <footer class="text-center py-3 mt-auto bg-dark text-white">
    <!-- 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>
  </footer>

</body>
<script>
  // 로그인 버튼 클릭 시 폼 유효성 검사
  $('#btn').click(function() {
    if ($.isNumeric($('#loginS').val()) == false) {
      alert('Staff ID는 숫자만 입력 가능합니다.');
    } else if ($('#password').val().length < 4) {
      alert('Password는 4자 이상 입력해야 합니다.');
    } else {
      $('#form').submit();
    }
  });
</script>
</html>