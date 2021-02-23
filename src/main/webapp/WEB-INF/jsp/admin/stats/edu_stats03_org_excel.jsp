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
	String fileNm = "관할기관별가입통계_"+today+".xls";
	
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
	<c:forEach var="map" items="${orgList}" varStatus="status">
		<th align="center"><c:out value="${map.MT_SUB_NAME}"/></th>
	</c:forEach>
	<th>합계</th>
	</tr>	
	<tr>
		<c:set var="orgTotal"></c:set>
		<c:forEach var="map" items="${orgList}" varStatus="status">
			<c:set var="orgTotal">${orgTotal + map.CNT}</c:set>
			<td align="right"><c:set var="cnt"><c:out value="${map.CNT}"/></c:set><fmt:formatNumber value="${cnt}" type="number" groupingUsed="true" /></td>
		</c:forEach>
		<td align="right"><c:set var="orgTotal">${orgTotal}</c:set><fmt:formatNumber value="${orgTotal}" type="number" groupingUsed="true" /></td>
	</tr>
</table>

</body>
</html>