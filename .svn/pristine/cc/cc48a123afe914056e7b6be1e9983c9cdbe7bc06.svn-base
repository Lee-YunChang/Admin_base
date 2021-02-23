<%
/****************************************************
    system	: 시스템관리 > 로그관리
    title	: 실시간HEAP메모리관리
    summary	:
    wdate	: 2013-10-26
    writer	: 송호현
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<%@ page import="java.net.InetAddress" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.util.NumberFormatUtil"%>


<%
DataMap requestMap = (DataMap)request.getAttribute("REQUEST_DATA");
requestMap.setNullToInitialize(true);

  if (requestMap.getString("gc").equals("ok")) {
    System.gc();
    System.runFinalization();
  }
%>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">실시간 Heap 메모리 현황<span></span></div>
<!-- 본문 > 상단 > 안내문구 시작 -->
<table width="100%" class="tb_Message">
    <tbody>
    <tr>
        <td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
            <div style="padding-top: 5px"><b>※  실시간 Heap 메모리 현황을 관리합니다.</b></div>
        </td>
    </tr>
    </tbody>
</table>
<div class="space"></div>
<!-- 본문 > 상단 > 안내문구 끝 -->

<table class="table-type1 search_form">
    <colgroup>
    <col class="cellc" width="15%">
    <col class="celll" width="35%">
    <col class="cellc" width="15%">
    <col class="celll" width="35%">
    </colgroup>
    <tr>
        <th>호스트</th>
        <td><%= InetAddress.getLocalHost().getHostName() %> (<%= InetAddress.getLocalHost().getHostAddress() %>)</td>
        <th>측정시각</th>
        <td>
            <% SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분 ss초", Locale.KOREA); %>
            <%= formatter.format(new Date()) %>
        </td>
    </tr>
</table>

<div class="space"></div>

<%
Runtime rt = Runtime.getRuntime();
//Process process = rt.exec("ls -al");
long free = rt.freeMemory();
long total = rt.totalMemory();
long usedRatio = (total - free) * 100 / total;
long unusedRatio = free * 100 / total;
%>
<table class="tb table-type1">
    <tr class="rndbg"><th colspan="2">전체 가상머신 메모리 (<b><%=NumberFormatUtil.toString(total/1024)%> KB</b>)</th></tr>
    <tr>
        <td>
            <div>사용중인 메모리 (<b><%=NumberFormatUtil.toString( (total - free)/1024 )%> KB</b>)</div>
            <div><hr color="#CC3366" align=left size=10 width="<%= usedRatio %>%" noshade></div>
            <div><b>(<%= usedRatio %> %)</b></div>

        </td>
        <td>
            <div>남아있는 메모리 (<b><%=NumberFormatUtil.toString( free/1024 ) %> KB</b>)</div>
            <div><hr color="#0066FF" align=left size=10 width="<%= unusedRatio %>%" noshade></div>
            <div><b>(<%= unusedRatio %> %)</b></div>
        </td>
    </tr>
</table>

<div class="space"></div>

<div class="button" align="center">
<!-- <a href="sysinfo.do?subcmd=01&gc=ok"><b>[가비지컬렉션 실행]</b></a>
&nbsp;&nbsp;&nbsp; -->
<a href="/admin/sysman/sysinfo01.do?cmmnSubMenuCode=ADM007006002"><b>[다시 읽기]</b></a>
</div>

<meta http-equiv="Refresh" content="10;url=/admin/sysman/sysinfo01.do?cmmnSubMenuCode=ADM007006002">

