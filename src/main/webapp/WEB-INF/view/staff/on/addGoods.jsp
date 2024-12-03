<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>상품 추가</title>

    <style>
        body {
            background-color: #808080; /* 배경색을 회색으로 설정 */
            color: #ffffff; /* 기본 텍스트 색상을 흰색으로 설정 */
            font-family: 'Open Sans', sans-serif;
        }

        h3 {
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

        .table-dark th {
            background-color: #000000; /* 헤더 배경색을 검정으로 설정 */
            color: #ffffff; /* 헤더 글씨 색상을 흰색으로 설정 */
        }

        .table tbody tr {
            background-color: #A9A9A9; /* 각 행의 배경색을 어두운 회색으로 설정 */
        }

        .app-button {
            text-decoration: none;
            color: #FFFFFF;
            font-size: 2.5vh;
            padding: 2px 4px;
            display: inline-block;
            margin-top: 2vh;
            border: 1px solid #FFFFFF;
            background: #000000;
            font-weight: 400;
            cursor: pointer;
            transition: background 0.3s, color 0.3s;
        }

        .app-button:hover {
            background: #FFFFFF; /* Hover 시 배경색 변경 */
            color: #000000; /* Hover 시 글씨 색상 변경 */
        }
    </style>
</head>
<body>
    <div class="row">
        <!-- 관리 사이드바 고정 -->
        <div class="col-sm-2 mt-5">
            <c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
        </div>
        
        <div class="col-sm-10 mb-3 mt-3">
            <h3 class="text-center">상품 추가</h3>
            
            <hr></hr>
            
            <form id="formAddGoods" method="post" action="${pageContext.request.contextPath}/staff/on/addGoods"
                enctype="multipart/form-data">
                <table class="table table-bordered">
                    <tr>
                        <td>상품명</td>
                        <td><input type="text" id="goodsTitle" name="goodsTitle" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>카테고리</td>
                        <td>
                            <select id="categoryNo" name="categoryNo" class="form-select">
                                <option value="">::: 카테고리 선택 :::</option>
                                <c:forEach var="c" items="${categoryList}">
                                    <option value="${c.categoryNo}">${c.categoryTitle}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>상품금액</td>
                        <td><input type="number" id="goodsPrice" name="goodsPrice" class="form-control">원</td>
                    </tr>
                    <tr>
                        <td>File</td>
                        <td>${msg}
                            <div id="fileDiv">
                                <button type="button" id="btnAddFile" class="app-button">파일추가</button>
                                <button type="button" id="btnRemoveFile" class="app-button">파일삭제</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>상품설명</td>
                        <td><textarea rows="3" cols="50" id="goodsMemo" name="goodsMemo" class="form-control"></textarea></td>
                    </tr>
                    <tr>
                        <td>상품재고</td>
                        <td>
                            <input type="radio" class="goodsState" name="goodsState" value="재고있음">재고있음<br>
                            <input type="radio" class="goodsState" name="goodsState" value="재고없음">재고없음<br>
                        </td>
                    </tr>
                </table>

                <!-- 상품 추가 버튼 -->
                <button type="button" id="btnAddGoods" class="app-button">상품 추가</button> 
                
                <!-- 고정 회사정보 -->
                <footer class="text-center py-3 bg-dark text-white">
                    <c:import url="/WEB-INF/view/company.jsp"></c:import> 
                </footer>

                <!-- 스크립트 -->
                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
                <!-- 상품 추가 폼 공백 유효성 검사 -->
                <script> 
                    $('#btnAddGoods').click(function() { 
                        if($('#goodsTitle').val() == '') { 
                            alert('상품명을 입력하세요'); 
                        } else if($('#categoryNo').val() == '') { 
                            alert('카테고리를 선택하세요'); 
                        } else if($('#goodsPrice').val() == '') { 
                            alert('상품금액을 입력하세요'); 
                        } else if($('#goodsMemo').val() == '') { 
                            alert('상품설명을 입력하세요'); 
                        } else if($('.goodsFile').length > 0 && $('.goodsFile').last().val() == '') { 
                            alert('첨부되지 않은 파일이 있습니다'); 
                        } else if($('.goodsState:checked').length == 0) { 
                            alert('재고상태를 선택하세요'); 
                        } else { 
                            $('#formAddGoods').submit(); 
                        } 
                    });
                    
                    // 파일 추가
                    $('#btnAddFile').click(function() { 
                        if($('.goodsFile').last().val() == '') { // 마지막 input=file 값이 공백이라면
                            alert('첨부하지 않은 파일이 이미 존재합니다');
                        } else {
                            let html = '<input type="file" name="goodsFile" class="goodsFile form-control">'; 
                            $('#fileDiv').append(html);
                        }
                    });
                    
                    // 파일 삭제
                    $('#btnRemoveFile').click(function() {
                        if($('.goodsFile').length == 0) { // class='goodsFile'가 없다면
                            alert('삭제할 파일이 존재하지 않습니다');	
                        } else {
                            $('.goodsFile').last().remove(); // 마지막 파일선택 삭제
                        }
                    });
                </script>

            </form>

        </div>

    </div>

</body>

</html>
