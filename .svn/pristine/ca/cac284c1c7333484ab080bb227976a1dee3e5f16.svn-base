<%
/****************************************************
	system	: 교육이력
	title	: 교육이력
	summary	: 
	wdate	: 2016-05-16
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">
// 수료증 발급
function fnPassPrint(mtCtypeCode, cuserNo, userNo,sdate,edate){
	
	var w1 =1070;
	var h1 = 900;
	var url = "";
	if(mtCtypeCode == "<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%>"){
		url = "/admin/study/cerOfflinePrint.do";
	}
	else {
		url = "/admin/study/cerOnlinePrint.do";
	}
	
	$("#sdate").val(sdate);
	$("#edate").val(edate);
	$("#pform").attr("target", "");
	$("#pform > input[name='userNo']").val(userNo);  
	$("#pform > input[name='cuserNo']").val(cuserNo);
	
	window.open( url+"?"+$("#pform").serialize()
		,"cert_pop","width="+w1+" height="+h1+", top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no");
}

</script>
 
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">개인별 교육이수현황</div>
<form name="pform" id="pform" action="/admin/user/userStudyList.do" method="post">
<input type="hidden" id="sdate" name="sdate" value=""/>
<input type="hidden" id="edate" name="edate" value=""/>
<input type="hidden" id="userNo" name="userNo" value=""/>
<input type="hidden" id="cuserNo" name="cuserNo" value=""/>

  	<table class="table-type1 search_form" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
		<colgroup>
			<col align=middle width="8%">
			<col align=middle width="12%">
			<col align=middle width="30%">
		  	<col align=middle width="28%">
		  	<col align=middle width="10%">
		  	<col align=middle width="12%">  
		</colgroup>
		<tr class="rndbg">
			<th>NO</th>
			<th>구분</th>
			<th>과정명</th>
			<th>학습기간</th>
			<th>이수여부</th>
			<th>수료증</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
			<td><c:out value='${resultList[0].TOTAL_CNT - status.count+1}'/></td>
			<td><c:out value="${result.MT_CTYPE_NAME}"/></td>
			<td align="left"><c:out value="${result.SEQ_TITLE}"/></td>
			<td>
				<c:if test="${result.MT_CTYPE_CODE == 'DAAA00'}"><c:out value="${result.STARTDATE}"/>~<c:out value="${result.ENDDATE}"/></c:if>
				<c:if test="${result.MT_CTYPE_CODE == 'DAAA01'}"><c:out value="${result.WDATE}"/></c:if>
			</td>
			<td>
				<c:if test="${result.ISPASS eq 'Y'}">수료</c:if>
				<c:if test="${result.ISPASS ne 'Y'}">미수료</c:if>
			</td>
			<td>
				<c:if test="${result.ISPASS eq 'Y'}">
				<a href="#" onclick="fnPassPrint('<c:out value="${result.MT_CTYPE_CODE}"/>', '<c:out value="${result.CUSERNO}"/>', '<c:out value="${result.USERNO}"/>','<c:out value="${result.STARTDATE}"/>','<c:out value="${result.ENDDATE}"/>'); return false;" class="btn brown">수료증</a>
				</c:if>
			</td>  
		</tr> 
		</c:forEach>
</table>
<div class="button">
	<a href="#" onclick="self.close();" class="btn big gray">닫기</a>
</div>
</form> 
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	