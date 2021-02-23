<%
/****************************************
    subject	: [공통] 상단영역
    summary	: 상단영역
    author	: 이진영
    date	: 2016-03-28
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="com.sangs.util.SangsUtil" %>
<%@ page import="com.sangs.util.DateUtil" %>
<%@ page import="java.util.List"%>
<% 
    pageContext.setAttribute("crlf", "\r\n");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge;"/>
<!-- 이니페이 관련 META정보 -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<!-- <meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" /> -->

<title>포털 관리시스템</title>
<link rel="stylesheet" href="/admin/common/css/style.css"/>

<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/admin/common/js/jquery.alphanumeric.pack.js"></script>

<!-- 달력 사용을 위한 스크립트 및 css 호출 시작 -->
<script type="text/javascript" src="/admin/common/js/jquery-ui-1.9.0.custom.js"></script>
<script type="text/javascript" src="/admin/common/js/jquery.showLoading.js"></script>
<link rel="stylesheet" href="/admin/common/css/jquery-ui-1.9.0.custom.css"/>

<script type="text/javascript" src="/admin/common/js/lodash/lodash.js" charset="utf-8"></script>
<script type="text/javascript" src="/admin/common/js/underscore/underscore.string.js" charset="utf-8"></script>
<!-- <script>window.lodash = _; _.mixin(_.str.exports());</script> -->
<script src="/admin/common/js/json3/lib/json3.js"></script>

<script type="text/javascript" src="/admin/common/js/appcommon.js"></script>
<script type="text/javascript"src="/admin/common/js/message.js"></script>
<script type="text/javascript" src="/admin/common/js/common.js"></script>
<script type="text/javascript" src="/admin/common/js/admin.js"></script>

<!-- [JQPLOT] 공통 필수 코드 -->
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="/admin/common/jqchart/excanvas.js"></script><![endif]-->
<script type="text/javascript" src="/admin/common/jqchart/jquery.jqplot.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/plugins/jqplot.cursor.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/plugins/jqplot.dateAxisRenderer.min.js"></script>
<script type="text/javascript" src="/admin/common/jqchart/sangs.chart.js"></script>
<link rel="stylesheet" type="text/css" href="/admin/common/jqchart/jquery.jqplot.css" />

<!-- JUI add -->
<script type="text/javascript" src="/admin/common/jui/jquery-2.2.4.min.js"></script>
<!--<script type="text/javascript" src="/admin/common/jui/jui-core-master/dist/jui-core.js"></script>
<link rel="stylesheet" type="text/css" href="/admin/common/jui/jui-ui-master/dist/jui-ui.classic.css" />
<script type="text/javascript" src="/admin/common/jui/jui-ui-master/dist/jui-ui.js"></script> -->
<!-- <script type="text/javascript" src="/admin/common/jui/tree.js"></script> -->

<!-- TREE TABLE CSS add 20200722 (박진만) -->
<link rel="stylesheet" type="text/css" href="/admin/common/aui/common.css" />

<!-- AUIGRID add 20200722 (박진만) -->
<script type="text/javascript" src="/admin/common/aui/AUIGrid/AUIGridLicense.js"></script>
<script type="text/javascript" src="/admin/common/aui/AUIGrid/AUIGrid.js"></script>
<!-- <script type="text/javascript" src="/admin/common/aui/AUIGrid/ajax.js"></script> -->
<link rel="stylesheet" type="text/css" href="/admin/common/aui/AUIGrid/AUIGrid_style.css" />


<!-- 달력 사용을 위한 스크립트 및 css 호출 끝-->
<%
    DataMap headerRequestMap = (DataMap)request.getAttribute("REQUEST_DATA");
    EduMap cmmnRootMenuMap = (EduMap)request.getAttribute("CMMN_ROOT_MENU_DATA");
    List cmmnSubMenuList  = (List)request.getAttribute("CMMN_SUB_MENU_LIST");

    String cmmnRootMenuCode = headerRequestMap.getString("cmmnRootMenuCode");
    String cmmnSubMenuCode = headerRequestMap.getString("cmmnSubMenuCode");
    EduMap cmmnCurrentMenuMap = (EduMap)request.getAttribute("cmmnCurrentMenuMap"); // 선택한 메뉴 정보

    String menuDepth1 = "";
    String menuDepth2 = "";
    String menuDepth3 = "";

    if(cmmnCurrentMenuMap != null) {
        menuDepth1 = cmmnCurrentMenuMap.getString("P_MENU_CODE");
        menuDepth2 = cmmnCurrentMenuMap.getString("MENU_CODE");
        menuDepth3 = cmmnCurrentMenuMap.getString("SUB_CODE");
    }
    String ctx = SangsProperties.getProperty("Globals.domainSSL");
    String menuLink = "";

%>
<script type="text/javascript">

    $(document).ready(function(){

    	
    	_.templateSettings = {
    			interpolate: /\{\{\=(.+?)\}\}/gim,
    			evaluate: /\{\{([\s\S]+?)\}\}/gim,
    			escape: /\{\{\-(.+?)\}\}/gim
    		};
    	
    	
    	//input에 숫자만 입력받는 이벤트
    	$(document).on("keyup", ".i-numOnly" ,function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") ); });
    	$(document).on("blur", ".i-numOnly" ,function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") ); });
    	
        var menuDepth1 = $("#menuDepth1").val();
        var menuDepth2 = $("#menuDepth2").val();
        var menuDepth3 = $("#menuDepth3").val();

        
        if(menuDepth2.length == 9) {
            // 넘어온 menuDepth2 서브코드가 2뎁스일때

			if(menuDepth2 == menuDepth1+'001'){
				$(".title-menu").first().addClass("on");
			}else {
				$(".title-menu").first().removeClass("off");
				$("#"+menuDepth2).addClass("on");
			}
            
            
           
            // 넘어온 서브코드에 3뎁스 정보가 있는경우.
            if(menuDepth3 != null && menuDepth3 != '') {

                //3뎁스 박스 창 보여주기
                $("."+menuDepth2).each(function() {
                    $(this).removeClass("on");
                    //$(this).addClass("off");
                    $(this).show("fast");
                });
                //3뎁스 메뉴 선택
                $("div[id^='menuLink_"+menuDepth3+"']").each(function() {
                    $(this).addClass("on");
                });
            }
        }
        else if(menuDepth2.length == 12) {
            // 넘어온 menuDepth2 서브코드가 3뎁스일때

            // 2뎁스 선택(상위)
            $("#"+menuDepth1).parent("p").removeClass("off");
            $("#"+menuDepth1).parent("p").addClass("on");
            $("#"+menuDepth1).removeClass("off");
            $("#"+menuDepth1).addClass("on"); 

            $("."+menuDepth1).each(function() {
                $(this).removeClass("on");
                //$(this).addClass("off");
                $(this).show("fast");
            });

            //3뎁스 메뉴 선택
            $("div[id^='menuLink_"+menuDepth2+"']").each(function() {
                $(this).addClass("on");
            });
        }

        // 메뉴 열기 닫기 이벤트 처리
        $(".no_click").click(function(event){
            var pid = $(this).attr("id");
             $("div[id^='menuLink_"+pid+"']").each(function() {

                if($(this).is(":visible")) $(this).hide("fast");
                else $(this).show("fast");
            });

        });
    });

    // 대메뉴 이동
    function fnMenuMove(menuUrl, menuCd, subMenuCd) {
        $("#cmmnRootMenuCode").val(menuCd);
        $("#cmmnSubMenuCode").val(subMenuCd);
        $("#adminMainFrm").attr("action" , menuUrl);
        $("#adminMainFrm").submit();
    }

    // 왼쪽메뉴 이동
    function fnLeftMenuMove(menuUrl, subMenuCd) {
        $("#cmmnSubMenuCode").val(subMenuCd);
        $("#adminMainFrm").attr("action" , menuUrl);
        $("#adminMainFrm").submit();
    }
    

</script>
</head>
<body class="scroll">
<div id="admin_header"><!-- 메뉴 depth 정보 -->
<input type="hidden" id="menuDepth1" value="<c:out value="${menuDepth1}"/>"/>
<input type="hidden" id="menuDepth2" value="<c:out value="${menuDepth2}"/>"/>
<input type="hidden" id="menuDepth3" value="<c:out value="${menuDepth3}"/>"/>
    <ul>
        <li><img src="/admin/images/logo.png" alt="logo" /></li>
        <!-- 상단메뉴 시작 -->
        <c:forEach items="${cmmnRootMenuList}" var="result" varStatus="stat">
            <c:set var="cmmnRootMenuCode" value="${REQUEST_DATA.cmmnRootMenuCode}"/>
            <c:set var="liClass" value=""/>
            <c:choose>
                <c:when test="${result.MENU_CODE == cmmnRootMenuCode}"><c:set var="liClass" value="on"/></c:when>
                <c:otherwise><c:set var="liClass" value="off"/></c:otherwise>
            </c:choose>
            <li class="${liClass}"><a href="javascript:fnMenuMove('<c:out value="${result.DEFAULT_LINK}"/>', '<c:out value="${result.MENU_CODE}"/>', '<c:out value="${result.SUB_CODE}"/>')"><span><c:out value="${result.MENU_NAME}"/></span></a></li>
        </c:forEach>
        <li class="btn_logout">
            <span class="user_info"><c:out value="${headerUserSessionVo.userName}"/>(<c:out value="${headerUserSessionVo.userId}"/>)</span>
            <a href="/admin/main/chatting.do" onclick="javascript:window.open(this.href,'새창','width=300,height=570,scrollbars=yes');return false;" target="_blank"><span>채팅</span></a>
            <a href="/admin/common/logout.do"><span>로그아웃</span></a>
        </li>
        <!-- 상단메뉴 끝 -->
    </ul>
</div>
<form id="fd_fileDownFrm" name="fileDownFrm" method="post" action="/admin/filedown.do" >
	<input type="hidden" name="filepath" value=""/>
	<input type="hidden" name="filename" value=""/>
	<input type="hidden" name="realFilePath" value=""/>
	<input type="hidden" name="orgfilename" value=""/>
	<input type="hidden" name="encYn" value=""/>
	<input type="hidden" name="downType" value=""/>
	<input type="hidden" id="sampleDown" name="sampleDown"  value="sampleDown"/>
</form>
<iframe name="hiddenDownloadFrame" title="hiddenDownloadFrame" style="width: 0px; height:0px;display:none;"></iframe>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
    <tbody>
    <tr>
        <c:if test="${fn:length(cmmnSubMenuList) > 0}">
        <!-- 왼쪽 메뉴시작 -->
            <td id="leftMenu" valign="top">
                <table border="0" cellspacing="0" cellpadding="0" height="100%">
                    <tbody>
                    <tr>
                        <td height="100%" valign="top">
                             <dl class="menu-group">
                                <dd class="menu">
                                    <c:forEach items="${cmmnSubMenuList}" var="result" varStatus="stats">
                                        <c:set var="menuDiv">0</c:set>
                                        <c:choose>
                                            <c:when test="${result.MENU_DIV == '2'}">
                                                <c:if test="${result.LINK != null}">
                                                    <p class="title-menu" id="<c:out value="${result.MENU_CODE}"/>">
                                                        <a href="javascript:fnLeftMenuMove('<c:out value="${result.LINK}"/>', '<c:out value="${result.MENU_CODE}"/>')" class="menuLink" id="<c:out value="${result.MENU_CODE}"/>" name="navi"><c:out value="${result.MENU_NAME}"/></a>
                                                    </p>
                                                </c:if>
                                                <c:if test="${result.LINK == null}">
                                                    <p class="title-menu" id="<c:out value="${result.MENU_CODE}"/>">
                                                        <a href="#" class="no_click" id="<c:out value="${result.MENU_CODE}"/>"><c:out value="${result.MENU_NAME}"/></a>
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="sub-menu <c:out value="${result.P_MENU_CODE}"/>" id="menuLink_<c:out value="${result.MENU_CODE}"/>" style="display:none">
                                                    <c:set var="menuLink"><c:out value="${result.LINK}"/>?cmmnSubMenuCode=<c:out value="${result.MENU_CODE}"/></c:set>
                                                    <a href="javascript:fnLeftMenuMove('<c:out value="${menuLink}"/>', '<c:out value="${result.MENU_CODE}"/>')" class="menuLink" id="<c:out value="${result.MENU_CODE}"/>" name="navi"><c:out value="${result.MENU_NAME}"/></a>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="menuDiv"><c:out value="${result.MENU_DIV}"/></c:set>
                                    </c:forEach>
                                </dd>
                                <dd class="menu-bottom"></dd>
                            </dl>
                            <div style="padding-left:7px" id="s2panelside"></div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
            <!-- 왼쪽 메뉴 끝 -->
        </c:if>

        <!--- 전체 보기 용 ------------------------------->
        <td style="display: none" id=sub_left_menu valign=top width="11"></td>

        <!--- 서브 본문 맨상단시작, 네비, 배너 ------------------------------->
        <td height="100%" valign=top width="100%">
            <table border="0" cellspacing="0" cellpadding="0" width="100%" height="21" style="display:none;">
                <tbody>
                    <tr>
                        <td width="100%"><div style="padding-bottom:4px; padding-left:12px; padding-right:0px; padding-top:0px">
                        <a href="#none" style="display: none; width:100px; margin-top:10px;" id="btn_menu" class="btn blue verysmall" onclick="hiddenLeft();">MENU OPEN</a></div></td>
                    </tr>
                </tbody>
            </table>
            <!--- 서브 본문 기본 골격 시작 --->
            <table border=0 cellspacing=0 cellpadding=0 width="100%" height="100%" bgcolor=white>
                <tbody>
                <tr>
                    <td class="admin_body" style="padding-left: 12px;padding-right:12px; padding-bottom:30px;" valign="top">
                    <form name="adminMainFrm" id="adminMainFrm" method="post" action="">
                        <input type="hidden" name="cmmnRootMenuCode" id="cmmnRootMenuCode" value="<c:out value="${REQUEST_DATA.cmmnRootMenuCode}"/>"/>
                        <input type="hidden" name="cmmnSubMenuCode" id="cmmnSubMenuCode" value="<c:out value="${REQUEST_DATA.cmmnSubMenuCode}"/>"/>
                    </form>
