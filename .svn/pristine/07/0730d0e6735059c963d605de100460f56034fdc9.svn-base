<%
/****************************************************
	system	: 과정관리 > 교육과정등록
	title	: 교육과정 학습목차 등록/수정 양식  
	summary	:	
	wdate	: 2016-05-16
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="reg"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:set var="rootMobilePath"><%=SangsProperties.getProperty("Globals.ContentsRootMobileUri") %>/${map.COURSENO}</c:set>

		
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>

<script type="text/javascript">
 
//등록실행 체크 
function writeFormCheck(){ 
	var form = document.pform;
	if (!form.sday.value || !isNumber(form.sday.value)){alert('차시번호를 입력하세요.\n숫자만 가능합니다.'); form.sday.focus();}
	if (!form.subject.value){alert('차시명을 입력하세요.'); form.subject.focus();}
	if (!form.frameCnt.value){alert('페이지수를 입력하세요.'); form.frameCnt.focus();}
	if (!form.runtime.value){alert('권장학습시간을 입력하세요.\n숫자만 가능합니다.'); form.runtime.focus();}
	if (!form.mobileTreeNo.value) {
		alert('콘텐츠 경로를 입력하세요\n예:01,02,03');
		form.mobileTreeNo.focus();
		return;
	}
	/* if (!form.mobileStartFile.value) {
		alert('콘텐츠 시작파일을 입력하세요\n예:index.html');
		form.mobileStartFile.focus();
		return;
	} */
	
	/* if (form.fileUpload.value) {
		if (form.fileUpload.value.toLowerCase().indexOf('zip') < 0) {
			alert('모바일 콘텐츠파일은 zip형식만 가능합니다.');
			return;
		}
	} */
	
	form.mobileFilePath.value = "/" + $("input[name='courseno']").val() 
	+ "/" + $("input[name='mobileTreeNo']").val() 
	+ "/" + $("input[name='mobileStartFile']").val();
	var msg = '${titleMode}';
       if(confirm( msg+ ' 하시겠습니까?')){
		form.target = '';
		$('#pform').attr("action", "/admin/course/treeExec.do").submit();
	}
}

function contentUplodCheck() {
	var form = document.pform;
	var formFile = document.pformFile;
	if (form.treeFilePath.value == ''){alert('저장할 차시경로를 정의하세요.'); form.treeFilePath.focus();}
	else if (formFile.fileUpload.value == '') {alert('저장할 파일을 등록하세요.');}
	else {
		formFile.treeFilePath.value = form.treeFilePath.value;
		var msg = '${titleMode}';
        if(confirm( '차시파일을 '+msg+ ' 하시겠습니까?')){
			formFile.target = 'fileList';
			formFile.submit();
		}
	}
	
} 


</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">콘텐츠관리 > 차시${titleMode}<span>콘텐츠 추가/수정을 할 수 있습니다.</span></div>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/treeExec.do" method="post" enctype="multipart/form-data">

<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="treeno" value="<c:out value="${REQUEST_DATA.treeno}"/>"/>
<input type="hidden" name="mobileFilePath" value="${mobileFilePath}"/>

<div class="title">콘텐츠 추가<FONT class=extext>  mp4 파일은 FTP 업로드를 권장합니다.</FONT></div>

<%-- <c:if test="${reg != REQUEST_DATA.pageMode}"> --%>
<div class="tb_title">메타정보</div>
<table class="table-type1 search_form">	
	<colgroup>
		<col class=cellc width="15%"> 
		<col class=celll width="*">
	</colgroup>
	
	<tbody> 
		<tr>
			<th> * 차시번호</th>
			<td><input class="line i-numOnly" style="width:30px;text-align: center;" value="<c:out value="${map.SDAY}"/>" name="sday" id="sday" maxlength="2"/><FONT class=extext> 숫자로 설정</FONT></td>
		</tr>
		<tr>
			<th> * 차시명</th>
			<td>
				<input class="lline" value="<c:out value="${map.SUBJECT}"/>" name="subject" id="subject" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<th> * 페이지수</th>
			<td>
				<input class="line i-numOnly"  style="width:30px;text-align: right;" value="<c:out value="${map.FRAMECNT}" default="1"/>" name="frameCnt" id="frameCnt"  maxlength="2"/> PAGE
			</td>
		</tr>
		<tr>
			 <th>* 권장 학습시간</th>
			<td><input class="line i-numOnly" value="<c:out value="${map.RUNTIME}"/>" style="width:30px;text-align: right;" name="runtime" id="runtime"/> 분</td> 
		</tr>
		<%-- <tr>
			<th>시작페이지</th>
			<td><input class="lline" value="<c:out value="${!empty map.MOBILE_FILE_PATH ? fn:split(map.MOBILE_FILE_PATH, '/')[2] : 'index.html'}"/>" name="mobileStartFile" id="mobileStartFile" style="width:250px" readonly="readonly"/> 
				<span style="float:right;"><FONT class=extext> ※ 예시) index.html</FONT></span>
			</td>
		</tr> --%> 
		<input class="lline" type="hidden" value="index.html" name="mobileStartFile" id="mobileStartFile" style="width:250px" readonly="readonly"/> 
		<tr>
			<th>차시경로</th>
			<td>
			<input class="lline" value="${rootMobilePath}" name="rootMobileFilePath"  style="width:250px; background:#efefef" readonly/> / 
			<input class="lline i-numOnly" value="${fn:split(map.MOBILE_FILE_PATH, '/')[1]}" name="mobileTreeNo" id="mobileTreeNo"  style="width:100px" maxlength="2"/>
				<span style="float:right;"><FONT class=extext> ※ 예시) 01, 02, 03</FONT></span>
			</td>
		</tr>
		<!-- <tr>
			<th>콘텐츠파일등록</th>
			<td>
				<input type="file" name="fileUpload"> 
			</td>
		</tr> -->
		<input style="visibility: hidden;" type="file" name="fileUpload">
		
		
		
		
		
		<%-- <tr>
			<th>장갯수</th>
			<td><input class="line" value="<c:out value="${map.SUBCNT}"/>" name="subCnt"/> 장</td>
		</tr>
		<tr>
			<th>콘텐츠사이즈</th>
			<td>
				가로 : <input class="line" value="<c:out value="${map.CON_WIDTH}"/>" name="conWidth" style="width:70px"/> X 
				세로 : <input class="line" value="<c:out value="${map.CON_HEIGHT}"/>" name="conHeight" style="width:70px"/> 
				 <FONT class=extext>픽셀단위</FONT>
			</td>
		</tr>
		
		--%>
		
	</tbody>
</table>
<%-- </c:if> --%>

</form>
<br/>

<!-- <iframe name="fileList" width="100%" height="250" src="" title="차시 파일 등록"></iframe> -->

<div class="button" align="center">
	<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}">
		<a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
	</c:when>
	<c:otherwise>
		<a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>      
	</c:otherwise>
	</c:choose>
	<a href="#" onclick="window.close();" class="btn big gray">취소</a> 
</div>

<!-- 본문 > 메인 > 목록 끝 -->
<!-- <script type="text/javascript">
 	onFileList('<c:out value="${contentsRootPath}"/>', '<c:out value="${filePath}"/>', '<c:out value="${treeFilePath}"/>');
</script> -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>