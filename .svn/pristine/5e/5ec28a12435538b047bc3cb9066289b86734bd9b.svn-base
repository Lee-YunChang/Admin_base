<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>포털 관리시스템</title>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/admin/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/admin/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/admin/common/js/rsa/rng.js"></script>
<script type="text/javascript" src="/admin/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/admin/common/js/rsa/base64.js"></script>
<link rel="stylesheet" href="/admin/common/css/style.css" type="text/css" />


<script type="text/javascript">

function go_exec() {
	if('' == $('#userid').val()) {
		alert("아이디를 입력해 주세요");
		$('#userid').focus();
		return;
	}
	if('' == $('#pwd').val()) {
		alert("비밀번호를 입력해 주세요");
		$('#pwd').focus();
		return;
	}

    var securedLoginForm = document.getElementById("frm");
    
    securedLoginForm.securedUserId.value = fn_encrypt(encodeURIComponent($('#userid').val()));
//     securedLoginForm.securedPassword.value = fn_encrypt(encodeURIComponent($('#pwd').val()));

    // 웹 취약점으로 인해 20190503 변경
    securedLoginForm.securedPassword.value = $('#pwd').val();
//     securedLoginForm.securedUserId.value = $('#userid').val();
    
//     $('#userid').val(fn_encrypt(encodeURIComponent($('#userid').val())));
//     $('#pwd').val(fn_encrypt(encodeURIComponent($('#pwd').val())));
	// 웹 취약점으로 인해 20190503 변경
    $('#userid').val('');
    $('#pwd').val('');
    
    var rsaPublicKeyModulus  = $("#rsaPublicKeyModulus").val();
    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
    
    submitEncryptedForm(securedLoginForm.securedUserId.value, securedLoginForm.securedPassword.value, rsaPublicKeyModulus, rsaPublicKeyExponent);
    
    
	/* $('#frm').submit(); */
}


function submitEncryptedForm(userId, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
	
	
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var securedUserId = rsa.encrypt(userId);
    var securedPassword = rsa.encrypt(password);

    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var frm = document.getElementById("frm");
    frm.securedUserId.value = securedUserId;
    frm.securedPassword.value = securedPassword;
    
/*     alert('${sessionScope.aaa }');
    alert('${sessionScope.__rsaPrivateKey__ }'); */
    
    $('#frm').submit();
    /* frm.submit(); */
}


function enterChk() {
	if(event.keyCode == 13) {
		go_exec();
	}
}
//비밀번호 변경
function fn_encrypt(str){
	return fn_encode(escape(str));
}

function fn_encode(input){
	var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	var output = "";
	var chr1,chr2,chr3;
	var enc1, enc2, enc3, enc4;
	var i =0;
	do{
		chr1 = input.charCodeAt(i++);
		chr2 = input.charCodeAt(i++);
		chr3 = input.charCodeAt(i++);
		enc1 = chr1 >> 2;
		enc2 = ((chr1 & 3) <<  4 | (chr2 >> 4));
		enc3 = ((chr2 & 15) <<  2 | (chr3 >> 6));
		enc4 = chr3 & 63;
		if(isNaN(chr2)){
			enc3 = enc4 =64;
		}else if(isNaN(chr3)){
			enc4 =64;
		}
		output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4);
		
	}while(i<input.length);
	return output;
}

</script>
</head>
<body style="background:#f2edea;">
<div id="Login">
	<div class="bg_blue">
		<h1> <img src="/admin/images/logo_login.png" alt="상상스토리 교육시스템" /></h1>
	</div>
	<div class="login_wrap">
		<h2>ADMINISTRATOR LOGIN</h2>

		<div class="login_box">
			<form name="frm" id="frm" action="/admin/common/loginExec.do" method="post">
			<input type="hidden" name="securedUserId" id="securedUserId" value="" />
		    <input type="hidden" name="securedPassword" id="securedPassword" value="" />
		    <input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
			<input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
		           	
				<div>
					<input type="text" id="userid" name="userId" title="아이디" placeholder="ID" class="login" style="width:274px;" />
					<input type="password" autocomplete="off" id="pwd" name="pwd" title="비밀번호" placeholder="Password" class="login" style="width:274px;" onkeypress="enterChk();" AUTOCOMPLETE="off"/>
				</div>

				<div class="clearfix">
					<button type="button" class="btn_login" onclick="go_exec();">로그인</button>
				</div>
			</form>
		</div>
	</div>
	<p align="center">Copyrights Ministry of environment. All Right Reserved.</p>
</div>
</body>
</html>