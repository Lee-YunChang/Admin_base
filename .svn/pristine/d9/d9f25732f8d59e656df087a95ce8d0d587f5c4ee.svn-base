<%--
	Description : 
	 
	Modification Information
	수정일		수정자			수정내용
	-------		-----------------------------------
	2015.04.01 	SANGS			최초작성

--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<title>시스템 메시지</title>
<script type="text/javascript">
//<![CDATA[


 	if('<c:out value="${msg}"/>' != '') {
 		alert( ( ('<c:out value="${msg}"/>').replace('<br/>', '\n') ).replace('&lt;br&gt;', '\n')  );
 	}
 	
	
	if('<c:out value="${type}"/>' == 'POP') {
		if('<c:out value="${url}" escapeXml='false' />' != '') {
			opener.location.href = '<c:out value="${url}" escapeXml='false' />';
		}  			
		self.close();
	} else if('<c:out value="${type}"/>' == 'POP_JS') {
		if('<c:out value="${js}" escapeXml='false' />' != '') {
			eval('<c:out value="${js}"/>');
		}  			
		self.close();
	} else if('<c:out value="${type}" escapeXml='false' />' == 'PARENT') {
		parent.location.href = '<c:out value="${url}" escapeXml='false' />';
	} else {
		if('<c:out value="${url}" escapeXml='false' />' != '') {
			location.href = '<c:out value="${url}" escapeXml='false' />';
		}
	}
//]]>
</script>


</head>
<body >
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
 
 
</body>
</html>

