<%
/****************************************************
system	: 게시판 실행
title	: 게시판 실행
summary	:
wdate	: 2013-07-09
writer	: 심위보
*****************************************************/
%>
<%@page contentType = "text/html; charset=UTF-8" %>
<%@page import="com.sangs.support.DataMap"%>
<%@page import="com.sangs.util.StringUtil" %>
<%
	DataMap requestMap = (DataMap)request.getAttribute("REQUEST_DATA"); 
	requestMap.setNullToInitialize(true);

	//int cPage = requestMap.getInt("cPage");
	int pbcateno = requestMap.getInt("pbcateno");
	String subcmd = "";
	
	if(requestMap.getString("qu").equals("cmtIns") || requestMap.getString("qu").equals("cmtDel")){
		subcmd = "view";
	}else{
		subcmd = "list";
	}
%>
<form name="form" action="bbs.do" method="post">
	   <input type="hidden" name="pbcateno" id="pbcateno" value="<%=pbcateno %>"/>
	   <input type="hidden" name="bbsNo" id="bbsNo" value="<%=requestMap.getInt("bbsNo") %>"/>
	   <input type="hidden" name="courseno" id="courseno" value="<%=requestMap.getInt("courseno") %>"/>
	   <input type="hidden" name="execCheck" value="Y"/>
	   <input type="hidden" name="subcmd" id="subcmd" value=""/>
</form>
<script type="text/javascript">

	document.form.subcmd.value = "<%=StringUtil.getContent(subcmd)%>";
	document.form.submit(); 

</script>
