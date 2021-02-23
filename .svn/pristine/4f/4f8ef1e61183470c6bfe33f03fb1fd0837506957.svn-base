<%@ page language="java"  contentType="text/html;charset=UTF-8" %>
<%   
	// 뒤로가기 했을때 저장 안되게 캐쉬 삭제
	String userAgent = request.getHeader("user-agent");
	
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	
	if(userAgent.indexOf("MSIE") > -1){ // internet explorer
		response.setHeader("Cache-Control", "no-cache");
	}else if(userAgent.indexOf("Firefox") > -1){ // firefox
		response.setHeader("Cache-Control","no-store");
	}else if(userAgent.indexOf("Chrome") > -1){ // chrome
		response.setHeader("Cache-Control","no-store");
	}else{ // other browser
		response.setHeader("Cache-Control","no-cache");
	}
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="autocomplete" content="off" />
	<title></title>

	<script type="text/javascript" src="<c:out value='/classdesk/common/js/jquery-1.8.2.js'/>"></script>

<script type="text/javascript">
//<![CDATA[
<c:if test="${not empty pageContext.exception.message}">
    // 에러 처리
	alert("error!!!");
	alert('${pageContext.exception.message}');
</c:if>

<c:if test="${empty pageContext.exception.message}">
$(function() {
	<c:if test="${empty REQUEST_DATA.rType || REQUEST_DATA.rType == 'alert'}">
	    <c:if test="${empty REQUEST_DATA.rMsg}">
	    submitAfterRedirectFunc();
	    </c:if>
	    
	    <c:if test="${!empty REQUEST_DATA.rMsg}">
			alert('${REQUEST_DATA.rMsg}');
			submitAfterRedirectFunc();
		</c:if>
	</c:if>
	});
	
	<c:if test="${empty REQUEST_DATA.rType || REQUEST_DATA.rType == 'alert'}">
	function submitAfterRedirectFunc() {
		<c:if test="${not empty REQUEST_DATA.rForm}">
		$('#' + '${fn:split(REQUEST_DATA.rForm,"|")[0]}', parent.document)
		.attr('target', '_self')
		.attr('action', '<c:out value='/${fn:split(REQUEST_DATA.rForm,"|")[1]}'/>').submit();
		</c:if>
	
		<c:if test="${not empty REQUEST_DATA.rScript}">
		parent.eval("${REQUEST_DATA.rScript}");
		return;
		</c:if>
		
		<c:if test="${not empty REQUEST_DATA.rUrl}">
		parent.location.href = '${REQUEST_DATA.rUrl}';
		</c:if>
	}
	</c:if>
</c:if>
//]]>
</script>
</head>
<body></body>
</html>