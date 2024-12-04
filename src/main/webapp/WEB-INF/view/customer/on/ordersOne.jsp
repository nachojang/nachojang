<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>주문상세</title>

</head>
<body>
	
	<!-- 헤더 고정 -->
	
	<!-- main -->
	<h1> 주문별 상세 내역 </h1>
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
                        <c:forEach var="row" items="${rowList}" varStatus="status">
                            <c:if test="${status.index == o.index}">
                                <!-- 댓글이 0개일 때 입력 폼을 보여줍니다 -->
                                <c:if test="${row == 0}">
                                    <form id="formComment" method="post" action="${pageContext.request.contextPath}/customer/on/ordersOne?paymentNo=${paymentNo}&ordersNo=${o.ordersNo}">
                                        <input type="text" name="boardContent" id="boardContent">    
                                        <button type="submit" class="btn btn-primary">입력</button>
                                    </form>
                                </c:if>
                                
                                <!-- 댓글이 1개 있을 때 해당 댓글을 출력 -->
                                <c:if test="${row == 1}">
                                    <c:forEach var="c" items="${comments}">
                                        <c:if test="${c.ordersNo == o.ordersNo}">
                                            <p>${c.boardContent}</p>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
				</td>
			 </tr>
			 </c:forEach>
		</table>
	</div>
	
	<!-- 고정 (회사정보) -->
    <div>
    		<c:import url="/WEB-INF/view/company.jsp"></c:import>
    </div>
</body>
<script>

	$('#btnAddComment').click(function() {
		if($('#boardContent').val() == '') {
			alert('후기를 작성하세요');
		} else {
			$('#formComment').submit();
		}
	});
	
</script>
</html>