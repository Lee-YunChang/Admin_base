<%/****************************************************
	system	: 시스템관리 > SMS 템플릿관리 등록수정 폼
	title	: SMS 템플릿관리 등록수정 폼
	summary	:	
	wdate	: 2016-06-10
	writer	: 조남훈
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<form name="form" action="smsmanTplList.do" method="post">
	<input type="hidden" name="tplno" id="tplno" value="<c:out value="${tplno}" />"/>
	<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}"/>
</form>

<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript">


 var msg = "<c:out value="${msg}" />";
 if(msg != ''){
	 alert(msg);
 }
 
if($("#qu").val() == 'delete') {
	document.form.submit();
} else {
	opener.location.href = "/admin/sysman/smsmanTplList.do";
	 self.close();
} 


	
</script>