<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
 <%-- <%@ page import="com.sangs.util.CourseCmmCode" %> --%>
<%@ page import="java.util.List"%>

<!-- 엔터 처리 -->
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%pageContext.setAttribute("crlfblank", "\r\n    > "); %>
<%pageContext.setAttribute("lf", "\n"); %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="now" value="<%=new java.util.Date()%>"/>

<%-- 사용자 권한 전역 변수 --%>
<c:set var="SUPERGRADENO"><c:out value="${cfn:getProperty('Globals.userGradeNo_superAdmin')}"/></c:set>
<c:set var="TUTORGRADENO"><c:out value="${cfn:getProperty('Globals.userGradeNo_eduMan')}"/></c:set>
<c:set var="USERGRADENO"><c:out value="${cfn:getProperty('Globals.userGradeNo_normal')}"/></c:set>
<c:set var="COMPMNGRGRADENO"><c:out value="${cfn:getProperty('Globals.userGradeNo_compMngr')}"/></c:set>

<c:set var="CALLBACK"><c:out value="${cfn:getProperty('Globals.UMS_CALLBACK')}"/></c:set>
    
<c:set var="UPLOADQUIZ"><c:out value="${cfn:getProperty('Globals.classDeskQuizFilePath')}"/></c:set>
<c:set var="UPLOADBBS"><c:out value="${cfn:getProperty('Globals.classDeskBbsFilePath')}"/></c:set>
<c:set var="UPLOADREPORT"><c:out value="${cfn:getProperty('Globals.classDeskReportFilePath')}"/></c:set>
<c:set var="UPLOAD_REPORT_USER"><c:out value="${cfn:getProperty('Globals.report_user')}"/></c:set>
<c:set var="FILEROOTURL"><c:out value="${cfn:getProperty('Globals.addFileDomain')}"/>/<c:out value="${cfn:getProperty('Globals.addFileRooturi')}"/></c:set>

<c:set var="DOMAIN"><c:out value="${cfn:getProperty('Globals.domain')}"/></c:set>
<c:set var="IMG_DOMAIN"><c:out value="${cfn:getProperty('Globals.addFileDomain')}"/></c:set>
<c:set var="CDNURL"><c:out value="${cfn:getProperty('Globals.CDNURL')}"/></c:set>
<c:set var="FILR_ROOT"><c:out value="${cfn:getProperty('Globals.addFileRooturi')}"/></c:set>
<c:set var="COURSE_PATH"><c:out value="${cfn:getProperty('Globals.courseImgPath')}"/></c:set>

<c:set var="MAILSENDERALIASNAME"><c:out value="${cfn:getProperty('Globals.mailSenderAliasName')}"/></c:set>
<c:set var="MAILSENDERMAILADDR"><c:out value="${cfn:getProperty('Globals.mailSenderMailAddr')}"/></c:set>

<c:set var="CONTENTS_DOMAIN"><c:out value="${cfn:getProperty('Globals.contents_domain')}"/></c:set>
