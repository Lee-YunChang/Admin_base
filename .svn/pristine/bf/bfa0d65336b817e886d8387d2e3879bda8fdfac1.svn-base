<%@ tag body-content="scriptless" pageEncoding="utf-8" description="tag utils option" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ attribute name="selected" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="maxNumber" type="java.lang.String" rtexprvalue="true" required="true" %>

<c:choose>
	<c:when test="${maxNumber eq '24'}">
		<c:forEach begin="1" end="24" var="x">
			<c:if test="${x < 10 }"><c:set value="0" var="beginIndex"/></c:if>
			<option value="<c:if test="${x < 10}">0</c:if>${x}" ><c:if test="${x < 10}">0</c:if>${x}</option>
		</c:forEach>
	</c:when>

	<c:when test="${maxNumber eq '60'}">
		<c:forEach begin="0" end="59" var="x">
			<c:if test="${x < 10 }"><c:set value="0" var="beginIndex"/></c:if>
			<option value="<c:if test="${x < 10}">0</c:if>${x}" ><c:if test="${x < 10}">0</c:if>${x}</option>
		</c:forEach>
	</c:when>
</c:choose>



