<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
	<form action="${ctx}/reservateCar.do"
		method="post">
		<table>
			<tr height="100">
				<td align="center" colspan="3"><font size="6" color="gray">
						옵션 선택</font></td>
			</tr>
			<tr>
				<td rowspan="7" width="500" align="center">
				<c:if test="${bean.sFileName ne null}">
	    			<img src="Uploads/${bean.sFileName}" id="photo" width="450" height="200"/>
	    		</c:if>
	    		<c:if test="${bean.sFileName eq null}">
	    			<img src="img/ready.jpg" width="450" height="200"/>
	    		</c:if>
	    		</td>
				<td width="250" align="center">대여기간</td>
				<td width="250" align="center"><select name="dday">
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
				</select></td>
			</tr>
			<tr>
				<td width="250" align="center">대여일</td>
				<td width="250" align="center"><input type="date" name="rday" id="today"
					size="15"></td>
			</tr>
			<script>
				document.getElementById("today").value= new Date().toISOString().substring(0,10);
			</script>
			
			<tr>
				<td width="250" align="center">보험적용</td>
				<td width="250" align="center"><select name="usein">
						<option value="1">적용(1일 1만원)</option>
						<option value="2">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td width="250" align="center">Wifi 적용</td>
				<td width="250" align="center"><select name="usewifi">
						<option value="1">적용(1일 1만원)</option>
						<option value="2">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td width="250" align="center">네비게이션 적용</td>
				<td width="250" align="center"><select name="usenavi">
						<option value="1">적용(무료)</option>
						<option value="2">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td width="250" align="center">베이비시트 적용</td>
				<td width="250" align="center"><select name="useseat">
						<option value="1">적용(1일 1만원)</option>
						<option value="2">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="hidden" name="no" value="${bean.no }">
				<input type="hidden" name="qty"	value="${qty}">
				<input type="submit" value="차량예약하기" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
<%@ include file="../parts/footer.jsp" %>