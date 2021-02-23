<%
/****************************************
	subject	: [웹페이지] 로그인
	summary	: 로그인 실행 
    wdate   : 2015-04-01
    writer  : SANGS
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<SCRIPT LANGUAGE="JavaScript">
if('<c:out value="${REQUEST_DATA.msg}"/>' != '') {
	alert('<c:out value="${REQUEST_DATA.msg}"/>');
}

location.href='<c:out value="${REQUEST_DATA.returnURL}"/>'; 
</SCRIPT>