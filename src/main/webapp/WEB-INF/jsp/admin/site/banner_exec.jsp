<%
/****************************************************
system	: 배너 등록 수정 실행
title	: 실행
summary	:
wdate	: 2016-09-08
writer	: 황두은
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.util.StringUtil" %>
<form name="form" action="/admin/site/bannerList.do" method="post">
	<input type="hidden" name="bannerno" id="bannerno" value="${REQUEST_DATA.bannerno}"/>
	<input type="hidden" name="execCheck" value="Y"/>
</form>
<script type="text/javascript">

	document.form.submit(); 

</script>
