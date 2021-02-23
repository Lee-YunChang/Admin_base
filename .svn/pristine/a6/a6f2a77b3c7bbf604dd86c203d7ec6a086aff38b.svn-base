<%
/****************************************************
    system	: 팝업
    title	: 팝업
    summary	:
    wdate	: 2016-05-16
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

<script type="text/javascript" src="/admin/common/js/appcommon.js"></script>
<script type="text/javascript" src="/admin/common/js/message.js"></script>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/admin/common/js/admin.js"></script>

<%-- <%
    String popContent = REQUEST_DATA.popContent;
    popContent = SangsUtil.getCheckXSS2(popContent);
%> --%>

<script type="text/javascript">

	function setCookie(name,value,expiredays) {
	    var todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	function closeWin() {
		var popNo = $("#popNo").val();
	    if(document.getElementById("close_view").checked) {
	        setCookie("main_popup_<c:out value="+ popNo +"/>", "done" , 1);
	    }
	    windowClose();
	}
	
	function windowClose() {
	    if (/MSIE/.test(navigator.userAgent))  {
	        //Explorer 8이상일때
	        if(navigator.appVersion.indexOf("MSIE 8.0")>=0)  {
	            window.opener='Self';
	            window.open('','_parent','');
	            window.close();
	        } else if(navigator.appVersion.indexOf("MSIE 7.0")>=0) {
	             //Explorer 7이상일때
	            window.open('about:blank','_self').close();
	        } else {
	              //Explorer 7미만일때
	            window.opener = self;
	            self.close();
	        }
	    } else{
	        //window.open('about:blank','_self').close();''
	        window.close();
	    }
	}
	$(document).ready(function(){
 		var decoded = strip($("#content").val());
		function strip(html) {
		   var tmp = document.createElement("div");
		   tmp.innerHTML = html;
		   return tmp.textContent||tmp.innerText;
		} 
		$("#contentBox").text(decoded);
	});
</script>
<style type="text/css">
    .anoView { position: absolute; bottom: 0; left: 0; width: 100%; background-color:#ddd; }
    .anoView p { color:#484848; text-align:right;  height:23px; line-height:23px; padding-right:15px; }
</style>
<input type="hidden" name="popNo" id="popNo" value="${REQUEST_DATA.popNo}"/>
<input type="hidden" name="content" id="content" value="${REQUEST_DATA.content}"/>
<!-- 팝업내용 --> 
<div id="contentBox"></div>
<div class="anoView"><p><input type="checkbox" name="close_view" id ="close_view" onclick="closeWin()" style="margin-left:10px;" /><label for="close_view"> 오늘 하루 이 창을 열지 않음 </label><span id="close_btn"><a href="javascript:windowClose()">[닫기]</a></span></p></div>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	