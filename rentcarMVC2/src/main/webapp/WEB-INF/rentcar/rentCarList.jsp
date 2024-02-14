<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../commom.jsp" %>
	<div align="center">
	<table>
		<tr height="60">
		<td align="center" colspan="3">
	<c:if test="${temp eq null}">
			<font size="6" color="gray">최신형 자동차</font>
	</c:if>
	<c:if test="${temp ne null and temp ne 'all' }">
			<font size="6" color="gray">${temp} 자동차</font>
	</c:if>
	<c:if test="${temp eq 'all'}">
			<font size="6" color="gray">전체 렌트카 보기</font>
	</c:if>
		</td>
		</tr>
		<c:forEach var = "vo" items = "${list}"  varStatus = "status">
		<c:if test="${temp ne null }">
			<c:if test="${status.index % 3 == 0 }">
			<tr height="220">
			</c:if>
		</c:if>
			<td width="333" align="center">
			<a href="${ctx}/carInfo.do?no=${vo.no}">
				<c:if test="${vo.sFileName ne null}">
	    			<img src="Uploads/${vo.sFileName}" id="photo" width="300" height="220"/>
	    		</c:if>
	    		<c:if test="${vo.sFileName eq null}">
	    			<img src="img/ready.jpg" width="300" height="220" />
	    		</c:if>
			</a><p><font size="3" color="gray"><b>차량명 | ${vo.name }</b></font></td>
			</td>
		</c:forEach>
		</tr>
	</table>
	<!-- ================================================== -->
	
	<hr size="3" color="red">
	<p>
	<font size="4" color="gray"><b>차량 검색 하기</b></font>
	
	<form action="${ctx}/carList.do" method="post">
		<font size="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>
		<input type="submit" value="검색" />&nbsp;&nbsp;
	</form>
	<%-- button은 form 밖에 위치시키기 --%>
	<button onclick="location.href='${ctx}/carList.do?category=all'">전체 검색</button>
	
	</div>
</body>
</html>