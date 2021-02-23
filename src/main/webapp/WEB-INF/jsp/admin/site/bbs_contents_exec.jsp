<%
/****************************************************
	system	: 게시판 실행
	title	: 게시판 실행
	summary	:
	wdate	: 2016-04-18
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<form name="form" action="/admin/site/bbsContentsList.do" method="post">
 <input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
 <input type="hidden" name="execCheck" value="Y"/>
</form>
<script type="text/javascript">
	document.form.submit(); 
</script>
