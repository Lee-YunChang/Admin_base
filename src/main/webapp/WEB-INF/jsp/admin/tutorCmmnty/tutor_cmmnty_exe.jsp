<%
/****************************************************
    system  : 시스템관리 > 공통코드 등록 실행
    title   : 공통 코드 목록 조회
    summary :
    wdate   : 2016-05-16
    writer  : sangs
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>

<form name="form" id="form" action="" method="post">
<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
<input type="hidden" name="useAt" id="useAt" value="${REQUEST_DATA.useAt}">
<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}">
</form>

<script type="text/javascript">

	alert('<c:out value="${msg}"/>');
	$("#form").attr('action', '<c:out value="${returnUrl}" />');
	$("#form").submit();
	
</script>