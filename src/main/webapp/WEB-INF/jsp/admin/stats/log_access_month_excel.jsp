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
	String fileNm = "월별접속현황_"+today+".xls";
	
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
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
		<col style="width:5%"/>
	</colgroup>
	<tr class="rndbg">
        <th>연도</th>
        <th>1월</th><th>2월</th><th>3월</th><th>4월</th><th>5월</th><th>6월</th><th>7월</th><th>8월</th><th>9월</th><th>10월</th><th>11월</th><th>12월</th><th>합계</th>
    </tr>
    <c:forEach var="monthMap" items="${accesslogMonthList}" varStatus="status">
    <tr>
        <th><c:out value="${monthMap.ACCES_YEAR}"/></th>
        <td align="right"><c:set var="month1"><c:out value="${monthMap.ACCES_MONTH1}"/></c:set><fmt:formatNumber value="${month1}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month2"><c:out value="${monthMap.ACCES_MONTH2}"/></c:set><fmt:formatNumber value="${month2}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month3"><c:out value="${monthMap.ACCES_MONTH3}"/></c:set><fmt:formatNumber value="${month3}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month4"><c:out value="${monthMap.ACCES_MONTH4}"/></c:set><fmt:formatNumber value="${month4}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month5"><c:out value="${monthMap.ACCES_MONTH5}"/></c:set><fmt:formatNumber value="${month5}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month6"><c:out value="${monthMap.ACCES_MONTH6}"/></c:set><fmt:formatNumber value="${month6}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month7"><c:out value="${monthMap.ACCES_MONTH7}"/></c:set><fmt:formatNumber value="${month7}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month8"><c:out value="${monthMap.ACCES_MONTH8}"/></c:set><fmt:formatNumber value="${month8}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month9"><c:out value="${monthMap.ACCES_MONTH9}"/></c:set><fmt:formatNumber value="${month9}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month10"><c:out value="${monthMap.ACCES_MONTH10}"/></c:set><fmt:formatNumber value="${month10}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month11"><c:out value="${monthMap.ACCES_MONTH11}"/></c:set><fmt:formatNumber value="${month11}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month12"><c:out value="${monthMap.ACCES_MONTH12}"/></c:set><fmt:formatNumber value="${month12}" type="number" groupingUsed="true" /></td>
        <td align="right">
            <c:set var="total">${month1+month2+month3+month4+month5+month6+month7+month8+month9+month10+month11+month12}</c:set>
            <fmt:formatNumber value="${total}" type="number" groupingUsed="true" />
        </td>
    </tr>
   </c:forEach>
</table>

</body>
</html>