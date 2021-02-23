<%
/****************************************************
	system	: 과정관리 > 과정차수관리 > 상태값 변경 실행
	title	: 상태값 변경 실행
	summary	:	
	wdate	: 2016-04-18
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.util.StringUtil" %>
<form name="form" action="/admin/course/seqList.do" method="post">
</form>
<script type="text/javascript">
 
	var msg= '${REQUEST_DATA.msg}';
	
 	if(msg != ''){
		alert(msg);
 	}
 	document.form.submit();
</script>