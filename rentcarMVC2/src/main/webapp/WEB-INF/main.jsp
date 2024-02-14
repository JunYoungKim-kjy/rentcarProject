<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./parts/header.jsp" %>
<!-- 센터 -->
	<c:if test = "${center ne null}">
		<tr align="center">
			<td align="center" width="1000">
				<jsp:include page="${center}"/>
			</td>
		</tr>
		</c:if>
		<c:if test= "${center eq null}">
		<table>
			<tr height="500">
				<td align="center">
					<img alt="" src="img/17.jpg" width="1000">
				</td>
			</tr>
		</table>
		</c:if>
<!-- 센터 끝 -->
<%@ include file="./parts/footer.jsp" %>
	</div>
</body>
</html>