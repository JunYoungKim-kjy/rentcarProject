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
</head>
<body>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 -->
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
				<img alt="" src="img/logo.png" width="200" height="200">
				</a>
			</div>
			<!-- /header_logo -->
			<div id="header_menu">
				<nav id="header_nav">
						<a href="${ctx}/carList.do" style="text-decoration: none">예 약 하 기</a>
						<a href="${ctx}/reserveList.do" style="text-decoration: none">예 약 확 인</a>
						<a href="#none" style="text-decoration: none">자유게시판</a>
						<a href="#none" style="text-decoration: none">이  벤  트</a>
						<a href="#none" style="text-decoration: none">고 객 센 터</a>
					<c:if test="${log eq 'GUEST' }">
						<a href="${ctx}/rentcarLogin.do"style="text-decoration: none"> 로그인 </a>
						<%-- <a href="${ctx}/rentcarJoin.do"style="text-decoration: none"> 회원가입 </a> --%>
					</c:if>
					<c:if test="${log eq 'admin' }">
						<a href="${ctx}/adminCarList.do"style="text-decoration: none"> 차량관리 </a>
						<a href="${ctx}/rentcarLogout.do"style="text-decoration: none"> 로그아웃 </a>
					</c:if>
					<c:if test="${log ne 'GUEST' and log ne 'admin' }">
						<a href="${ctx}/rentcarContent.do"style="text-decoration: none"> 마이페이지 </a>
						<a href="${ctx}/rentcarLogout.do"style="text-decoration: none"> 로그아웃 </a>
					</c:if>
				</nav>
				<!-- /nav -->
			</div>
			<!-- /header_menu -->
		</section>
		
	</header>
</body>
</html>