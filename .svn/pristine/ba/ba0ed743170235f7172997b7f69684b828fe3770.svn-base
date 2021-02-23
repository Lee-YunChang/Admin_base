<%
/****************************************
	system	: ClassDesk > 수강생 > 콘텐츠 frameset 세팅
	title	: 콘텐츠 frameset 세팅
	summary	:	
	wdate	: 2013-08-14
	writer	: jang Sun Ah
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta HTTP-EQUIV="Pragma" CONTENT="No-Cache" />
        <meta HTTP-EQUIV="Expires" CONTENT="0" />
        <title>::: 상상스토리 Class Desk :::</title>
        
        <link rel="stylesheet" type="text/css" href="/classdesk/common/css/classdesk.css" />
        <link rel="stylesheet" type="text/css" href="/classdesk/common/css/jquery-ui-1.9.0.custom.css"/>
        
        <script type="text/javascript" src="/classdesk/common/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="/classdesk/common/js/jquery-ui-1.9.0.custom.js"></script>
        <script type="text/javascript" src="/common/js/sangs_core.js"></script>
        
        <script type="text/javascript">
            window.resizeTo(970,750);
            window.moveTo(0.0);
            window.focus();
        </script>
        
    </head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
     
     <frameset rows="1,0,*" border="0">
        <!-- 학습 페이지(출석 CHECK) 관련 각종 FIELD를 저장하는 FRAME -->    
     	<frame src="<c:out value="${ctx}"/>/classdesk<c:out value="${rowData.CONURL}"/>?subcmd=frame&CONTENTS_WEB_FRAME_CNT=<c:out value="${treeData.FRAMECNT}"/>&CONTENTS_MULTI_DURA=&PROGRESS_ETC_INFO=&COMPLETE_YN=<c:out value="${treeHistData.MT_PROG_STATUS_CODE}"/>&URL=<c:out value="${treeData.FILE_PATH}"/>&treeno=<c:out value="${REQUEST_DATA.treeno}"/>&cuserNo=<c:out value="${REQUEST_DATA.cuserNo}"/>&courseno=<c:out value="${REQUEST_DATA.courseno}"/>&cseqno=<c:out value="${REQUEST_DATA.cseqno}"/>" scrolling="no" marginwidth="0" marginheight="0" name="pres_data">
     
        <!-- 학습 페이지(출석 CHECK) 관련 프로그램을 실행시키는 FRAME -->
         <frame src="<c:out value="${ctx}"/>/classdesk/online/blank.jsp" scrolling="auto" marginwidth="0" marginheight="0" name="pres">
         <frame src="<c:out value="${ctx}"/>/classdesk/online/blank.jsp" scrolling="no" marginwidth="0" marginheight="0" name="study_data">
    	    <noframes>
    	    	<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
    	    		<p>이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.</p>
    	    	</body>
    	    </noframes>
    	</frameset>