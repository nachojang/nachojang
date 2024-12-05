<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>주문상세</title>

<style>
    /* 기본 설정 */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .header-menu {
        background-color: #343a40;
        color: #fff;
        padding: 1rem 0;
        text-align: center;
    }

    .header-menu a {
        color: #fff;
        text-decoration: none;
        padding: 10px 20px;
        font-size: 1.1rem;
    }

    .header-menu a:hover {
        background-color: #495057;
        border-radius: 5px;
    }

    h1 {
        font-size: 2rem;
        color: #333;
        margin-bottom: 1.5rem;
        text-align: center;
    }

    /* 주문 상세 테이블 디자인 */
    .col-sm-10 {
        margin: 3rem auto;
        padding: 2rem;
        max-width: 960px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 2rem;
    }

    table th, table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
    }

    table td {
        background-color: #f9f9f9;
    }

    table td img {
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* 후기 작성 폼 디자인 */
    .form-comment {
        margin-top: 1.5rem;
        display: flex;
        flex-direction: column;
    }

    .form-comment input[type="text"] {
        padding: 10px;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 10px;
        width: 100%;
    }

    .form-comment button {
        padding: 10px;
        font-size: 1rem;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .form-comment button:hover {
        background-color: #0056b3;
    }

    /* 하단 회사 정보 */
    .footer {
        background-color: #f1f1f1;
        padding: 1rem;
        text-align: center;
        font-size: 0.9rem;
        color: #333;
    }
</style>

</head>
<body>
	
	<!-- 헤더 고정 -->
	<div>
		<c:import url="/WEB-INF/view/customer/on/inc/header.jsp"></c:import>
	</div>
	
	<!-- main -->
	<br>
	<h1>주문별 상세 내역</h1>
	<div class="col-sm-10">
		<!-- main content -->
		<table class="table">
			<c:forEach var="o" items="${ordersList}">
			<tr>
				<td>결제 번호</td>
				<td>${o.paymentNo}</td>
			</tr>
			<tr>
				<td>주문 번호</td>
				<td>${o.ordersNo}</td>
			</tr>	
			<tr>
				<td>주문일자</td>
				<td>${o.createDate}</td>
			</tr>	
			<tr>	
				<td>배송 현황</td>
				<td>${o.paymentState}</td>
			</tr>	
			<tr>	
				<td>이미지</td>
				<td>
					<img src="${pageContext.request.contextPath}/upload/${o.goodsFileName}.${o.goodsFileExt}" width="100" height="100">
				</td>
			</tr>	
			<tr>	
				<td>상품 이름</td>
				<td>${o.goodsTitle}</td>					
			</tr>	
			<tr>	
				<td>주문 개수</td>
				<td>${o.ordersAmount}</td>
			</tr>	
			<tr>	
				<td>총합 가격</td>
				<td>${o.totalPrice}</td>
			</tr>	
			<tr>	
				<td>결제 수단</td>
				<td>${o.paymentMethod}</td>
			</tr>	
			<tr>	
				<td>후기</td>
				<td>	
				    <!-- 배송완료 상태일 때만 후기 관련 내용 표시 -->
                    <c:if test="${o.paymentState == '배송완료'}">
	                    <!-- 댓글이 0개일 때 입력 폼을 보여줍니다 -->
	                    <c:if test="${rowCount == 0}">
	                        <div class="form-comment">
	                            <form id="formComment" method="post" action="${pageContext.request.contextPath}/customer/on/ordersOne">
	                                <input type="hidden" name="ordersNo" value="${o.ordersNo}">    
	                                <input type="hidden" name="paymentNo" value="${o.paymentNo}">    
	                                <input type="text" name="boardContent" id="boardContent" placeholder="후기를 작성해주세요.">    
	                                <button type="submit" class="btn btn-primary">입력</button>
	                            </form>
	                        </div>
	                    </c:if>
	                    
	                    <!-- 댓글이 1개 있을 때 해당 댓글을 출력 -->
	                    <c:if test="${rowCount == 1}">
	                    	<p>${comments.boardContent}</p>	
	                	</c:if>
	                </c:if>
				</td>
			 </tr>
			 </c:forEach>
		</table>
	</div>
	
	<!-- 고정 (회사정보) -->
    <div class="footer">	
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>

<script>
	$('#btnAddComment').click(function() {
		if($('#boardContent').val() == '') {
			alert('후기를 작성하세요');
		} else {
			$('#formComment').submit();
		}
	});
</script>
</body>
</html>
