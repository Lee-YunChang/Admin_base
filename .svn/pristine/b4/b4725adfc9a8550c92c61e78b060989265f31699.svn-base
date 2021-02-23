<%@ tag body-content="scriptless" pageEncoding="utf-8" description="tag utils option" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="items" type="java.util.List" rtexprvalue="true" required="true" %>
<%@ attribute name="selected" type="java.lang.String" rtexprvalue="true" %>

<c:if test="${not empty items}">
	<c:forEach items="${items}" var="item">
		<option value="${item.KEY}" <c:if test="${item.KEY eq selected}">selected="selected"</c:if>>${item.VALUE}</option>
	</c:forEach>
</c:if>
