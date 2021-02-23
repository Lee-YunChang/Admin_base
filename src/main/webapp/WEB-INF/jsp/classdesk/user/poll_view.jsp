<%
/****************************************
	system	: ClassDesk > 수강생 > 설문
	title	: 설문 보기
	summary	:	
	wdate	: 2015-04-01
    writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<div style="padding-top: 10px; padding-bottom: 10px;" align="center"><h2> <c:out value="${listData[0].TITLE}"/>  </h2></div>
	
	<div class="round-box-small blue mg-t18 clearfix" style="text-align:center;line-height:200%;font-weight:bold;">
		<form id="markingForm" name="markingForm" action="<c:out value="${ctx}"/>/classdesk/user/poll.do">
		    설문 제출을 완료 하였습니다.
		</form>
	</div>
	<!-- //시험문제 -->
	<!-- 게시판 버튼영역 -->
	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	<!--
		
	//-->
	</script>

