<%/****************************************************
	system	: 일반과정관리 > 
	title	: 게시판 등록/수정 폼
	summary	:
	wdate	: 2016-05-25
	writer	: 
	*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<%
    // 에디터 관련 선언
    //에디터업로드 이미지 경로 선언
    String webEditPath= SangsProperties.getProperty("Globals.bbsFilePath");
    com.ckeditor.CKEditorConfig ckeditorSettings = com.sangs.util.CKEditorUtil.getCKEditorConfig(webEditPath);	
%>
<!--  에디터 로드 -->
<c:set var="ckeditorSettings" value="<%=ckeditorSettings%>"/>
<c:set var="title" value="${map.TITLE}"/>
<c:if test="${REQUEST_DATA.qu == 'reply'}">
	<c:set var="title" value="[RE]${map.TITLE}"/>	
</c:if>
<script type="text/javascript">

function fnAdd() {
	if ( $(".td-input-wrap").children(".input-wrap").length > 8) {
		alert('9개까지 등록 가능합니다.');
		return;
	}
	$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='hidden' id='fileName' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'> <input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange(this.value , 0);'>	<span class='timebtn'><a class='scale-up btn blue small' onclick='fnAdd();return false' title='추가'>추가</a> <a class='scale-down btn red small' id='fnDel' title='삭제'>삭제</a></span></div></div></div>");
}
var delNum = "";
//파일 변경값
function fnChange(  pval , fileId) {
	if(fileId != 0){
		if(confirm("기존파일은 삭제됩니다 수정하시겠습니까")){
			delNum = fileId + "," + delNum ;
		}else{
			return false;
		}
	}
	$("#delNum").val(delNum);
}

$(document).on('click', '#fnDel', function(){ 
	if ( $(".td-input-wrap").children("#eduDate_").length == 1) {
		alert("더 이상 삭제하실 수 없습니다.");
		return;
	}
	$(this).closest("#eduDate_").remove();
});
	function go_list(){
		var form = document.forms[0];
		$("#pform").attr("action", "/admin/course/bbsList.do");
		form.submit();	
	}
	
	function go_exec(){
		var form = document.pform;
		if(form.title.value == ''){
			alert("제목을 입력해 주세요.");
			return;
			
		}
		
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	    form.content.value = document.getElementById("content").value;
		
	    //내용 필수 입력
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		}
		
		// 삭제 대상 첨부파일 번호 set
		form.delCheckFile.value = "";
		if ($('input[name=delFileChk]:checked').length > 0) {
			var fileIdArr = [];
			$('input[name=delFileChk]:checked').each(function(){
				fileIdArr.push($(this).val());
			});
			form.delCheckFile.value = fileIdArr.join(',');
		}
		
		var fileNum = $("#filesCount").val() * 1 + 1;
		if(confirm('등록하시겠습니까?')){
			$(".td-input-wrap").children("#eduDate_").each(function(){
				$(this).attr("id","eduDate_"+fileNum);
				$(this).children().find(".inputtxt").attr("id","fileName"+fileNum);
				$(this).children().find(".file_input_hidden").attr("id","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("name","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("onchange",fileNum+", this.value, 0");
				$(this).children().find(".scale-down").attr("onclick","fnDel("+fileNum +");return false");
				fileNum = fileNum + 1;
			});
			
			$("#pform").attr("action", "/admin/course/bbsExec.do");
			form.submit();	
		}

	}
	
	function fileUpChange(obj){
		var filename = obj.value.substring(obj.value.lastIndexOf(".")).toLowerCase();
		if(filename == '') 
			return;
		var maxSize = '<%=SangsProperties.getProperty("Globals.addFileMaxSize")%>';
		var maxMageSize = '<%=SangsProperties.getProperty("Globals.addFileMaxMegaSize ")%>';
		if(typeof document.body.style.maxHeight != 'undefined'){
			var fso = new ActiveXObject("Scripting.FileSystemObject");
			var f = fso.GetFile(obj.value);
			var fileSize = f.size;
			f = null;
			fso = null;
		} else {
			var img = new Image();
			img.dynsrc = obj.value;
			var fileSize = img.fileSize;
		}
		fileSize = parseInt(fileSize);
		maxSize = parseInt(maxSize);

		if(fileSize > maxSize){
			alert("파일업로드 허용용량 " + maxMageSize + "M Byte를 초과하였습니다.");
			fileValueReset(obj.name);
			return;
		}
		if(!(filename == '.jpg' || filename == '.gif' || filename == '.hwp' || filename == '.doc' || filename == '.ppt' || filename == '.zip' || filename == '.txt' || filename == '.xls')){
			alert("첨부할수 없는 확장자입니다.");
			fileValueReset(obj.name);
			return;
		}
		
	}

	function fileValueReset(file){
		document.getElementById(file).select();
		document.selection.clear();
	}
	
	function delete_file(){
		form.delFile.value = "Y";
		document.getElementById("fileDiv").style.display = "none";
		document.getElementById("uploadFile").style.display = "block";
	}
	
	function filedown(fileno){
		var form = document.fileForm;
		$('form[name=fileForm]').attr('action', '/admin/course/bbsFileDown.do');
		form.fileno.value = fileno;
		
		form.submit();		
	}

	function go_delete(){
		if(confirm("삭제하시겠습니까?")){
			var form = document.pform;
			form.qu.value = 'delete';
			$("#pform").attr("action", "/admin/course/bbsExec.do");
			form.submit();	
		}
	}
	
	function go_list(){
		var form = document.pform;
		$("#pform").attr("action", "/admin/course/bbsList.do");
		form.submit();	
		
	}
	
</script>

<c:set var="bbsNotice"><%=SangsProperties.getProperty("Globals.bbsBcateCourseNotice")%></c:set>
<c:set var="bbsCourse"><%=SangsProperties.getProperty("Globals.bbsBcateCourseData")%></c:set>
<c:if test="${REQUEST_DATA.bcateno == '1010'}"><c:set var="title" value="공지사항"/></c:if>
<c:if test="${REQUEST_DATA.bcateno == '1020'}"><c:set var="title" value="자료실"/></c:if>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정등록 - ${title}<span></span></div>

<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>
<form name="fileForm" action="/admin/filedown.do" method="post">
	<input type="hidden" name="fileno" value=""/>
</form>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/course/bbsForm.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="oFileNo" value="<c:out value="${map.FILENO}"/>"/>
    <input type="hidden" name="fileno" value=""/>
    <input type="hidden" name="delFile" value=""/>
    <input type="hidden" name="bbsNo" value="<c:out value="${map.BBSNO}"/>"/>
    <input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.classdeskFilePath"))%>"/>
    <input type="hidden" name="grpNo" value="<c:out value="${map.GRPNO}"/>"/>
	<input type="hidden" name="refLevel" value="<c:out value="${map.REFLEVEL}"/>"/>
	<input type="hidden" name="refStep" value="<c:out value="${map.REFSTEP}"/>"/>
	<input type="hidden" name="delCheckFile" value=""/>
	<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>">
	<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
	<input type="hidden" name="filesCount" id="filesCount" value="${fn:length(fileList)}" />
	
	<table class="table-type1 search_form">
	  <colgroup>
	  		<col class="cellc" width="15%">
			<col class="celll" width="35%">
	  </colgroup>
	  <tr>
			<th>제목</th> 
			<td colspan="3">
				<input type="text" class="line" name="title" style="width:100%" value="<c:out value="${map.TITLE}"/>"/> 
			</td>
	  </tr>
	  <tr>
			<th>공개여부</th>
			<td>
				<input type="radio" name="openAt" id="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked"</c:if> checked/><span>공개</span>
				<input type="radio" name="openAt" id="openAt" value="N"<c:if test="${map.OPEN_AT eq 'N'}"> checked="checked"</c:if>/><span>비공개</span>
			</td>
			<th>상위고정</th>
			<td>
				<input type="radio" name="topYn" id="topYn" value="Y"<c:if test="${map.TOPYN eq 'Y'}"> checked="checked"</c:if> checked/><span>고정</span>
				<input type="radio" name="topYn" id="topYn" value="N"<c:if test="${map.TOPYN eq 'N'}"> checked="checked"</c:if> /><span>고정 안함</span>
			</td>
		</tr>
	  <tr>
	  	 <th>내용</th>
	     <td style="padding:20px 10px 20px 10px;" colspan="3">
				<div>
					<!-- [필수]에디터 안에 글내용 영역 -->
					<textarea name="content" id="content" rows="22" style="width:100%;" ><c:out value="${map.CONTENT}" escapeXml="xml"/></textarea>
					<%-- <ckeditor:replace replace="content" basePath="${pageContext.request.contextPath}/admin/common/ckeditor" config="${ckeditorSettings}" ></ckeditor:replace> --%>
                </div>
		 </td>
		</tr>  
		<tr>
			<th>파일첨부</th> 
            <td colspan="3" class="td-input-wrap">
                <div  id="eduDate_" class="input-wrap mb15">
					<div class="file-wrap">
						<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
						<div class="file_input_div">
						  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
							<span class="timebtn">
								<a class="scale-down btn blue small" onclick="fnAdd();return false" title="추가">추가</a>
								<a class="scale-down btn red small" id="fnDel" title="삭제">삭제</a>
							</span>
						</div>
					</div>
				</div>
            </td>    
        </tr>
        
        <tr> 
        	<c:if test="${map.BBSNO ne null}">
        	<c:if test="${not empty fileList}">
            <th> 첨부된 파일</th>
            <td colspan="3">    
            	<c:forEach var="fmap" items="${fileList}" varStatus="status">
					<BR><input type="checkbox" name="delFileChk" value='<c:out value="${fmap.FILE_ID}"/>' /><a href="#" onclick="filedown('<c:out value="${fmap.FILE_ID}"/>');"><c:out value="${fmap.ORGFILE}"/></a>(${fmap.FILE_SIZE > 1024 ? fmap.FILE_SIZE / 1024 - (fmap.FILE_SIZE / 1024 %1) : fmap.FILE_SIZE} KB)</BR>
					<BR><FONT class=extext>체크박스 선택시 이미지가 삭제됩니다.</FONT></BR>
				</c:forEach>
				
			</td>
			 </c:if>
			 </c:if>
	  </tr>
		</table>
	
	 
<div class="button" >
	<c:choose>
    <c:when test="${map.BBSNO ne null}">
		<a href="#" onclick="go_exec(); return false;" class="btn big green">수정</a>    
		<a href="#" onclick="go_delete();" class="btn big red">삭제</a>  
	</c:when>
	<c:otherwise>
		<a href="#" onclick="go_exec(); return false;" class="btn big blue">등록</a>
	</c:otherwise>
	</c:choose>
	<a href="#" onclick="go_list();return false;" class="btn big gray">취소</a>
</div>
	
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
</script>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>