<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.header {
  background-color: #fff;
  padding: 10px 0;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.max-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.user-actions {
  align-self: flex-end;
  margin-bottom: 10px;
}

.user-actions a {
  margin-left: 15px;
  text-decoration: none;
  color: #333;
  font-size: 14px;
}

.logo-container {
  margin: 20px 0;
}

.logo {
  font-size: 36px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}

.main-nav ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  display: flex;
}

.main-nav ul li {
  margin: 0 10px;
}

.main-nav ul li a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  transition: color 0.3s ease;
}

.main-nav ul li a:hover {
  color: #007bff;
}
</style>

<header class="header">
  <div class="max-inner">
    <div class="user-actions">
      <c:if test="${loginCustomer == null}">
        <a href="${pageContext.request.contextPath}/customer/off/customerLogin">로그인</a>
      </c:if>
      <c:if test="${loginCustomer != null}">
        <a href="${pageContext.request.contextPath}/customer/on/customerLogout">로그아웃</a>
      </c:if>
      <a href="${pageContext.request.contextPath}/customer/on/my?customerMail=${loginCustomer}">마이페이지</a>
      <a href="${pageContext.request.contextPath}/customer/on/cartList?customerMail=${loginCustomer}">장바구니</a>
    </div>
    
    <div class="logo-container">
      <a href="${pageContext.request.contextPath}/customer/main" class="logo">NACHOJANG</a>
    </div>
    
    <nav class="main-nav">
      <ul>
        <li><a href="${pageContext.request.contextPath}/customer/goodsList">전체</a></li>
        <li><a href="${pageContext.request.contextPath}/customer/goodsList?categoryNo=1">상의</a></li>
        <li><a href="${pageContext.request.contextPath}/customer/goodsList?categoryNo=2">하의</a></li>
        <li><a href="${pageContext.request.contextPath}/customer/goodsList?categoryNo=3">겉옷</a></li>
      </ul>
    </nav>
  </div>
</header>