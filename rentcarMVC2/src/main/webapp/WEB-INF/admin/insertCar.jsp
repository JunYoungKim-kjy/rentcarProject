<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<div align="center">
<table>
	<tr>
		<td>차량 추가하기</td>
	</tr>
</table>

<form action = "${ctx}/insertCar.do" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<td>차량이름</td>
			<td><input name="name" id="name"></td>
		</tr>
		<tr>
			<td>차종</td>
			<td><select name="category" id="category">
			<option value="">--차종을 선택해 주세요--</option>
  			<option value="1">소형</option>
  			<option value="2">중형</option>
  			<option value="3">대형</option>
			</select></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input name="price" id="price"></td>
		</tr>
		<tr>
			<td>인승</td>
			<td>
			<select name="usepeople" id="usepeople" required>
				<option value="">--인승을 선택해 주세요--</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i}"> ${i} </option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>차량대수</td>
			<td><input name="totalQty" id="totalQty"></td>
		</tr>
		<tr>
			<td>제조사</td>
			<td><input name="company" id="company"></td>
		</tr>
		<tr>
			<td>차량정보</td>
			<td><input name="info" id="info"></td>
		</tr>
		<tr align="center">
			<td colspan="2" id="btns">
			<input type="button" value="추가" class="col-3 btn btn-primary" onclick="check(form)" /> 
			<input type="reset" value="취소" class="col-3 btn btn-warning" />
			</td>
		</tr>
	
		</table>
	</form>
</div>




</body>
</html>
<script type="text/javascript">
function check(form){
	if(!form.name.value.trim()){
		alert("차량의이름을 입력해주세요");
		form.name.focus();
		return;
	}
	if(form.category.value === ""){
		alert("차종을 선택 해주세요");
		return;
	}
	if(!form.price.value.trim()){
		alert("차량의 가격을 입력해주세요");
		form.price.focus();
		return;
	}
	if(form.usepeople.value ===""){
		alert("인승을 선택 해주세요");
		return;
	}
	if(!form.totalQty.value.trim()){
		alert("차량의 수량을 입력해주세요");
		form.totalQty.focus();
		return;
	}
	if(!form.company.value.trim()){
		alert("차량의 제조사를 입력해주세요");
		form.company.focus();
		return;
	}
	if(!form.info.value.trim()){
		alert("차량의 정보를 입력해주세요");
		form.info.focus();
		return;
	}
	form.submit();
}

</script>
<%@ include file="../parts/footer.jsp" %>