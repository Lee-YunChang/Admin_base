<%
/****************************************************
	system	: 수료증발급
	title	: 엑셀다운로드
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
	String fileNm = "수료회원_"+today+".xls";
	//String filename = new String(fileNm.getBytes("euc-kr"),"iso-8859-1");
	
	response.setContentType("application/vnd.ms-excel;charset=utf-8");
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

		<table border="1">
			<tr class="rndbg">
				<th>아이디</th> 
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>수료코드</th>
				<th>수료일자</th>
			</tr>
			<colgroup>
				<col align=middle width="10%">
				<col align=middle width="10%">
				<col align=middle width="15%"> 
				<col align=middle width="12%"> 
				<col align=middle width="10%">  
		 </colgroup>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
				<tr align=middle>
		 			<td><c:out value="${result.USERID}"/></td> 
		 			<td><c:out value="${result.USERNAME}"/></td>
		  			<td><c:out value="${result.MOBLPHON}"/></td>
		  			<td><c:out value="${result.COMPCODE}"/></td>
		  			<td><c:out value="${result.COMPDATE}"/></td>
		     	</tr> 
		</c:forEach>
		</table>
	</body>
</html>

