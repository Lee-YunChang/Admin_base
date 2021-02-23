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
	String fileNm = "온라인교육운영현황_"+today+".xls";
	
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
    <tr class="rndbg">
    	<th rowspan="2" colspan="3">구분</th>
        <th rowspan="3">운영횟수</th>
        <th colspan="9">공무원</th>
        <th colspan="9">교원</th>
        <th colspan="9">일반사용자</th>
    </tr>
    <tr class="rndbg">
    	<th colspan="4">신청인원</th>
        <th colspan="4">수료인원</th>
        <th rowspan="2">이수율</th>
        <th colspan="4">신청인원</th>
        <th colspan="4">수료인원</th>
        <th rowspan="2">이수율</th>
        <th colspan="4">신청인원</th>
        <th colspan="4">수료인원</th>
        <th rowspan="2">이수율</th>
    </tr>
    <tr class="rndbg">
    	<th>월별</th>
        <th>과정번호</th>
        <th>과정명</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
    </tr>
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <tr>
    	<%-- <th><c:out value="${result.MM}"/>월</th>
    	<th></th>
    	<th>합계</th> --%>
    	<td><c:out value="${result.YYYY}"/>.<c:out value="${result.MM}"/></td>
    	<td><c:out value="${result.COURSENO}"/></td>
    	<td><c:out value="${result.COURSETITLE}"/></td>
   		<td><c:out value="${result.CNT}"/></td>
    	<td><c:out value="${result.PUBMAPPLY}"/></td>
    	<td><c:out value="${result.PUBFAPPLY}"/></td>
    	<td><c:out value="${result.PUBXAPPLY}"/></td>
    	<td><c:out value="${result.PUBSUMAPPLY}"/></td>
    	<td><c:out value="${result.PUBMPASS}"/></td>
    	<td><c:out value="${result.PUBFPASS}"/></td>
    	<td><c:out value="${result.PUBXPASS}"/></td>
    	<td><c:out value="${result.PUBSUMPASS}"/></td>
    	
		<td><c:out value="${result.PUBPASSPERCENT}"/></td>   
		 	
    	<td><c:out value="${result.TEAMAPPLY}"/></td>
    	<td><c:out value="${result.TEAFAPPLY}"/></td>
    	<td><c:out value="${result.TEAXAPPLY}"/></td>
    	<td><c:out value="${result.TEASUMAPPLY}"/></td>
    	<td><c:out value="${result.TEAMPASS}"/></td>
    	<td><c:out value="${result.TEAFPASS}"/></td>
    	<td><c:out value="${result.TEAXPASS}"/></td>
    	<td><c:out value="${result.TEASUMPASS}"/></td>
    	
    	<td><c:out value="${result.TEAPASSPERCENT}"/></td>  
    	<td><c:out value="${result.NOMMAPPLY}"/></td>
    	<td><c:out value="${result.NOMFAPPLY}"/></td>
    	<td><c:out value="${result.NOMXAPPLY}"/></td>
    	<td><c:out value="${result.NOMSUMAPPLY}"/></td>
    	<td><c:out value="${result.NOMMPASS}"/></td>
    	<td><c:out value="${result.NOMFPASS}"/></td>
    	<td><c:out value="${result.NOMXPASS}"/></td>
    	<td><c:out value="${result.NOMSUMPASS}"/></td>
    	
    	<td><c:out value="${result.NOMPASSPERCENT}"/></td>  
    </tr>
    </c:forEach>
     <tr>
    	<td colspan="3">합계</td>
    	<td><c:out value="${resultList[0].TOTALCOUNT}"/></td>
    	<td colspan="33"></td>
    </tr>
</table>

</body>
</html>