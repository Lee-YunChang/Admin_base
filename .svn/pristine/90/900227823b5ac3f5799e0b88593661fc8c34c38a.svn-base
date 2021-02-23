<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>

<c:set var="req" value="${pageContext.request}"/>

<script type="text/javascript" src="<c:out value='/academy/common/js/jquery-1.8.2.js'/>"></script>

<script type="text/javascript">
    $().ready(function(){
        if ('<c:out value="${REQUEST_DATA.icMsg}"/>') {
            alert('<c:out value="${REQUEST_DATA.icMsg}"/>');
        }
        
        $('#loginForm').submit();
    });
</script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>알림메세지</title>
<link rel="stylesheet" type="text/css" href="/common/css/error.css" />
</head>
<body>
    
    <form name="loginForm" id="loginForm" action="/classdesk/cmmn/login.do" target="_self">
        <input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
    </form>

</body>
</html>


