<%
/****************************************
	system	: ClassDesk > 강사 > 설문 리스트
	title	: 설문 메인
	summary	: 
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">설문 주관식 조회</div>

<div class="table-type1">
	<div class="table-header-left"></div>
	<table class="tb table-type1">
	<colgroup>
		<col style="width: 8%;" />
		<col style="width: ;" />
		
	</colgroup>	
	<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>답변내용</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr>
		  	<td style="text-align:center"><c:out value='${status.count}'/></td>
		  	<%-- <td><c:out value='${result.USERNM}'/></td> --%>
		  	<td><c:out value='${result.ANSWER}' escapeXml="false"/></td>
		</tr> 
		</c:forEach>
		<c:if test="${empty resultList }">
		<tr><td colspan="2" align="center">등록된 답변이 없습니다.</td></tr>
		</c:if>
	</tbody>
	</table>
	</div>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>