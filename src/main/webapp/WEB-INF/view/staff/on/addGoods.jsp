<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 추가</title>

</head>
<body>
	<div class="row">
		<!-- 관리 사이드바 고정 -->
		<div class="col-sm-2 mt-5">
			<c:import url="/WEB-INF/view/staff/on/inc/staffMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<h3 class="text-center">상품 추가</h3>
			
			<hr></hr>
			<form id="formAddGoods" method="post" action="${pageContext.request.contextPath}/staff/on/addGoods"
				enctype="multipart/form-data">
				<table class="table table-bordered" style="width : 80%">
					<tr>
						<td>상품명</td>
						<td><input type="text" id="goodsTitle" name="goodsTitle"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select id="category" name="category">
								<option value="">::: 카테고리 선택 :::</option>
								<c:forEach var="c" items="${categoryList}">
									<option value="${c.categoryNo}">${c.categoryTitle}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품금액</td>
						<td>
							<input type="number" id="goodsPrice" name="goodsPrice">원
						</td>
					</tr>
					<tr>
						<td>File</td>
						<td>
							${msg}
							<div id="fileDiv">
								<button type="button" id="btnAddFile">파일추가</button>
								<button type="button" id="btnRemoveFile">파일삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>상품설명</td>
						<td>
							<textarea rows="3" cols="50" id="goodsMemo" name="goodsMemo"></textarea>
						</td>
					</tr>
					<tr>
						<td>상품재고</td>
						<td>
							<input type="radio" class="goodsState" name="goodsState" value="재고있음">재고있음<br>
							<input type="radio" class="goodsState" name="goodsState" value="재고없음">재고없음<br>
						</td>
					</tr>
				</table>
				<button type="button" id="btnAddGoods">상품 추가</button>
			</form>
		</div>
	
	
    <!-- 고정 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>
 
</body>

<script>
	// 상품 추가 폼 공백 유효성 검사
	$('#btnAddGoods').click(function() {
		if($('#goodsTitle').val() == '') {
			alert('상품명을 입력하세요');
		} else if($('#category').val() == '') {
			alert('카테고리를 선택하세요');
		} else if($('#goodsPrice').val() == '') {
			alert('상품금액을 입력하세요');
		} else if($('#goodsMemo').val() == '') {
			alert('상품설명을 입력하세요');
		} else if($('.goodsFile').length > 0 && $('.goodsFile').last().val() == ''){
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
			let html = '<input type="file" name="goodsFile" class="goodsFile">'; 
			$('#fileDiv').append(html);
		}
	});
	
	// 파일 삭제
	$('#btnRemoveFile').click(function() {
		// 마지막으로 추가된 <input type="file" name="goodsFile" class="goodsFile"> 태그 제거
		// console.log($('.goodsFile').length);
		if($('.goodsFile').length == 0) { // class="actorFile"이 없다
			alert('삭제할 파일이 존재하지 않습니다');	
		} else {
			$('.goodsFile').last().remove(); // 마지막 파일선택 삭제
		}
	});
	
</script>

</html>