<%
/****************************************************
	system	: 교육과정관리 > 과정정보관리
	title	: 최종평가 > 문제 삭제
	summary	:	
	wdate	: 2013-07-23
	writer	: 심위보
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@page import="com.sangs.support.DataMap"%>
<%
	DataMap requestMap = (DataMap)request.getAttribute("REQUEST_DATA"); 
	requestMap.setNullToInitialize(true);
%>
<script type="text/javascript">
	
	alert("삭제되었습니다.");
	location.href="class.do?subcmd=list&courseno=<%=requestMap.getInt("courseno")%>&secno=<%=requestMap.getInt("secno")%>";
	
</script>
