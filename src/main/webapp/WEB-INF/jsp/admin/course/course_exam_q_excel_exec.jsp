<%
/****************************************************
	system	: 교육과정관리 > 과정정보관리
	title	: 최종평가 > 문제 엑셀일괄등록 실행
	summary	:	
	wdate	: 2016-06-07
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@page import="com.sangs.support.DataMap"%>
<script type="text/javascript">

	alert("처리가 완료되었습니다.");
	var courseno = '${REQUEST_DATA.courseno}';
	var secno = '${REQUEST_DATA.secno}';
	location.href="/admin/course/examQlist.do?courseno="+courseno+"&secno="+secno;

</script>
