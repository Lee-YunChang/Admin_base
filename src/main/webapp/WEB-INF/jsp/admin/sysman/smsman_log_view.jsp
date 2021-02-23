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
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	var text = $("#smsbody").val();
	$("#msglen").val(text.length);
});
</script>


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">발송상세정보<span> </span></div>
 

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" action="user.do" method="post" enctype="multipart/form-data">
 <input type="hidden" name="subcmd" id="subcmd" value="exec"/>  
  <table class="table-type1 search_form">
	  <colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
 		</colgroup>
		<tbody>
		<tr>
			<th>보낸사람 연락처</th>
			<td><c:out value="${VIEW_DATA.CALLBACK}" /></td>
		</tr>
		<tr>
			<th>받는사람 연락처</th>
			<td><c:out value="${VIEW_DATA.REC_HP}" /></td>
		</tr>
		<tr>	
			<th>SMS UID</th>
			<td><c:out value="${VIEW_DATA.TPL_UID}" /></td> 
		</tr> 
		<tr>
			<th>발송여부</th>
			<td><c:out value="${VIEW_DATA.STATUS}" /></td>
		</tr> 
		<tr>
			<th>발송일시</th>
			<td><c:out value="${VIEW_DATA.SEND_DATE}" /></td> 
		</tr>   
		</tbody>
	</table>
	
		<div class="space"></div> 
	 
	 			<!--sms 시작-->
					<table border=0 cellspacing=0 cellpadding=0 width="232" align="center" style="margin:0 auto;">
					<tr>
						<td background="/admin/images/etc/sms_bg.gif" width="232" height="284" align="center" valign="top" class="sms_box">
						<!--화면 시작-->
							<!--SMS 시작-->
							<textarea id="smsbody" name="smsbody" class="screen" onkeyup=MsgSmsLenCheck(); readonly="true"> <c:out value="${VIEW_DATA.SUMMARY}" /> </textarea>
							<div class="bytes"><input class="input3" readOnly maxLength="3" size="3" value="0" id="msglen" name="msglen"/> <span>bytes</span></div>
						<!--화면 끝-->
						</td>
					</tr>
					</table>
				<!--sms 끝-->
				
 
 
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->

<div class="space"></div>
<!-- 공백 default 20px -->


<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>

