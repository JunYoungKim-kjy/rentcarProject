<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/css/option.css">
<script type="text/javascript" defer src="${ctx}/script/option.js"></script>
<div id="container">
	<div id="center">
		<font size="6" class="carTitle" color="white">옵션 선택</font>
		<form action="${ctx}/reservateCar.do" method="post">
			<table>
				<tr>
					<td rowspan="7" width="500" align="center">
					<c:if test="${bean.sFileName ne null}">
		    			<img src="Uploads/${bean.sFileName}" id="photo" width="450"/>
		    		</c:if>
		    		<c:if test="${bean.sFileName eq null}">
		    			<img src="img/ready.jpg" width="450"/>
		    		</c:if>
		    		</td>
					<td class="word" width="250" align="center">대여기간</td>
					<td width="250" align="center">
						<select name="dday" id="dday">
							<option value="">--대여기간을 선택하세요--</option>
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
							<option value="6">6일</option>
							<option value="7">7일</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="word" width="250" align="center">대여일</td>
					<td width="250" align="center">
					<input type="date" name="rday" id="today" size="15"></td>
				</tr>
				<script>
					document.getElementById("today").value = new Date().toISOString().substring(0,10);
				</script>
				
				<tr>
					<td class="word" width="250" align="center">보험적용</td>
					<td width="250" align="center">
						<select name="usein">
								<option value="1">적용(1일 1만원)</option>
								<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="word" width="250" align="center">Wifi 적용</td>
					<td width="250" align="center">
						<select name="usewifi">
								<option value="1">적용(1일 1만원)</option>
								<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="word" width="250" align="center">네비게이션 적용</td>
					<td width="250" align="center">
						<select name="usenavi">
								<option value="1">적용(무료)</option>
								<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="word" width="250" align="center">베이비시트 적용</td>
					<td width="250" align="center">
						<select name="useseat">
								<option value="1">적용(1일 1만원)</option>
								<option value="2">비적용</option>
						</select>
					</td>
				</tr>
			</table>
			<input type="hidden" name="qty"	value="${qty}">
			<input type="hidden" name="no" value="${bean.no }">
			<input class="btn btn-submit" type="button" onclick="reserve(form)" value="차량예약하기" />
		</form>
	</div>
<!-- /center -->
</div>
<!-- /container -->
<%@ include file="../parts/footer.jsp" %>