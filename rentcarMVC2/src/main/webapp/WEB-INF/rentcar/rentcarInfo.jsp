<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<div align="center">

		<form action="${ctx}/selectCarOption.do"
			method="post">

			<table>
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							${bean.name} 차량 선택
					</font></td>
				</tr>
				<tr>
					<td rowspan="6" width="500" align="center">
					<c:if test="${bean.sFileName ne null}">
	    				<img src="Uploads/${bean.sFileName}" id="photo" width="450"/>
	    			</c:if>
	    			<c:if test="${bean.sFileName eq null}">
	    				<img src="img/ready.jpg" width="450"/>
	    			</c:if>
					</td>
					<td width="250" align="center">차량이름</td>
					<td width="250" align="center">${bean.name}</td>
				</tr>
				
				<tr>
					<td width="250" align="center">총 승차인원</td>
					<td width="250" align="center">${bean.usepeople}</td>
				</tr>
				<tr>
					<td width="250" align="center">차량수량</td>
					<td width="250" align="center"><select name="qty">
					<c:forEach var="i" begin="1" end="${bean.totalQty}">
						<c:if test="${i == 1 }">>
							<option value="1" selected >1</option>
						</c:if>
						<c:if test="${i != 1 }">
							<option value="${i}">${i}</option>
						</c:if>
					</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">차량분류</td>
					<td width="250" align="center">${temp }</td>
				</tr>
				<tr>
					<td width="250" align="center">대여가격</td>
					<td width="250" align="center">${bean.price }원</td>
				</tr>
				<tr>
					<td width="250" align="center">제조회사</td>
					<td width="250" align="center">${bean.company}</td>
				</tr>
				<tr>
					<td width="250" align="center">
					
					
					<c:if test="${log ne null }">
						<%-- 이전 차량에 관한 정보 --%> <input type="hidden" name="no"
						value="${bean.no }" /> <input type="hidden" name="img"
						value="${bean.img}" /> <input type="submit"
						value="옵션선택후 렌트 예약 하기" />
					</c:if>
					</td>
				</tr>
			</table>

			<br />
			<br />
			<br /> <font size="5" color="gray">차랑 정보 보기</font>
			<p>${bean.info } </p>
		</form>



	</div>
</body>
</html>
<%@ include file="../parts/footer.jsp" %>