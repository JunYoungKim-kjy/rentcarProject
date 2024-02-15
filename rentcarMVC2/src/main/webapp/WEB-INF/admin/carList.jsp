<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<div align="center">
	<table>
		<tr height="60">
			<td align="center" colspan="3">차량관리</td>
			<td><button onclick="location.href='${ctx}/adminInsert.do'">차량추가</button></td>
		</tr>
	</table>
	<table border="1">
			<tr height="40">
				<td width="150" align="center"> 이미지 </td>
				<td width="150" align="center"> 번호 </td>
				<td width="150" align="center"> 이름 </td>
				<td width="150" align="center"> 종류 </td>
				<td width="60" align="center"> 가격 </td>
				<td width="100" align="center"> 탑승인원 </td>
				<td width="60" align="center"> 차량대수 </td>
				<td width="60" align="center"> 제조사 </td>
				<td width="60" align="center"> 정보 </td>
				<td width="60" align="center"> 수정 </td>
			</tr>
		<c:forEach var = "bean" items="${list}">
		<tr height="70">	
			<td height="70" align="center">
			<c:if test="${bean.sFileName ne null}">
	    		<img src="Uploads/${bean.sFileName}" id="photo" width="100" height="100"/>
	    	</c:if>
	    	<c:if test="${bean.sFileName eq null}">
	    		<img src="img/ready.jpg" width="100" height="100"/>
	    	</c:if>
			</td>
			<td width="30" align="center">${bean.no }</td>
			<td width="50" align="center">${bean.name }</td>
			<td width="30" align="center">${bean.category==1?"소형":bean.category==2?"중형":"대형" }</td>
			<td width="70" align="center">${bean.price } 원</td>
			<td width="60" align="center">${bean.usepeople }</td>
			<td width="60" align="center">${bean.totalQty }</td>
			<td width="60" align="center">${bean.company }</td>
			<td width="150" align="center">${bean.info }</td>
			<td width="90" align="center">
			<button onclick="location.href='${ctx}/carContent.do?no=${bean.no}'">수정</button>
			</td>
			
		</tr>
		</c:forEach>
	</table>
</div>
		
</body>
</html>
<%@ include file="../parts/footer.jsp" %>