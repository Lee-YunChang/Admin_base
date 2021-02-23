<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 과정별 출석부
	title	: 30시간 이상 출석부 출력
	summary	:	
	wdate	: 2016-05-11
	writer	: 
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
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>
<%
	List list = (List)request.getAttribute("tutorList");
	String today = SangsUtil.getToday("yyyyMMdd");
	String fileNm = "특강목록_"+today+".xls";
	String filename = new String(fileNm.getBytes("euc-kr"),"iso-8859-1");
	
	response.setContentType("application/x-msdownload;charset=utf-8");
    response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "utf-8") + ";");
 %>
<html>

<head>
<meta http-equiv='Content-Type' content='application/x-msdownload; charset=utf-8'/>

<style type="text/css">
table th { background-color:#6EE3F7;}

</style>
</head>
<body>
	<table class="tb table-type1" border="1">
		<colgroup>
			<col class="cellc" width="2%">
			<col class="cellc" width="4%">
			<col class="cellc" width="8%">
			<col class="cellc" width="12%">
			<col class="celll" width="12%">
			<col class="celll" width="4%">
			<col class="celll" width="9%">
			<col class="cellc" width="4%">
			<col class="cellc" width="10%">
			<col class="celll" width="6%">
			<col class="cellc" width="10%">
			<col class="cellc" width="4%">
			<col class="celll" width="8%">
			<col class="cellc" width="8%">
			<col class="cellc" width="10%">
			<col class="cellc" width="4%">
			<col class="cellc" width="10%">
			<col class="cellc" width="10%">
			<col class="cellc" width="10%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
		</colgroup>	       
	    <tr>
	    	<th scope="col">신청번호</th>
			<th scope="col">신청기관</th> 
			<th scope="col">신청교육일시</th> 
			<th scope="col">확정교육일시</th>
			<th scope="col">시간(분)</th> 
	    	<th scope="col">지역</th> 
			<th scope="col">교육장소</th> 
			<th scope="col">교육대상</th>
			<th scope="col">참석인원</th> 
			<th scope="col">결과인원</th> 
			<th scope="col">교육주제</th>
			<th scope="col">신청자</th>
			<th scope="col">신청자 연락처</th>
			<th scope="col">강사구분</th>
			<th scope="col">강사</th>
			<th scope="col">강사 연락처</th>
			<th scope="col">교육확인서<br/>유무</th> 
			<th scope="col">수강생 만족도</th> 
			<th scope="col">수요처 만족도</th> 
			<th scope="col">강사료</th> 
			<th scope="col">출장비</th> 
			<th scope="col">상태</th> 
			<th scope="col">신청일</th> 
			<th scope="col">기타</th> 
		</tr>
	    <c:choose>
			<c:when test="${fn:length(resultList) > 0}">
				<c:forEach var="data" items="${resultList}" varStatus="varStatus">
					<tr align="center">
						<td><c:out value='${varStatus.count}'/></td>
						<td><strong><c:out value="${data.APPLY_ORGAN_NM}"/></strong></td> 
						<td>${data.EDU_SDATE } ~ ${data.EDU_EDATE }</td>
						<td>
							<c:choose>
								<c:when test="${data.MT_LEC_STATUS_CODE eq 'LE0001' || data.MT_LEC_STATUS_CODE eq 'LE0005'}">
								</c:when>
								<c:otherwise>
									${data.DS_SDATE } ~ ${data.DS_EDATE }
								</c:otherwise>
							</c:choose>
						</td> 
						<td><c:out value="${data.STUDY_TIME}"/></td>
						<td><c:out value='${data.LE_LNM_ADRES1}'/>&nbsp;<c:out value='${data.LE_LNM_ADRES2}'/></td>
						<td><strong><c:out value="${data.EDU_AREA}"/></strong></td> 
						<td>
							<c:out value="${data.MT_LEC_TARGET_NAME}"/>
							<c:if test="${data.MT_LEC_TARGET_NAME eq '기타'}">(<c:out value="${data.TARGET_ETC}"/>)</c:if>
						</td>
						<td><c:out value="${data.PERSON_CNT}"/></td> 
						<td><c:out value="${data.COM_CNT}"/></td>
						<td><c:out value="${data.mtLctreName}"/></td>
						<td><c:out value="${data.APPLY_NM}"/></td> 
						<td><c:out value="${data.APPLY_PHONE}"/></td>
						<td>${data.MT_TUTOR_CATE_NAME }</td> 
						<td>${data.MBERNM }</td>
						<td><c:out value="${data.MOBLPHON}"/></td>
						<td>
							<c:if test="${data.FILE_YN == 'Y'}">O</c:if>
							<c:if test="${data.FILE_YN == 'N'}">X</c:if>
						</td>
						<td><c:out value="${data.APPLY_SCORE}"/></td>
						<td><c:out value="${data.ORGAN_SCORE}"/></td>
						<td><c:out value="${data.PAY}"/></td>
						<td><c:out value="${data.PTRPS}"/></td>
						<td><c:out value="${data.MT_LEC_STATUS_NAME }"/></td> 
						<td><c:out value="${data.REGIST_DT }"/></td> 
						<td><c:out value="${data.EDU_CONTENTS }"/></td> 
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="14" align="center">
						등록된 특강이 존재 하지 않습니다.
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
   </table>
</body>
</html>
