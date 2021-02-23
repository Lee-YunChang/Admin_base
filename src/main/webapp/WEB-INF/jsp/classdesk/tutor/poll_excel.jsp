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
	String fileNm = "설문결과_"+today+".xls";
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
	<table border="1"> 
		<tbody>
			<tr>
				<th>설문명</th>
				<td colspan='2'><c:out value="${surveyInfo.TITLE}"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan='2'><c:out value="${surveyInfo.WRITER}"/></td>
			</tr>
			<tr>
				<th>설문기간</th>
				<td colspan='2'>
					<c:out value="${surveyInfo.SDATE}"/>
					~
					<c:out value="${surveyInfo.EDATE}"/>
				</td>
			</tr>
			<tr>
				<th>응답수</th> 
				<td colspan='2'><input type='hidden' id='totalCnt' value='<c:out value="${surveyInfo.CNT}"/>'/><c:out value="${surveyInfo.CNT}"/>명 
				<c:if test="${REQUEST_DATA.ISCOURSE eq 'Y'}">
					(전체 수강생 <c:out value="${surveyInfo.TOTALMEMBER}"/>명)</td>
				</c:if>
			</tr>
			<tr>
				<th>설문설명</th>
				<td colspan='2'><c:out value="${surveyInfo.SUMMARY}"/></td>
			</tr>
		</tbody> 
	</table>
	<br/> 
	<table border="1">
		<tr>
			<th>문항</th>
			<th>응답율</th>
			<th>응답자수</th>
		</tr>
		
		
		<c:forEach var="questionList" items="${questionList}" varStatus="status">
			<c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}"> 
			<tr>
				<td colspan="3" style="background-color: #ffff95;">
					<%-- <c:out value="${questionList.QNO}"/>. <c:out value="${questionList.SUBJECT}"/> --%> 
					<c:out value="${status.count}"/>. <c:out value="${questionList.SUBJECT}"/>
					<c:if test="${questionList.PERIOD != '' && questionList.PERIOD != null}">[<c:out value="${questionList.PERIOD}"/>교시 ${questionList.LIB_SUBJECT}]</c:if>
				</td>
			</tr>
				<c:if test="${not empty listData}">
		 			<c:forEach items="${listData}" var="result" varStatus="stat">
					<c:if test="${questionList.QNO == result.QNO}">
		 					<tr>
								<td>&nbsp;&nbsp;<c:out value="${result.ITEMSEQ}"/>. <c:out value="${result.ITEM_SUBJECT}"/></td>
								<td>
									<fmt:formatNumber var="sumAnswer1" value="${result.CNT}" pattern="#.##"/>  
									<fmt:formatNumber var="sumAnswer2" value="${surveyInfo.CNT}" pattern="#.##"/> 
									<c:choose>
										<c:when test="${sumAnswer1 > 0}">
											<fmt:formatNumber var="calAnswer1" value="${sumAnswer1/sumAnswer2 * 100}"/>
											<c:out value="${calAnswer1 }"/>%
										</c:when>	
									</c:choose>
								</td>
								<td align="right"><c:out value="${result.CNT}"/>명</td>
							</tr> 
					</c:if>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}"> 
			<tr>
				<td colspan="3" style="background-color: #ffff95;"  >
					<c:out value="${status.count}"/>. <c:out value="${questionList.SUBJECT}" escapeXml='false'/>
					<c:if test="${questionList.PERIOD != '' && questionList.PERIOD != null}">[<c:out value="${questionList.PERIOD}"/>교시 ${questionList.LIB_SUBJECT}]</c:if>(주관식)
				</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>

	<br/> 
	
	<table border="1">
		<tr>
			<th colspan='2'>주관식 문항</th>
			<th>설문응답</th>
		</tr>
 			<c:forEach items="${questionList}" var="questionList" varStatus="questionListStat"> 
				<c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00' }">
					 <tr>
						<%-- <td align="center"><c:out value="${listData2.QNO}"/></td> --%>
						<td colspan='2' align="center"><c:out value="${questionList.SUBJECT}"  escapeXml='false'/></td>
						<td>
						<c:forEach items="${listData2}" var="listData2" varStatus="stat"> 
						<c:if test="${questionList.QNO == listData2.QNO}">
							<c:out value="${listData2.ANSWER}"  escapeXml='false'/>
						</c:if>
						</c:forEach>
						</td>
					</tr>
				</c:if>
			</c:forEach>
	</table> 
</body>
</html>