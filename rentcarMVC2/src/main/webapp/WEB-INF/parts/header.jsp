<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../commom.jsp" %>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/car.css">
<c:if test="${log eq null}">
<c:set var="log" value="GUEST"/>
</c:if>
<!-- 	 // 세션을 이용한 로그인 처리
	 String id = (String)session.getAttribute("id");
	 
	 // 로그인이 되어있지 않다면
	 if(id == null){
		 id = "GUEST";
	 } -->


	<table>
		<tr height="70">
			<td colspan="4">
				<a href="${ctx}/main.do" style="text-decoration: none">
				<img alt="" src="img/rent_logo.jpg" height="120">
				<c:if test="${log eq 'admin' }">
					<input type="file" />
				</c:if>
				</a>
			</td>
			<td align="center" width="500">
				${log }님
				<c:if test="${log eq 'GUEST' }">
					<button onclick="location.href='${ctx}/rentcarLogin.do'"> 로그인 </button>
					<button onclick="location.href='${ctx}/rentcarJoin.do'"> 회원가입 </button>
				</c:if>
				<c:if test="${log eq 'admin' }">
					<button onclick="location.href='${ctx}/adminCarList.do'">차량관리</button>
				</c:if>
				<c:if test="${log ne 'GUEST' }">
					<button onclick="location.href='${ctx}/rentcarContent.do'"> 마이페이지 </button>
					<button onclick="location.href='${ctx}/rentcarLogout.do'"> 로그아웃 </button> 
				</c:if>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="${ctx}/carList.do" 
				style="text-decoration: none">예 약 하 기</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="${ctx}/reserveList.do" 
				style="text-decoration: none">예 약 확 인</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">자유게시판</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">이  벤  트</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">고 객 센 터</a></font>
			</td>
		</tr>
	</table>
</body>
</html>