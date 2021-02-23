<%
/****************************************
	system	: ClassDesk > 수강생 > 콘텐츠 로드 index 페이지
	title	: 콘텐츠 로드를위한 index페이지
	summary	:	
	wdate	: 2013-08-14
	writer	: jang Sun Ah
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"%>
	<!-- 초기 파라미터 세팅 -->

	<form name="frm" action="" method="POST">
		<input type="hidden" name="subcmd" id="subcmd" value=""/>
		<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/> 
		<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/> 
		<input type="hidden" name="cuserNo" id="cuserNo" value="<c:out value="${REQUEST_DATA.cuserNo}"/>"/> 
		<input type="hidden" name="treeno" id="treeno" value="<c:out value="${REQUEST_DATA.treeno}"/>"/>
		<input type="hidden" name="MATERIAL" id="MATERIAL" value="<c:out value="${REQUEST_DATA.MATERIAL}"/>"/>
	</form>

	<script type="text/javascript"> 
    	$(document).ready(function(){ 
    		$('#subcmd').val('frameset');
    		$('form[name=frm]').attr('action', '/classdesk<c:out value="${rowData.CONURL}"/>').submit();
    	});
	</script>