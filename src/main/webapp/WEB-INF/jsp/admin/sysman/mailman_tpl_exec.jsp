<%/****************************************************
	system	: 시스템관리 > 메일 템플릿관리 등록수정 실행
	title	: 메일 템플릿관리 등록수정 실행
	summary	:	
	wdate	: 2016-06-09
	writer	: 조남훈
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>

<form name="form" action="mailmanTplList.do" method="post">
   <input type="hidden" name="qu" id="qu" value="<c:out value="${qu}" />"/>
   <input type="hidden" name="tplno" id="tplno" value="<c:out value="${tplno}" />"/>
</form>
<script type="text/javascript">
 
 var msg="<c:out value="${msg}" />";
 if(msg != ''){
	 alert(msg);
 }

 document.form.submit();

</script>
