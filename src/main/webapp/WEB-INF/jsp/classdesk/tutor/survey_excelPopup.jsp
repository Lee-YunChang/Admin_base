
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">

function writeFormCheck(pollcseqno,pollcseqno2,cnt){
	
	var frm = document.writeform;
// 	$("#writeform").attr("action", "/admin/course/surveyExcelPreview.do");
	if (frm.file.value == ''){alert("엑셀파일을 등록하세요!");}
	else {
		var submitWin = window.confirm("등록하겠습니까?");
		if (submitWin){
			
			frm.pollcseqno.value = pollcseqno;
			frm.pollcseqno2.value = pollcseqno2; 
			frm.cnt.value=cnt;
			
			opener.name="surveyForm";
			frm.target=opener.name;
			frm.action='/classdesk/tutor/poll/surveyExcelPreview.do';
			frm.submit();
			self.close();
		}
	}
}

function cancelWin(){
	var cwin = window.confirm("등록을 취소하겠습니까?");
	if (cwin) {
		window.close();
	}
}

//매뉴얼 다운로드
function sampleFileDown() {
    downManualDoc('survey_sample.xls', 'edu-data/download');
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">설문 > 엑셀 일괄등록<span>문제를 엑셀로 일괄 등록할 수 있습니다.</span></div>

<!-- 본문 > 상단 > 안내문구 시작 -->
<table  width="100%" class="tb_Message">
	<tbody>
	<tr>
		<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
		
			<div style="padding-top: 5px"><b>※ 엑셀일괄등록안내 </b> <a href="javascript:sampleFileDown();">[엑셀양식다운로드]</a></div>
			<div style="padding-top: 7px"><font class=g9 color=#666666> - 제시된 엑셀파일양식으로 문제를 입력하세요.</font></div>
			<div style="padding-top: 7px"><font class=g9 color=#666666> - 문제,유형,정답은 필수 입력항목입니다.</font></div>
		</td>
	</tr>
	</tbody>
</table>
<!-- 본문 > 상단 > 안내문구 끝 -->
<div class="space"></div><!-- 공백 default 20px -->


<!-- 본문 > 메인 > 목록 시작  -->
<form name="writeform" id="writeform" method="post" onsubmit="writeFormCheck('<c:out value="${result.POLLCSEQNO}"/>','${REQUEST_DATA.pollcseqno2}','${REQUEST_DATA.cnt}'); return false;" enctype="multipart/form-data"> 
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
<input type="hidden" name="pollcseqno" id="pollcseqno" value=""/>
<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}"/>
<input type="hidden" id="pollcseqno2" name="pollcseqno2" value="<c:out value="${REQUEST_DATA.pollcseqno2}"/>"/>
<input type="hidden" id="pageMode" name="pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
<input type="hidden" id="cnt" name="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>"/>
<input type="hidden" id="excelyn" name="excelyn" value="Y"/>

<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">	
	<colgroup>
	<col class=cellc>
	<col class=celll>
	<tbody>
	<tr>
		<td>파일업로드</td>
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