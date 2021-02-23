<%
/****************************************************
	system	: 통계관리
	title	: 교육실적 통계 엑셀다운로드
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
	String fileNm = "종합수료통계현황_"+today+".xls";
	
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

<!-- 전체 교육 운영 현황 -->
<table class="tb table-type1 stats_tb">

<tr>
	<th rowspan="1" colspan="2" style="width: 150px">구분</th>
	<th rowspan="1" style="width:100px">교육과정</th>
	<th colspan="1">수료자 수</th>
</tr>
<c:set var="trCnt1" value="0"/>
<c:set var="trCnt2" value="0"/>
<c:set var="trCnt3" value="0"/>
<c:set var="compTotMinus" value="0"/>
<c:set var="compCyberLonCnt" value="0"/>
<c:set var="trRef2Nm" value=""/>
<c:set var="trAbcYn" value="N"/>
<c:forEach var="result" items="${resultList}">
	<c:set var="trCnt1" value="${trCnt1+1 }"/>
	<tr>
		<c:choose>
			<c:when test="${trCnt1 == 1}">
				<td rowspan="${resultCateList1[trCnt2].CNT-1}" style="text-align: center">${result.REF2}</td>
				<td rowspan="${resultCateList2[trCnt3].CNT}" style="text-align: center">${result.ABC_CD}</td>
				<td>${result.REF3}</td>
				<c:set var="trCnt2" value="${trCnt2+1}"/>
				<c:set var="trCnt3" value="${trCnt3+1}"/>
			</c:when>
			<c:when test="${trCnt1 != 1 and result.TYPE=='A'}">
				<c:if test="${trRef2Nm != result.REF2}">
					<td rowspan="${resultCateList1[trCnt2].CNT-1}" style="text-align: center">${result.REF2}</td>
					<c:set var="trCnt2" value="${trCnt2+1}"/>
				</c:if>
				<c:if test="${trAbcYn == 'Y'}">
					<td rowspan="${resultCateList2[trCnt3].CNT}" style="text-align: center">${result.ABC_CD}</td>
					<c:set var="trCnt3" value="${trCnt3+1}"/>
				</c:if>
				<c:if test="${result.ABC_CD != '교육별소계'}">
					<td>${result.REF3}</td>
				</c:if>
				<c:set var="trAbcYn" value="N"/>
			</c:when>
			<c:when test="${trCnt1 != 1 and result.TYPE=='B'}">
				<td colspan="2" style="text-align: center">${result.ABC_CD} 소계</td>
				<c:set var="trAbcYn" value="Y"/>
			</c:when>
			<c:when test="${trCnt1 != 1 and result.TYPE=='B+B'}">
				<td colspan="3" style="text-align: center">${result.REF2} 소계</td>
				<c:set var="trAbcYn" value="Y"/>
			</c:when>
			<c:when test="${result.TYPE=='ALL'}">
				<td colspan="3" style="text-align: center">합계</td>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${result.REF2 == '대출이용자 교육' and result.ABC_CD == '온라인교육' and result.REF3 == '햇살론'}">
				<td>${resultCompCnt1}</td>
				<c:set var="compTotMinus" value="${compTotMinus+result.CNT}"/>
			</c:when>
			<c:when test="${result.REF2 == '대출이용자 교육' and result.ABC_CD == '온라인교육' and result.REF3 == '미소금융'}">
				<td>${resultCompCnt2}</td>
				<c:set var="compTotMinus" value="${compTotMinus+result.CNT}"/>
			</c:when>
			<c:when test="${result.REF2 == '대출이용자 교육' and result.ABC_CD == '온라인교육' and result.REF3 == '과정별소계'}">
				<td>${resultCompCnt1+resultCompCnt2}</td>
			</c:when>
			<c:when test="${result.REF2 == '대출이용자 교육' and result.ABC_CD == '교육별소계' and result.REF3 == '과정별소계'}">
				<td>${result.CNT-compTotMinus+resultCompCnt1+resultCompCnt2}</td>
			</c:when>
			<c:when test="${result.REF2 == '합계' and result.ABC_CD == '교육별소계' and result.REF3 == '과정별소계' and result.TYPE =='ALL'}">
				<td>${result.CNT-compTotMinus+resultCompCnt1+resultCompCnt2}</td>
			</c:when>
			<c:otherwise>
				<td>${result.CNT}</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<c:set var="trRef2Nm" value="${result.REF2}"/>
</c:forEach>

</table>

</body>
</html>