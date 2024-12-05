<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <meta charset="UTF-8">
    <title>ADD CUSTOMER</title>
    <style>
        @font-face {
            font-family: "Poppins-Regular";
            src: url("../fonts/poppins/Poppins-Regular.ttf");
        }
        @font-face {
            font-family: "Poppins-SemiBold";
            src: url("../fonts/poppins/Poppins-SemiBold.ttf");
        }
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        body {
            font-family: "Poppins-Regular";
            color: #333;
            font-size: 13px;
            margin: 0;
        }
        input, textarea, select, button {
            font-family: "Poppins-Regular";
            color: #333;
            font-size: 13px;
        }
        .wrapper {
            min-height: 100vh;
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
        }
        .inner {
            padding: 20px;
            background: #fff;
            max-width: 1000px; /* 최대 너비를 늘림 */
            margin: auto;
            display: flex;
            flex-direction: column;
        }
        .inner form {
            width: 100%;
            padding-top: 36px;
            padding-left: 45px;
            padding-right: 45px;
        }
        .inner h3 {
            text-transform: uppercase;
            font-size: 25px;
            font-family: "Poppins-SemiBold";
            text-align: center;
            margin-bottom: 28px;
        }
        .form-group {
            display: flex;
            margin-bottom: 25px;
        }
        .form-group input {
            width: 50%;
        }
        .form-group input:first-child {
            margin-right: 25px;
        }
        .form-wrapper {
            position: relative;
            margin-bottom: 25px;
        }
        .form-control {
            border: 1px solid #333;
            border-top: none;
            border-right: none;
            border-left: none;
            display: block;
            width: 100%;
            height: 30px;
            padding: 0;
        }
        button {
            border: none;
            width: 164px; /* 버튼 너비 */
            height: 51px; /* 버튼 높이 */
            margin: 10px auto; /* 버튼 마진 */
            cursor: pointer; /* 커서 포인터 */
            display: flex; /* 플렉스 박스 */
            align-items: center; /* 수직 정렬 */
            justify-content: center; /* 수평 정렬 */
            padding: 0; /* 패딩 제거 */
            background: #333; /* 배경색 */
            font-size: 15px; /* 글자 크기 */
            color: #fff; /* 글자 색상 */
            vertical-align: middle; /* 수직 정렬 */
           -webkit-transform: perspective(1px) translateZ(0); /* 변형 효과 */
           transform: perspective(1px) translateZ(0); /* 변형 효과 */
           -webkit-transition-duration: 0.3s; /* 전환 효과 */
           transition-duration: 0.3s; /* 전환 효과 */
       }
    </style>
</head>
<body>
    <!-- 헤더 고정 -->
    <div>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>
    
    <div class="wrapper">
        <div class="inner">
            <h3>회원가입</h3>
            ${msg}
            
             <!-- 중복확인 폼 -->
             <form id="formMailCheck" method="post" action="${pageContext.request.contextPath}/customer/off/mailCheck">
                <div class="form-wrapper">
                    <input type="email" name="mailCheck" id="mailCheck" placeholder="Email Address" class="form-control">
                </div>
                <button type="submit">중복확인</button>
             </form>

             <!-- 회원가입 폼 -->
             <form id="formAddCustomer" method="post" action="${pageContext.request.contextPath}/customer/off/addCustomer">
                <div class="form-wrapper">
                    <input type="email" name="customerMail" id="customerMail" placeholder="Email Address" class="form-control" value="${mailCheck}" readonly>
                </div>
                <div class="form-wrapper">
                    <input type="password" name="customerPw" id="customerPw" placeholder="Password" class="form-control">
                </div>
                <div class="form-wrapper">
                    <input type="password" name="repw" id="repw" placeholder="Confirm Password" class="form-control">
                </div>
                <div class="form-wrapper">
                    <input type="date" name="customerBirth" id="customerBirth" class="form-control">
                </div>
                <div class="form-group">
                    <label>
                        <input type="radio" name="customerGender" class="customerGender" value="남자"> 남자
                    </label>
                    <label>
                        <input type="radio" name="customerGender" class="customerGender" value="여자"> 여자
                    </label>
                </div>
                <button type="button" id="btnAddCustomer">회원가입</button>
             </form>

         </div> 
     </div> 
</body>

<script>
// 회원가입 유효성 검사
$('#btnAddCustomer').click(function() {
    if($('#customerMail').val() == '') {
        alert('메일을 입력하세요');
    } else if($('#customerPw').val() == '') {
        alert('비밀번호를 입력하세요');
    } else if($('#customerPw').val() != $('#repw').val()) {
        alert('비밀번호가 같지 않습니다');
    } else if($('#customerBirth').val() == '') {
        alert('생일을 입력하세요');
    } else if($('.customerGender:checked').length == 0) {
        alert('성별을 선택하세요');
    } else {
        $('#formAddCustomer').submit();
    }
});
</script>

</html>