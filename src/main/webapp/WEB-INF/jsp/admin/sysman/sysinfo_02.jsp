<%/****************************************************
    system	: 시스템관리 > 로그관리
    title	: 실시간접속세션정보
    summary	:
    wdate	: 2013-10-26
    writer	: 송호현
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<%@ page import="java.util.concurrent.ConcurrentHashMap" %>
<%@ page import="com.sangs.session.UserSessionVO" %>
<%@ page import="com.sangs.session.SessionManager" %>
<%@ page import="com.sangs.session.UserSessionManager" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    SessionManager sessManager = SessionManager.getInstance();
    ConcurrentHashMap<String, HttpSession> userMap = sessManager.getLoginSessionMap();
    int userCnt = userMap.size();

%>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">실시간접속세션<span></span></div>

<!-- 본문 > 상단 > 안내문구 시작 -->
<table width="100%" class="tb_Message">
    <tbody>
    <tr>
        <td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
            <div style="padding-top: 5px"><b>※ 사이트 실시간 접속자 현황을 관리합니다. </b></div>
        </td>
    </tr>
    </tbody>
</table>
<br/>
<!-- 본문 > 상단 > 안내문구 끝 -->

<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class="pageinfo">현재 <span class="red"><b><%=userCnt %></b></span> 명이 접속하고 있습니다.</td>
        <td align=right> </td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<table class="tb table-type1">
    <tr class="rndbg">
        <th>userNo</th>
        <th>아이디</th>
        <th>성명</th>
        <th>마지막접속시간</th>
        <th>마지막접속URI</th>
        <th>아이피주소</th>
        <th>세션ID</th>
    </tr>
    <%
    Set e = userMap.keySet();
    Iterator iter = e.iterator();
    String key = null;
    int i = 1;
    while ( iter.hasNext() ) {
        key = iter.next().toString();
        HttpSession ses = (HttpSession) userMap.get(key);
        String sessingString = (String)ses.getAttribute(SangsProperties.getProperty("Globals.loginSessionNm"));
        Gson gson = new Gson();
        UserSessionVO userSessionVO = gson.fromJson(sessingString, UserSessionVO.class);

        String ipAddr = "";
        String ipAddr1 = "";
        String ipAddr2 = "";

        ipAddr = userSessionVO.getIpAddr();
        if(ipAddr != null) {
            ipAddr1 = ipAddr.substring(0,8);
            ipAddr2 = ipAddr.substring(8,ipAddr.length());
            ipAddr2 = ipAddr2.replaceAll("[\\d]", "*");
        }
        ipAddr = ipAddr1 + ipAddr2;
        
     %>
    <tr>
        <td align="center"><%=userSessionVO.getUserNo() %></td>
        <td align="center"><%=userSessionVO.getUserId() %></td>
        <td align="center"><%=userSessionVO.getUserName() %></td>
        <td align="center"><%=userSessionVO.getLastAccDate() %></td>
        <td align="center"><%=userSessionVO.getLastAccUrl() %></td>
        <td align="center"><%=ipAddr%></td>
        <td align="center"><%=userSessionVO.getSessionId() %></td>
    </tr>
    <%} %>
</table>

