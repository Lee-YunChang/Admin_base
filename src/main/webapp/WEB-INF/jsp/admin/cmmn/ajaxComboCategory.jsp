<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<option value="">선택</option>
<c:forEach var="item" items="${resultList}" varStatus="status">
	<option value="${item.MT_SUB_CODE}" <c:if test="${REQUEST_DATA.mtSubCode eq item.MT_SUB_CODE}">selected="selected"</c:if>>${item.MT_SUB_NAME}</option>
</c:forEach>