<%
/****************************************************
system	: 팝업 등록 수정 실행
title	: 실행
summary	:
wdate	: 2016-05-16
writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.util.StringUtil" %>
<form name="form" action="/admin/site/popupList.do" method="post">
	<input type="hidden" name="popNo" id="popNo" value="${REQUEST_DATA.popNo}"/>
	<input type="hidden" name="execCheck" value="Y"/>
</form>
<script type="text/javascript">

	document.form.submit(); 

</script>
