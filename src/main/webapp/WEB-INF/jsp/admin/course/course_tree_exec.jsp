<%
/****************************************************
	system	: 교육과정관리 > 과정정보관리
	title	: 교육과정 목차 등록/수정 실행 
	summary	:	
	wdate	: 2016-05-16
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@page import="com.sangs.support.DataMap"%>
<%@ page import = "com.sangs.util.StringUtil" %>
<form name="form" action="/admin/course/treeList.do" method="post" >
	  <input type="hidden" name="treeno" value="<c:out value="${REQUEST_DATA.treeno}"/>"/>
</form>

<script type="text/javascript">

	// alert("처리가 완료 되었습니다.");
	opener.location.reload(); // 부모창 새로고침
	window.close();

	document.form.submit(); 
	
</script>
