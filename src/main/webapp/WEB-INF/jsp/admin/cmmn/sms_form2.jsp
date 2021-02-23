<%
/****************************************
subject	: [관리시스템] SMS 발송양식(과정관리 > 과정운영관리 > 진행관리)
summary	: 

	발송파라메터규칙
	----------------------------------------------------------
	parameter name = sms_user
	parameter vlaue = userid / username / email / mobile

	※ 값이 없을 경우 -로 전달되어야함.

	ex) ?sms_user=test/테스트/aaa@aaa.com/01012341234

****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_pop_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/calendar.js"></script>
<style type="text/css">
<!--
.input3 { width:20px; BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BACKGROUND: none; BORDER-BOTTOM-WIDTH: 0px; TEXT-ALIGN: right; BORDER-RIGHT-WIDTH: 0px; SOLID: color:#808080; font-size: 8pt; }
textarea   { font-family: "돋움, 돋움체, Verdana"; BACKGROUND-COLOR: #FFFFFF; BORDER-BOTTOM: #808080 1px solid; BORDER-LEFT: #808080 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: #808080 1px solid; COLOR: #000000; FONT-SIZE: 9pt; padding:5 0 5 5}
.screen  { 
	width:150px; height:100px;
	font-family: "돋움, 돋움체, Verdana"; SCROLLBAR-FACE-COLOR: #86C3EC; BACKGROUND: NONE; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #1E81C4; SCROLLBAR-3DLIGHT-COLOR: #1E81C4; SCROLLBAR-ARROW-COLOR: #1E81C4; SCROLLBAR-TRACK-COLOR: #86C3EC; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; border:#1E81C4 0px solid; FONT-SIZE: 9pt;}
//-->
</style>

<script type="text/javascript" >
//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.

var dateFormat={
	 dayNamesMin:['일','월','화','수','목','금','토'],
	 monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	 showMonthAfterYear: true, //연월 순서로 보여줌
	 changeMonth: true, //월을 셀렉트박스로 표현
	 changeYear: true, //년을 셀렉트박스로 표현
	 dateFormat: "yy-mm-dd"
};	

$(document).ready(function(){
	$("#set_senddate").datepicker(dateFormat);
	
	//수신자 목록에 번호만 입력되도록
	$('option[name="mobile"]').each(function () {
		var str = $(this).text();
		var newStr = str.replace(/-/g, "");
		$(this).text(newStr.trim());
	});
	 
	$('#recnt').bind('DOMNodeInserted DOMSubtreeModified DOMNodeRemoved', function() {
		document.all("applyUserCnt").innerHTML = document.all("recnt").innerHTML;
	});
	  
 });
 
 
 function fnSmsSubmit(){
	var list = document.smsform.receiver_list;
	var form = document.smsform; 
	if($("#callback").val().trim().length < 1){alert("발송번호를 입력하세요!");$("#callback").focus();return false;} 
	if (form.smsbody.value =="") { alert("문자내용을 입력하세요!");form.smsbody.focus();return false;}
	var text = $('#smsbody').val();
 	if(text.indexOf('%') != -1) {alert('% 기호는 사용하실 수 없습니다. 한글로 대체하여 주세요.');return false;}
	if( isNaN($("#callback").val()) == true){alert("발송번호는 숫자로만 입력하여 주세요.");return false;}
	
	if(list.length == 0) {
		alert("SMS를 전송할 이동전화번호를 입력하세요!");
	} else {
		
		retValue = confirm("문자 메시지를 발송하겠습니까?");
		if(retValue == false) {return false;}
	
		var recList = new Array;
		//수신자 목록 
		$('select[name="receiver_list"] option').each(function () {
			recList.push($(this).val());
		}); 
		document.getElementById("recList").value=recList;
		
		
		 //sms면 4, mms면 6
		 if($("#msglen").val() > 90) {
			 $("#tranType").val(6);
		 } else {
			 $("#tranType").val(4);
		 }  
		form.submit();
	 }
 }
 
 
</script>
	<!-- title -->
	
	<div class="title title_top">SMS발송</div>
	
	<table style="border-collapse: collapse" border="0" bordercolor="#dce1e1" width="100%">
		<tbody>
			<tr>
				<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px" class="tb_Message">
					<div style="padding-top: 7px">
						<font class=g9 color=#666666> 
							- 휴대폰번호는 '-'없이 입력하세요. EX)01012341234<br>
							- 발송 문자는 90Byte 초과 시 mms로 자동 변환 됩니다.<br>
							- 발신번호는 공통코드관리에서 변경할 수 있습니다.<br>
							- % 기호는 사용하실 수 없습니다.
						</font>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	
	<!--space-->
	<div class="space"></div>
	
	<form name="smsform" method="post" action="/admin/common/smsExec2.do">
		<input type="hidden" name="tplUid" value=""/> 
		<input type="hidden" name="sendtime" value=""/>
		<input type="hidden" name="SES_USERID" id="SES_USERID" value="${REQUEST_DATA.SES_USERID}"/>
		<input type="hidden" name="SES_USERNAME" id="SES_USERNAME" value="${REQUEST_DATA.SES_USERNAME}"/>
		<input type="hidden" name="tranType" id="tranType" valye=""/>
		<input type="hidden" id="recList" name="recList"value=""/>
		<input type="hidden" name="smsType" id="smsType" value=2>
		<!--시작-->
		<table cellspacing=0 cellpadding=0 class="search_table">
			<tr>
				<td style="padding: 10 10 10 10;background-color:#fff;">
	
					<table border=0 cellspacing=0 cellpadding=0 width="100%">
						<tr>
							<td width="160">
	
								<table border="0" cellspacing="0" cellpadding="0" width="232" align="center" style="margin: 0 auto;">
									<tbody>
										<tr>
											<td background="/admin/images/etc/sms_bg.gif" width="232" height="284" align="center" valign="top" class="sms_box">
												<div style="position:relative;">
													<!--화면 시작--> 
													<c:set var="tplContent">${fn:replace(REQUEST_DATA.tplContent,'-','')}</c:set>
													<textarea id="smsbody" name="smsbody" class="screen" onkeyup="MsgSmsLenCheck();"></textarea>
													<div class="bytes">
														<input class="input3" readonly="" maxlength="3" size="3" value="0" id="msglen" name="msglen"/><span>bytes</span> <span name="textMms" id="textMms" style="color: red;"></span> 
													</div>
													<!--화면 끝-->
												</div>
											</td>
										</tr>
									</tbody>
								</table>
	
							</td>
							<td width="16"></td>
							<td width="*" valign="top">
								<!--입력정보시작-->
								<table border=0 cellspacing=0 cellpadding=0 width="100%">
									<tr height="30">
										<td width="15">
											<input type="text" id="destAdd" name="destAdd" maxlength="11" style="width: 120px" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="line"/> 
										</td>
										<td style="padding-left: 23px" align="right">
											<a href="#" border="0" style="cursor: hand" onclick="MsgSmsUserAdd()" class= "btn small green">추가</a>
											<a href="#" border="0" style="cursor: hand" onclick="MsgSmsUserRemove()" class= "btn small red">삭제</a>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="padding: 3 0 0 0">
											<select name="receiver_list" multiple style="font-family: 돋움, 돋움체; font-size: 9pt; color: #646464; padding: 0 0 0 0; width: 100%; height: 220px">
												<c:forEach var="result" items="${mobileInfo}">
													<OPTION name="mobile" VALUE="${result.USERID}">
														${result.MOBILE}
													</OPTION>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2"  height="30" align="center"> 
											<c:set var="MT_CTYPE_CODE_ONLINE"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%></c:set>
											<c:set var="MT_CTYPE_CODE_OFFLINE"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%></c:set>
										 
											<c:if test="${courseInfo.MT_CTYPE_CODE eq MT_CTYPE_CODE_ONLINE }"><font id="recnt">${courseInfo.ONLINE_STUDY_USER_CNT }</font> / 1000 </c:if>
											<c:if test="${courseInfo.MT_CTYPE_CODE eq MT_CTYPE_CODE_OFFLINE }"><font id="recnt">${courseInfo.OFFLINE_STUDY_USER_CNT }</font> / 1000 </c:if>
											
										</td>
									</tr>
								</table> <!--입력정보 끝-->
							</td>
						</tr>
					</table> <!--내용 끝--> <!--space-->
					<div class="space"></div>
					
					
					<table class="table-type1 search_form">
						<tr>
							<th width="15">과정명</th>
							<td width="35">${courseInfo.SEQ_TITLE }</td>
						</tr>
						<tr>
							<th>발송번호</th>
							<td><c:set var="callback">${fn:replace(REQUEST_DATA.callback,'-','')}</c:set>
								<input type="text" id="callback"  name="callback" value="${callback}" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="line"/>
							</td>
						</tr>	
						</tbody>
					</table>
	
				</td>
			</tr>
		</table>
	</form>
	<!--space-->
	<div class="space"></div>
	
	<!--버튼 시작-->
	<table width=100% border=0 cellspacing=0 cellpadding=0>
		<tr>
			<td align="center">
				<a href="#" onclick="fnSmsSubmit()" class= "btn sky big">전송</a>
				<a href="#" onclick="window.close();" class= "btn gray big">취소</a>
				</a>
			</td>
		</tr>
	</table>
	<!--버튼 끝-->
	
	<!--끝-->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_pop_inc.jsp"%>