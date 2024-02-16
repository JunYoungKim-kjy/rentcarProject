<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/css/carList.css">
  
<body onLoad="load()">
<div id="container">
	<div id="categoryNav">
		<nav id="category">
			<a href="${ctx}/carList.do?category=1" style="text-decoration: none">소형</a>
			<a href="${ctx}/carList.do?category=2" style="text-decoration: none">중형</a>
			<a href="${ctx}/carList.do?category=3" style="text-decoration: none">대형</a>
		</nav>
	<hr size="3" color="#eeeeee">
	</div>
	<!-- ================================================== -->
	<div id= <c:if test="${temp eq null }">"slide_center"</c:if>
			<c:if test="${temp ne null }">"center"</c:if>
	>
	<c:if test="${temp eq null}">
			<h3 style="color:white;" class="carTitle">신차 리스트</h3>
	</c:if>
	<c:if test="${temp ne null and temp ne 'all' }">
			<h3 style="color:white;" class="carTitle">${temp} 자동차</h3>
	</c:if>
	<c:if test="${temp eq 'all'}">
			<h3 style="color:white;" class="carTitle">전체 렌트카 보기</h3>
	</c:if>
		<!-- 기본 최신순 일 때 -->
			<c:if test="${temp eq null}">
				<div class="autoplay">
					<c:forEach var = "vo" items = "${list}"  varStatus = "status">
					<div class="list_items1">
						<a href="${ctx}/carInfo.do?no=${vo.no}">
						<c:if test="${vo.sFileName ne null}">
			    			<img src="Uploads/${vo.sFileName}" id="photo" width="390" height="220"/>
			    		</c:if>
			    		<c:if test="${vo.sFileName eq null}">
			    			<img src="img/ready.jpg" width="390" height="220" />
			    		</c:if>
						</a>
					<table>
						<tr align="center">
							<td>
								<font size="3" color="white"><b>차량명</b></font>
							</td>
							<td>
								<font size="3" color="white"><b>|  ${vo.name }</b></font>
							</td>
						</tr>
						<tr align="center">
							<td>
								<font size="3" color="white"><b>차종</b></font>
							</td>
							<td>
								<font size="3" color="white"><b>|  ${vo.category == 1 ? "소형" : vo.category==2 ? "중형" : "대형" }</b></font>
							</td>
						</tr>
						<tr align="center">
							<td>
								<font size="3" color="white"><b>제조사</b></font>
							</td>
							<td>
								<font size="3" color="white"><b>|  ${vo.company}</b></font>
							</td>
						</tr>
						<tr align="center">
							<td>
								<font size="3" color="white"><b>인승</b></font>
							</td>
							<td>
								<font size="3" color="white"><b>|  ${vo.usepeople}</b></font>
							</td>
						</tr>
						<tr align="center">
							<td>
								<font size="3" color="white"><b>남은차량</b></font>
							</td>
							<td>
								<font size="3" color="white"><b>|  ${vo.totalQty}</b></font>
							</td>
						</tr>
					</table>
					</div>
					</c:forEach>
				</div>
			</c:if>
		<!-- 카테고리가 있을 때 -->
		
			<c:if test="${temp ne null }">
				<div id="list_items2">
					<c:forEach var = "vo" items = "${list}"  varStatus = "status">
						<div class = "item">
						<a href="${ctx}/carInfo.do?no=${vo.no}">
							<c:if test="${vo.sFileName ne null}">
				    			<img src="Uploads/${vo.sFileName}" id="photo" width="350" height="220"/>
				    		</c:if>
				    		<c:if test="${vo.sFileName eq null}">
				    			<img src="img/ready.jpg" width="350" height="220" />
				    		</c:if>
						</a>
						<p><font size="3" color="white"><b>차량명 | ${vo.name }</b></font>
						</div>
					</c:forEach>
				</div>
			</c:if>
	<!-- ================================================== -->
	
<%-- 	<hr size="3" color="red">
	<p><font size="4" color="gray"><b>차량 검색 하기</b></font>
	<form action="${ctx}/carList.do" method="post">
	<font size="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>
		<input type="submit" value="검색" />&nbsp;&nbsp;
	</form>
	button은 form 밖에 위치시키기
	<button onclick="location.href='${ctx}/carList.do?category=all'">전체 검색</button>
	 --%>
	</div>

</div>
<%@ include file="../parts/footer.jsp" %>
<script type="text/javascript">
function load() {
	let test = $(".autoplay");
 	 	$('.autoplay').slick({
	    slidesToShow: 3,
	    slidesToScroll: 1,
	    autoplay: true,
	    autoplaySpeed: 3000,
	    dots: false, // 좌우 arrow 네비게이션 안보이게 하기 (보이고 싶을 때는 true로 변경)
	    arrows: false, // 아래 dost 네비게이션 안보이게 하기 (보이고 싶을 때는 true로 변경)
	    }); 
}
</script>