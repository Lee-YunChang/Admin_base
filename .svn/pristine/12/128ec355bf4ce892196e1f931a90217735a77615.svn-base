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
	String fileNm = "방문교육통계_"+today+".xls";
	
	response.setContentType("application/vnd.ms-excel;");
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
<c:choose>
	<c:when test="${REQUEST_DATA.searchType eq 'TC' }">
		<div id="select3">
			<table class="tb table-type1 stats_tb">
				   <colgroup>
			        <col style="width: *">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:8%">
			    </colgroup>
			    <thead>
				<tr>
			    	<th scope="col" colspan="2">구분(강사)</th>
			    	<th scope="col">1월</th>
			    	<th scope="col">2월</th>
			    	<th scope="col">3월</th>
			    	<th scope="col">4월</th>
			    	<th scope="col">5월</th>
			    	<th scope="col">6월</th>
			    	<th scope="col">7월</th>
			    	<th scope="col">8월</th>
			    	<th scope="col">9월</th>
			    	<th scope="col">10월</th>
			    	<th scope="col">11월</th>
			    	<th scope="col">12월</th>
			    	<th scope="col">합계</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="status">
				    <tr>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MT_SUB_NAME }</td>
				    	<td>횟수</td>
				    	<td><c:out value="${result.M01}" /></td>
				    	<td><c:out value="${result.M02}" /></td>
				    	<td><c:out value="${result.M03}" /></td>
				    	<td><c:out value="${result.M04}" /></td>
				    	<td><c:out value="${result.M05}" /></td>
				    	<td><c:out value="${result.M06}" /></td>
				    	<td><c:out value="${result.M07}" /></td>
				    	<td><c:out value="${result.M08}" /></td>
				    	<td><c:out value="${result.M09}" /></td>
				    	<td><c:out value="${result.M10}" /></td>
				    	<td><c:out value="${result.M11}" /></td>
				    	<td><c:out value="${result.M12}" /></td>
				    	<td><c:out value="${result.MTOT}" /></td>
				    </tr>
				     <tr>
				    	<td style="border-left:1px solid #ddd;">인원</td>
				    	<td><c:out value="${result.SUM01}" /> </td>
				    	<td><c:out value="${result.SUM02}" /></td>
				    	<td><c:out value="${result.SUM03}" /></td>
				    	<td><c:out value="${result.SUM04}" /></td>
				    	<td><c:out value="${result.SUM05}" /></td>
				    	<td><c:out value="${result.SUM06}" /></td>
				    	<td><c:out value="${result.SUM07}" /></td>
				    	<td><c:out value="${result.SUM08}" /></td>
				    	<td><c:out value="${result.SUM09}" /></td>
				    	<td><c:out value="${result.SUM10}" /></td>
				    	<td><c:out value="${result.SUM11}" /></td>
				    	<td><c:out value="${result.SUM12}" /></td>
				    	<td><c:out value="${result.SUMTOT}" /></td>
				    </tr>
			    </c:forEach> 
			</tbody>
			</table>
			</div>
	</c:when>
	<c:when test="${REQUEST_DATA.searchType eq 'TU' }">
		<div id="select4">
			<table class="tb table-type1 stats_tb">
				   <colgroup>
			        <col style="width:6%">
			        <col style="width:5%">
			        <col style="width:7%">
			        <col style="width:6%">
			        <col style="width:10%">
			        <col style="width:14%">
			        <col style="width:8%">
			        <col style="width:16%">
			        <col style="width: *">
			        <col style="width:9%">
			    </colgroup>
			    <thead>
				<tr>
					<th scope="col">아이디</th>
			    	<th scope="col">이름</th>
			    	<th scope="col">구분(강사)</th>
			    	<th scope="col">신청자</th>
			    	<th scope="col">신청기관</th>
			    	<th scope="col">교육주제</th>
			    	<th scope="col">교육대상</th>
			    	<th scope="col">교육일시</th>
			    	<th scope="col">주소</th>
			    	<th scope="col">교육장소</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="status">
				    <tr>
				    	<td><c:out value="${result.UNITY_ID}" /></td>
				    	<td><c:out value="${result.MBERNM}" /></td>
				    	<td><c:out value="${result.MT_TUTOR_NAME}" /></td>
				    	<td><c:out value="${result.APPLY_NM}" /></td>
				    	<td><c:out value="${result.APPLY_ORGAN_NM}" /></td>
				    	<td><c:out value="${result.mtLctreName}" /></td>
				    	<td><c:out value="${result.MT_LEC_TARGET_NAME}" /></td>
				    	<td><c:out value="${result.DS_SDATE}" />~<c:out value="${result.DS_EDATE}" /></td>
				    	<td><c:out value="${result.LE_LNM_ADRES1}" />&nbsp;<c:out value="${result.LE_LNM_ADRES2}" /></td>
				    	<td><c:out value="${result.EDU_AREA}" /></td>
				    </tr>
			    </c:forEach> 
			</tbody>
			</table>
			</div>
			
	</c:when>
	<c:when test="${REQUEST_DATA.searchType eq 'TM' }">
		<div id="select3">
			<table class="tb table-type1 stats_tb">
				   <colgroup>
			        <col style="width: *">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			    </colgroup>
			    <thead>
				<tr>
			    	<th scope="col">아이디</th>
			    	<th scope="col">이름</th>
			    	<th scope="col">구분</th>
			    	<th scope="col">1월</th>
			    	<th scope="col">2월</th>
			    	<th scope="col">3월</th>
			    	<th scope="col">4월</th>
			    	<th scope="col">5월</th>
			    	<th scope="col">6월</th>
			    	<th scope="col">7월</th>
			    	<th scope="col">8월</th>
			    	<th scope="col">9월</th>
			    	<th scope="col">10월</th>
			    	<th scope="col">11월</th>
			    	<th scope="col">12월</th>
			    	<th scope="col">합계</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="status">
				    <tr>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.UNITY_ID}</td>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MBERNM}</td>
				    	<td>횟수</td>
				    	<td><c:out value="${result.M01}" /></td>
				    	<td><c:out value="${result.M02}" /></td>
				    	<td><c:out value="${result.M03}" /></td>
				    	<td><c:out value="${result.M04}" /></td>
				    	<td><c:out value="${result.M05}" /></td>
				    	<td><c:out value="${result.M06}" /></td>
				    	<td><c:out value="${result.M07}" /></td>
				    	<td><c:out value="${result.M08}" /></td>
				    	<td><c:out value="${result.M09}" /></td>
				    	<td><c:out value="${result.M10}" /></td>
				    	<td><c:out value="${result.M11}" /></td>
				    	<td><c:out value="${result.M12}" /></td>
				    	<td><c:out value="${result.MTOT}" /></td>
				    </tr>
				     <tr>
				    	<td style="border-left:1px solid #ddd;">인원</td>
				    	<td><c:out value="${result.SUM01}" /> </td>
				    	<td><c:out value="${result.SUM02}" /></td>
				    	<td><c:out value="${result.SUM03}" /></td>
				    	<td><c:out value="${result.SUM04}" /></td>
				    	<td><c:out value="${result.SUM05}" /></td>
				    	<td><c:out value="${result.SUM06}" /></td>
				    	<td><c:out value="${result.SUM07}" /></td>
				    	<td><c:out value="${result.SUM08}" /></td>
				    	<td><c:out value="${result.SUM09}" /></td>
				    	<td><c:out value="${result.SUM10}" /></td>
				    	<td><c:out value="${result.SUM11}" /></td>
				    	<td><c:out value="${result.SUM12}" /></td>
				    	<td><c:out value="${result.SUMTOT}" /></td>
				    </tr>
			    </c:forEach> 
			</tbody>
			</table>
			</div>
	</c:when>
	<c:otherwise>
		<div id="select1">
			<table class="tb table-type1 stats_tb">
			
			    <colgroup>
			        <col style="width: *">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:6%">
			        <col style="width:8%">
			    </colgroup>
			    <thead>
				<tr>
			    	<th scope="col" colspan="2">구분(교육대상)</th>
			    	<th scope="col">1월</th>
			    	<th scope="col">2월</th>
			    	<th scope="col">3월</th>
			    	<th scope="col">4월</th>
			    	<th scope="col">5월</th>
			    	<th scope="col">6월</th>
			    	<th scope="col">7월</th>
			    	<th scope="col">8월</th>
			    	<th scope="col">9월</th>
			    	<th scope="col">10월</th>
			    	<th scope="col">11월</th>
			    	<th scope="col">12월</th>
			    	<th scope="col">합계</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="status">
					 <tr>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MT_SUB_NAME }</td>
				    	<td>횟수</td>
				    	<td><c:out value="${result.M01}" /></td>
				    	<td><c:out value="${result.M02}" /></td>
				    	<td><c:out value="${result.M03}" /></td>
				    	<td><c:out value="${result.M04}" /></td>
				    	<td><c:out value="${result.M05}" /></td>
				    	<td><c:out value="${result.M06}" /></td>
				    	<td><c:out value="${result.M07}" /></td>
				    	<td><c:out value="${result.M08}" /></td>
				    	<td><c:out value="${result.M09}" /></td>
				    	<td><c:out value="${result.M10}" /></td>
				    	<td><c:out value="${result.M11}" /></td>
				    	<td><c:out value="${result.M12}" /></td>
				    	<td><c:out value="${result.MTOT}" /></td>
				    </tr>
				     <tr>
				    	<td style="border-left:1px solid #ddd;">인원</td>
				    	<td><c:out value="${result.SUM01}" /> </td>
				    	<td><c:out value="${result.SUM02}" /></td>
				    	<td><c:out value="${result.SUM03}" /></td>
				    	<td><c:out value="${result.SUM04}" /></td>
				    	<td><c:out value="${result.SUM05}" /></td>
				    	<td><c:out value="${result.SUM06}" /></td>
				    	<td><c:out value="${result.SUM07}" /></td>
				    	<td><c:out value="${result.SUM08}" /></td>
				    	<td><c:out value="${result.SUM09}" /></td>
				    	<td><c:out value="${result.SUM10}" /></td>
				    	<td><c:out value="${result.SUM11}" /></td>
				    	<td><c:out value="${result.SUM12}" /></td>
				    	<td><c:out value="${result.SUMTOT}" /></td>
				    </tr>
				</c:forEach> 
			</tbody>
			</table>
			</div>
	</c:otherwise>
</c:choose>

</body>
</html>