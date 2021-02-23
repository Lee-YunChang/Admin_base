<%
/****************************************************
    system	: 시스템관리 > 로그관리 > 접속로그 삭제 팝업
    title	: 로그 삭제 팝업
    summary	:
    wdate	: 2013-06-26
    writer	: sangs
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">
function goSubmit(){
	var form = document.pform;
	var confirmWin = window.confirm("선택한 연도의 로그를 삭제하겠습니까?\n 삭제 후 복구 할 수 없습니다.");
	if(confirmWin) {
		form.submit();
	}
}
</script>


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">접속로그삭제<span>로그는 연도단위로 일괄 삭제됩니다.</span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="accesslogDelExec.do" method="post">

<table class="tb table-type1">
	<colgroup>
		<col class="cellc" width="15%">
		<col class="cellc" width="15%">
		<col class="cellc" width="15%">	
	</colgroup>
	<tbody>
	<tr>
		<th>연도</th>
		<th>로그수</th>
		<th>인증구분</th>
	</tr>
	<c:if test="${fn:length(LIST_DATA) > 0}">
 		<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
			<tr align="middle"  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
				<td><c:out value="${result.ACCES_YEAR}" /></td>
				<td><c:out value="${result.CNT}" /></td>
				<td><input type="checkbox" name="accesYear" value="<c:out value="${result.ACCES_YEAR}" />" /></td>
			</tr> 
		</c:forEach>
    </c:if>
	</tbody>
</table>

<div class="button" >
	<a href="#" onclick="goSubmit(); return false;" class="btn orange big">삭제</a>  
	<a href="#" onclick="self.close();" class="btn gray big">취소</a>  
</div> 
</form>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>
