<%
	/****************************************************
	system	: 게시판
	title	: 등록 폼
	summary	:
	wdate	: 2016-05-25
	writer	: 
	*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<!-- <script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/admin/common/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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
		alert("더이상 삭제하실 수 없습니다.");
		return;
	}
	$(this).closest("#eduDate_").remove();
});

    function go_exec(){ 
    	var form = document.form;
    	 
    	/* 유효성 체크 시작 */
        if(form.title.value == ''){
            alert('제목을 입력해 주세요.');
            return;
        }
    	
        //공개여부
	    if(!$(':input:radio[name=openAt]:checked').val()) {
	    	alert("공개여부를 선택해주세요.");
	        return;
	    }
    	
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		form.content.value = document.getElementById("content").value;
		
	    //내용
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		}

		var fileNum = $("#filesCount").val() * 1 + 1;
		if(confirm("저장하시겠습니까?")) {
			$(".td-input-wrap").children("#eduDate_").each(function(){
				$(this).attr("id","eduDate_"+fileNum);
				$(this).children().find(".inputtxt").attr("id","fileName"+fileNum);
				$(this).children().find(".file_input_hidden").attr("id","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("name","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("onchange",fileNum+", this.value, 0");
				$(this).children().find(".scale-down").attr("onclick","fnDel("+fileNum +");return false");
				fileNum = fileNum + 1;
			});
			
			$("#form").attr("action", "/admin/site/bbsContentsExec.do");
	        form.submit(); 
		}
    } 
    
    function delete_exec(){ 
    	var form = document.form;
    	form.qu.value='delete';
		if(confirm("삭제하시겠습니까?")) {
			$("#form").attr("action", "/admin/site/bbsContentsExec.do");
	        form.submit();
		}
    }
    
	function fnTabMove(bcateno) { 
		var frm = document.pform;
		$("#bcateno").val(bcateno);
		$("#pform").attr("action", "/admin/site/bbsContentsList.do");
		frm.submit();
	}
	
	//파일 삭제
	function delBtn(fileId , cnt , savePath , saveFile,bbsno){ 
		var fileId = fileId;
		var cnt = cnt;
		var savePath = savePath;
		var saveFile = saveFile;
		var bbsno = bbsno;
		var ajaxChk='Y';
		if(fileId != ''){
			if(confirm("기존파일을 삭제하시겠습니까?")){
		        $.ajax({
		            url : "/admin/site/deleteEdDataFileAjax.do",
		            data : {fileId : fileId, type : 'D' , savePath : savePath , saveFile : saveFile, bbsNo : bbsno, ajaxChk:ajaxChk},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == "SUCCESS"){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	$("#eduDate_"+cnt).remove();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		}else{
			$("#eduDate_"+cnt).remove();
		}
	}
	
	//파일다운로드
	function filedown(fileId,fname,type,orgFile,fileSeq){ 
		$('#fileId').val(fileId);
		$('#filename').val(encodeURIComponent(fname));
		$('#fileName').val(encodeURIComponent(orgFile));
		$('#ftype').val(type);
		$('#fileSeq').val(fileSeq);
		$('form[name=form]').attr('action', '/admin/site/filedown.do').submit();
	}
	
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"><c:out value="${titleMap.TITLENAME}"/> <span>사이트 게시물을 관리합니다.</span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/site/bbsContentsList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="0"/>
	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<input type="hidden" name="qu" id="qu" value=""/>
	<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>  
	
	<%-- <table width=100% border=0 cellspacing=0 cellpadding=0 class="exp-tab">
		<colgroup>
		  	<col class="cellc" width="25%">
		  	<col class="celll" width="25%">
		  	<col class="cellc" width="25%">
		  	<col class="celll" width="25%">
	  	</colgroup>
		<tbody>
			<tr>
				<td class="<c:choose><c:when test="${REQUEST_DATA.bcateno == bbsBcateSiteData}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('<c:out value="${bbsBcateSiteData}"/>');">자료실</a></td>
				<td class="<c:choose><c:when test="${REQUEST_DATA.bcateno == bbsBcateSiteNews}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('<c:out value="${bbsBcateSiteNews}"/>');">뉴스,언론보도</a></td>
				<td class="<c:choose><c:when test="${REQUEST_DATA.bcateno == bbsBcateSiteEduDicary}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('<c:out value="${bbsBcateSiteEduDicary}"/>');">교육 사전자료</a></td>
				<td class="<c:choose><c:when test="${REQUEST_DATA.bcateno == bbsBcateSiteFnncDicary}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('<c:out value="${bbsBcateSiteFnncDicary}"/>');">금융용어사전</a></td>			
			</tr>
		</tbody>
	</table> --%>
</form> 
<c:if test="${REQUEST_DATA.bcateno == bbsBcateSiteData}">※ 해당 내용은 포털사이트 “안내공간 > 자료실” 에 보여집니다.</c:if>
<%-- <c:if test="${REQUEST_DATA.bcateno == bbsBcateSiteNews}">※ 해당 내용은 포털사이트 “교육센터 소개 > 뉴스, 언론보도” 에 보여집니다.</c:if>
<c:if test="${REQUEST_DATA.bcateno == bbsBcateSiteEduDicary}">※ 해당 내용은 포털사이트 “교육센터 소개 > 교육 사전자료” 에 보여집니다.</c:if>
<c:if test="${REQUEST_DATA.bcateno == bbsBcateSiteFnncDicary}">※ 해당 내용은 포털사이트 “안내공간 > 금융용어사전” 에 보여집니다.</c:if> --%>
<div class="space"></div><!-- 공백 default 20px --> 
 
<form name="form" id="form" action="/admin/site/bbsContentsList.do" enctype="multipart/form-data" method="post">
<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="oFileNo" value="<c:out value="${map.FILENO}"/>"/>
    <input type="hidden" name="delFile" value=""/>
    <input type="hidden" name="bbsNo" id="bbsNo"value="<c:out value="${map.BBSNO}"/>"/>
    <input type="hidden" name="grpNo" value="<c:out value="${map.GRPNO}"/>"/>
    <input type="hidden" name="refLevel" value="<c:out value="${map.REFLEVEL}"/>"/>
    <input type="hidden" name="refStep" value="<c:out value="${map.REFSTEP}"/>"/>
    <input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR"  value="<%=SangsProperties.getProperty("Globals.bbsDataFilePath")%>"/>
    <input type="hidden" name="delCheckFile" value=""/>
	<input type="hidden" name="fileId" id="fileId" value=""/>
	<input type="hidden" name="filename" id="filename" value=""/>
	<input type="hidden" name="fileName" id="fileName" value=""/>
	<input type="hidden" name="ftype" id="ftype" value=""/>
	<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
	<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />
		
    
    <table class="table-type1 search_form">
      <colgroup>
          <col class="cellc" width="9%">
          <col class="celll" width="82%">
      </colgroup>
      <tr>
            <th><em>*</em>제목</th>
            <td colspan="3">
        		<input type="text" class="line" name="title" id="title" style="width:600px" value="<c:out value="${map.TITLE}"/>"/>
            </td>
      </tr>
      <tr>
          <th><em>*</em>공개여부</th>
          <td>
        		 <input type="radio" name="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked" </c:if> <c:if test="${REQUEST_DATA.qu eq 'insert'}">checked </c:if>/> 공개 &nbsp;
				<input type="radio" name="openAt" value="N" <c:if test="${map.OPEN_AT eq 'N'}"> checked="checked" </c:if> /> 미공개         
          </td>
      </tr>
      <tr>
         <th><em>*</em>내용</th>
         <td style="padding:20px 10px 20px 10px;" colspan="3">
               <div>
                   <!-- [필수]에디터 안에 글내용 영역 -->
                   <textarea name="content" id="content" rows="22" style="width:100%;" ><c:out value="${map.CONTENT}" escapeXml="false"/></textarea>
               </div>
         </td>
        </tr>
        <tr>
        	<th>파일첨부</th>
			<td class="td-input-wrap">
			<c:if test="${REQUEST_DATA.qu eq 'update'}">
				<c:forEach var="fileList" items="${fileList}" varStatus="status">
				<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
					<div  id="eduDate_${status.count}" class="input-wrap mb15"  style="height:25px">
						<div class="file-wrap">
							<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
							<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
								<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
							</a>
							<span class="timebtn">
								<a class="scale-down btn red small" onclick="delBtn('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${status.count}"/>' , '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>','<c:out value="${map.BBSNO}"/>');return false" title="삭제">삭제</a>
							</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
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
    </table>
    
 <div class="button" style="text-align:center;" >
	<c:choose>
    <c:when test="${map.BBSNO ne null}">
        <a href="#" onclick="go_exec(); return false;" class="btn green big">수정</a>
        <a href="#" onclick="delete_exec(); return false;" class="btn orange big">삭제</a>
    </c:when>
    <c:otherwise>
        <a href="#" onclick="go_exec(); return false;" class="btn blue big">등록</a>
    </c:otherwise>
    </c:choose>
    <a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>
