<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<script type="text/javascript" defer src="${ctx}/script/insert.js"></script>
<div id="container">
	<div id="center">
		<font class="carTitle">차량 추가하기</font>
		<form action = "${ctx}/insertCar.do" method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="2">
					<img src="img/ready.jpg" id="fileview" width="350" id="photo"/>
					<input id="uploadFile" type="file" name="uploadFile" accept="image/*" onchange="setThumbnail(event)"/>
					</td>
				</tr>
				<tr>
					<td class="word">차량이름</td>
					<td><input name="name" id="name"></td>
				</tr>
				<tr>
					<td class="word">차종</td>
					<td><select name="category" id="category">
					<option value="">--차종을 선택해 주세요--</option>
		  			<option value="1">소형</option>
		  			<option value="2">중형</option>
		  			<option value="3">대형</option>
					</select></td>
				</tr>
				<tr>
					<td class="word">가격</td>
					<td><input name="price" id="price"></td>
				</tr>
				<tr>
					<td class="word">인승</td>
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
					<td class="word">차량대수</td>
					<td><input name="totalQty" id="totalQty"></td>
				</tr>
				<tr>
					<td class="word">제조사</td>
					<td><input name="company" id="company"></td>
				</tr>
				<tr>
					<td class="word">차량정보</td>
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
</div>
<%@ include file="../parts/footer.jsp" %>