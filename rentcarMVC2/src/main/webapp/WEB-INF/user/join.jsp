<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<script src="${ctx}/script/join.js"></script>
<style>
tr :last-child {
	text-align: left;
}

input[type=submit], input[type=reset] {
	text-align: center;
}

#btns {
	text-align: center;
}
</style>


<body>
	<h1 class="py-3">회원 가입</h1>
	<form action="${ctx}/rentcarLogin.do" method="post" >
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td><input class="col-5" type="text" name="id" id="id" autofocus required />
				 <input type="button" value="중복체크" id="checkId" class="btn btn-outline-dark"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input class="col-5" type="password" name="pw" id="pw" required/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="col-5" type="text" name="name" id="name" required/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input class="col-5" type="number" name="age" id="age" required  /></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><input class="col-5" type="text" name="job" id="job"/></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input class="col-5" type="text" name="hobby" id="hobby"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input class="col-5" type="email" name="email" id="email" required/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input class="col-5" type="tel" name="phone" id="phone" required/></td>
			</tr>
			<tr>
				<td>자기소개</td>
				<td><textarea width="30" height="20" name="info" id="info" placeholder="자기소개"></textarea></td>
			</tr>
			<!-- <tr>
				<td>프로필 사진</td>
				<td><input type="file" name="uploadFile" accept="image/*"></td>
			</tr>-->
			<tr>
				<td colspan="2" id="btns">
					<input type="button" value="가입" class="col-3 btn btn-primary" onclick="validCheck(form)" /> 
					<input type="reset" id="reset" value="취소" class="col-3 btn btn-warning" /></td>
			</tr> 
		</table>
	</form>
	

</body>
</html>



<%@ include file="../parts/footer.jsp" %>