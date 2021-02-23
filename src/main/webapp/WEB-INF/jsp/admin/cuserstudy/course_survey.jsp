<%
/****************************************************
	system	: 과정진행관리 > 수강생정보관리 > 설문
	title	: 수강생정보  
	summary	:	
	wdate	: 2016-05-12
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
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수강생정보관리<span>설문</span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_user_tab_inc.jsp"></jsp:include>
</c:if>
<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/study/surveyView.do" method="POST">
<input type="hidden" name="subcmd" id="subcmd" value="<c:out value="${REQUEST_DATA.subcmd}"/>"/>
<input type="hidden" name="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="userNo" id="userNo" value="<c:out value="${REQUEST_DATA.userNo}"/>"/>
<input type="hidden" name="cuserno" id="cuserno" value="<c:out value="${REQUEST_DATA.cuserno}"/>"/>
<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
<div class="tb_title">설문참여내역</div>
<c:if test="${not empty emap.APPLY_DATE && emap.APPLY_YN == 'Y'}">
	<span>참여일 : <c:out value='${emap.APPLY_DATE}'/></span>
</c:if>

<div class="space"></div><!-- 공백 default 5px -->
<c:if test="${not empty resultList}">
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<!-- 객관식 -->		
		<c:if test="${result.MT_CPOLL_CODE == 'JBBA00'}">
			<div><strong><c:out value='${result.QNO}'/>. <c:out value='${result.SUBJECT}'/></strong></div>
			<div class="space"></div><!-- 공백 default 5px -->
			<div style="padding-left: 10px;">
				<c:if test="${not empty result.ITEM01}">
					<p id="a01item" style="margin:3px;" class="<c:if test="${result.ITEMSEQ eq '1'}"> red </c:if>">
						1) <c:out value='${result.ITEM01}'/>&nbsp; (배점 : <c:out value='${result.ITEM01_VAL}'/>)</p>
				</c:if>
				<c:if test="${not empty result.ITEM02}">
					<div class="space5"></div>
					<p id="a02item" style="margin:3px;" class="<c:if test="${result.ITEMSEQ eq '2'}"> red </c:if>">
						2) <c:out value='${result.ITEM02}'/>&nbsp; (배점 : <c:out value='${result.ITEM02_VAL}'/>)</p>
				</c:if>
				<c:if test="${not empty result.ITEM03}">
					<div class="space5"></div>
					<p id="a03item" style="margin:3px;" class="<c:if test="${result.ITEMSEQ eq '3'}"> red </c:if>">
						3) <c:out value='${result.ITEM03}'/>&nbsp; (배점 : <c:out value='${result.ITEM03_VAL}'/>)</p>
				</c:if>
				<c:if test="${not empty result.ITEM04}">
					<div class="space5"></div>
					<p id="a04item" style="margin:3px;" class="<c:if test="${result.ITEMSEQ eq '4'}"> red </c:if>">
						4) <c:out value='${result.ITEM04}'/>&nbsp; (배점 : <c:out value='${result.ITEM04_VAL}'/>)</p>
				</c:if>
				<c:if test="${not empty result.ITEM05}">
					<div class="space5"></div>
					<p id="a05item" style="margin:3px;" class="<c:if test="${result.ITEMSEQ eq '5'}"> red </c:if>">
						5) <c:out value='${result.ITEM05}'/>&nbsp; (배점 : <c:out value='${result.ITEM05_VAL}'/>)</p>
				</c:if>
			</div>
			<div class="space"></div><!-- 공백 default 5px -->
		</c:if>
		
		<!-- 주관식 -->
		<c:if test="${result.MT_CPOLL_CODE == 'JBAA00'}">
			<div><strong><c:out value='${result.QNO}'/>. <c:out value='${result.SUBJECT}'/></strong></div>
			<div class="space"></div>
			<textarea title="서술형정답" name="answer<c:out value="${status.index}"/>" id="answer<c:out value="${status.index}"/>" rows="5" style="width:99%;"><c:out value="${result.ANSWER}" /></textarea>
			<div class="space"></div>
		</c:if>
	</c:forEach>
</c:if>
<c:if test="${empty resultList}">
	<div>설문에 참여하지 않았습니다.</div>
</c:if>
<div class="button">
	<a href="#" onclick="window.close()" class="btn big gray">닫기</a> 
</div>
</form>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>