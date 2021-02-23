<%
/****************************************************
	system	: 회원관리
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
	String fileNm = "회원관리_"+today+".xls";
	//String filename = new String(fileNm.getBytes("euc-kr"),"iso-8859-1");
	
	response.setContentType("application/vnd.ms-excel;charset=utf-8");
    response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "utf-8") + ";");
%>
<html>
<head>
<meta http-equive="content-type" content="text/html; charset=utf-8">
<style type="text/css">
table th { background-color:#A4A4A4; }
</style>
</head>
<body>
	<table class="tb table-type1" border="1">
		<colgroup>
			<col style="width:4%">
			<col style="width:7%">
			<col style="width:12%">
			<col style="width:12%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>	
		<thead>
			<tr class="rndbg">
				<th>NO</th>
				<th>회원구분</th>
				<th>지점</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>가입일시</th>
				<th>강사여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh"> 
					<td><c:out value='${status.count}'/></td> 
					<td><c:out value='${result.MT_GRADE_NAME}'/></td>
					<td><c:out value='${result.MT_OFFICE_NAME}'/></td>
					<td><c:out value='${result.USERID}'/></td>
					<td><c:out value='${result.USERNAME}'/></td>
					<td><c:out value="${fn:substring(result.BRTHDY, 0, 4)}"/>.<c:out value="${fn:substring(result.BRTHDY, 4, 6)}"/>.<c:out value="${fn:substring(result.BRTHDY, 6, 8)}"/></td>		
					<td><c:out value='${result.WRITE_DATE}'/></td>
					<td><c:out value='${result.TUTOR_NAME}'/></td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
</body>
</html>