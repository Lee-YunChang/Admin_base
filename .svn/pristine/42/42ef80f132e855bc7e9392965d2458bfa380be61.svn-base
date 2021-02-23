<%/****************************************************
	system	: 시스템관리 > 메일 템플릿관리 등록수정 폼
	title	: 메일 템플릿관리 등록수정 폼
	summary	:	
	wdate	: 2016-06-09
	writer	: 조남훈
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>


<script type="text/javascript">

$(document).ready(function() {
	$(".mailcontent th").css("color", "#333");
});


// 목록이동
function goList(){
 	
	var form = document.pform; 
  	form.submit();
}
</script>


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">메일발송관리<span> </span></div>

<!-- 본문 > 상단 > 안내문구 시작 -->
<!-- <table width="100%" class="tb_Message"> 
	<tbody>
		<tr>
			<td
				style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
			<div style="padding-top: 5px"><b>※ 설명내용을 입력합니다.</b></div>
			<div style="padding-top: 7px"><font class=g9 color=#666666>설명내용을 입력합니다.</font></div>
			</td>
		</tr>
	</tbody>
</table> 
<div class="space"></div>-->
<!-- 본문 > 상단 > 안내문구 끝 -->

<table width="100%">
  <tbody>
	<tr>
 		<td align="right">
 			<a href="#" onclick="goList();" class="btn orange">목록</a>
		</td>
	</tr>
  </tbody>
</table>
<table width="100%">
  <tbody>
	<tr>
		<td class="pageinfo"><b>보내는이 정보</b> </td>
		<td align="right"></td>
	</tr>
  </tbody>
</table>
 <!-- 공백 default 20px --> 

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="mailmanLogList.do" method="post"  >
	<input type="hidden" name="cPage"			id="cPage"			value="<c:out value="${REQUEST_DATA.cPage}" />"/>
	<input type="hidden" name="sdate"			id="sdate"			value="<c:out value="${REQUEST_DATA.sdate}" />"/>
	<input type="hidden" name="edate"			id="edate"			value="<c:out value="${REQUEST_DATA.edate}" />"/>
	<input type="hidden" name="searchWord"	id="searchWord"		value="<c:out value="${REQUEST_DATA.searchWord}" />"/>
	<input type="hidden" name="searchMode"	id="searchMode"		value="<c:out value="${REQUEST_DATA.searchMode}" />"/>
</form>
  <table class="table-type1 search_form">
	  <colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
		</colgroup>
		<tbody>
		<tr>
			<th>아이디</th>
			<td><c:out value="${VIEW_DATA.WRITER_USERID}" /></td>
			<th>성명</th>
			<td><c:out value="${VIEW_DATA.WRITER_USERNAME}" /></td> 
		</tr> 
	  	<tr>
			<th>이메일</th>
			<td><c:out value="${VIEW_DATA.SENDER_EMAIL}" /></td>
			<th>템플릿UID</th>
			<td><c:out value="${VIEW_DATA.TPL_UID}" /></td> 
		</tr> 
		<tr>
			<th>발송 일자</th>
			<td><c:out value="${VIEW_DATA.SEND_DATE}" /></td>
			<th>발송 여부</th>
			<td><c:out value="${VIEW_DATA.SUCCCYN}" /></td> 
		</tr> 
		</tbody>
	</table>
	
<div class="space"></div> 
<table width="100%">
  <tbody>
	<tr>
		<td class="pageinfo"><b>받는사람 정보</b> </td>
		<td align="right"> 
   	</td>
	</tr>
  </tbody>
</table>

	<table class="table-type1 search_form" style="table-layout:fixed;">
	  	<colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
		</colgroup>
		
		<tbody>
			<tr>
				<th>아이디</th>
				<td><c:out value="${VIEW_DATA.REC_USERID}" /></td>
				<th>성명</th>
				<td><c:out value="${VIEW_DATA.REC_USERNAME}" /></td> 
			</tr> 
		  	<tr>
				<th>제목</th>
				<td><c:out value="${VIEW_DATA.TITLE}" /></td>
				<th>이메일</th>
				<td><c:out value="${VIEW_DATA.REC_EMAIL}" /></td> 
			</tr> 
			<tr>
				<th>내용</th>
				<td colspan="3" class="mailcontent" style="width:85%; padding:20px 10px 20px 10px;"> <c:out value="${VIEW_DATA.SUMMARY}" escapeXml="false" /> </td>    
			</tr> 
		</tbody>
	</table>
 <!-- 본문 > 상단 > 검색영역 끝 -->

<div class="space"></div>
<!-- 공백 default 20px -->


