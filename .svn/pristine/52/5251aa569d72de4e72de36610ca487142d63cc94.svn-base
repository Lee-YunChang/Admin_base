<%
/****************************************************
	system	: 영수증 발급현황 엑셀 다운로드
	title	: 
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
	String fileNm = "영수증발급현황_"+today+".xls";
	//String filename = new String(fileNm.getBytes("euc-kr"),"iso-8859-1");
	
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

<table border=1>
	<tr class="rndbg">
		<th>No</th>
		<th>이름</th>
		<th>아이디</th>
		<th>과정명</th>
		<th>교육기간</th>
		<th>금액</th>
	</tr>	
	<c:forEach var="result" items="${resultList}" varStatus="status">
        <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
            <td>${result.RNUM}</td>
            <td>${result.USERNAME}</td>
            <td>${result.UNITY_ID}</td>
            <td>${result.SEQ_TITLE}</td>
            <td>${result.UDATE}</td>
            <td align="right"><fmt:formatNumber value="${result.PAYMENT_PRC}" groupingUsed="true" /></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>