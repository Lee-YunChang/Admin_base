<%@ tag pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="value" type="java.lang.String" rtexprvalue="true" %>
<!-- 수강 상태 -->
<c:choose>
    <c:when test="${value eq '1'}"><strong class="ad_txt_orange">수강중</strong></c:when>
    <c:when test="${value eq '2'}"><strong class="ad_txt_aqua">접수완료</strong></c:when>
    <c:when test="${value eq '3'}"><strong class="ad_txt_purple">종료</strong></c:when>
    <c:when test="${value eq '4'}"><strong class="ad_txt_red">폐강</strong></c:when>
    <c:when test="${value eq '5'}"><strong class="ad_txt_aqua">대상자선정</strong></c:when>
    <c:when test="${value eq '6'}"><strong class="ad_txt_aqua">입금완료</strong></c:when>
    <c:when test="${value eq '7'}"><strong class="ad_txt_aqua">대상자미선정</strong></c:when>
    <c:when test="${value eq '8'}"><strong class="ad_txt_aqua">수료</strong></c:when>
    <c:when test="${value eq '9'}"><strong class="ad_txt_aqua">미수료</strong></c:when>
    <c:when test="${value eq '10'}"><strong class="ad_txt_aqua">대상자선정중</strong></c:when>
    <c:otherwise>-</c:otherwise>
</c:choose>