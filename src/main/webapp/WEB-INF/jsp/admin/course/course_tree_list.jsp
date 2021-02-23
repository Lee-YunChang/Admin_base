<%
/****************************************************
	system	: 교육관리 > 과정목록
	title	: 교육과정 > 학습목차 조회 
	summary	:	
	wdate	: 2016-05-16
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<c:set var="treeSampleUrl"><%=SangsProperties.getProperty("Globals.ContentsRootUri")%></c:set>
<c:set var="mobiletreeSampleUrl"><%=SangsProperties.getProperty("Globals.ContentsRootMobileUri")%></c:set>
<script type="text/javascript">

var isXml = '${isXml}';
var isCourseSeqIng = '${isCourseSeqIng}';
var isExistTree = '${isExistTree}';

//학습오브젝트 등록/수정
function itemWinView(treeno, pageMode){

	var courseNo = document.pform.courseno.value;
	var param = "";
	param = "courseno="+courseNo+"&treeno="+treeno+"&pageMode="+pageMode;
	if (pageMode == 'mod') {
		popup4("/admin/course/treeForm.do?"+param, 700,580,1,1);
	} else if (pageMode == 'reg') {
		popup4("/admin/course/treeForm.do?"+param, 700,400,1,1);
	}

}

//삭제
function objDelete(){
	
	if (isExistTree == 'Y') {
		
		if (isXml == 'Y') {
			alert('XML로부터 구성된 차시정보는 삭제가 불가합니다.\n차시업로드를 이용하시기 바랍니다.');
			return;
		}
		
		if (isCourseSeqIng == 'Y') {
			alert('수강중인 차시정보는 삭제가 불가합니다.');
			return;
		}
	} 
	
	var delArr = [];
	$('table input.chk_course_box:checkbox[checked=checked]').each(function(){
		delArr.push($(this).val());
	});
	
	if (delArr.length > 0) {
		
		var form = document.pform;
		var delwin = window.confirm('선택한 차시를 삭제하시겠습니까?\n삭제한 차시는 복구가 불가합니다.');
	
		if(delwin){
			$("#pform").attr("action", "/admin/course/treeDelExec.do");
			form.treenoArr.value = delArr.join(',');
			form.submit();
		}
		
	}
}

function viewSample(url, popupName, strOptions) {
	if (!strOptions) {
		strOptions = "width=800,height=600,menubar=no,status=no,toolbar=no";
	}
	window.open(url, popupName, strOptions);
}

function allCheck() {
	 $("input[type='checkbox']").attr('checked', $('#isall').is(':checked'));
}

// PC용 차시업로드
function openCourseUpload() {
	
	if (isExistTree == 'Y') {
		if (isXml == 'N') {
			alert('차시구성으로 부터 생성된 차시정보는 XML로 업로드가 불가합니다.');
			return;
		}
		
		if (isCourseSeqIng == 'Y') {
			alert('수강중인 차시정보는 차시구성이 불가합니다.');
			return;
		}
	}
	
	var courseno = $('input[name=courseno]').val();
	popup4("/admin/course/upload_coursetree_form.do?courseno="+courseno, 590,340,1,1);
}

function execCourseTreePageAutoSet(){
	
	if (isExistTree == 'N') {
		alert('PC용 차시업로드 완료 이후에 실행 가능합니다.');
		return;
	}
	
	if (isXml == 'N') {
		alert('PC용 차시업로드 완료 이후에 실행 가능합니다.');
		return;
	}
	
	var courseno = $('input[name=courseno]').val();
	
	if (confirm('페이지 자동구성을 실행하시겠습니까?')) {
		
		$.ajax({
			url:'/admin/course/execPageAutoSet.do'
			,type:'post'
			,data:{ courseno : courseno }
			,dataType:'json'
			,success:function(data) {
				if (data && data.result == 'success') {
					alert('페이지구성이 완료되었습니다.');
					setTimeout(function(){parentReload();},1000);
				} else {
					alert(data.error);
				}
			}
		});
	}
}



// 차시구성
function openCourseReConst(){
	
	if (isExistTree == 'Y') {
		
		if (isXml == 'Y') {
			alert('xml 업로드 후에는 차시 구성이 불가합니다.');
			return;
		}
		
		if (isCourseSeqIng == 'Y') {
			alert('수강중인 차시정보는 차시구성이 불가합니다.');
			return;
		}
		
	}

	var courseno = $('input[name=courseno]').val();
	popup4("/admin/course/reconst_coursetree_form.do?courseno="+courseno, 700,820,1,1);
}

function parentReload(){
	
	/* var form = document.pform;
	$("#pform").attr("action", "/admin/course/examSecList.do");
	form.target = "";
	form.submit(); */
	var form = document.pform;
	fnTabMove('/admin/course/treeList.do', form.courseno.value, '');
	
}

// 차시추가
function itemWin(treeno){
	if (isExistTree == 'Y') {
			
		if (isXml == 'Y') {
			alert('xml 업로드 후에는 차시 추가가 불가합니다.');
			return;
		}
		
		/* if (isCourseSeqIng == 'Y') {
			alert('수강중인 차시정보는 차시 추가가 불가합니다.');
			return;
		} */
	}
	var courseNo = document.pform.courseno.value;
	var param = "";
	var pageMode = "";
	if(treeno == 0) pageMode = '<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_REG"))%>';
	else pageMode = '<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_MOD"))%>';
		
	param = "courseno="+courseNo+"&treeno="+treeno+"&pageMode="+pageMode;
	popup3("/admin/course/treeForm.do?"+param, 700,500,1,1);

}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정등록 - 콘텐츠관리<span></span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>
<form name="pform" id="pform" method="post" action="/admin/course/treeList.do">
<input type="hidden" name="courseno"  id="courseno"  value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>
<input type="hidden" name="treeno" value=""/>
<input type="hidden" name="treenoArr" value=""/>
</form>

<!-- 본문 > 메인 > 목록 시작  -->
<div style="background: #c2c2c2;padding: 10px;margin-bottom: 15px;border-radius: 5px;">
	<h3>※ 주의사항</h3>
	<ul style="padding-left: 25px;line-height: 20px;">
		<li>PC 콘텐츠 업로드 후 모바일 콘텐츠 업로드가 가능합니다.</li>
		<li>PC 콘텐츠 업로드로 xml 파일 업로드 <strong>→</strong> FTP로 플래시 파일 업로드 <strong>→</strong> [페이지 자동구성] 을 반드시 진행해야 합니다.</li>
		<li>페이지 수는 “진도체크”와 연결된 부분으로 수정이 불가합니다.</li>
	</ul>
</div>
<div style="margin-bottom:5px;">
	<a href="#" class="btn gray" onclick="openCourseReConst()">차시구성하기</a>
<%-- 	<a href="#" class="btn gray" onclick="execCourseTreePageAutoSet(${REQUEST_DATA.courseno})">페이지 자동구성</a>
	<a href="#" class="btn blue" onclick="openCourseUpload(${REQUEST_DATA.courseno})">xml업로드</a> --%>
	<span style="float:right;">
		<a href="#" class="btn blue" onclick="itemWin(0);">차시추가</a>
		<a href="#" class="btn red" onclick="objDelete()">차시삭제</a>
	</span>
</div>

<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;" treeno="${resultList[0].TREENO}">
	<colgroup>
		<col align=middle width="4%">
		<col align=middle width="8%">
		<col align=middle width="35%">
		<col align=middle width="8%">
		<col align=middle width="15%">
		<!-- <col align=middle width="15%"> -->
	</colgroup>
	<tr class="rndbg">
		<th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"  onclick="allCheck();"/></th>
		<th>차시</th>
		<th>목차명</th>
		<th>페이지수</th>
		<th>학습시간(분)</th>
		<!-- <th>콘텐츠</th> -->
	</tr>
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		<td><input type="checkbox" name="chk_course_box" class="chk_course_box"  value="${result.TREENO}"/></td>
		<td><c:out value="${result.SDAY}"/></td>
		<td align="left"><img src="/admin/images/blt_etc_02.gif" alt="image"><a href="#" onclick="itemWinView(${result.TREENO}, 'mod');return false;">${result.SUBJECT}</a></td>
		<td><c:out value="${result.FRAMECNT}"/></td>
		<td><c:out value="${result.RUNTIME}"/></td>
		
		<%-- <td>
			<c:choose>
			<c:when test="${result.WEB_CONTENTS eq 'UPLOADED'}">
				<a href="#" onclick="viewSample('${treeSampleUrl}${result.FILE_PATH}', '미리보기', ''); return false;" target="_blank"><font color="blue">미리보기</font></a>
			</c:when>
			<c:otherwise>
				<font color="red">${result.WEB_CONTENTS}</font>
			</c:otherwise>
			</c:choose>
		</td> --%>
		<%-- <td>
			<c:choose>
				<c:when test="${result.MOBILE_CONTENTS eq 'UPLOADED'}">
					<a href="#" onclick="viewSample('${mobiletreeSampleUrl}${result.MOBILE_FILE_PATH}','미리보기',''); return false;" target="_blank"><font color="blue">미리보기</font></a>
				</c:when>
				<c:otherwise>
					<c:choose> // 기존 주석 부분
						<c:when test="${result.WEB_CONTENTS ne 'UPLOADED'}">
							<font color="red">${result.MOBILE_CONTENTS}</font>
						</c:when>
						<c:otherwise>
							<a href="#" class="btn blue" onclick="itemWin(${result.TREENO}, 'reg');return false;">등록</a>
						</c:otherwise>
					</c:choose> // 기존 주석  끝 부분
				</c:otherwise>
			</c:choose>
		</td>	 --%>	
			
	</tr> 
	</c:forEach>
</table>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	