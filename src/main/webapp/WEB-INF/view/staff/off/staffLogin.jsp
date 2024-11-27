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
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <!-- 로그인 폼 -->
        <div class="card">
          <div class="card-header text-center">
            <h3>Staff Login</h3>
          </div>
          <div class="card-body">
            <!-- 로그인 실패 메시지 -->
            <c:if test="${not empty msg}">
              <div class="alert alert-danger text-center">
                ${msg}
              </div>
            </c:if>

            <!-- 로그인 폼 -->
            <form id="loginForm" action="${pageContext.request.contextPath}/staff/off/staffLogin" method="post">
              <div class="mb-3">
                <label for="staffId" class="form-label">Staff ID</label>
                <input type="text" class="form-control" id="staffId" name="staffId" required>
              </div>
              <div class="mb-3">
                <label for="staffPw" class="form-label">Password</label>
                <input type="password" class="form-control" id="staffPw" name="staffPw" required>
              </div>
              <button type="button" id="loginButton" class="btn btn-primary w-100">Login</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 고정 푸터 -->
  <footer class="text-center py-3 mt-auto bg-dark text-white">
    <!-- 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>
  </footer>

</body>
<script>
  // 로그인 버튼 클릭 시 폼 유효성 검사
   $('#loginButton').click(function () {
    let staffId = $('#staffId').val();
    let staffPw = $('#staffPw').val();

    // 유효성 검사
    if (!staffId || staffId.trim() === '') {
      alert('Staff ID를 입력하세요.');
    } else if (!staffPw || staffPw.trim() === '') {
      alert('Password를 입력하세요.');
    } else {
      $('#loginForm').submit(); // 유효성 검사를 통과하면 폼 제출
    }
  });
</script>
</html>