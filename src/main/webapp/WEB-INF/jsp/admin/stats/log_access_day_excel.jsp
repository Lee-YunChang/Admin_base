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
	String fileNm = "일별접속현황_"+today+".xls";
	
	response.setContentType("application/vnd.ms-excel");
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

<table class="tb table-type1 stats_tb">
	<colgroup>
		<col align=middle><col align=middle><col align=middle><col align=middle><col align=middle>
		<col align=middle><col align=middle><col align=middle><col align=middle><col align=middle><col align=middle>
	</colgroup>
	<tr>
    <c:set var="total_cnt"></c:set>
    <c:forEach var="dayMap" items="${accesslogDayList}" varStatus="status">
     <c:set var="total_cnt">${total_cnt + dayMap.CNT}</c:set>
    <th><c:out value="${dayMap.ACCES_DAY}"/>일</th>
    <td align="right">
        <c:set var="cnt"><c:out value="${dayMap.CNT}"/></c:set>
        <fmt:formatNumber value="${cnt}" type="number" groupingUsed="true" />
    </td>
    <%-- <c:if test="${(status.index+1)%10 == 0}"></tr><tr></c:if> --%>
    <c:if test="${status.count == 10}"></tr><tr></c:if>
    <c:if test="${status.count == 20}"></tr><tr></c:if>
    <c:if test="${status.count == 30}"></tr><tr></c:if>
    </c:forEach>
    <th>합계</th>
    <td align="right">
        <c:set var="total">${total_cnt}</c:set>
        <fmt:formatNumber value="${total}" type="number" groupingUsed="true" />
    </td>
    </tr>
</table>

</body>
</html>