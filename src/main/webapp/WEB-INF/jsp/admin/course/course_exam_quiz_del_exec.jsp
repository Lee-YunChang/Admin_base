<%
/****************************************************
	system	: 교육과정관리 > 과정정보관리
	title	: 최종평가 > 문제 삭제
	summary	:	
	wdate	: 2016-05-19
    writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.util.StringUtil" %>
<%@ page import="com.sangs.util.ParamUtil"%>

<form name="form" action="/admin/course/examQlist.do" method="post">
<input type="hidden" name="courseno" value="${REQUEST_DATA.courseno}"/>
<input type="hidden" name="secno" value="${REQUEST_DATA.secno}"/>	   
</form>

<script type="text/javascript">
	document.form.submit(); 
</script>

