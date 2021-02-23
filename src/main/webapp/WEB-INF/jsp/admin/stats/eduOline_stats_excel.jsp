<%
/****************************************************
	system	: 통계관리
	title	: 교육신청통계 엑셀다운로드
	summary	:	
	wdate	: 2016-05-16
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType="application/x-msdownload; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/cfn.tld" prefix="cfn"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="ext" %>
<%@ taglib uri = "/WEB-INF/tlds/admin-paging-taglib.tld" prefix="paging" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="com.sangs.util.SangsUtil" %>
<%@ page import="java.util.List"%>
<%

	String today = SangsUtil.getToday("yyyyMMdd");
	String fileNm = "온라인교육통계_"+today+".xls";
	
	response.setContentType("application/vnd.ms-excel;");
    response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "utf-8") + ";");
%>
<html>
<head>
<meta http-equive="content-type" content="text/html; charset=utf-8">

<style type="text/css">
table th { background-color:#6EE3F7;}

</style>
</head>
<body>
<c:choose>
	<c:when test="${REQUEST_DATA.searchMode eq 'person'}">
		<!-- 교육대상 선택시 보여주는 테이블 -->
			<div id="select1">
			<table class="tb table-type1 stats_tb">
			
			    <colgroup>
			    	<col style="width:2%">
			        <col style="width:15%">
			        <col style="width: *">
			        <col style="width:10%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:6%">
			        <col style="width:6%">
			    </colgroup>
			    <thead>
				<tr>
					<th scope="col">NO</th>
			    	<th scope="col">대상자 ID</th>
			    	<th scope="col">과정명</th>
			    	<th scope="col">수료일</th>
			    	<th scope="col">이름</th>
			    	<th scope="col">회원구분</th>
			    	<th scope="col">사전시험점수</th>
			    	<th scope="col">사후시험점수</th>
			    	<th scope="col">변동폭</th>
			    	<th scope="col">순위</th>
			
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}">
					<tr>
						<td><c:out value="${totalCount-((REQUEST_DATA.cPage-1)*20+status.index)}"/></td>
						<td><c:out value="${result.USERID}"/></td>
						<td><c:out value="${result.SEQ_TITLE}"/></td>
						<td><c:out value="${result.COMPDATE}"/></td>
						<td><c:out value="${result.MBERNM}"/></td>
						<td><c:out value="${result.MT_GRADE_NAME}"/></td>
						<td><c:out value="${result.BEFORE}"/></td>
						<td><c:out value="${result.AFTER}"/></td>
						<td><c:out value="${result.MOV}"/></td>
						<td><c:out value="${result.RNK}"/></td>
					</tr>
				</c:forEach>
			    
			</tbody>
			</table>
			</div>
	</c:when>
	<c:otherwise>
		<!-- 교육대상 선택시 보여주는 테이블 -->
			<div id="select1">
			<table class="tb table-type1 stats_tb">
			
			    <colgroup>
			        <col style="width:15%">
			        <col style="width: *">
			        <col style="width:8%">
			        <col style="width:6%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        
			    </colgroup>
			    <thead>
				<tr>
			    	<th scope="col">대상자</th>
			    	<th scope="col">과정명</th>
			    	<th scope="col">총 인원(명)</th>
			    	<th scope="col">총점</th>
			    	<th scope="col">사전시험(평균)</th>
			    	<th scope="col">사후시험(평균)</th>
			    	<th scope="col">변동폭</th>
			    	<th scope="col">순위</th>
			
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}">
					<tr>
						<td><c:out value="${result.REF2}"/></td>
						<td><c:out value="${result.COURSETITLE}"/></td>
						<td><c:out value="${result.TOTCNT}"/></td>
						<td><c:out value="${result.TOTSUM}"/></td>
						<td><c:out value="${result.AVG_BEFORE}"/></td>
						<td><c:out value="${result.AVG_AFTER}"/></td>
						<td><c:out value="${result.MOVVAL}"/></td>
						<td><c:out value="${result.RNK}"/></td>
					</tr>
				</c:forEach>
			    
			</tbody>
			</table>
			</div>
	</c:otherwise>
</c:choose>

</body>
</html>