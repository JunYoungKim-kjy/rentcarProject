<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<div id="container">
	<div id="user_center">
		<h1 class="userTitle" > 마이페이지 </h1>
		<form action="${ctx}/userUpdate.do" method="post">
		<input type="hidden" name="no" value="${vo.no}"/>
			<table class='table table-bordered'>
			  <tr>
			    <td class="word">번호</td>
			    <td class="word left"> ${vo.no}</td>
			  </tr>
			   <tr>
			    <td class="word" >아이디</td>
			    <td class="word left" >${vo.id}</td>
			  </tr>
			   <tr>
			    <td class="word" >비밀번호</td>
			    <td class="word" ><input class="col-12"  type="password" name="pw" value="${vo.pw}"/></td>
			    
			  </tr>  
			    <%-- <tr>
			    <td>이름</td>
			    <td class="left">${vo.name}</td>
			  </tr>  --%>
			  <tr>
			    <td class="word">나이</td>
			    <td><input class="col-12"  type="text" name="age" value="${vo.age}"/></td>
			  </tr> 
			  <tr>
			    <td class="word" >직업</td>
			    <td><input class="col-12"  type="text" name="job" value="${vo.job}"/></td>
			  </tr> 
			  <tr>
			    <td class="word" >취미</td>
			    <td><input class="col-12"  type="text" name="hobby" value="${vo.hobby}"/></td>
			  </tr> 
			     <tr>
			    <td class="word" >이메일</td>
			    <td><input class="col-12"  type="text" name="email" value="${vo.email}"/></td>
			  </tr>
			  <tr>
			    <td class="word" >전화번호</td>
			    <td><input class="col-12"  type="text" name="tel" value="${vo.tel}"/></td>
			  </tr> 
			  <tr>
			    <td class="word" >소개</td>
			    <td><input class="col-12"  type="text" name="info" value="${vo.info}"/></td>
			  </tr> 
			    <tr>
			    <td colspan="3" align="center">
				<input class="btn" type="button" onclick="check(form)" value="수정완료" > 
				<input class="btn" type="reset" value="취소">
				<input class="btn" type="button" value="회원탈퇴" onclick="location.href='${ctx}/userDelete.do?id=${id}'">
				</td>  
			  </tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../parts/footer.jsp" %>
<script>
function check(form){
	if(!form.age.value.trim()){
		alert("나이를 입력하세요.");
		form.age.focus();
	}
	if(!form.email.value.trim()){
		alert("이메일을 입력하세요.");
		form.email.focus();
	}
	if(!form.tel.value.trim()){
		alert("연락처를 입력하세요.");
		form.age.focous();
	}
	form.submit();
}
</script>