<%
/****************************************
    subject	: 지원센터 > 공지사항 보기
    summary	:
    author	: 김학규
    date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_pop_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/calendar.js"></script>
<style>
/* 	.messages { padding-left:18px; padding-right:18px; padding-top:18px; margin: 0px; height: 359px; width: 100%; resize: none; border: solid; border-color:#cccccc; border-width: 1px; } */
 	.messages { word-break:break-all;word-wrap:break-word; padding-left:18px; padding-right:18px; padding-top:18px; margin: 0px; height: 359px; width:85%; resize: none; border: solid; border-color:#cccccc; border-width: 1px; }
	#senderSpen {font-weight: bold;}
	
	.balloonArea 
	{
		float:right;
		text-align: right;
		width:100%;
		word-break:break-all;
		word-wrap:break-word;
		margin-top:-11px;
	}
	
	
	.myBalloon 
	{ 
		display: inline-block; 
		position: relative; 
		background: #ffe004; 
		max-width: 100%; 
		margin: 0 13px 10px; 
		padding : 8px; 
		border-radius : 10px; 
		margin-top: 6px; 
	}	

	.myBalloon:after 
	{
		content: ''; 
		position: absolute; 
		border-top: 10px solid transparent; 
		border-right: 8px solid transparent; 
		border-left: 10px solid #ffe004; 
		bottom: 13px; 
		right: -16px; 
	}
	
	.yourBalloon 
	{
		display: inline-block;
		position: relative;
		background: #f5efef;
		max-width: 100%;
		margin: 0 15px 10px;
		padding : 8px;
		border-radius : 10px;
		margin-top: 6px;
	}
	
	.yourBalloon:after 
	{
	    content: '';
	    position: absolute;
	    border-top: 10px solid transparent;
	    border-right: 8px solid #f5efef;
	    border-left: 10px solid transparent;
	    bottom: 13px;
	    left: -16px;
	}
	
	.msgInput 
	{
		border: solid; 
		border-color:#cccccc; 
		border-width: 1px;
		width: 81%;
		height: 28px;
	}
		
</style>

<script type="text/javascript">

	// 소켓 connection
	$(document).ready(function() {
		
		openSocket();
	})
	
</script>

<div class="title title_top">채팅</div>

				<div id="wrap">
					<div id="messages" class="messages" style="overflow:auto" >
					<div id="arrow_box" class="arrow_box" style="overflow:auto" >
					</div>
				</div>
			
				<section class="tableBox">
					<div class="tblWrap">
						<input type="text" id="sender" value="${REQUEST_DATA.SES_USERID }" style="display: none;">
					</div>
											
					<div class="titSearchWrap" style="margin-top: 18px;">
						<button type="button" onclick="openSocket();" style="display: none">Open</button>
						<input type="text" id="messageinput" class="msgInput" value=""  onkeypress="if(event.keyCode==13){send();return false}">
				        <a href="#" onclick="send(); return false;" class="btn sky">전송</a>
					</div>
				</section>
				
		</div><!-- //contents-->


<script>

	var ws;
	var messages=document.getElementById("messages");
	
	function openSocket(){
		
		if(ws!==undefined && ws.readyState!==WebSocket.CLOSED) {
			writeResponse("WebSocket is already opened.");
			return;
		}
		
    //웹소켓 객체 만드는 코드  
// 	    ws=new WebSocket("ws://keledu.sangs.kr/websocket/chat/echo.do"); 
// 	    ws=new WebSocket("ws://192.168.20.152:8085/websocket/chat/echo.do");
	    ws=new WebSocket("ws://localhost:8085/websocket/chat/echo.do");
	    
	    
	    ws.onopen=function(event){
	    	
	    	console.log("::::::::::::::::::::::::::connection success");
	    	
	    	if(event.data===undefined) return;
	        writeResponse(event.data);
	    };
	    
	    ws.onmessage=function(event){
	    	console.log(":::::::::connection success >>> :::::::::: 메시지 전송 버튼 클릭 :::::::");
	        writeResponse(event.data);
	    };
	    
	    ws.onclose=function(event){
	        writeResponse("종료하겠습니다.");
	    }
	}
	
	function send() {
		
		if('' == $('#messageinput').val()) {
			alert('내용을 입력해주세요.');
			return false;
		}
		
		var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
		ws.send(text);
		text="";
		$('#messageinput').val('');
	}
	
	function closeSocket(){
		ws.close();
	}
	
	function writeResponse(text){
// 		messages.innerHTML+="<br/>"+text;

		var sender;
		var content;

		var textArr = new Array();
		textArr = text.trim().split(":");
		
		for(var i = 0; i < textArr.length; i++) {
			console.log("i" + i + ">>>>" + textArr[i]);
			sender = textArr[0];
			content = textArr[1];
		}
			
// 		messages.value+="\r\n"+$('#senderArea').val() + " : " + content;
		if(sender.trim() != '${REQUEST_DATA.SES_USERID}' && sender.trim() != 'admin') {
			
			$('#messages').append("<div style='margin-top:-11px;'><span style='font-weight:bold;'>" + sender + "</span><span class='yourBalloon'>" + content + "</span></div>" );
		
		} else if(sender.trim() != '${REQUEST_DATA.SES_USERID}' && sender.trim() == 'admin') {
			
			$('#messages').append("<div style='margin-top:-11px;'><span style='font-weight:bold; color:blue;'>" + sender + "</span><span class='yourBalloon'>" + content + "</span></div>" );
			
		} else if(sender.trim() == '${REQUEST_DATA.SES_USERID}' ) {
			
			$('#messages').append("<div class='balloonArea'><span class='myBalloon'>" + content + "</span></div><br>" );
			
		} 
		
		// 본인이 쓴글 아이디 노출 안되게끔!
		/* else if(sender.trim() == '${REQUEST_DATA.SES_USERID}' && sender.trim() != 'admin' ) {
			
			$('#messages').append("<div class='balloonArea'><span class='myBalloon'>" + content + "</span><span style='font-weight:bold;'>" + sender + "</span></div><br>" );
		}
		 */
		var top = $('#messages').prop('scrollHeight');
		$('#messages').scrollTop(top);
	}

</script>
