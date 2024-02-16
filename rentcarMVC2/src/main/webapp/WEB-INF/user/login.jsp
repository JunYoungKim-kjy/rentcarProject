<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/css/login.css">
<script type="text/javascript" defer src="${ctx}/script/login.js"></script>
<div id = "container">
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
	        <!-- <button class="btn" id="signIn" onclick="signIn(secondForm)">Sign In</button>-->
	      </div>
	      <div class="overlay__panel overlay--right">
	        <button class="btn" id="signUp">Sign Up</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<%@ include file="../parts/footer.jsp" %>