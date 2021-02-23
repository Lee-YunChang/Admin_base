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
   <input type="hidden" name="mtCgrpCode" id="mtCgrpCode" value="${REQUEST_DATA.mtCgrpCode}"/>
   <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="${REQUEST_DATA.mtCtypeCode}"/>
   <input type="hidden" name="seqTitle" id="seqTitle" value="${REQUEST_DATA.seqTitle}"/>
   <input type="hidden" name="mtCseqStatusCode" id="mtCseqStatusCode" value="${REQUEST_DATA.mtCseqStatusCode}"/>
   <input type="hidden" name="defaultSearch" id="defaultSearch" value="Y"/> 
</form>

<input type="hidden" name="msg" id="msg" value="${REQUEST_DATA.msg}"/>  

<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript">

	var msg = $("#msg").val();
	if(msg!=''||msg!=null){
		alert(msg);
	}
	document.form.submit();

	</script>
