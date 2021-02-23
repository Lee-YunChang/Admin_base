<%/****************************************************
	system	: 시스템관리 > 메일 템플릿관리 등록수정 폼 팝업
	title	: SMS 템플릿관리 등록수정 폼 팝업
	summary	:	
	wdate	: 2016-06-10
	writer	: 조남훈
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<!-- 변수 setting -->
<c:if test="${REQUEST_DATA.pageMode == 'reg'}">
	<c:set var="titleMode" value="등록" /> 
</c:if>
<c:if test="${REQUEST_DATA.pageMode == 'mod'}"> 
	<c:set var="titleMode" value="수정" />
</c:if>

<!-- sms관련 js호출 -->
<script type="text/javascript" src="/resource/js/message.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    
	$("input:text[numberOnly]").live("keyup", function() {
        $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
    });
    
	var text = $("#smsbody").val();
	$("#msglen").val(text.length);
    
});
	function writeFormCheck(){

 	var form = document.smsform; 
   		if (form.tplname.value == ''){
 			alert("템플릿명을 입력하세요!"); 
 			form.tplname.focus();
 		} else if (form.tplUid.value == ''){
 			alert("탬플릿 UID를 입력하세요."); 
 			form.tplUid.focus();
 		} else if (form.useyn.value == ''){
 			alert("사용여부를 선택하세요."); 
 		}  else if (form.smsbody.value == ''){
 			alert("내용을 입력하세요!"); 
 			form.smsbody.focus();
 		} else { 
 			 var submitWin = window.confirm('<c:out value="${titleMode}" />하시겠습니까?');
 			if (submitWin){
 				form.submit();
 			} 
 		}
	}

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">SMS탬플릿 <c:out value="${titleMode}" /></div>

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
</table>
<div class="space"></div> -->

<!-- 본문 > 상단 > 안내문구 끝 --> 
 
<!-- 본문 > 메인 > 목록 시작  -->
<form name="smsform" action="smsmanTplExec.do" method="post">	 
	<input type="hidden" name="tplno"			id="tplno"				value="<c:out value="${REQUEST_DATA.tplno}" />"/>	 
  	<table class="table-type1 search_form">
	  <colgroup>
		<col class="cellc" width="15%">
		<col class="celll" width="85%">
		
		</colgroup><tbody>
		<tr>
			<th>탬플릿명</th>
			<td colspan="3"><input type="text" class="line" id="tplname" name="tplname" style="width:100%" title="탬플릿명" value="<c:out value="${VIEW_DATA.TPLNAME}" />"/>  </td>
		</tr> 
	  	<tr>
			<th>사용여부</th>
			<td colspan="3">
 			  	<input type="radio" name="useyn" value="Y" <c:if test="${VIEW_DATA.USEYN == 'Y' || VIEW_DATA.USEYN == ''}">checked="checked" </c:if>style="border:0px" checked/> 사용  &nbsp;
			  	<input type="radio" name="useyn" value="N" <c:if test="${VIEW_DATA.USEYN == 'N'}">checked="checked" </c:if>style="border:0px"/> 미사용  
 			</td>
		</tr>
		<tr>
			<th>탬플릿UID</th>
			<td colspan="3">
				<input type="text" class="line" id="tplUid" name="tplUid" style="width:100%" title="탬플릿명" value="<c:out value="${VIEW_DATA.TPL_UID}" />"numberonly="true" maxlength="10"/>  
				<font class=extext>숫자만 입력 가능 합니다.(최대 10자리)</font>
			</td>
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
							<textarea id="smsbody" name="smsbody" class="screen" onkeyup=MsgSmsLenCheck();><c:out value="${VIEW_DATA.CONTENT}" /></textarea>
							<div class="bytes"><input class="input3" readOnly maxLength="3" size="3" value="0" id="msglen" name="msglen"/> <span>bytes</span></div>
						<!--화면 끝-->
						</td>
					</tr>
					</table>
				<!--sms 끝-->

 
	 
	<div class="button">
		<c:if test="${REQUEST_DATA.pageMode == 'reg'}">
			<a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a> 
		</c:if>
		<c:if test="${REQUEST_DATA.pageMode == 'mod'}"> 
			<a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
		</c:if>
		<a href="#" onclick="self.close();" class="btn gray big">취소</a>
	</div>
</form> 


<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>

