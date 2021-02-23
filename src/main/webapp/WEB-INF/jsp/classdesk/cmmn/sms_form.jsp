
<%
/****************************************
	system	: ClassDesk > 강사 > 시험 
	title	: 세트방식 시험 문제 수정 / 등록 양식  팝업
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"  %>

<!-- 메일 발송관련 초기 세팅 -->
<script type="text/javascript">
<!--
//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.

var dateFormat={
	 dayNamesMin:['일','월','화','수','목','금','토'],
	 monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	 showMonthAfterYear: true, //연월 순서로 보여줌
	 changeMonth: true, //월을 셀렉트박스로 표현
	 changeYear: true, //년을 셀렉트박스로 표현
	 dateFormat: 'yy-mm-dd'
};	


$(document).ready(function(){
	$('#set_senddate').datepicker(dateFormat);
 });
//-->
</script>

<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">SMS발송</h1>
		<!-- 20130820일자 삭제or주석처리 <div class="bg-tnb-line"></div>-->
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
 <div id="content">
	<!-- 문제등록 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">발송정보입력</h3>
	</div>
	<div class="round-box-small blue">
		<!-- 문제등록 테이블 -->
		<form id="smsForm" name="smsForm">
		<input type="hidden" name="subcmd" id="subcmd"/> 
		<div class="table-type2">
			<table summary="상상스토리 교육시스템의 발송정보입력입니다.">
				<caption>발송정보입력</caption>
				<colgroup>
					<col width="140" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>발신번호</th>
						<td><label for="callback">발신번호</label><input type="text" class="w50" name="callback" id="callback" value="<c:out value="${CALLBACK}"/>" /></td>
					</tr>
					<!-- <tr>
						<th>발신제목</th>
						<td><label for="send-mail">발신제목</label><input type="text" class="w98" name="send-mail" id="send-mail" value="" /></td>
					</tr> -->
					<tr>
						<th>수신번호</th>
						<td>
							<div class="table-in-row">
								<label for="destAdd">수신번호</label><input type="text" class="w50" name="destAdd" id="destAdd"  value="'-' 없이 입력해주세요." onfocus="preFillInputText(this,'off')"/>
								<a href="#" onclick="list_add()"><img src="/classdesk/images/btn_s_add.png" alt="추가" /></a>
							</div>
							<div class="table-in-row">
								<ul id="selectable"> 
									<c:choose>
										<c:when test="${not empty listData}">
											<c:forEach items="${listData}" var="result" varStatus="stat"> 
													<li><c:out value="${result}"/><input type = "hidden" name="receiver_list" id="receiver_list" value="<c:out value="${result}"/>"/></li> 
											</c:forEach>
										</c:when>
									</c:choose>
								</ul>
								<p style="float:left;">수신자 수 : <strong class="blue" name="userCnt" id="userCnt">0</strong> / 1000 (수신번호는 최대 1000개까지 가능합니다.)</p>
								<a href="#" onclick="list_del()"><img src="/classdesk/images/btn_s_delete.png" alt="삭제" style="margin-top:9px; float:right;" /></a>
							</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="sms-wrap">
								<textarea title="발신내용" name="smsbody" id="smsbody" onkeyup="MsgSmsLenCheck();" style="background-color:#4683b7;"> <c:out value="${rowData.CONTENT}"/></textarea>
								<span class="txt-byte" name="msglen" id="msglen"><strong>0</strong> bytes</span>
								<span name="textMms" id="textMms"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th>예약발송</th>
						<td>
							<label for="isreserve">예약발송</label><input type="checkbox" name="isreserve" id="isreserve" class="check-mid" onclick="fnReserve()" value="Y"/>
							<!-- check 안될시 display:none; -->
							<div id = "time_set" style="display:none; ">
 												일자 : <input type="text" name="set_senddate" id="set_senddate" class="input_date"  > 
												<select style="width: 50px; height: 17px; border: 1px solid CCCCCC; font-family: 돋움, 돋움체; font-size: 9pt;" name="m_hour">
													<option value="00">0시 </option>
													<option value="01">1시 </option>
													<option value="02">2시 </option>
													<option value="03">3시 </option>
													<option value="04">4시 </option>
													<option value="05">5시 </option>
													<option value="06">6시 </option>
													<option value="07">7시 </option>
													<option value="08">8시 </option>
													<option value="09">9시 </option>
													<option value="10">10시 </option>
													<option value="11">11시 </option>
													<option value="12">12시 </option>
													<option value="13">13시 </option>
													<option value="14">14시 </option>
													<option value="15">15시 </option>
													<option value="16">16시 </option>
													<option value="17">17시 </option>
													<option value="18">18시 </option>
													<option value="19">19시 </option>
													<option value="20">20시 </option>
													<option value="21">21시 </option>
													<option value="22">22시 </option>
													<option value="23">23시 </option>
												</select>
												<select style="width: 50px; height: 17px; border: 1px solid CCCCCC; font-family: 돋움, 돋움체; font-size: 9pt;" name="m_min">
													<option value="00">00분</option>
													<option value="10">10분</option>
													<option value="20">20분</option>
													<option value="30">30분</option>
													<option value="40">40분</option>
													<option value="50">50분</option>
												</select>
 							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		<!-- //문제등록 테이블 -->
		<!-- 라운드박스 구성요소 -->
		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div>
		<!-- //라운드박스 구성요소 -->
	</div>
	<!-- //문제등록 -->
</div>
 <!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup">
		<a href="#" onclick="fnSmsExec()" class="btn-large-blue"><span>발송</span></a>
		<a href="#" onclick="self.close();" class="btn-large-orange"><span>취소</span></a>
	</div>
</div>

<script type="text/javascript"><!--
	
	function preFillInputText(Field,Type){
	   if (!Field.value && Type=='on') {
	      Field.value=Field.defaultValue;
	   } else if (Field.value==Field.defaultValue && Type=='off') {
	      Field.value='';
	   }
	}
	
	// 등록 폼
	function fnSmsExec(){
		$('#smsForm').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/common/sms/exec.do').submit();
	}
	
	// 리턴 설정
	function fnClose(){ 
		window.close();
	}
	
	// selectable 활성화
	$(function() {
		$( '#selectable' ).selectable();
	});

	// 삭제
	function list_del(){
	   var current = $('#selectable').find('.ui-selected');
	   current.remove(); //삭제
	   checkCnt();
	}
 
	// 추가
	function list_add(){
	 	var mailAddr = '-/-/';
	  
		if ($('input[name=destAdd]').valueEmpty()) {
			alert('추가할 메일 주소를 입력해주세요');	 
			return;
	 	}else{
	 		var cnt = $('li').length;
	 		
	 		if(cnt < 1001){
	 			mailAddr = mailAddr + $('input[name=destAdd]').val();
				$('#selectable').append('<li>'+mailAddr+'</li><input type = 'hidden' name='receiver_list' id='receiver_list' value=''+mailAddr+''/>');
				$('input[name=destAdd]').val('');
	 		}else{
	 			alert('최대 1000명을 초과할 수 없습니다.');	 
	 		}
			
		};
 		checkCnt();
	}
	
	// 예약 발송
	function fnReserve(){ 
		if ($('#isreserve').is(':checked') == true ){  
			$('#time_set').css('display', 'inline-block');
		}else{
			$('#time_set').css('display', 'none');
		}
		checkCnt();
	}
	 
	// 수신자 수
	function checkCnt(){ 
		var cnt = $('li').length;
		$('#userCnt').html(cnt);
	}
	

	// SMS 사이즈 제한
	function MsgSmsLenCheck()
	{
 		var  nStrLen;

		sInputStr = $('#smsbody').val();
		nStrLen = calculate_byte(sInputStr);
		 
		if ( nStrLen > 80 ) {
			/*tmpStr = Cut_Str(sInputStr,80);
			reserve = nStrLen - 80;*/

			//alert('작성하신 문구는 ' + reserve + '바이트가 초과되었습니다.(최대 80Bytes)\r\n초과된 부분은 전송되지 않습니다');
			//alert('작성하신 문구는 80bytes를 초과하여 MMS로 발송됩니다.');
			$('#textMms').html('(MMS)') ;
			// 80byte에 맞게 입력내용 수정
			/*form.smsbody.value = tmpStr;
			nStrLen = calculate_byte(tmpStr);
			form.msglen.value = nStrLen;*/
			$('#msglen').html('<strong>'+nStrLen+'</strong> bytes' );  
			
		} else {
			$('#textMms').html('') ;

			$('#msglen').html('<strong>'+nStrLen+'</strong> bytes' );  
		}

		return;
	}
	
	function calculate_byte( sTargetStr ) {
		var sTmpStr, sTmpChar;
		var nOriginLen = 0;
		var nStrLength = 0;

		sTmpStr = new String(sTargetStr);
		nOriginLen = sTmpStr.length;

		for ( var i=0 ; i < nOriginLen ; i++ ) {
			sTmpChar = sTmpStr.charAt(i);

			if (escape(sTmpChar).length > 4) {
				nStrLength += 2;
			} else if (sTmpChar!='\r') {
				nStrLength ++;
			}
		}

		return nStrLength;
	}
	
	
	$( document ).ready(function() {
		checkCnt();
		MsgSmsLenCheck();
	});

	//-->
	</script>
 
</body>
</html>
