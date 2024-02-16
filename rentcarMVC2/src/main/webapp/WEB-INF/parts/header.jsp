<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<%@ include file="../commom.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css">
<script type="text/javascript" defer src="${ctx}/script/header.js"></script>
</head>
<body>
<c:if test="${log eq null}">
<c:set var="log" value="GUEST"/>
</c:if>
<!-- 	 // 세션을 이용한 로그인 처리
	 String id = (String)session.getAttribute("id");
	 
	 // 로그인이 되어있지 않다면
	 if(id == null){
		 id = "GUEST";
	 } -->
	<header id="header">
		<section id="logo_section">
			<div class="header_logo">
				<a href="${ctx}/main.do" style="text-decoration: none">
				<img alt="" src="img/logo.png" width="100" height="40">
				</a>
			</div>
			<!-- /header_logo -->
			<div id="header_menu">
				<nav id="header_nav">
						<a href="${ctx}/carList.do" style="text-decoration: none">Reservation</a>
						<a href="#none" style="text-decoration: none">Board</a>
						<a href="#none" style="text-decoration: none">Event</a>
						<a href="#none" style="text-decoration: none">Q/A</a>
					<c:if test="${log eq 'GUEST' }">
						<a href="${ctx}/rentcarLogin.do"style="text-decoration: none"> Login </a>
						<%-- <a href="${ctx}/rentcarJoin.do"style="text-decoration: none"> 회원가입 </a> --%>
					</c:if>
					<c:if test="${log eq 'admin' }">
						<a href="${ctx}/reserveList.do" style="text-decoration: none">ManageReserve</a>
						<a href="${ctx}/adminCarList.do"style="text-decoration: none"> ManageCar </a>
						<a href="${ctx}/rentcarLogout.do"style="text-decoration: none"> Logout </a>
					</c:if>
					<c:if test="${log ne 'GUEST' and log ne 'admin' }">
						<a href="${ctx}/reserveList.do" style="text-decoration: none">MyReserve</a>
						<a href="${ctx}/rentcarContent.do"style="text-decoration: none"> mypage </a>
						<a href="${ctx}/rentcarLogout.do"style="text-decoration: none"> Logout </a>
					</c:if>
				</nav>
				<!-- /nav -->
			</div>
			<!-- /header_menu -->
		</section>
		
	</header>