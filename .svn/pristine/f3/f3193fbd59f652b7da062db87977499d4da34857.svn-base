<%
/****************************************************
    system	: 시스템관리 > 로그관리
    title	: 시스템정보
    summary	:
    wdate	: 2013-10-26
    writer	: 송호현
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<%@ page import="java.util.*, java.awt.*"%>

<%
    String[] stdPropNames =
    {
        // 일반적으로, 보안에 걸리지 않는 표준 시스템 프로퍼티
        "java.version",        	// 자바의 버전 ( "1.0.2", "1.1", "1.1.3", "1.2", ...)
        "java.class.version",  	// 자바 클래스 화일 포맷 버전
        "java.vendor",         	// 자바 가상머신 판매 회사
        "java.vendor.url",     	// 자바 가상머신 판매 회사의 URL
        "os.name",             	// 운영체제 이름 ( "Windows 95", "Windows NT",
                                // "Solaris", "SunOS", "MacOS", "Linux", "OS/2", "OSF1", ... )
        "os.version",          	// 운영체제 버전
        "os.arch",             	// 컴퓨터 기종 ( "x86", "sparc", ... )
        "line.separator",      	// 시스템에서의 행 분리 문자열 ( "\r\n", "\n", "\r" )
        "file.separator",      	// 화일 경로 이름내의 디렉토리 구분 문자 ("\", "/")
        "path.separator",		// 화일 경로 이름 리스트의 구분 문자 (";", ":")
                                // 일반적으로, 보안에 의한 접근 제한을 받는 표준 시스템 프로퍼티 (애플릿의 경우)
        "java.home",           	// JDK 설치 디렉토리
        "java.class.path",     	// 패키지가 있는 디렉토리 리스트
                                //  (일반적으로, CLASSPATH 환경변수값에 의해 영향 받음)
        "user.name",           	// 사용자의 등록 이름
        "user.home",           	// 사용자의 홈 디렉토리
        "user.dir",            	// 사용자의 현재 작업 디렉토리
    };

String name = null;
%>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">시스템 정보<span></span></div>

<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title"><b>Application Info</b></div>
<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" style="width:20%">
          <col class="celll" style="width:80%">
    </colgroup>
    <tbody>
        <tr>
            <th>Server Info</th>
            <td><%=application.getServerInfo()%></td>
        </tr>
        <tr>
            <th>Servlet Major Version</th>
            <td><%=application.getMajorVersion()%></td>
        </tr>
        <tr>
            <th>Servlet Minor Version</th>
            <td><%=application.getMinorVersion()%></td>
        </tr>
    </tbody>
</table>

<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title"><b>System properties</b></div>
<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" style="width:20%">
          <col class="celll" style="width:80%">
    </colgroup>
    <tbody>
    <%
    for( int i = 0; i < stdPropNames.length; i++ ) {
        name = stdPropNames[i];
    %>
    <tr>
        <th><%=name%></th>
        <td><%=System.getProperty( name )%></td>
    </tr>
    <%}%>

    <tr>
        <th>maybe.not.defined.property</th>
        <td><%=System.getProperty( name ) %></td>
    </tr>

    <%
        Properties props = System.getProperties();
        Properties props2 = (Properties) props.clone();
        for( int i = 0; i < stdPropNames.length; i++ ) {
            props2.remove( stdPropNames[i] );
        }
        Enumeration e= props2.keys();
        while( e.hasMoreElements() ) {
            name = (String) e.nextElement();
    %>
            <tr>
                <th style="word-break:break-all"><%=name %></th>
                <td style="text-align:left;word-break:break-all"><%=System.getProperty( name ) %></td>
            </tr>
    <%
        }
    %>
    </tbody>
</table>

<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title"><b>Methods to get locale information</b></div>

<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" style="width:20%">
          <col class="celll" style="width:80%">
    </colgroup>
    <tbody>
        <tr>
            <th>new java.io.InputStreamReader(System.in).getEncoding()</th>
            <td>
            <%
                out.println(new java.io.InputStreamReader(System.in).getEncoding() );
            %>
            </td>
        </tr>
        <tr>
            <th>java.util.Locale.getDefault().getLanguage()</th>
            <td>
            <%
                out.println(java.util.Locale.getDefault().getLanguage());
            %>
            </td>
        </tr>

        <tr>
            <th>java.util.Locale.getDefault().getCountry()</th>
            <td>
            <%
                out.println(java.util.Locale.getDefault().getCountry());
            %>
            </td>
        </tr>

        <tr>
            <th>java.util.Locale.getDefault().getVariant()</th>
            <td>
            <%
                out.println(java.util.Locale.getDefault().getVariant());
            %>
            </td>
        </tr>

        <tr>
            <th>java.util.TimeZone.getDefault().getID()</th>
            <td>
            <%
                out.println(java.util.TimeZone.getDefault().getID());
            %>
            </td>
        </tr>
    </tbody>
</table>