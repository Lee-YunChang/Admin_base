<%
/****************************************************
	system	: 교육과정관리 > 과정정보관리
	title	: 출제정책 등록/수정 실행 
	summary	:	
	wdate	: 2016-05-19
    writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.util.StringUtil" %>
<form name="form" action="/admin/course/examSecList.do" method="post" >
<input type="hidden" name="treeno" value="${REQUEST_DATA.secno}"/>
</form>

<script type="text/javascript">

	alert("처리가 완료 되었습니다.");
    opener.parentReload(); //부모창 새로고침
	document.form.submit(); 
	window.close();
</script>