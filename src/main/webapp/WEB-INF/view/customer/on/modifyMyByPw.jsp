<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>회원정보수정_비밀번호</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        table td {
            padding: 12px;
            text-align: left;
        }

        table input {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .err-msg {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }

        .footer {
            margin-top: 50px;
            text-align: center;
            padding: 15px;
            background-color: #f8f9fa;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- 헤더 고정 -->
    <div>
        <c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
    </div>

    <br>
    <div class="container">
        <h1>비밀번호 변경</h1>

        <div class="err-msg">${errMsg}</div>

        <form id="formModifyPw" method="post" action="${pageContext.request.contextPath}/customer/on/modifyMyByPw">
            <table border="0">
                <tr>
                    <td><label for="prePw">변경 전 비밀번호</label></td>
                    <td><input type="password" name="prePw" id="prePw" placeholder="현재 비밀번호를 입력하세요"></td>
                </tr>
                <tr>
                    <td><label for="newPw">변경할 비밀번호</label></td>
                    <td><input type="password" name="newPw" id="newPw" placeholder="새로운 비밀번호를 입력하세요"></td>
                </tr>
                <tr>
                    <td><label for="rePw">비밀번호 확인</label></td>
                    <td><input type="password" name="rePw" id="rePw" placeholder="비밀번호를 다시 입력하세요"></td>
                </tr>
            </table>

            <!-- Change button to use Bootstrap's primary class -->
            <button type="button" id="btnModifyPw" class="btn btn-primary" style="width: 100%; padding: 12px; font-size: 16px; margin-top: 20px;">정보 수정</button>
        </form>
    </div>

    <!-- 고정 (회사정보) -->
    <div>
        <c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>

    <script>
        $('#btnModifyPw').click(function() {
            if ($('#prePw').val() == '') {
                alert('변경 전 비밀번호를 입력하세요');
            } else if ($('#newPw').val() == '') {
                alert('변경할 비밀번호를 입력하세요');
            } else if ($('#newPw').val() != $('#rePw').val()) {
                alert('변경 비밀번호가 잘못 입력되었습니다');
            } else {
                $('#formModifyPw').submit();
            }
        });
    </script>
</body>
</html>