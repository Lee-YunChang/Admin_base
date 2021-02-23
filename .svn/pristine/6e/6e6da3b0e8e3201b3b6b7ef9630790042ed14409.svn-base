<%
/****************************************************
	system	: 시스템관리 > 메일발송관리 > 메일 템플릿 목록
	title		: 메일 템플릿 목록
	summary	:	
	wdate		: 2016-06-09
	writer	: 조남훈
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	//삭제
	function fndelete(tno){ 
		if(confirm('삭제하시겠습니까?')){
			var form = document.listform;
			form.tplno.value = tno;
			$("#listform").attr("action", "/admin/sysman/mailDeleteExec.do");
			form.submit();	
		}
	}
	// 상세보기
	function goDetail(tno){ 
		var form = document.listform;

		form.tplno.value = tno;
	 	form.qu.value = "update";
	 	form.pageMode.value= "<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_MOD"))%>";
		form.submit();
	}
	
	//등록
	function goInsert(){
		var form = document.listform; 
		form.tplno.value="0";
		form.qu.value="insert";
		form.pageMode.value= "<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_REG"))%>";
		form.submit(); 
	}
	 
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">메일탬플릿 관리<span></span></div>

<!-- 본문 > 상단 > 안내문구 시작 -->
<!-- <table width="100%" class="tb_Message">
	<tbody>
	<tr>
		<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
			<div style="padding-top: 5px"><b>※  </b></div>
			<div style="padding-top: 5px"><b>※  </b></div>
		</td>
	</tr>
	</tbody>
</table> -->
<!-- 본문 > 상단 > 안내문구 끝 -->
<!-- <div class="space"></div>공백 default 20px -->

<!-- 본문 > 메인 > 목록 시작  -->
<form name="listform" id="listform" action="mailman.do" method="post"  >
	<input type="hidden" name="qu" id="qu" value=""/>
	<input type="hidden" name="tplno" id="tplno" value=""/>
	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<!-- 서브카테고리 여부 --> 
</form> 
 
<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
	<tr>
		<td class="pageinfo">조회건수 <span class="red"><c:out value="${fn:length(LIST_DATA)}" /></span> 건</td>

		<td align=right> 
			<a href="#" onclick="goInsert('insert');" class="btn blue">등록</a>
  	</td>
	</tr>
  </tbody>
</table>

<!-- 본문 > 메인 > 서브   영역 끝 -->
<table class="tb table-type1">
	<tr class="rndbg">
		<th>NO</th>
		<th>탬플릿명</th>
		<th>템플릿UID</th>
		<th>사용여부</th>
		<th>-</th>
	</tr>
	<colgroup>
		<col align=middle width="4%">
		<col align=middle width="*">
		<col align=middle width="10%">
		<col align=middle width="8%">
		<col align=middle width="10%">
	</colgroup>
	
	<c:if test="${fn:length(LIST_DATA) > 0}">
    	<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
			<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
				<td><%//no--%><c:out value="${result.NUM}" /></td>
				<td align="left"><a href="#" onclick="goDetail('<c:out value="${result.TPLNO}" />');return false;"><c:out value="${result.TPLNAME}" /></a> </td>
				<td><c:out value="${result.TPL_UID}" /></td>
				<td><c:if test="${result.USEYN eq 'Y'}">사용</c:if><c:if test="${result.USEYN eq 'N'}">미사용</c:if></td>
				<td>
					<a href="#" onclick="goDetail('<c:out value="${result.TPLNO}" />');return false;" class="btn green small">수정</a>
					<a href="#" onclick="fndelete('<c:out value="${result.TPLNO}" />');return false;" class="btn orange small">삭제</a>
				</td>
			</tr> 
		</c:forEach>
    </c:if>

</table>
<!-- 본문 > 메인 > 목록 끝 -->