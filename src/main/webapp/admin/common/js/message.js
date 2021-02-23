
////////////////////////////////////////////
// 메일 관련
////////////////////////////////////////////

// 메일보내기
function MsgMailSubmit(){
	var list = document.mailform.receiver_list;
	var form = document.mailform;

	for(i=0; i<list.length; i++){
		form.receiver_list[i].selected = true;
	}

 	if (form.subject.value=="") { alert("제목을 입력하세요");form.subject.focus();return false;}
	if (form.content.value=="") { alert("내용을 입력하세요");form.content.focus();return false;}

	retValue = confirm("메일을 발송하겠습니까?");
	if (retValue == false) {return false;}   

	form.submit();
}


function MsgMailUserRemove()
{
	var days = document.mailform.receiver_list;
	var RemoveChk = 0;

	for (var i = days.length; i>0; i--) {
		if(days.options[i-1].selected==true) {
			days.options[i-1] = null;
			RemoveChk = 1;
		}
	}

	document.all("recnt").innerHTML = days.length;

	if(RemoveChk == 0) alert("삭제할 메일주소를 선택 후 삭제하세요!");
}

function MsgMailUserAdd()
{
	var days = document.mailform.receiver_list;
	var dest = "-/-/"+document.mailform.destAdd.value;

	if (document.mailform.destAdd.value=="") {
		alert("수신자 메일주소를 입력하세요!");
		dest.focus();
		return false;
	}

	var option = new Option(dest, dest);
	days.options[days.length] = option;
	document.all("recnt").innerHTML = days.length;
	document.mailform.destAdd.value = "";
}


////////////////////////////////////////////
// 쪽지 관련
////////////////////////////////////////////

// 쪽지보내기(공통)
function MsgMemoSubmit(){
	var form = document.forms[0];

	if (form.subject.value=="") { alert("제목을 입력하세요");form.subject.focus();return false;}
	if (form.content.value=="") { alert("내용을 입력하세요");form.content.focus();return false;}

	retValue = confirm("쪽지를 발송하겠습니가?");
	if (retValue == false) {return false;}   

	form.secgb.value='R';

	form.submit();
}





////////////////////////////////////////////
// SMS 관련
////////////////////////////////////////////
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

function Cut_Str( sTargetStr , nMaxLen ) {
	var sTmpStr, sTmpChar, sDestStr;
	var nOriginLen = 0;
	var nStrLength = 0;
	var sDestStr = "";
	sTmpStr = new String(sTargetStr);
	nOriginLen = sTmpStr.length;

	for ( var i=0 ; i < nOriginLen ; i++ ) {
		sTmpChar = sTmpStr.charAt(i);

		if (escape(sTmpChar).length > 4) {
			nStrLength = nStrLength + 2;
		} else if (sTmpChar!='\r') {
			nStrLength ++;
		}

		if (nStrLength <= nMaxLen) {
			sDestStr = sDestStr + sTmpChar;
		} else {
			break;
		}
	}

	return sDestStr;
}

function MsgSmsSubmit()
{
	var list = document.smsform.receiver_list;
	var form = document.smsform;

	if (form.smsbody.value =="") { alert("문자내용을 입력하세요!");form.smsbody.focus();return false; }
	
	for(i=0; i<list.length; i++){
		document.smsform.receiver_list[i].selected = true;
	}

	if(list.length == 0) {
		alert("SMS를 전송할 이동전화번호를 입력하세요!");
	} else {
		
		if (form.isReserve.checked==true) {

			if (form.set_senddate.value == "") {
				alert("예약발송일자를 설정하세요."); return false;
			} else {
				form.sendtime.value = form.m_hour.value+":" +form.m_min.value +":00";
			}
		} 

		retValue = confirm("문자 메시지를 발송하겠습니까?");
		if(retValue == false) {return false;}

		
		form.submit();
	}
}

// SMS 사이즈 제한
function MsgSmsLenCheck()
{
	var form = document.smsform;
	var tmpStr, nStrLen, reserve, f;

	sInputStr = form.smsbody.value;
	nStrLen = calculate_byte(sInputStr);

	if ( nStrLen > 90 ) {
		/*tmpStr = Cut_Str(sInputStr,90);
		reserve = nStrLen - 90;*/

		//alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 90Bytes)\r\n초과된 부분은 전송되지 않습니다");
		//alert("작성하신 문구는 90bytes를 초과하여 MMS로 발송됩니다.");
		$("#textMms").html("&nbsp;MMS") ;
		// 90byte에 맞게 입력내용 수정
		/*form.smsbody.value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
		form.msglen.value = nStrLen;*/
		form.msglen.value = nStrLen;
	} else {
		$("#textMms").html("") ;

		form.msglen.value = nStrLen;
	}

	return;
}

// SMS 사이즈 제한 (다수)
function MsgSmsLenCheck2(flagId)
{
	//var form = document.smsform;
	var tmpStr, nStrLen, reserve, f;
	document.getElementById()
	sInputStr = document.getElementById('smsbody'+flagId).value;
	nStrLen = calculate_byte(sInputStr);

	if ( nStrLen > 90 ) {
		tmpStr = Cut_Str(sInputStr,90);
		reserve = nStrLen - 90;

		alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 90Bytes)\r\n초과된 부분은 전송되지 않습니다");

		// 90byte에 맞게 입력내용 수정
		document.getElementById('smsbody'+flagId).value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
		document.getElementById('msglen'+flagId).value = nStrLen;
	} else {
		document.getElementById('msglen'+flagId).value = nStrLen;
	}

	return;
}

 


function MsgSmsUserRemove()
{
	var days = document.smsform.receiver_list;
	var RemoveChk = 0;

	for (var i = days.length; i>0; i--) {
		if(days.options[i-1].selected==true) {
			days.options[i-1] = null;
			var x = days.options[i-1].getAttribute("value");
			RemoveChk = 1;
			
			 $("option[name='mobile']").each(function() {
			 	if($(this).val() == x) { 
			 		console.log($(this).val())
			 		$(this).attr('selected','selected');
				}  
			});
			 
		}
	}

	document.all("recnt").innerHTML = days.length;

	if(RemoveChk == 0) alert("삭제할 번호를 선택 후 삭제하세요!");
}

function MsgSmsUserAdd()
{
	var days = document.smsform.receiver_list;
	var dest = document.smsform.destAdd.value;

//	if (dest.value=="") {
	if (document.smsform.destAdd.value=="") {
		alert("SMS를 전송할 이동전화번호를 입력하세요!");
		dest.focus();
		return false;
	} 

	var option = new Option(dest, dest);
	days.options[days.length] = option;
	document.all("recnt").innerHTML = days.length;
	document.smsform.destAdd.value = "";
}

//예약전송
function MsgSmsReserveView()
{
	var form = document.smsform;

	if (form.isReserve.checked==true){
		document.all["time_set"].style.display =''; 
	} else {
	    document.all["time_set"].style.display ='none';
	}
}


//-->
