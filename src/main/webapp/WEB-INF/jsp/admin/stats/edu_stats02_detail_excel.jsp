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
	String fileNm = "온라인교육운영상세_"+today+".xls";
	
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
<table class="tb table-type1" >
		<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>이름</th>
			<th>아이디</th>
			<th>회원구분</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>승인여부</th>
			<th>수강상태</th>
			<th>등록일</th>
			<th>소속</th>
			<th>직급</th>
			<th>휴대폰번호</th>
			<th>이메일</th>
			<th>수료여부</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				 <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
					<td><c:out value="${result.TOTALCOUNT-result.RNUM+1}"/></td>
					<td><c:out value='${result.MBERNM}'/></td>
					<td><c:out value='${result.UNITY_ID}'/></td>
					<td><c:out value='${result.MT_GRADE_NAME}'/></td>
					<td><c:out value='${result.SEX}'/></td>
					<td><c:out value='${result.BRTHDY}'/></td>
					<td><c:out value='${result.TARGETYN}'/></td>
					<td><c:out value='${result.USEYN}'/></td>
					<td><c:out value='${result.WDATE}'/></td>
					<td><c:out value='${result.COMNAME}' escapeXml="xml"/></td>
					<td><c:out value='${result.POSITION_NAME}' escapeXml="xml"/></td>
					<td><c:out value='${result.MOBLPHON}'/></td>
					<td><c:out value='${result.EMAIL}'/></td>
					<td><c:out value='${result.COMPYN}'/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>