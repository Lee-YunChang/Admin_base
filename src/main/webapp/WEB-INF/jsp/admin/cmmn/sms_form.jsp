<%
/****************************************
subject	: [관리시스템] SMS 발송양식
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
$(document).ready(function(){
	
	//수신자 목록에 번호만 입력되도록
	$('option[name="mobile"]').each(function () {
		var str = $(this).text();
		var newStr = str.replace(/-/g, "");
		$(this).text(newStr.trim());
	});
	
	var days = document.smsform.receiver_list;
	var moblphonList = $('#moblphonList').val();
	var useridList = $('#useridList').val();
     var jbSplit = moblphonList.split( ',' );
     var jbSplit2 = useridList.split( ',' );
	 for ( var i in jbSplit ) {
			var option = new Option(jbSplit[i], jbSplit2[i]);
			days.options[days.length] = option;
      } 
	document.all("recnt").innerHTML = days.length;
	
 });
 
  function fnSmsSubmit(){
	var list = document.smsform.receiver_list;
	var form = document.smsform;

	if (form.smsbody.value == '') { alert("문자내용을 입력하세요!");form.smsbody.focus();return false; }
	
	if(list.length == 0) {
		alert("SMS를 전송할 이동전화번호를 입력하세요!");
	} else {
		retValue = confirm("문자 메시지를 발송하겠습니까?");
		if(retValue == false) {return false;}
	
		var recList = new Array;
		var smSdMbNoList = new Array;	//전략물자 sms모듈을 위해 추가 - 화면 목록에 표기된 번호 리스트
	 	//수신자 목록 
		$('select[name="receiver_list"] option').each(function () {
			if($(this).val().length = 0){
				recList.push($(this).val());
			}else{
				recList.push($(this).text());
			} 
			smSdMbNoList.push($(this).html().replace(/(^\s*)|(\s*$)/gi, ""));	//화면에 표기된 번호를 공백 제거
		}); 
		//document.getElementById("recList").value=$('#moblphonList').val();
		document.getElementById("recList").value=recList;
		document.getElementById("smSdMbNoList").value=smSdMbNoList;
		
		 //sms면 4, mms면 6
		 if($("#msglen").val() > 90) {
			 $("#tranType").val(6);
		 } else {
			 $("#tranType").val(4);
		 }
		form.submit();
	 }
 }
  
  function TPLChange(){
	  var content = $("#SMSTPL option:selected").val();
	  $('#smsbody').val(content);
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
							- 휴대폰번호는 '-'없이 입력하세요. EX)01012341234<br/>
							- 발송 문자는 90Byte 이상 시 mms로 자동 변환 됩니다.</br>
							- 발신번호는 공통코드관리에서 변경할 수 있습니다.
							 
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
		<input type="hidden" id="smSdMbNoList" name="smSdMbNoList" value=""/>
		<input type="hidden" name="smsType" id="smsType" value=1>
		
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
												<c:forEach var="result" items="">
													<OPTION name="mobile" VALUE="">
													</OPTION>
												</c:forEach>
											</select>
											 <input type="hidden" id="moblphonList" value="${REQUEST_DATA.moblphonList}"/> 
											 <input type="hidden" id="useridList" value="${REQUEST_DATA.useridList}"/> 
										</td>
									</tr>
									<tr>
										<td colspan="2"  height="30" align="center">
											<font id="recnt">${fn:length(mobileInfo)}</font> / 1000 
										</td>
									</tr>
								</table> <!--입력정보 끝-->
							</td>
						</tr>
						<tr>
							<td align="center"> 
								<select id="SMSTPL" onchange="TPLChange(); return false;">
									<option value=''>선택하세요</option>
									<c:forEach var="result" items="${tamplateList}" varStatus="status">
										<option value='${result.CONTENT }'>${result.TPLNAME }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table> <!--내용 끝--> <!--space-->
					<div class="space"></div>
					
					
					<table class="table-type1 search_form">
						<tr>
							<th>발송번호</th>
							<td colspan="3"><c:set var="callback">${fn:replace(REQUEST_DATA.callback,'-','')}</c:set>
								<input type="text" name="callback" value="${callback}" class="line"/>
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