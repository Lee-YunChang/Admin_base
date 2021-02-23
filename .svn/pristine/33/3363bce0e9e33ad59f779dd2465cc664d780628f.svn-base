<%
/****************************************************
	system	: 과정관리 > 교육과정등록
	title	: 교육과정 상세보기 공통 tab 메뉴
	summary	:	
	wdate	: 2016-04-21
	writer	: 이진영 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript">
	function fnTabMove(purl, courseno, pageMode) {
		var frm = document.pform;
		frm.courseno.value = courseno;
		frm.action = purl;
	 	frm.submit(); 
	}
	
	function fnBbsTabMove(purl, pbcateno, courseno, bcateno) {
		var frm = document.pform;
		frm.pbcateno.value = pbcateno;
		frm.bcateno.value = bcateno;
		frm.courseno.value = courseno;
		frm.action = purl;
	 	frm.submit(); 
	}
</script>
<div class="space5"></div>
<table width=100% border=0 cellspacing=0 cellpadding=0 class="exp-tab">
	<colgroup>
		<col width="17%" />
		<col width="16%" />
		<col width="17%" />
		<col width="17%" />
		<col width="16%" />
		<col width="17%" />
	</colgroup>
	<tbody>
	<c:set var="sysCode" value="${REQUEST_DATA.sysCode}"/>
	<c:set var="bcateno" value="${REQUEST_DATA.bcateno}"/>
	<c:set var="bbsNotice"><%=SangsProperties.getProperty("Globals.bbsBcateCourseNotice")%></c:set>
	<c:set var="bbsCourse"><%=SangsProperties.getProperty("Globals.bbsBcateCourseData")%></c:set>
	<c:set var="offlineCourse"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%></c:set>
	
	<c:if test="${sysCode == 'bbs'}"><c:set var="sysCode">${sysCode}_${REQUEST_DATA.bcateno}</c:set></c:if>
		<tr>
			
			<td class="<c:choose><c:when test="${sysCode == 'courseForm'}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('/admin/course/courseForm.do', '<c:out value="${REQUEST_DATA.courseno}"/>', '<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>'); return false;">과정메타정보</a></td>
			<!--  201905 START 유관기간 등록/수정 시, 유튜브일경우 사용안함! -->
			<c:choose>
				<c:when test="${ REQUEST_DATA.MT_CTYPE_CODE eq 'DAAA00'  || (REQUEST_DATA.MT_CTYPE_CODE eq 'DAAA02' && REQUEST_DATA.type ne 'youtube')}">
<%-- 				<c:when test="${REQUEST_DATA.MT_CTYPE_CODE ne offlineCourse}"> --%>
				<td class="<c:choose><c:when test="${sysCode == 'treeList'}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('/admin/course/treeList.do', '<c:out value="${REQUEST_DATA.courseno}"/>', '');return false;">콘텐츠관리</a></td>
				</c:when>
			</c:choose>
			<!--  201905 END 유관기간 등록/수정 시, 유튜브일경우 사용안함! -->
			<!-- 201905 START 유관기관 등록/수정 시, 사용안함 -->
			<c:if test="${REQUEST_DATA.MT_CTYPE_CODE ne 'DAAA02'}">
				<td class="<c:choose><c:when test="${sysCode == 'examSecList'}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('/admin/course/examSecList.do', '<c:out value="${REQUEST_DATA.courseno}"/>', '');return false;">시험문제관리</a>
				<%-- <td class="<c:choose><c:when test="${sysCode == 'pollList'}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('/admin/course/pollList.do', '<c:out value="${REQUEST_DATA.courseno}"/>', '');return false;">설문</a></td> --%>			
				<td class="<c:choose><c:when test="${(sysCode == 'bbsList' || sysCode == 'bbsForm') && bcateno eq bbsNotice}">on</c:when><c:otherwise>off</c:otherwise></c:choose>">
					<a href="#" onclick="fnBbsTabMove('/admin/course/bbsList.do', '<%=SangsProperties.getProperty("Globals.bbsPbcateCourseNotice")%>', '<c:out value="${REQUEST_DATA.courseno}"/>', '<%=SangsProperties.getProperty("Globals.bbsBcateCourseNotice")%>');return false;"> 공지사항</a>
				</td>
				<td class="<c:choose><c:when test="${(sysCode == 'bbsList' || sysCode == 'bbsForm') && bcateno eq bbsCourse}">on</c:when><c:otherwise>off</c:otherwise></c:choose>">
					<a href="#" onclick="fnBbsTabMove('/admin/course/bbsList.do', '<%=SangsProperties.getProperty("Globals.bbsPbcateCourseData")%>', '<c:out value="${REQUEST_DATA.courseno}"/>', '<%=SangsProperties.getProperty("Globals.bbsBcateCourseData")%>');return false;">자료실</a>
				</td>
			</c:if>
			<!-- 201905 END 유관기관 등록/수정 시, 사용안함 -->
		</tr>
	</tbody>
</table>
<!-- <div align="right"> 
	<a href="courseList.do" class="btn green">목록</a>
</div> -->