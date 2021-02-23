<%
/****************************************
	system	: ClassDesk > 강사 > 설문 리스트
	title	: 설문 메인
	summary	: 
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">설문지 미리보기</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="form" action="/classdesk/tutor/poll/exec.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" id="pollcseqno" name="pollcseqno" value="<c:out value="${surveyInfo.POLLCSEQNO}"/>"/>
    <input type="hidden" id="qu" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
	<input type="hidden" id="pollcseqno2" name="pollcseqno2" value="<c:out value="${REQUEST_DATA.pollcseqno2}"/>"/>
	<input type="hidden" id="pageMode" name="pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
	<input type="hidden" id="cnt" name="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>"/>
	<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}"/>
	
	<table class="table-type1 search_form">
		<colgroup>
			<col style="width:30%;" />
			<col style="width:70%;" />
		</colgroup>
		<tbody>
			<tr>
				<th><em>*</em>설문명</th>
				<td>
					<c:out value="${surveyInfo.TITLE}"/>
				</td>
			</tr>
			<tr>
				<th>설문기간</th>
				<td><c:out value="${surveyInfo.SDATE}"/>~<c:out value="${surveyInfo.EDATE}"/></td>
			</tr>
			<tr>
				<th>설문설명</th>
				<td><c:out value="${surveyInfo.SUMMARY}"/></td>
			</tr>
			<tr>
				<th><em>*</em>사용여부</th>
				<td><c:if test="${surveyInfo.USEYN eq 'Y'}"> 사용 </c:if>&nbsp;<c:if test="${surveyInfo.USEYN eq 'N'}"> 사용안함</c:if></td>
			</tr>
		</tbody> 
	</table>

	
	</br>
	<div id='table' style='background:#b5d1d9';>
		<c:forEach var="moduleList" items="${moduleList}" varStatus="status">
		<div style='background:#fff;height:10px;'></div>
		<div class='module' id='module' name='module' style='padding:5px 20px; font-size:16px; color:#33485d;'></br>
		<strong>모듈명&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<c:out value='${moduleList.CPOLL_TITLE}'/></strong>
			<ol style='background:#fff;'>
			<c:forEach var="questionList" items="${questionList}" varStatus="status">
			<c:if test="${moduleList.CPOLL_TITLE == questionList.CPOLL_TITLE}">
			<div id='questions'>
				<div style='background:#B5D2DA;height:10px;'></div>
				<div class='question' id='question' name='question' style='padding:10px;margin:10px'> 
				<strong style="font-size:15px;">* 형태&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='hidden' id='countItem' name='countItem'>
				<c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">주관식</c:if>
				<c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}">객관식</c:if>
				</br></br>
				<li style='-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'>
					<strong style="font-size:15px;">질문&nbsp;&nbsp;:</strong>
					<c:if test="${questionList.TUTOR_USERNO != '' && questionList.TUTOR_USERNO > 0}">&nbsp;[강사: <c:out value='${questionList.TUTORNM}'/>]</c:if>
						&nbsp;&nbsp;<c:out value='${questionList.SUBJECT}'/>
						<c:if test="${questionList.PERIOD != '' && questionList.PERIOD != null}">[<c:out value="${questionList.PERIOD}"/>교시 ${questionList.LIB_SUBJECT}]</c:if>
					<c:if test="${questionList.DOUBLE_AT eq 'Y'}">(복수응답)</c:if>
				</li></br>
					<div id='itemsMenu' style='display: block;'>
						<ol id='items' style='-webkit-margin-start:2em'>
							<c:forEach var="resultList" items="${resultList}" varStatus="status">
							<c:if test="${questionList.QNO == resultList.QNO}">
							<c:if test="${resultList.ITEM_SUBJECT != null && resultList.ITEM_SUBJECT != ''}">
								<li id='item' style='padding-top:5px; list-style:decimal;'>
									<c:out value='${resultList.ITEM_SUBJECT}'/>
								</li>
							</c:if>
							</c:if>
							</c:forEach>
						</ol>
					</div> 
				</div>
			</div>
			</c:if>
			</c:forEach>
			</ol>
		</div>
		</c:forEach>
	</div>
</form>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>