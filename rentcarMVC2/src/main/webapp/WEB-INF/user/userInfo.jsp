<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>

<body>
<div>
<h1 class="py-3" > ${vo.id}  회원의 상세보기 </h1>
<form action="${ctx}/userUpdate.do" method="post">
	<input type="hidden" name="no" value="${vo.no}"/>
	<table class='table table-bordered'>
	  <tr>
	    <td>번호</td>
	    <td class="left"> ${vo.no}</td>
	  </tr>
	   <tr>
	    <td>아이디</td>
	    <td class="left">${vo.id}</td>
	  </tr>
	   <tr>
	    <td>비밀번호</td>
	    <td class="left">${vo.pw}</td>
	    
	  </tr>  
	    <%-- <tr>
	    <td>이름</td>
	    <td class="left">${vo.name}</td>
	  </tr>  --%>
	  <tr>
	    <td>나이</td>
	    <td><input class="col-12"  type="text" name="age" value="${vo.age}"/></td>
	  </tr> 
	  <tr>
	    <td>직업</td>
	    <td><input class="col-12"  type="text" name="job" value="${vo.job}"/></td>
	  </tr> 
	  <tr>
	    <td>취미</td>
	    <td><input class="col-12"  type="text" name="hobby" value="${vo.hobby}"/></td>
	  </tr> 
	     <tr>
	    <td>이메일</td>
	    <td><input class="col-12"  type="text" name="email" value="${vo.email}"/></td>
	  </tr>
	  <tr>
	    <td>전화번호</td>
	    <td><input class="col-12"  type="text" name="tel" value="${vo.tel}"/></td>
	  </tr> 
	  <tr>
	    <td>소개</td>
	    <td><input class="col-12"  type="text" name="info" value="${vo.info}"/></td>
	  </tr> 
	    <tr>
	    <td colspan="3" align="center">
		<input type="button" onclick="check(form)" value="수정완료" > 
		<input type="reset" value="취소">
		<input type="button" value="회원탈퇴" onclick="location.href='${ctx}/userDelete.do?id=${id}'">
		</td>  
	</tr>
	</table>
	</form>
</div>
</body>
</html>

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

/* 	let uploadDiv = document.querySelector("#upload"); //업로드div
	uploadDiv.style.display = "none";//처음엔 display - none
	let uploadBtn = document.querySeletor("#uploadBtn");
	let deleteBtn = document.querySeletor("#deleteBtn");
	
	let input = document.querySeletor("#uploadFile");
	
	input.addEventListener("change", ()=>{
		let maxSize = 5 * 1024 * 1024;
		if(input.size == 0 || input.size > maxSize){
			return;
		}
		let form = document.querySelector("#imgForm");
		let formData = new FormData(form);
		
		fetch('memberUploadImg.do',{
			method:'POST',
			body : formData,
		})
		 .then(response => response.text())
		 .then(data => {
			 console.log(data);
			 if(data === 'fail'){
				 alert('이미지 업로드 실패');
			 }else{
				 alert('이미지 업로드 성공');
				 let src = 'Uploads/' + data;
				 document.querySelector("#photo").setAttribute('src',src);
				 document.querySelector('#photo').classList.remove("default");
			 }
		 })
		 .catch(error => {
			 console.log("error=",error);
		 });
	})
	
	uploadBtn.addEventListener("click" , ()=>{
		uploadDiv.style.display = "block";
	});
	
	deleteBtn.addEventListener("click", ()=> {
		if(document.querySeletor(".default")){
			alert('기본이미지는 삭제할 수 없습니다');
			return;
		}
		fetch('memberDeleteImg.do',{
			method:"POST",
			//headers:{"Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"},
			body:"num="+document.querySelector('#num').value,
		})
		 .then(response => response.text())
		 .then(data => {
			 if (data === 'fail'){
				 alert('이미지 삭제 실패');
			 }else{
				 alert('이미지 삭제 성공');
				 let src = 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'; //기본 이미지
				 document.querySelector("#photo").setAttribute('src', src);
				 document.querySelector("#photo").classList.add("default");
			 }
		 })
		 .catch(error => {
			 console.log('error=',error);
		 });
	}); */
	
</script>
<%@ include file="../parts/footer.jsp" %>