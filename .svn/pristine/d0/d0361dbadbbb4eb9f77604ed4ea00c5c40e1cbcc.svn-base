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
	String fileNm = "집합교육운영현황_"+today+".xls";
	
	response.setContentType("application/vnd.ms-excel;charset=euc-kr");
    response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "utf-8") + ";");
%>
<html>
<head>
<meta http-equive="content-type" content="text/html; charset=ksc5601">

<style type="text/css">
table th { background-color:#6EE3F7;}

</style>
</head>
<body>

<table class="tb table-type1 stats_tb">
    <tr>
    	<th>순번</th>
    	<th>구분</th>
    	<th>과정명</th>
    	<th>시작일</th>
    	<th>종료일</th>
    	<th>실제인원</th>
    	<th>교육장소</th>
    </tr>
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <tr>
    	<td><c:out value="${result.RNUM}"/></td>
    	<td><c:out value="${result.COURSETITLE}"/></td>
    	<td><c:out value="${result.SEQ_TITLE}"/></td>
    	<td><c:out value="${result.STUDY_SDATE}"/></td>
    	<td><c:out value="${result.STUDY_EDATE}"/></td>
    	<td><c:out value="${result.CNT}"/></td>
    	<td><c:out value="${result.EDU_PLACE}"/></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>