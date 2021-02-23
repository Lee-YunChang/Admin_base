<%
/****************************************************
system	: 연간일정관리 실행
title	: 실행
summary	:
wdate	: 2017-02-15
writer	: 
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.util.StringUtil" %>
<form name="form" action="/admin/site/annualScheduleView.do" method="post">
	<input type="hidden" name="execCheck" value="Y"/>
</form>
<script type="text/javascript">

	document.form.submit(); 

</script>
