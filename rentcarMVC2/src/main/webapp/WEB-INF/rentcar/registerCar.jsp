<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<div id="container">
	<div id="center">
		<font size="6" class="carTitle" color="gray"> 차량 예약 완료</font> 
		<table>
			<tr height="100">
				<td align="center"> 
				<c:if test="${bean.sFileName ne null}">
	    			<img src="Uploads/${bean.sFileName}" id="photo" width="450"/>
	    		</c:if>
	    		<c:if test="${bean.sFileName eq null}">
					<img src="img/ready.jpg" width="450"/>
	    		</c:if>
				</td>
			</tr>	
			<tr height="50">
				<td align="center">
					<font size="5" color="white"> 옵션 금액 : ${totalOption } 원 </font>
				</td>
			</tr>			
			<tr height="50">
				<td align="center">
					<font size="5" color="white"> 차량 금액 : ${totalCar } 원 </font>
				</td>
			</tr>	
			<tr height="50">
				<td align="center">
					<font size="5" color="white"> (옵션 + 차량) 총예약 금액 : ${totalOption + totalCar } 원 </font>
				</td>
			</tr>
		</table>
	</div>
<!-- /center -->
</div>
<!-- /container -->
<%@ include file="../parts/footer.jsp" %>