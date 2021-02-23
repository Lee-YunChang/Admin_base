<%
/****************************************
	subject	: [관리시스템] 메일발송양식
	summary	: 

	발송파라메터규칙
	----------------------------------------------------------
	parameter name = msg_user
	parameter vlaue = userid / username / email / mobile

	※ 값이 없을 경우 -로 전달되어야함.

	ex) ?sms_user=test/테스트/aaa@aaa.com/01012341234

****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@ page import = "com.sangs.session.UserSessionManager" %>
<%@ page import = "com.sangs.session.UserSessionVO" %>

<% 

	String sender_username = SangsProperties.getProperty("Globals.mailSenderAliasName");
	String sender_mailaddr = SangsProperties.getProperty("Globals.mailSenderMailAddr");
	
	UserSessionVO headerUserSessionVo = UserSessionManager.getUserSessionVO(request);
	
 %>
<style type="text/css">
<!--
.input3 { width:20px; BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BACKGROUND: none; BORDER-BOTTOM-WIDTH: 0px; TEXT-ALIGN: right; BORDER-RIGHT-WIDTH: 0px; SOLID: color:#808080; font-size: 8pt; }
textarea   { font-family: "돋움, 돋움체, Verdana"; BACKGROUND-COLOR: #FFFFFF; BORDER-BOTTOM: #808080 1px solid; BORDER-LEFT: #808080 1px solid; BORDER-RIGHT: #808080 1px solid; BORDER-TOP: #808080 1px solid; COLOR: #000000; FONT-SIZE: 9pt; padding:5 0 5 5}
.screen  { 
	width:150px; height:100px;
	font-family: "돋움, 돋움체, Verdana"; SCROLLBAR-FACE-COLOR: #86C3EC; BACKGROUND: NONE; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #1E81C4; SCROLLBAR-3DLIGHT-COLOR: #1E81C4; SCROLLBAR-ARROW-COLOR: #1E81C4; SCROLLBAR-TRACK-COLOR: #86C3EC; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; border:#1E81C4 0px solid; FONT-SIZE: 9pt;}
//-->
</style>

<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- title -->
<div class="title title_top">메일발송</div>

<!--// search //-->
<table style="border-collapse: collapse" border="4" bordercolor="#dce1e1" width="100%" class="tb_Message">
	<tbody>
	<tr>
  	<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
  		<div style="padding-top: 7px"><font class=g9 color=#666666>
  		- 받는사람은 최대 1000명까지 가능합니다.</br>
  		- 보내는 사람의 성명, 메일주소는 공통코드관리에서 변경할 수 있습니다.
  		</font></div>
  	</td>
  </tr>
	</tbody>
</table>
<!--// search end //-->
<!--space--><table class="space"><tr><td></td></tr></table>

<form name="mailform" id="mailform" method="post" action="/admin/common/mailForm.do"  enctype="multipart/form-data">
<input type="hidden" name="writerIp" value="<c:out value="${REQUEST_DATA.writerIp}"/>" />
<input type="hidden" name="SES_USERID" id="SES_USERID" value="<%=headerUserSessionVo.getUserId()%>"/>
<input type="hidden" name="SES_USERNAME" id="SES_USERNAME" value="<%=headerUserSessionVo.getUserName()%>"/>
<input type="hidden" name="usernoArr" id="usernoArr" value="${REQUEST_DATA.usernoArr}"/>
<input type="hidden" name="secsnMailYn" id="secsnMailYn" value="${REQUEST_DATA.secsnMailYn}"/>
<input type="hidden" name="UPLOAD_DIR" value="email"/>
<input type="hidden" name="filename" id="filename" value=""/>
<input type="hidden" name="fileName" id="fileName" value=""/>
<input type="hidden" name="filesCount" id="filesCount" value=""/>

<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;"> 
	<tr>
		<th class="table01_header" width="100">발송자 성명</th>
		<td class="table01_td"><input type="text" name="sender_username" id="sender_username" style="width:40%" class="line" value="<c:out value="${REQUEST_DATA.sendName}"/>"/></td>
	</tr>
	<tr>
		<th class="table01_header" width="100">발송자 메일주소</th>
		<td class="table01_td"><input type="text" name="sender_mailaddr" id="sender_mailaddr" style="width:40%" class="line" value="<c:out value="${REQUEST_DATA.sendAddr}"/>"/></td>
	</tr>

	<tr>
		<th class="table01_header">수신자 메일주소</th>
		<td class="table01_td" >
				<div style="line-height:35px">
					<input type="text" class="line" name="destAdd" style="width:80%;"/> 
					<a href="#" onclick="MsgMailUserAdd2();" class= "btn small green">추가</a>
					<a href="#" onclick="MsgMailUserRemove();" class= "btn small red">삭제</a>
				</div>
				<select  name="receiver_list"  multiple style="font-family:돋움,돋움체; font-size:9pt; color:#646464;padding:0 0 0 0;width:100%; height:80px">
					<c:forEach var="result" items="${emailInfo}">
						<c:if test="${not empty emailInfo}">
							<option value="${result.EMAIL}"><c:out value="${result.EMAIL}" /></option>
						</c:if>
					</c:forEach>
				</select>
				<div style="line-height:25px" align="right">
					<font id="recnt">0</font> / 1000  
				</div> 
		</td>
	</tr>
	<tr>
		<th class="table01_header">제목</th>
		<td class="table01_td"><input type="text" name="subject" id="subject" style="width:100%" class="line"/></td>
	</tr>
	<tr>
		<td class="table01_td" colspan="2" height="300"> 
			<div>
				<!-- [필수]에디터 안에 글내용 영역 -->
				<textarea name="content" id="content" rows="15" style="width:100%;" ><%-- <c:out value="${emailTplMap.CONTENT}" escapeXml="false"/> --%></textarea>
			</div>
		</td>
	</tr>
	<tr>
       	<th>파일첨부</th>
		<td class="td-input-wrap" colspan="3">
		<div id="eduDate_" class="input-wrap mb15">
			<div class="file-wrap">
				<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
				<div class="file_input_div">
				  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
					<span class="timebtn">
						<a class="scale-down btn blue small" onclick="fnAdd();return false" title="추가">추가</a>
						<a class="scale-down btn red small" id="fnDel" title="삭제">삭제</a>
					</span>
				</div>
			</div>
		</div>
		</td>
       </tr>
</table>
</form>
		
<!--space--><table class="space"><tr><td></td></tr></table>

<!--버튼 시작-->
<table width=100% border=0 cellspacing=0 cellpadding=0>
	<tr>
		<td align="center">
		<a href="#" onclick="goMailExec()" class= "btn sky big">전송</a>
		<a href="#" onclick="window.close();" class= "btn gray big">취소</a>
		</td>
	</tr>
</table>

<script type="text/javascript">
	function fnAdd() {
		
		if ( $(".td-input-wrap").children(".input-wrap").length > 8) {
			alert('9개까지 등록 가능합니다.');
			return;
		}
		$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='hidden' id='fileName' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'> <input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange(this.value , 0);'>	<span class='timebtn'><a class='scale-up btn blue small' onclick='fnAdd();return false' title='추가'>추가</a> <a class='scale-down btn red small' id='fnDel' title='삭제'>삭제</a></span></div></div></div>");
	}
	
	var delNum = "";
	//파일 변경값
	function fnChange(  pval , fileId) {
		if(fileId != 0){
			if(confirm("기존파일은 삭제됩니다 수정하시겠습니까")){
				delNum = fileId + "," + delNum ;
			}else{
				return false;
			}
		}
		$("#delNum").val(delNum);
	}

	$(document).on('click', '#fnDel', function(){ 
		if ( $(".td-input-wrap").children("#eduDate_").length == 1) {
			alert("더이상 삭제하실 수 없습니다.");
			return;
		}
		$(this).closest("#eduDate_").remove();
	});
	
	function goMailExec(){
		var form = document.mailform;
		
		if($("#subject").val() == '') {
			alert("제목을 입력해주세요.");
			$("#subject").focus();
			return;
		}
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	    form.content.value = document.getElementById("content").value;
		
	    //내용 필수 입력
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		}
		
 		var list = document.mailform.receiver_list;
		if(list.length < 1) {
			alert("수신자 메일주소를 입력해주세요.");
			return;
		}
		// 안내 메시지
		// alert("메일 발송이 오래 걸릴 수 있으니 완료 메시지가 나올 때 까지 기다려주세요.");

		var fileNum = $("#filesCount").val() * 1 + 1;
		if(confirm("메일을 전송하시겠습니까?\n메일 발송이 오래 걸릴 수 있으니 완료 메시지가 나올 때 까지 기다려주세요.")) {
			$(".td-input-wrap").children("#eduDate_").each(function(){
				$(this).attr("id","eduDate_"+fileNum);
				$(this).children().find(".inputtxt").attr("id","fileName"+fileNum);
				$(this).children().find(".file_input_hidden").attr("id","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("name","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("onchange",fileNum+", this.value, 0");
				$(this).children().find(".scale-down").attr("onclick","fnDel("+fileNum +");return false");
				fileNum = fileNum + 1;
			});
			
			for(var i =0; i<list.length; i++){
				form.receiver_list[i].selected = true;
			}
	 
			$("#mailform").attr("method", "POST").attr("action", "/admin/common/mailExec.do").submit();
		}
	}
</script>
<!--버튼 끝-->

<!--끝-->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});


function MsgMailUserAdd2()
{
	var days = document.mailform.receiver_list;
	var dest = document.mailform.destAdd.value;

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
</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>
