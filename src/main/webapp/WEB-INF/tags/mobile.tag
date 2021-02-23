<%@ tag body-content="scriptless" pageEncoding="utf-8" description="tag utils option" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ attribute name="selected" type="java.lang.String" rtexprvalue="true" %>

	<option value="010" <c:if test="${'010' eq selected}">selected="selected"</c:if>>010</option>
	<option value="011" <c:if test="${'011' eq selected}">selected="selected"</c:if>>011</option>
	<option value="016" <c:if test="${'016' eq selected}">selected="selected"</c:if>>016</option>
	<option value="017" <c:if test="${'017' eq selected}">selected="selected"</c:if>>017</option>
	<option value="018" <c:if test="${'018' eq selected}">selected="selected"</c:if>>018</option>
	<option value="019" <c:if test="${'019' eq selected}">selected="selected"</c:if>>019</option>	



