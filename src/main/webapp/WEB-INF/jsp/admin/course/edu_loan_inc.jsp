<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:forEach var="result" items="${loans}" varStatus="status">
	<p><c:out value="${result.FND_USECD_NM}"/>/<c:out value="${result.GDNM}"/>/<c:out value="${result.FND_KND_NM}"/></p>
</c:forEach>