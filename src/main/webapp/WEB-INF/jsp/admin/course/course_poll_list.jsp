<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 강의평가 > 평가문항 목록  
	summary	:	
 	wdate	: 2016-05-25
 	writer	: 이진영
 *****************************************************/
 %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">과정정보관리 > 설문<span></span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>
<form name="pform" action="/admin/course/pollList.do" method="post">  
<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/> 
<input type="hidden" name="pbcateno" id="pbcateno" value=""/> 
<input type="hidden" name="bcateno" id="bcateno" value=""/>  
<input type="hidden" name="pageMode" id="pageMode" value=""/>
	
	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
		
		<tr class="rndbg">
			<th>NO</th>
			<th>설문유형</th>
			<th>설문내용</th>
			<th>항목01</th>
			<th>항목02</th>
			<th>항목03</th>
			<th>항목04</th>
			<th>항목05</th>
			<th>사용여부</th>
			<th>
				<a href="#" onclick="popup2('/admin/course/pollForm.do?courseno=${REQUEST_DATA.courseno}&qno=0&pageMode=reg',800,500,1);" class="btn small green">추가</a></a>
			</th>
		</tr>
		
		<colgroup>
			<col align=middle width="8%">
			<col align=middle width="8%">
			<col align=middle width="15%">
			<col align=middle width="10%">
			<col align=middle width="10%">
			<col align=middle width="10%">
			<col align=middle width="10%">
			<col align=middle width="10%">
			<col align=middle width="10%">
			<col align=middle width="10%">
		</colgroup>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align="middle" onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
			<td><c:out value="${result.QNO}"/></td>
			<td><c:out value="${result.MT_CPOLL_NAME}"/></td>
			<td align="left"><c:out value="${result.SUBJECT}"/></td>
			<td><c:out value="${result.ITEM01}"/></td>
			<td><c:out value="${result.ITEM02}"/></td>
			<td><c:out value="${result.ITEM03}"/></td>
			<td><c:out value="${result.ITEM04}"/></td>
			<td><c:out value="${result.ITEM05}"/></td>
			<td><c:out value="${result.USEYN}"/></td>
			<td>
				<a href="#" onclick="popup3('/admin/course/pollForm.do?courseno=${REQUEST_DATA.courseno}&qno=${result.QNO}&pageMode=mod',800,500,1);" class="btn small green">수정</a>
			</td>
		</tr> 
	</c:forEach>
	</table>
<!-- 본문 > 메인 > 목록 끝 -->
</form>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	