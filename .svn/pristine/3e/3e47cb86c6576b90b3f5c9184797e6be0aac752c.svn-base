<%
/****************************************************
system	: 클레스데스크 팝업창 호출
title	: 클레스데스크 팝업창 호출
summary	:
wdate	: 2016-08-08
writer	: 구동림
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>

<form id="form" name="form" method="post" action="/classdeskAdm/defaultAuth.do">
	<input type="hidden" name="paramCourseNo" id="courseNo" value="${REQUEST_DATA.paramCourseNo}"/>
	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="${REQUEST_DATA.paramcSeqNo}"/>
	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="${REQUEST_DATA.paramcUserNo}"/> 
	<input type="hidden" name="paramSessionId" id="paramSessionId" value="${REQUEST_DATA.paramSessionId}"/>
	<input type="hidden" name="paramUserNo" id="paramUserNo" value="${REQUEST_DATA.paramUserNo}"/>
</form>

<script type="text/javascript">
	$(document).ready(function(){
		$("#form").submit();
	});
</script>