<%
/****************************************
	system	: ClassDesk > 수강생 > 콘텐츠 fram 
	title	: 콘텐츠 frame 
	summary	:	
	wdate	: 2013-08-14
	writer	: jang Sun Ah
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<c:out value="${REQUEST_DATA.URL}"/>
 
<html>
    <script type="text/javascript" src="<c:out value='/classdesk/common/js/jquery-1.8.2.js'/>"></script>
    <script type="text/javascript" src="<c:out value='/classdesk/common/js/common_contents.js'/>"></script>
 
    <script  type="text/javascript" >
    function fncMoveCont()
    { 
        //top.opener.top.init.document.location.reload();
        
        top.study_data.document.location.href='<c:out value="${DOMAIN}${REQUEST_DATA.URL}"/>';    
    }
    </script>

    <!-- onUnload="javascript: alert('언로드 11'); pres_check_unload(f_pres_data.CURRENT_PAGE.value);"   -->
    <body   onLoad="javascript:fncMoveCont()">
        <form name="f_pres_data" >
        	<input type=text name="STUDY_GRT_CD" value='<c:out value="${REQUEST_DATA.SES_GRADENO}"/>'> <!-- 권한코드 -->
         
        	<input type=text name="CONTENTS_WEB_FRAME_CNT" value="">
        	<input type=text name="CONTENTS_MULTI_DURA" value="">
        	<input type=text name="CONTENTS_UNIT_NM" value="">
        	<input type=text name="CONTENTS_ID" value="">
        	<input type=text name="CONTENTS_SEQ" value="">
        	<input type=text name="CURRENT_PAGE" value="">
        	<input type=text name="CURRENT_STUDY_URL" value="">
        	<input type=text name="PREVIEW_STUDY_URL" value="">	
        	<input type=text name="PROGRESS_ETC_INFO" value="">
        
        	<input type=text name="LEC_STATUS_CD" value="">	
        	<input type=text name="COMPLETE_YN" value="">  
        
        	<!-- 상상스토리 관리용 파라미터 세팅 2013092 jangsunah  -->
        	<input type=text name="treeno" value="<c:out value="${REQUEST_DATA.treeno}"/>">  
        	<input type=text name="cuserNo" value="<c:out value="${REQUEST_DATA.cuserNo}"/>">  
        	<input type=text name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>">  
        	<input type=text name="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>">  
        </form>	
    </body>
</html>
 <!-- 
 		추후 작업 >> EXEC 로드되는것 까지 확인 
 		페이지 저장 로직 구현
 		1/contents/js/common.js > 로직 변경함 다른 콘텐츠 경로 파일들도 교체해야함
 		<script language='javascript' src='../../js/lib.js'></script> index.html 교체해야함 
 		진도체크 로직 재구현 필요함@@@@@@@@@@@@@@@@@@@@@@@
 
  -->