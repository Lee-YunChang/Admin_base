<%
/****************************************
	system	: ClassDesk > 강사 > 시험 
	title	: 세트방식 시험 문제 수정 / 등록 양식  팝업
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"  %>

<!-- header -->
<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">문제 일괄 등록</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content"> 

		<form id="qform" name="qform"  enctype="multipart/form-data">
			<input type="hidden" name="setno" id="setno" value="<c:out value="${REQUEST_DATA.setno}"/>"/>
			<input type="hidden" name="downNo"  id="downNo"  value="" />
			<input type="hidden" name="downType"  id="downType" value="" />
			<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<c:out value="${UPLOADQUIZ}"/>"/>
			
			
			<strong>* 문제를 엑셀로 일괄 등록할 수 있습니다.</strong><br />
			<p style="line-height:150%;color:#666;letter-spacing:-0.05em;">
			<strong class="orange">[문제유형] [문제] [지문01] [지문02] [지문03] [지문04] [지문05] [정답]</strong> 형식이며,<br/>
			
			<a href = "#" onclick="fileDown('E', '0')">☞ 여기</a> 를 클릭하여 샘플 파일을 다운받아 사용 하시기 바랍니다.<br/>
			</p>
			<input type="file" name="file"/>
		</form>
 
</div>
	 
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup">
		<a href="#none" onclick="fnSave();"  class="btn-large-blue"><span>미리보기</span></a>
	</div>
</div>


<!-- //팝업 버튼영역 -->

<script type="text/javascript">
<!--

	window.resizeTo(550,290); 
	
	// 페이징 이동 
	function fnList(){
		$('#qform').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_form.do').submit();
	} 
	
	//등록후 창 새로고침 
	function fnReload(){
		window.close();
		$( opener.location ).attr( 'href' ,  'javascript:fnList();'); 
	} 
	
	// 등록 폼
	function fnSave(){
		$('#qform').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_excel_preview.do').submit();
	}
	
	
	function fileDown(type, no ){
		$('#downType').val(type);
		$('#downNo').val(no); 
		$('#qform')
		.attr('action', '/classdesk/filedown.do')
		.attr('method', 'post')
		.attr('target', '_cm')
		.submit();
	}
	
	 
//-->
</script>
	
</body>
</html>
