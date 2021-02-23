<%
/****************************************
	system	: ClassDesk > 강사 > 설문
	title	: 설문 팝업
	summary	:	
	wdate	: 2013-08-09
	writer	: kim min gyu 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%-- <%@ include file="../common/include/popup_header.jsp"  %> --%>



<!-- header -->
<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">답변정보</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content">
	<!-- 과제정보 -->
	<div class="table-title clearfix">
		<div><h3><c:out value="${listData[0].QNO}"/>. <c:out value="${listData[0].SUBJECT}"/> </h3></div>
	</div>
	<!-- <div class="round-box-small blue"> -->
		<!-- 과제정보 테이블 -->
	<div class="table-type1">
		<div class="table-header-left"></div>
		<table>
			<caption>과제</caption>
			<colgroup>
				<col width="5%" />
				<col width="95%" />
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty listData}">
					<c:forEach items="${listData}" var="result" varStatus="stat">
					<tr>
						<td><c:out value="${result.RNUM}"/> </td>
						<td class="left"><c:out value="${result.ANSWER}"/></td>
					</tr>
					
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="2">등록된 정보가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
		<!-- //과제정보 테이블 -->
		<!-- 라운드박스 구성요소 -->
 		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div> 
		<!-- //라운드박스 구성요소 -->
	</div>
	<!-- //과제정보 -->
	
	
	
<!-- </div> -->
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup">
		<a href="#none"  onclick="self.close();"  class="btn-large-orange"><span>닫기</span></a>
	</div>
</div>
<!-- //팝업 버튼영역 -->
</body>
</html>
