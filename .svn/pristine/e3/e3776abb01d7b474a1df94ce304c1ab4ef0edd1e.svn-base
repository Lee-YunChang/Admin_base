<%
/****************************************************
	system	: 과정진행관리 > 수강생정보관리 > 회원정보
	title	: 회원정보  
	summary	:	
	wdate	: 2016-05-11
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	$(".header-tab").each(function() {
		$(this).removeClass("on");
	});
	$("."+$("#subcmd").val()).each(function() {
		$(this).addClass("on");
		$(this).show("fast");
	});
	
});
//수료증 발급
function fnPassPrint(mtCtypeCode, cuserNo, userNo,sdate,edate){
	
	var w1 =1070;
	var h1 = 900;
	var url = "";
	if(mtCtypeCode == "<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%>"){
		url = "/admin/study/cerOfflinePrint.do";
	}
	else {
		url = "/admin/study/cerOnlinePrint.do";
	}
	
	$("#sdate").val(sdate);
	$("#edate").val(edate);
	$("#pform").attr("target", "");
	$("#pform > input[name='userNo']").val(userNo);  
	$("#pform > input[name='cuserNo']").val(cuserNo);
	
	window.open( url+"?"+$("#pform").serialize()
		,"cert_pop","width="+w1+" height="+h1+", top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no");
}
</script>

<c:choose>
<c:when test="${result.MBER_GBN == 'USER'}"><c:set var="titleInfo">회원정보</c:set></c:when>
<c:otherwise><c:set var="titleInfo">비회원정보</c:set></c:otherwise>
</c:choose>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수강생정보관리<span><c:out value="${titleInfo}"/></span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_user_tab_inc.jsp"></jsp:include>
</c:if>
<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/study/cuserView.do" method="POST">
<input type="hidden" name="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="userNo" id="userNo" value="<c:out value="${REQUEST_DATA.userNo}"/>"/>
<input type="hidden" name="cuserno" id="cuserno" value="<c:out value="${REQUEST_DATA.cuserno}"/>"/>
<input type="hidden" name="cuserNo" id="cuserNo" value=""/>
<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
<input type="hidden" name="sdate" id="sdate" value=""/>
<input type="hidden" name="edate" id="edate" value=""/>
<input type="hidden" name="subcmd" id="subcmd" value="<c:out value="${REQUEST_DATA.subcmd}"/>"/>

<div class="tb_title"><c:out value="${titleInfo}"/></div>
<table class="table-type1 search_form">
	<colgroup>
		<col class="cellc" width="15%">
		<col class="celll" width="35%">
		<col class="cellc" width="15%">
		<col class="celll" width="35%">
	</colgroup>
	<tbody>
		<c:if test="${result.MBER_GBN == 'USER'}">
		<tr> 
			<th>아이디</th>
			<td><c:out value='${result.USERID}'/></td>
			<th>이름</th>
			<td><c:out value='${result.USERNAME}'/></td>
		</tr>
		</c:if>
		<c:if test="${result.MBER_GBN == 'NON'}">
		<tr> 
			<th>이름</th>
			<td><c:out value='${result.USERNAME}'/></td>
			<th>생년월일</th>
			<td><c:out value='${result.BRTHDY}'/></td>
		</tr>
		</c:if>
		<tr>
			<th>휴대폰번호</th>
			<td><c:out value='${result.MOBILE}'/></td>
			<th>메일주소</th>
			<td><c:out value='${result.EMAIL}'/></td>
		</tr>
		<tr>
			<th>회원구분</th>
			<td><c:out value='${result.MT_GRADE_NAME}'/></td>
			<th>지점</th>
			<td><c:out value='${result.MT_OFFICE_NAME}'/></td>
		</tr>
	</tbody>
</table>

<div style="width:100%; height:300px; overflow:auto; overflow-x:hidden; margin-top:20px;">
<div class="tb_title">수강정보 </div>
<table class="table-type1 search_form">
	<colgroup>
		<col class="cellc" width="5%">
		<col class="celll" width="20%">
		<col class="cellc" width="35%">
		<col class="celll" width="*">
		<col class="celll" width="10%">
	</colgroup>
	<thead>
		<tr>
			<th>No</th>
			<th>구분</th>
			<th>과정명</th>
			<th>학습기간</th>
			<th>수료여부</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="totalCount" value="${fn:length(courseInfo)}"/>
		<c:forEach var="course" items="${courseInfo}" varStatus="status">
			<tr>
				<td>${totalCount - status.index}</td>
				<td style="text-align: center;">${course.MT_CTYPE_NAME}</td>
				<td><c:out value="${course.SEQ_TITLE}"/></td>
				<td>
					<c:if test="${course.OPENTYPE == 'D'and course.COURSE_STATUS == '8'}">
						<c:out value='${course.STUDY_SDATE}'/>~<c:out value='${course.STUDY_EDATE}'/>
					</c:if>
					<c:if test="${course.OPENTYPE == 'A' and course.COURSE_STATUS == '8'}"> 
						<c:out value='${course.WDATE}'/>~<c:out value='${course.COMPDATE}'/>
					</c:if>
				</td>
				<td style="text-align: center;">
				<c:choose>
					<c:when test="${course.COURSE_STATUS == '8'}">
					<a href="#" onclick="fnPassPrint('<c:out value="${course.MT_CTYPE_CODE}"/>', '<c:out value="${course.CUSERNO}"/>', '<c:out value="${course.USERNO}"/>','<c:out value="${course.STARTDATE}"/>','<c:out value="${course.ENDDATE}"/>'); return false;" class="btn brown">수료증</a>
					</c:when>
					<c:when test="${course.COURSE_STATUS == '9'}">미수료</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>				
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<div class="button">
	<a href="#" onclick="window.close()" class="btn big gray">닫기</a>
</div> 
</form>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>