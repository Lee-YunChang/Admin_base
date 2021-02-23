<%
/****************************************************
	system	: 수강생정보관리 > 삭제
	title	: 
	summary	:
	wdate	: 2016-05-12
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<form action="/admin/study/cuserList.do" name="frm" method="post">
	<input type="hidden" name="msg" id="msg" value="${REQUEST_DATA.msg}">
</form>

<script type="text/javascript">
	alert($("#msg").val());
	document.frm.submit();
</script>