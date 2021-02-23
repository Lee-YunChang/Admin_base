<%
/****************************************************
    system  : classdesk > 로그인
    title   : 로그인페이지
    summary :   
    wdate   : 2015-04-01
    writer  : SANGS
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    
    <link rel="stylesheet" href="/academy/common/css/common.css" type="text/css" />  
    <link rel="stylesheet" href="/academy/common/fancybox/css/jquery.fancybox.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/classdesk/common/css/jquery-ui-1.9.0.custom.css"/>
        
    <script type="text/javascript" src="/classdesk/common/js/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery-ui-1.9.0.custom.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/common/js/makePCookie.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.countdown.js"></script>
    <script type="text/javascript" src="/common/js/sangs_core.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/keysecurity.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.selectbox-0.2.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/design.js"></script>


    
    <title>::: 상상스토리 Class Desk :::</title>
 
    <script type="text/javascript">
        $().ready(function(){
            if($.cookie('save_id')) { //쿠키값이있다면
                $('#userId').val($.cookie('save_id')); //아이디세팅
                $('#save_id_chk:checkbox').attr('checked','checked'); //체크박스 세팅
                $('#pId').text(''); 
                $('#login_pwd').focus();
                
            }else{
                $('#login_id').focus(); 
            }
        });
        
        
        function go_exec() {
            if('' == $('#userId').val()) {
                alert('아이디를 입력해 주세요');
                $('#userId').focus();
                return;
            }
            if('' == $('#pwd').val()) {
                alert('비밀번호를 입력해 주세요');
                $('#pwd').focus();
                return;
            }
        
            if($('#save_id_chk:checkbox').prop('checked')){
                $.cookie('save_id',$('#userId').val(),{expires:7}); //일주일
                
            } else {
                $.cookie('save_id', '', { expires: -1 }); //쿠키삭제
            }
            
            if ($.cookie('classdeskCookieParamCourseNo')) {
                $('#paramCourseNo').val($.cookie('classdeskCookieParamCourseNo'));
            } else {
                $('#paramCourseNo').remove();
            }
            
            if ($.cookie('classdeskCookieParamcSeqNo')) {
                $('#paramcSeqNo').val($.cookie('classdeskCookieParamcSeqNo'));
            } else {
                $('#paramcSeqNo').remove();
            }
            
            if ($.cookie('classdeskCookieParamcUserNo')) {
                $('#paramcUserNo').val($.cookie('classdeskCookieParamcUserNo'));
            } else {
                $('#paramcUserNo').remove()
            }
            
            if ($.cookie('classdeskCookieParamUserNo')) {
                $('#userNo').val($.cookie('classdeskCookieParamUserNo'));
            } else {
                $('#userNo').remove();
            }
            
            $('#frm').submit();
        }
        
        function enterChk() {
            if(event.keyCode == 13) {
                go_exec();
            }
        }
    </script>
 
</head>
<body>
    <div id="contents">
        <div class="ad_login_wrap">
            <div class="ad_login_title">
                <h2><img src="/academy/images/academy/login_title.gif" alt="MEMBER LOGIN" /></h2>
                <p>학사관리시스템에 오신 것을 환영합니다.<br />가입된 아이디, 비밀번호로 로그인하시면 강의실에서 온라인 교육과정을 수강할 수 있습니다.</p>
            </div>
            <form name="frm" id="frm" action="/classdesk/cmmn/loginExec.do" method="post" target="_self">
                <input type="hidden" id="paramCourseNo" name="paramCourseNo"/>
                <input type="hidden" id="paramcSeqNo" name="paramcSeqNo"/>
                <input type="hidden" id="paramcUserNo" name="paramcUserNo"/>
                <input type="hidden" id="userNo" name="userNo"/>
                <input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>"/>
                
                <div class="ad_login_box">
                    <div class="ad_login_box_in">
                        <ul>
                            <li class="ad_login_left">
                                <div class="ad_login_input"><input type="text" id="userId" name="userId" title="로그인 아이디" /><p id="pId">아이디</p></div>
                                <div class="ad_login_input"><input type="password" id="pwd" name="pwd" autocomplete="off" title="로그인 비밀번호" /><p>비밀번호</p></div>
                            </li>
                            <li class="ad_login_right"><input type="image" src="/academy/images/academy/btn_l_login.gif" id="login_btn" title="로그인" onclick="javascript:go_exec();return false;" /></li>
                            <li class="ad_login_btm">
                                <span><input type="checkbox" id="save_id_chk" /><label for="save_id">아이디 저장</label></span>
                                <span><a href="/academy/user/memberJoinAgree.do" target="_new">회원가입</a> | <a href="/academy/user/member/memberIdPw.do" target="_new">아이디/비밀번호 찾기</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>