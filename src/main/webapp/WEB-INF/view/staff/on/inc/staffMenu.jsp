<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Header</title>
<style>
:root {
    --orange: #DF4500;
    --gray: #000000; 
    --gray-shine: #1A1A1A; 
    --white-off: #DFDBD9;
}

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;
    background-color: var(--gray); 
}

.header {
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    width: 17.5em;
    background: var(--gray);
    color: var(--white-off);
}

.main-nav ul {
    border-top: solid 1px var(--gray-shine);
    list-style: none;
    padding: 0;
    margin: 0;
}

.main-nav li {
    position: relative;
    overflow: hidden;
}

.main-nav li:not(:last-child) {
    border-bottom: solid 1px var(--gray-shine);
}

.main-nav a {
    display: block;
    padding: 1.1em 0;
    color: var(--white-off);
    text-align: center;
    text-transform: lowercase;
    text-decoration: none;
    font-size: 1.125em;
    position: relative;
    z-index: 1;
    transition: .35s ease color;
}

.main-nav a:before {
    content: '';
    position: absolute;
    left: -100%;
    top: 0;
    width: 100%;
    height: 100%;
    background: var(--gray-shine);
    border-right: solid 5px var(--orange);
    z-index: -1;
    transition: .35s ease left;
}

.main-nav a:hover {
    color: white;
}

.main-nav a:hover:before {
    left: 0;
}

.logo {
    text-transform: lowercase;
    text-align: center;
    padding: 1em 0;
    margin: 0;
}

.logo a {
    color: var(--white-off);
    text-decoration: none;
    font-size: 2em;
    font-weight: 300;
    transition: .15s linear color;
}

.logo a:hover {
    color: white;
}

.logo span {
    font-weight: 700;
}

.logo a:hover span {
    color: var(--orange);
}
</style>
</head>
<body>
    <header class="header">
        <nav class="main-nav">
            <ul>
                <li><a href="#">::: ${loginStaff.staffId}님 :::</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/staff/on/logout">로그아웃</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/staff/on/customerList">회원
                        관리</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/staff/on/goodsList">상품
                        관리</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/staff/on/ordersList">주문
                        관리</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/staff/on/boardList">댓글
                        관리</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/staff/on/categoryList">카테고리
                        관리</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>