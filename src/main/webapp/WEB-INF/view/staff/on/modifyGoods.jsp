<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품 수정</title>

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
			<form id="formModify" method="post" action="${pageContext.request.contextPath}/staff/on/modifyGoods"
				enctype="multipart/form-data">
				<table class="table table-bordered" style="width : 80%">
					<tr>
						<td>상품명</td>
						<td><input type="text" id="goodsTitle" name="goodsTitle" value="${goodsTitle}"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select id="categoryNo" name="categoryNo">
								<option value="${c.categoryNo}">${c.categoryTitle}</option>
								<c:forEach var="c" items="${categoryList}">
									<option value="${c.categoryNo}">${c.categoryTitle}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품금액</td>
						<td>
							<input type="number" id="goodsPrice" name="goodsPrice" value="${goodsPrice}">원
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
							<textarea rows="3" cols="50" id="goodsMemo" name="goodsMemo" value="${goodsMemo}"></textarea>
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
				<button type="button" id="btnModifyGoods">상품 수정</button>
			</form>
		</div>
	
	
    <!-- 고정 회사정보 -->
    <c:import url="/WEB-INF/view/company.jsp"></c:import>
 
</body>
</html>