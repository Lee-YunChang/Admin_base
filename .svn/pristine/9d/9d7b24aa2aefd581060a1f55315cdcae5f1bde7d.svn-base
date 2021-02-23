<%
/****************************************
    system  : ClassDesk > 수강생 > 콘텐츠 로드 index 페이지
    title   : 콘텐츠 로드를위한 index페이지
    summary :   
    wdate   : 2013-08-14
    writer  : jang Sun Ah
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<c:set var="contentsRootUri" value='<%=SangsProperties.getProperty("Globals.ContentsRootUri")%>'/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="/classdesk/common/css/classdesk.css" />
	<link rel="stylesheet" type="text/css" href="/classdesk/common/css/jquery-ui-1.9.0.custom.css">
	
	<script type="text/javascript" src="/classdesk/common/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/classdesk/common/js/jquery-ui-1.9.0.custom.js"></script>
	
	<script type="text/javascript" src="/classdesk/common/js/jquery-control.js"></script>
	<script type="text/javascript" src="/common/js/sangs_core.js"></script>
</head>


    <%-- <c:set var="URL" value="${DOMAIN}${treeData.FILE_PATH}/${treeData.TREE_FILE_PATH}/${treeData.START_FILE}"/> --%>
    <c:set var="URL" value="${DOMAIN}${contentsRootUri}${treeData.FILE_PATH}"/>
    <c:set var="COURSENO" value="${REQUEST_DATA.courseno}"/>
    <c:set var="CSEQNO" value="${REQUEST_DATA.cseqno}"/>
    <c:set var="CUSERNO" value="${REQUEST_DATA.cuserNo}"/>
    <c:set var="TREENO" value="${REQUEST_DATA.treeno}"/>
    <c:set var="GRADENO" value="${REQUEST_DATA.SES_GRADENO}"/>
    <c:set var="FRAMECNT" value="${treeData.FRAMECNT}"/>
    <c:set var="CONURL" value="${treeData.FRAMECNT}"/>
    <c:set var="FRAMESEQ" value="${treeHistData.FRAMESEQ}" />
    <c:set var="MOVSEC" value="${treeHistData.MOVSEC}" />
	<c:set var="FRAMESEQ_BAK" value="${treeHistData.FRAMESEQ}" />
	<c:set var="ISPASS" value="${REQUEST_DATA.ispass}" />
	
	<c:if test="${ FRAMECNT eq FRAMESEQ && FRAMECNT ne 3 }">
		<c:set var="FRAMESEQ" value="1" />
	</c:if>

	<frameset rows="0, 1*" cols="1*" border="0">
		<frame name="top" scrolling="no" marginwidth="0" marginheight="0" src="<c:out value="${ctx}"/>/classdesk/online/blank.jsp" target_frame="top" noresize>

		<%-- <frame name="main" scrolling="auto" marginwidth="0" marginheight="0"  src="<c:out value="${URL}"/>?courseno=<c:out value="${COURSENO}"/>&cseqno=<c:out value="${CSEQNO}"/>&cuserNo=<c:out value="${CUSERNO}"/>&treeno=<c:out value="${TREENO}"/>&gradeno=<c:out value="${GRADENO}"/>&frameCnt=<c:out value="${FRAMECNT}"/>&frameSeq=<c:out value="${FRAMESEQ}" default="1"/>&frameSeqBak=<c:out value="${FRAMESEQ_BAK}" default="1"/>&movsec=<c:out value="${MOVSEC}" default="0"/>&ispass=<c:out value="${ISPASS}" default="0"/>" noresize target_frame="main"> --%>
		<frame name="main" scrolling="auto" marginwidth="0" marginheight="0"  src="${URL}" noresize target_frame="main">

		<noframes> 
			<body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
			</body>
		</noframes>
	</frameset>

</html>