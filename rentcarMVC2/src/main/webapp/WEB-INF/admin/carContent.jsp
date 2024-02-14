<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../commom.jsp" %>

<table>
	<tr>
		<h2>${vo.name }차량 정보</h2>
	</tr>
</table>
<form action="${ctx}/carUpdate.do" method="post">
<input type="hidden" name="no" value="${vo.no}"/>
<input type="hidden" name="sFileName" value="${vo.sFileName}"/>
<table border="1">
	<tr>
		<td>번호</td>
		<td>${vo.no }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="name" id="name" value="${vo.name}"></td>
	</tr>
	<tr>
		<td>차종</td>
		<td>
			<select name="category" id="category">
				<option value="">--차종을 선택해 주세요--</option>
  				<option value="1" <c:if test="${vo.category == 1}">selected</c:if> >소형</option>
  				<option value="2" <c:if test="${vo.category == 2}">selected</c:if>>중형</option>
  				<option value="3" <c:if test="${vo.category == 3}">selected</c:if>>대형</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input name="price" id="price" value="${vo.price}"></td>
	</tr>
	<tr>
		<td>인승</td>
		<td>
			<select name="usepeople" id="usepeople" required>
				<option value="">--인승을 선택해 주세요--</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i}" <c:if test="${vo.usepeople == i }">selected</c:if> > ${i} </option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>차량대수</td>
		<td><input name="totalQty" id="totalQty" value="${vo.totalQty}"></td>
	</tr>
	<tr>
		<td>제조사</td>
		<td><input name="company" id="company" value="${vo.company}"></td>
	</tr>
	<tr>
		<td>차량이미지</td>
		<td>
	    	<c:if test="${vo.sFileName ne null}">
	    		<img src="Uploads/${vo.sFileName}" id="photo" width="100" height="100"/>
	    	</c:if>
	    	<c:if test="${vo.sFileName eq null}">
	    		<img src="img/ready.jpg" width="100" height="100"  class="default" id="photo"/>
	    	</c:if>
	    </td>
	</tr>
	<tr>
		<td>차량정보</td>
		<td><input name="info" id="info" value="${vo.info}"></td>
	</tr>
	<tr>
    <td colspan="2" align="center">
		<!-- <input type="button" value="사진 업로드" class='col-3 btn btn-success' id="uploadBtn"/> --> 
		<input type="submit" value="수정하기" class='col-3 btn btn-primary' />
		<input type="button" value="사진 삭제" class='col-3 btn btn-warning' id="deleteBtn"/> 
    </td>
  </tr>
</table>
</form>


<form id="imgForm">
  	<input id="uploadFile" type="file" name="uploadFile" accept="image/*" />
  	<input type="hidden" id="no" name="no" value="${vo.no}"/>
</form>

</body>
</html>

<script>
let uploadBtn = document.querySelector("#uploadBtn");//업로드버튼
let deleteBtn = document.querySelector("#deleteBtn");//삭제버튼
let inputImg = document.querySelector("#uploadFile");//업로드한 이미지

inputImg.addEventListener("change" , ()=>{
	let maxSize = 5 * 1024 * 1024;
	if(inputImg.size == 0 || inputImg.size > maxSize){
		alert("파일 크기를 확인해주세요.");
		return;
	};
	let form = document.querySelector("#imgForm");
	let formData = new FormData(form);
	
	fetch("carUploadImg.do",{
		method:"POST",
		body: formData,
	})
	.then(response => response.text())
	.then(data => {
		if(data === 'fail'){
			alert('이미지 업로드 실패');
		}else{
			alert('이미지 업로드 성공');
			let src = "Uploads/" + data;
			document.querySelector('#photo').setAttribute('src', src);
		    document.querySelector('#photo').classList.remove("default");
		}
	}).catch(error =>{
		alert("error="+error);
		//console.log('error=',error);
	});
});

deleteBtn.addEventListener("click",()=>{
	console.log("여기도..?");
	if(document.querySelector('.default')){
		alert('기본이미지는 삭제 할 수 없습니다.');
		return;
	};
	fetch("carDeleteImg.do",{
		method:"POST",
		headers:{
			 "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
	    },
	    body : "no=" + document.getElementById("no").value,
	})
	.then(response => response.text())
	.then(data => {
		if(data === 'fail'){
			alert("이미지 삭제 실패");
		}else{
			alert("이미지 삭제 성공");
			let src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Noimage_MC.png/640px-Noimage_MC.png';
	        document.querySelector('#photo').setAttribute('src', src);
	        document.querySelector('#photo').classList.add("default");
	     }
	 })
	 .catch(error => {
	   	console.log('error=', error);
	    });
});
</script>