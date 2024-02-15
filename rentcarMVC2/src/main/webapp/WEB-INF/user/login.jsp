<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/css/login.css">
<%-- <script type="text/script" src="${ctx}/script/login.js"></script> --%>
<div class="container">
  <!-- Sign Up -->
  <div class="container__form container--signup">
    <form action="${ctx}/rentcarJoin.do" class="form" id="form2">
      <h2 class="form__title">Sign Up</h2>
      <input type="text" placeholder="User" name="id" id="id" class="input" />
      <input type="button" value="중복체크" id="checkId" class="btn-outline-dark">
      <input type="password" placeholder="Password" name="pw" id="pw" class="input" />
      <input type="text" placeholder="Name" name="name" id="name"  class="input" />
      <input type="number" placeholder="Age" name="age" id="age" class="input" />
      <input type="text" placeholder="Job" name="job" id="job" class="input" />
      <input type="text" placeholder="Hobby" name="hobby" class="input" />
      <input type="email" placeholder="Email" name="email" id="email" class="input" />
      <input type="phone" placeholder="Phone" name="phone" id="phone" class="input" />
      <input type="text" placeholder="Info" name="info" class="input" />
      <span>
      <input type="button" value="가입" class="btn btn-primary" onclick="validCheck(form)" /> 
	  <input type="reset" id="reset" value="취소" class="btn btn-warning" />
	  </span>
    </form>
  </div>

  <!-- Sign In -->
  <div class="container__form container--signin">
    <form action="${ctx}/rentcarLogin.do" method="POST" class="form" id="form1">
      <h2 class="form__title">Sign In</h2>
      <input type="text" placeholder="User" name="id" class="input" />
      <input type="password" placeholder="Password" name="pw" class="input" />
      <input type="button" value="Sign In" class="btn btn-primary" onclick="loginCheck(form)" /> 
      <a href="#none" class="link">Forgot your password?</a>
    </form>
  </div>

  <!-- Overlay -->
  <div class="container__overlay">
    <div class="overlay">
      <div class="overlay__panel overlay--left">
        <button class="btn" id="signIn">Sign In</button>
      </div>
      <div class="overlay__panel overlay--right">
        <button class="btn" id="signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="../parts/footer.jsp" %>
<script>
/* 로그인 */
const signInBtn = document.querySelector("#signIn");
const signUpBtn = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
  document.getElementById("form2").reset();
});

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

/* fistForm.addEventListener("submit", (e) => e.preventDefault());
secondForm.addEventListener("submit", (e) => e.preventDefault()); */
function loginCheck(form){
	if(!form.id.value.trim()){
		alert("아이디를 입력해주세요");
		form.id.focus();
		return false;
	}	
	if(!form.pw.value.trim()){
		alert("패스워드를 입력해주세요");
		form.id.focus();
		return false;
	}	
	form.submit();
}
/* 회원가입 */
let check = 0;
function validCheck(form){
		if(!form.id.value.trim()){
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		}	
		if(!form.pw.value.trim()){
			alert("패스워드를 입력해주세요");
			form.id.focus();
			return false;
		}	
		if(!form.name.value.trim()){
			alert("이름를 입력해주세요");
			form.id.focus();
			return false;
		}	
		if(!form.age.value.trim()){
			alert("나이를 입력해주세요");
			form.age.focus();
			return false;
		}else{
			 if(Number(form.age.value.trim()) < 1 || Number(form.age.value.trim()) > 99 ){
					alert("나이 값(1-99)을 정확하게 입력하세요");
					form.age.focus();
					return false;
			}
		}
		/*
		@ 앞에는 영어소문자,숫자 . _ % + - 만 허용
		@ 골뱅이 필수.
		@ 뒤 . 앞에는 영어소문자,숫자 . - 만 허용
		. 점 필수
		. 뒤에는 영어소문자 2자리 이상
		*/
		if(!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)){
			alert("이메일 형식이 다릅니다");
			form.email.value="test@test.com";
			form.email.focus();
			return false;
		}
		if(!form.phone.value.match(/010-\d{3,4}-\d{4}/)){
			alert("전화번호 형식이 다릅니다");
			form.phone.value="010-1234-1234";
			form.phone.focus();
			return false;
		}
		if(check == 0){
			alert('id 중복체크 해주세요');
			return false;
		} else if(check == -1){
			alert('id 중복체크 다시하세요');
			return false;
		}
		console.log(form);
		form.submit();
	}

	//취소 클릭시.
	document.getElementById("reset").addEventListener("click" , ()=> {
		document.getElementById("id").removeAttribute("readonly");
		document.getElementById("id").style.border = "";
		check = 0;
	});
	//중복체크
	document.getElementById("checkId").addEventListener("click" , ()=> {
		 let id = document.getElementById("id").value.trim();
	  	if(check === 1){
	  		alert("이미 중복체크 하였습니다.");
	  		document.getElementById("pw").focus();
	  		return;
	  	}
		 if (id.length === 0) {
		    alert("id 값을 입력해주세요");
		    document.getElementById("id").focus();
		    document.getElementById("id").style.border = "";
		    return;
		  }
	  fetch("rentcarValidId.do", {
	    method: "POST",
	    headers: {
	      "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
	    },
	    body: "id=" + id,
	  })
	  .then(response => response.text())
	  .then(getResult)
	  .catch(() => alert("error"));
	});

	function getResult(data) {
	  if (data === "valid") {
	    alert("이 아이디는 사용가능 합니다  ");
	    document.getElementById("pw").focus();
	    document.getElementById("id").style.border = "3px blue solid";
	    document.getElementById("id").setAttribute("readonly","readonly");
	    check = 1;
	  } else if (data === "notValid") {
	    alert("이 아이디는 사용 불가능 합니다");
	    document.getElementById("id").value = "";
	    document.getElementById("id").focus();
	    document.getElementById("id").style.border = "3px red solid";
	    check = -1;
	  }
	}
</script>