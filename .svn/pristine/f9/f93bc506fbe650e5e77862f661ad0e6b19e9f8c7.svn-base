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
	String fileNm = "기업정보관리_"+today+".xls";
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
		<th>업체명</th>
		<th>대표명</th>
		<th>사업자번호</th>
		<th>전화번호</th>
 		<th>기업담당자</th>
	</tr>		
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align="middle" class="onFocusBgCh">
			<td><c:out value='${result.COMNAME}'/></a></td>
			<td><c:out value='${result.CEO}'/></td>
			<td><c:out value='${result.BIZNO}'/></td>
			<td><c:out value='${result.TEL}'/></td>
			<td><c:if test="${result.USERNAME ne null}"><c:out value='${result.USERNAME}'/>(<c:out value='${result.USERID}'/>)</c:if></td>
			
		</tr> 
	</c:forEach>
</table>

</body>
</html>