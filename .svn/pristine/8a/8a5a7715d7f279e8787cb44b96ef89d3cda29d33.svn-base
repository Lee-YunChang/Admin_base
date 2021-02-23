<%
/****************************************
subject	: [관리시스템] SMS 발송양식(과정관리 > 과정운영관리 > 진행관리(설문))
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

$(document).ready(function() {
	
	//수신자 목록에 번호만 입력되도록
	$('input[name="recHp"]').each(function () {
		var str = $(this).val();
		var newStr = str.replace(/-/g, "");
		$(this).val(newStr.trim());
	});
	
	$("#set_senddate").datepicker(dateFormat);
 });
 
function fnSmsSubmit(){
	var form = document.smsform;

	if (form.smsbody.value == '') { alert("문자내용을 입력하세요!");form.smsbody.focus();return false; }
	
	if(confirm('문자 메시지를 발송하겠습니까?')) {
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
		<input type="hidden" id="pollcseqno" name="pollcseqno" value=""/>
		<input type="hidden" id="paramcSeqNo" name=paramcSeqNo value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
		<input type="hidden" id="paramCourseNo" name=paramCourseNo value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
		<input type="hidden" name="tranType" id="tranType" value=""/>
		<input type="hidden" name="smsType" id="smsType" value=3>
		
		<c:forEach var="result" items="${mobileInfo}">
			<input type="hidden" id="recUserName" name="recUserName" value="${result.USERNAME}"/>
			<input type="hidden" id="recUserId" name="recUserId"value="${result.USERID}"/>
			<input type="hidden" id="recHp" name="recHp"value="${result.MOBILE}"/>
		</c:forEach>
			
		<!--시작-->
		<table cellspacing=0 cellpadding=0 class="search_table">
			<tr>
				<td style="padding: 10 10 10 10;background-color:#fff;">
					<table border=0 cellspacing=0 cellpadding=0 width="100%">
						<colgroup><col width="50%"><col width="5%"><col width="45%"></colgroup>
						<tr>
							<td valign="top" width="100%">
								<table align="right">
									<td>
										<a href="#" onclick="fnPreview()" class="btn brown small">설문 미리보기</a>
										<a href="#" onclick="fnText()" class="btn blue small">선택 등록</a>
									</td>
								</table>
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td valign="top" width="100%">
								<div style="height:275px;overflow:auto" >
								<table class="table-type1">
									<colgroup>
										<col width="5%"/>
										<col width="5%"/>
										<col width="90%"/>
										<!-- <col width="40%"/> -->
									</colgroup>
									<thead>
										<tr>
											<th>선택</th>
											<th>No</th>
											<th>설문명</th>
											<!-- <th>설문기간</th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${resultList}" varStatus="status">
											<tr>
												<td><input type="radio" class="smsRadio" value="<c:out value='${result.POLLCSEQNO}'/>">
												<input type="hidden"  id="pollTitle" value="${result.TITLE }"/></td>
											  	<td><c:out value='${result.RNUM}'/></td>
											  	<td><c:out value="${result.TITLE}"/></td>
											  	<%-- <td><c:out value='${result.SDATE}'/> ~ <c:out value='${result.EDATE}'/></td>   --%>
											</tr> 
										</c:forEach>
									</tbody>
								</table> 
								</div>
							</td>
							<td></td>
							<td>
							
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
						</tr>
					</table> <!--내용 끝--> <!--space-->
					<div class="space"></div>
					
					<table class="table-type1 search_form">
					<tr>
						<th width="">과정명</th>
						<td width="">${courseInfo.SEQ_TITLE }</td>
						<th width="">발송인원</th>
						<td width="">${courseInfo.APPLY_USER_CNT } 명</td>
						
					</tr>
						<!-- <tr>
							<th width="20%">예약발송 <input type="checkbox" style="border: 0px" name="isReserve" value="Y" onclick="javascript:MsgSmsReserveView();" class="input_chbox"/> 
								</th>
							<td width="80%" colspan="3">
								<div ID="time_set" STYLE="display: none">
								<input type="text" name="set_senddate" id="set_senddate" class="line" style="width:70px"/> 
								<a href="#" onclick="$('#set_senddate').focus(); return false;">
							 		<img src="/admin/images/btn_calendar.png" alt="예약발송일">
							 	</a> &nbsp;
								<select name="m_hour" id="m_hour">
									<option value="00">0</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
								</select> 시  &nbsp;
								<select name="m_min" id="m_min">
									<option value="00">00</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="40">40</option>
									<option value="50">50</option>
								</select> 분
							</div>
							</td>
						</tr>	 -->
						<tr>
							<th>발송번호</th>
							<td  colspan="3"><c:set var="callback">${fn:replace(REQUEST_DATA.callback,'-','')}</c:set>
								<input type="text" name="callback" value="${callback}" class="line"/>
							</td>
						</tr>	
						<!-- <tr>
							<th>발송제목</th>
							<td  colspan="3">
								<input type="text" name="title" style="width:100%" value="[관리자시스템]" class="line"/>
							</td>
						</tr>	 -->
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
	
<script>
	$(".smsRadio").click(function(){
			//체크했다면 자신을 제외한 다른 체크를 해제
			if($(this).attr('checked')) {
				$(".smsRadio").not(this).prop('checked', false);
			}
	});
	
	//설문 미리보기
	function fnPreview(){
		var chk = $("input:radio:checked");
		var chklen = $("input:radio:checked").length;
		
	 	if(chklen < 1 ){
			alert('최소 한 개 이상 선택 해 주세요.');
			return false;
		} 
		
	 	var form = document.smsform;
		
		if( chk.val()==null || chk.val()=='' ){
			form.pollcseqno.value='';
		} else {
			form.pollcseqno.value=chk.val();
		}
		 var smspop = window.open("", "surveyPreview",  "width="+1000+" height="+600); 
		 
		form.method = "post";
		form.action = "/classdesk/tutor/poll/surveyPreview.do";
		form.target = "surveyPreview"; 
		form.submit();
		smspop.focus();
	}
	
	//설문 등록
	function fnText(){
		var chk =  $("input:radio:checked");
		var pollcseqno = chk.val();
		var paramcSeqNo = $("#paramcSeqNo").val();
		var paramCourseNo = $("#paramCourseNo").val();
		var pollTitle = chk.next().val(); 

		if(pollcseqno == '' || pollcseqno == null) {
			alert('최소 한 개 이상 선택 해 주세요.');
			return false;
		} 
		
		var domainUrl = '<%=SangsProperties.getProperty("Globals.domain")%>';
		var text = '설문명: '+pollTitle+'\n'+domainUrl+'/classdesk/user/poll/view.do?pollcseqno='+pollcseqno+'&CLASSDESK=10111111&paramcSeqNo='+paramcSeqNo+'&paramCourseNo='+paramCourseNo;
		
		if(text.length > 80 ){
			$("#textMms").html("&nbsp;MMS") ;
			$("#msglen").val(text.length);
		}
		
		$("#smsbody").val('설문명: '+pollTitle+'\n'+domainUrl+'/classdesk/user/poll/view.do?pollcseqno='+pollcseqno+'&CLASSDESK=10111111&paramcSeqNo='+paramcSeqNo+'&paramCourseNo='+paramCourseNo);
	}
</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_pop_inc.jsp"%>