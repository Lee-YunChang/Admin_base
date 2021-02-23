<%
/****************************************************
	system	: 과정진행관리 > 수강생정보관리 탭
	title	: 과정진행관리 > 수강생정보관리 상세보기 공통 tab 메뉴
	summary	:	
	wdate	: 2016-05-11
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<div class="space5"></div>
<c:set var="paramMtCtypeCode"><c:out value="${REQUEST_DATA.mtCtypeCode}"/></c:set>
<c:set var="mtCtypeCode"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%></c:set>
<c:choose>
<c:when test="${result.MBER_GBN == 'USER'}"><c:set var="titleInfo">회원정보</c:set></c:when>
<c:otherwise><c:set var="titleInfo">비회원정보</c:set></c:otherwise>
</c:choose>
<table width=100% border=0 cellspacing=0 cellpadding=0 class="exp-tab">
	<colgroup>
		<col width="17%" />
		<col width="16%" />
		<col width="17%" />
		<col width="17%" />
		<col width="16%" />
		<col width="17%" />
	</colgroup>
	<tbody>
		<tr>
			<td class="header-tab user_view"><a href="#" onclick="fnTabMove('user_view', '/admin/study/cuserView.do');return false;">${titleInfo}</a></td>
			<c:if test="${paramMtCtypeCode == mtCtypeCode}">
				<td class="header-tab online_study"><a href="#" onclick="fnTabMove('online_study', '/admin/study/onlineStudyView.do');return false;">온라인학습</a>
			</c:if>		
		</tr>
	</tbody>
</table>
<script type="text/javascript">

	function fnTabMove(subcmd, url){
		var frm = document.pform;
		frm.subcmd.value = subcmd;
		$(".header-tab").each(function() {
			$(this).removeClass("on");
		});
		
		$("."+subcmd).each(function() {
			$(this).addClass("on");
			$(this).show("fast");
		});
		$("#pform").attr("action", url);
		frm.submit();
	}
</script>