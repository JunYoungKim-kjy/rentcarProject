<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/css/userReserve.css">
<div id="container">
	<div id="ReserveList">
		<h3 style="color: white;" class="carTitle"> 전체 예약 현황 </h3> 
		<table border="1" id="reserveList_table">
			<tr height="40">
				<td class="word" width="150" align="center"> 이미지 </td>
				<td class="word" width="100" align="center"> 차량이름 </td>
				<td class="word" width="100" align="center"> 예약자아이디 </td>
				<td class="word" width="100" align="center"> 예약자이름 </td>
				<td class="word" width="100" align="center"> 대여일 </td>
				<td class="word" width="100" align="center"> 대여기간 </td>
				<td class="word" width="100" align="center"> 금액 </td>
				<td class="word" width="60" align="center"> 수량 </td>
				<td class="word" width="60" align="center"> 보험 </td>
				<td class="word" width="60" align="center"> wifi </td>
				<td class="word" width="60" align="center"> 베이비시트 </td>
				<td class="word" width="60" align="center"> 네비게이션 </td>
				<td class="word" width="100" align="center"> 예약취소 </td>
			</tr>
		<c:forEach var = "bean" items="${v}">
		<tr height="70">	
			<td height="70" align="center">
				<c:if test="${bean.sFileName ne null}">
	    			<img src="Uploads/${bean.sFileName}" width="120" height="70"/>
	    		</c:if>
	    		<c:if test="${bean.sFileName eq null}">
	    			<img src="img/ready.jpg" width="120" height="70" />
	    		</c:if>
			</td>
			<td class="word" align="center">${bean.name }</td>
			<td class="word" align="center">${bean.id }</td>
			<td class="word" align="center">${bean.userName }</td>
			<td class="word" align="center">${bean.rday }</td>
			<td class="word" align="center">${bean.dday }</td>
			<td class="word" align="center">${bean.price } 원</td>
			<td class="word" align="center">${bean.qty }</td>
			<td class="word" align="center">${bean.usein==1?"적용":"미적용" }</td>
			<td class="word" align="center">${bean.usewifi==1?"적용":"미적용" }</td>
			<td class="word" align="center">${bean.useseat==1?"적용":"미적용" }</td>
			<td class="word" align="center">${bean.usenavi==1?"적용":"미적용" }</td>
			<td class="word" align="center">
				<button class="btn" onclick="location.href='${ctx}/reserveDelete.do?resSeq=${bean.reserveSeq}&qty=${bean.qty}&no=${bean.no}'">예약취소</button>
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>
</div>
<%@ include file="../parts/footer.jsp" %>