<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../commom.jsp" %>
	<div align="center">
		<table>
			<tr height="100">
				<td align="center"> 
					<font size="6" color="gray"> 차량 예약 완료 화면 </font> 
				</td>
			</tr>
			<tr height="100">
				<td align="center"> 
				<c:if test="${vo.sFileName ne null}">
	    			<img src="Uploads/${vo.sFileName}" id="photo" width="450"/>
	    		</c:if>
	    		<c:if test="${vo.sFileName eq null}">
				<img src="img/ready.jpg" width="450"/>
	    		</c:if>
				</td>
			</tr>	
			<tr height="50">
				<td align="center">
					<font size="5" color="red"> 차량 총예약 금액 ${totalCar } 원 </font>
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<font size="5" color="red"> 차량 총옵션 금액 ${totalOption } 원 </font>
				</td>
			</tr>			
			<tr height="50">
				<td align="center">
					<font size="5" color="red"> 차량 총 금액 ${totalOption + totalCar } 원 </font>
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>