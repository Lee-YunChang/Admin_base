<%
/****************************************************
	system	: 회원관리 > 기업정보관리
	title	: (팝업)기업정보 엑셀일괄 등록 양식 
	summary	:	
	wdate	: 2015-06-29
	writer	: 이진영 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">

function writeFormCheck(){
	
	var form = document.writeform;
	if (form.file.value == ''){alert('엑셀파일을 등록하세요.');}
	else {
		var submitWin = window.confirm('등록하시겠습니까?');
		if (submitWin){form.submit();}
	}
}

function cancelWin(){
	var cwin = window.confirm('등록을 취소하겠습니까?');
	if (cwin) {
		self.close();
	}
}

//매뉴얼 다운로드
function sampleFileDown() {
    downManualDoc('special_lecture_import_sample.xls', 'webapp/edu-data/download');
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">과정관리 > 특강 엑셀등록<span>특강목록을 엑셀로 일괄 등록처리할 수 있습니다.</span></div>

<table  width="100%" class="tb_Message">
	<tbody>
	<tr>
		<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
		
			<div style="padding-top: 5px"><b>※ 엑셀일괄등록안내 </b> <a href="javascript:sampleFileDown();">[엑셀샘플다운로드]</a></div>
		</td>
	</tr>
	</tbody>
</table>
<!-- 본문 > 상단 > 안내문구 끝 -->
<div class="space"></div><!-- 공백 default 20px -->
<!-- 본문 > 메인 > 목록 시작  -->
<form name="writeform" action="/admin/lecture/specilLectureExcelExec.do" method="post" onsubmit="writeFormCheck(); return false;" enctype="multipart/form-data">
<input type="hidden" name="SES_USERNO" id="userno" value="${REQUEST_DATA.SES_USERNO}"/>
<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">	
	<colgroup>
	<col class=cellc>
	<col class=celll>
	<tbody>
	<tr>
		<td>파일등록</td>
		<td>
			<input type="file" name="file" style="width:400px"/>
		</td>
	</tr>
	</tbody>
</table>

<div class="button">
	<a href="#" onclick="writeFormCheck(); return false;" class="btn big blue">등록</a> 
	<a href="#" onclick="cancelWin();" class="btn big gray">취소</a>
</div>
</form>

<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	