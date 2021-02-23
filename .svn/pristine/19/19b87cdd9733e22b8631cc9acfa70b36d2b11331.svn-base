<%--
    Description : 아카데미 헤더
     
    Modification Information
    수정일     수정자         수정내용
    -------     -----------------------------------
    2015.04.08  SANGS           최초작성

--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <link rel="stylesheet" type="text/css" href="/classdesk/common/css/jquery-ui-1.9.0.custom.css"/>
    <link rel="stylesheet" type="text/css" href="/classdesk/common/css/classdesk.css" />
        
    <script type="text/javascript" src="/classdesk/common/js/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery-ui-1.9.0.custom.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.cookie.js"></script> 
    <script type="text/javascript" src="/common/js/makePCookie.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.countdown.js"></script>
    <script type="text/javascript" src="/common/js/sangs_core.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/keysecurity.js"></script>
    
    
    <title>::: 상상스토리 교육시스템 강의실 :::</title>
    
    <script type="text/javascript">
    //<![CDATA[
    var menuCd = "<c:out value='${topMenuCode}'/>";  // 상단 메뉴코드
    //]]>
    
    jQuery(document).ready(function() {
    
        //상단 메뉴 on / off 처리
        if(jQuery("#gnb").find("ul li span").hasClass(menuCd)){
            jQuery("."+menuCd)
                .parent()
                .addClass(jQuery("."+menuCd).parent().attr("class")+" on");
        }
        
     
        $.browser.chrome = $.browser.webkit && !!window.chrome;
        $.browser.safari = $.browser.webkit && !window.chrome;
             
        var w1 = parseInt(screen.width);
        var h1 = parseInt(screen.height);
        
        if($.browser.chrome == true) {
            window.resizeTo(w1, h1); 
        } else if($.browser.mozilla == true) {
            // alert("mozilla");
        }
        /*
        else if($.browser.msie == true) {
         //   alert("IE");
        }
        else if($.browser.safari == true) {
         // alert("safari");
        }   
        else if($.browser.opera == true) {
         //   alert("Opera");
        }
        */
    });
    
    </script>
</head>
<body>

<iframe id="_cm" name="_cm" title="hidden command page" style="display:none"></iframe>

<%--
<b>REQUEST_DATA</b><br/>
REQUEST_DATA.SES_GRADENO : ${REQUEST_DATA.SES_GRADENO}<br/> 
USERGRADENO : ${USERGRADENO}<br/>
SUPERGRADENO : ${SUPERGRADENO}<br/>
REQUEST_DATA.SES_GRADENO : ${REQUEST_DATA.SES_GRADENO}<br/>
TUTORGRADENO : ${TUTORGRADENO}
<br/>
<br/>
<b>COMMON_DATA</b><br/>
COMMON_DATA.CLASS_DESK : ${COMMON_DATA.CLASS_DESK}<br/>
--%>

<!-- header -->
<div id="header" class="clearfix">
    <!-- tnb영역 -->
    
    <!-- //tnb영역 --> 
	<a href="#content" class="skip">본문 바로가기</a>
	
	<a href="#" class="menu_toggle" style="display: none;"><img src="/classdesk/images/menu_toggle.png" alt="메뉴 열기" /></a>
	
    <!-- gnb메뉴 -->
    <div id="gnb" class="menu_toggle_close">
        
        <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
        <!-- gnb메뉴의 on/off 효과는 css로 처리됨 (on상태일 경우 a태그 class="on" 추가) -->
         <ul>
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/main.do" class="gnb_menu0"><span class="main">강의실 메인</span></a>
            </li>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,0,1) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/progress/tree_list.do" class="gnb_menu1"><span class="study">온라인학습</span></a>
            </li>
			</c:if>
			 <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,2,3) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/exam/list.do" class="gnb_menu3"><span class="test">시험</span></a>
            </li>
            </c:if>
            <li>
				<a href="<c:out value="${ctx}"/>/classdesk/tutor/result/result_form.do" class="gnb_menu4"><span class="result">성적</span></a>
            </li>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,3,4) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/poll/list.do" class="gnb_menu5"><span class="survey">설문</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,4,5) == 1}">
	            <li>
	                <a href="<c:out value="${ctx}"/>/classdesk/bbs/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassNotice')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassNotice')}"/>" class="gnb_menu6"><span class="notice">공지사항</span></a>
	            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,5,6) == 1}">
	            <li>
	                <a href="<c:out value="${ctx}"/>/classdesk/bbs/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassData')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassData')}"/>" class="gnb_menu7"><span class="data">자료실</span></a>
	            </li>
            </c:if>
        </ul>
        </c:if>
        
        <a href="#" class="menu_toggle_close" style="display:none;"><img src="/classdesk/images/menu_toggle_close.png" alt="메뉴 열기" /></a>
        
    </div>
    
    <!-- //gnb메뉴 -->
    <div class="header-line"></div>
</div>
<!-- //header -->
<!-- 개설과목명 -->

<!-- content -->
<div id="content">  