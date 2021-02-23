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

<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#content").text(function(index, text){
	 return strip(text);
	});

	function strip(html) {
	   var tmp = document.createElement("div");
	   tmp.innerHTML = html;
	   return tmp.textContent||tmp.innerText;
	}
	
	var encoded = $('#title').val();
	var decoded = encoded.replace(/&amp;/g, '&');
	$('#title').val(decoded);
	
});

//파일 변경값
function fnChange(fileId  , savePath , saveFile, prevFile,bbsno,type,bcateno) {
	if($("#qu").val() == "update"){
		if(confirm("기존파일은 삭제됩니다 수정하시겠습니까?")){
			
			 $.ajax({
		            url : "/admin/site/deleteEdDataFileAjax.do",
		            data : {fileId : fileId, type : type , savePath : savePath , saveFile : saveFile, bbsno : bbsno, bcateno:bcateno},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == "SUCCESS"){
		            		alert("삭제되었습니다.");	
			            $("#"+prevFile).remove();
		            	}else{
		            		alert('fail');
		            	}
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            },
		        }); 
			 
		}else{
			return false;
		}
	}
}
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
        
	    var bcateno = $("#bcateno").val();//현재게시판
    	var bbsAdv = $("#bbsAdv").val();//교육컨텐츠 & 광고
    	var bbsBcateYtnCampaign = $("#bbsBcateYtnCampaign").val();//YTN
    	var bbsBcateResultMovie = $("#bbsBcateResultMovie").val();//결정례
    	var bbsBcateOpenEdu = $("#bbsBcateOpenEdu").val();//열린교육
    	
    	if(bcateno == bbsAdv || bcateno == bbsBcateYtnCampaign || bcateno == bbsBcateResultMovie|| bcateno == bbsBcateOpenEdu) {//교육컨텐츠
    		$("#UPLOAD_DIR").val($("#bbsAdvFilePath").val());
    		if($("#qu").val()=='insert'){
	    		if ( $("#mtCateCode").val() == ''||  $("#mtCateCode").val() == null) {
	    			alert("분류를 선택해주세요.");
	    			return;
	    		}
    		}
            if($("#content").val() == ''){
            	$("#content").val('-');
            }
            
            if($('#qu').val()=='insert'){
	    		var ext1 = $('#uploadFile1').val().split('.').pop().toLowerCase();
	    		if($("#uploadFile1").val().length > 0 && $.inArray(ext1, ['gif','png','jpg','jpeg','bmp']) == -1) {
	    		    alert('등록할 수 없는 파일 형식입니다. 썸네일 이미지는 이미지 형식의 파일만 등록하여 주세요.');
	    		    return;
	    		} else if($("#uploadFile1").val().length == 0 && $("#qu").val() == "insert") {
	    			alert('썸네일 이미지를 등록하여 주세요.');
	    		    return;
	    		}
	    		var ext2 = $('#uploadFile2').val().split('.').pop().toLowerCase();
	    		if($("#uploadFile2").val().length > 0 && $.inArray(ext2, ['mp4','mp3']) == -1) {
	    		    alert('등록할 수 없는 파일 형식입니다. 영상 파일은 mp3,mp4 파일만 등록하여 주세요.');
	    		    return;
	    		} else if($("#uploadFile2").val().length == 0 && $("#qu").val() == "insert") {
	    			alert('영상 파일을 등록하여 주세요.');
	    		    return;
	    		}
            } else {
            	if($("#uploadFile1").val()!=null){
	            	var ext1 = $('#uploadFile1').val().split('.').pop().toLowerCase();
		    		if($("#uploadFile1").val().length > 0 && $.inArray(ext1, ['gif','png','jpg','jpeg','bmp']) == -1) {
		    		    alert('등록할 수 없는 파일 형식입니다. 썸네일 이미지는 이미지 형식의 파일만 등록하여 주세요.');
		    		    return;
		    		}  
            	}
            	if($("#uploadFile2").val()!=null){
		    		var ext2 = $('#uploadFile2').val().split('.').pop().toLowerCase();
		    		if($("#uploadFile2").val().length > 0 && $.inArray(ext2, ['mp4','mp3']) == -1) {
		    		    alert('등록할 수 없는 파일 형식입니다. 영상 파일은 mp3,mp4 파일만 등록하여 주세요.');
		    		    return;
		    		}  
            	}
            }
    	} 
		if(confirm("저장하시겠습니까?")) {
			if ( $("#mtCateCode").val() == 'SJ0001') {
    			$("#bcateno2").val($("#bbsBcateYtnCampaign").val());//ytn캠페인
    		} else if($("#mtCateCode").val() == 'SJ0002') {
    			$("#bcateno2").val($("#bbsBcateResultMovie").val());//결정례동영상
    		} else if($("#mtCateCode").val() == 'SJ0003') {
    			$("#bcateno2").val($("#bbsAdv").val());//광고
    		} else if($("#mtCateCode").val() == 'SJ0004') {
    			$("#bcateno2").val($("#bbsBcateOpenEdu").val());//열린교육
    		}
			
			$("#form").attr("action", "/admin/site/bbsExec.do");
	       form.submit();
		}
    } 
    
    function delete_exec(){
    	var form = document.form;
    	form.qu.value='delete';
		if(confirm("삭제하시겠습니까?")) {
			$("#form").attr("action", "/admin/site/bbsExec.do");
	        form.submit();
		}
    }
	
    function fnTabMove(bcateno) {
		var frm = document.pform;
		$("#bcateno").val(bcateno);
		$("#pform").attr("action", "/admin/site/bbsContentsList.do");
		frm.submit();
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
	
<form name="pform" id="pform" action="/admin/site/bbsList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="0"/>
	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>  
	
	
	<table width=100% border=0 cellspacing=0 cellpadding=0 class="exp-tab">
		<colgroup>
			<col width="17%" />
			<col width="16%" />
			<col width="17%" />
			<col width="17%" />
			<col width="16%" />
			<col width="17%" />
		</colgroup>
		<tbody>
			<c:set var="bcateno" value="${REQUEST_DATA.bcateno}"/>
			<c:set var="bbsData"><%=SangsProperties.getProperty("Globals.bbsBcateSiteData")%></c:set>
			<c:set var="bbsAdv"><%=SangsProperties.getProperty("Globals.bbsBcateSiteAdv")%></c:set>

			<tr>
				<td class="<c:choose><c:when test="${bcateno == bbsData}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('<c:out value="${bbsData }"/>');">교육자료</a></td>
				<td class="<c:choose><c:when test="${bcateno == bbsAdv}">on</c:when><c:otherwise>off</c:otherwise></c:choose>"><a href="#" onclick="fnTabMove('<c:out value="${bbsAdv }"/>');">교육콘텐츠</a></td>			
			</tr>
		</tbody>
	</table>
</form> 
<!-- 본문 > 상단 > 검색영역 끝 -->
<c:if test="${REQUEST_DATA.bcateno == bbsData}">※ 해당 내용은 포털사이트 “지식터 > 교육자료” 에 보여집니다.</c:if>
<c:if test="${REQUEST_DATA.bcateno == bbsAdv}">※ 해당 내용은 포털사이트 “지식터 > 교육컨텐츠” 에 보여집니다. 세부항목은 등록 시 선택하세요.</c:if>
<div class="space"></div><!-- 공백 default 20px --> 
<form name="form" id="form" action="" enctype="multipart/form-data" method="post">
	<input type="hidden" name="delNum" id="delNum" value=""/>
	<input type="hidden" name="type" id="type" value=""/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
	<input type="hidden" name="bcateno2" id="bcateno2" value=""/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" id="qu" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="oFileNo" value="<c:out value="${map.FILENO}"/>"/>
    <input type="hidden" name="bbsNo" value="<c:out value="${map.BBSNO}"/>"/>
    <input type="hidden" name="grpNo" value="<c:out value="${map.GRPNO}"/>"/>
    <input type="hidden" name="refLevel" value="<c:out value="${map.REFLEVEL}"/>"/>
    <input type="hidden" name="refStep" value="<c:out value="${map.REFSTEP}"/>"/>
    <input type="hidden" name="bbsData" id="bbsData" value="${bbsData}"/>
	<input type="hidden" name="bbsNegative" id="bbsNegative" value="${bbsNegative}"/>
	<input type="hidden" name="bbsTranslation" id="bbsTranslation" value="${bbsTranslation}"/>
	<input type="hidden" name="bbsAdv" id="bbsAdv" value="${bbsAdv}"/>
	<input type="hidden" name="bbsBcateYtnCampaign" id="bbsBcateYtnCampaign" value="${bbsBcateYtnCampaign}"/>
	<input type="hidden" name="bbsBcateResultMovie" id="bbsBcateResultMovie" value="${bbsBcateResultMovie}"/>
	<input type="hidden" name="bbsBcateOpenEdu" id="bbsBcateOpenEdu" value="${bbsBcateOpenEdu}"/>
	<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR"  value=""/>
	<input type="hidden" name="" id="bbsNegativeFilePath"  value="<%=SangsProperties.getProperty("Globals.bbsNegativeFilePath")%>"/>
	<input type="hidden" name="" id="bbsTranslationFilePath"  value="<%=SangsProperties.getProperty("Globals.bbsTranslationFilePath")%>"/>
	<input type="hidden" name="" id="bbsAdvFilePath"  value="<%=SangsProperties.getProperty("Globals.bbsAdvFilePath")%>"/>
	<input type="hidden" name="fileId" id="fileId" value=""/>
	<input type="hidden" name="filename" id="filename" value=""/>
	<input type="hidden" name="fileName" id="fileName" value=""/>
	<input type="hidden" name="ftype" id="ftype" value=""/>
	<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
	<input type="hidden" name="fileAt" id="fileAt" value=""/>
    
<c:choose>
<c:when test="${REQUEST_DATA.bcateno == bbsNegative}">  
    <table class="table-type1 search_form">
      <colgroup>
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
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
        		 <input type="radio" name="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked" </c:if><c:if test="${REQUEST_DATA.qu eq 'insert'}"> checked </c:if> /> 공개 &nbsp;
				<input type="radio" name="openAt" value="N" <c:if test="${map.OPEN_AT eq 'N'}"> checked="checked" </c:if> /> 미공개         
          </td>
      </tr>
      <tr>
         <th><em>*</em>썸네일 이미지</th>
         <td>
         
         	<c:if test="${REQUEST_DATA.qu eq 'update'}">
         	
	         	<c:forEach var="fileList" items="${fileList}" varStatus="status"> 
	         		<c:if test = "${fileList.FGUBUN eq 'IMG'}">	
	         			첨부된 파일 : <a id="prevFile1" value="${fileList.FILE_ID}" href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
							<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
						</a>
						</br><input type="file"  id="uploadFile1" name="uploadFile1" class="file_input_hidden" onchange="fnChange('${fileList.FILE_ID}','${fileList.SAVPATH}', '${fileList.SAVFILE}','prevFile1','<c:out value="${map.BBSNO}"/>','N','<c:out value="${REQUEST_DATA.bcateno}"/>');">
	         			<input type="hidden" id="prev_uploadFile1" value="<c:out value="${fileList.FILE_ID}"/>"/> 
         			</c:if>
         			<c:if test="${REQUEST_DATA.nullImg eq 'Y'}">
         			<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden">
         			</c:if>
	         	</c:forEach> 
	         	
	         	<c:if test="${empty fileList }">
   					<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden">
   				</c:if>
   				
         	</c:if>
         	
         	<c:if test="${REQUEST_DATA.qu eq 'insert'}">
         		<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden" >
			</c:if>  
			       	
       	</td>
      </tr>
      <tr>
         <th><em>*</em>음성 파일</th>
         <td>
         	<c:if test="${REQUEST_DATA.qu eq 'update'}">
	         	<c:forEach var="fileList" items="${fileList}" varStatus="status">
	         		<c:if test = "${fileList.FGUBUN eq 'VIDEO'}">
	         			첨부된 파일 : <a id="prevFile2" value="${fileList.FILE_ID}" href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
							<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
						</a>
						  </br><input type="file"  id="uploadFile2" name="uploadFile2" class="file_input_hidden" onchange="fnChange('${fileList.FILE_ID}','${fileList.SAVPATH}', '${fileList.SAVFILE}','prevFile2','<c:out value="${map.BBSNO}"/>','N','<c:out value="${REQUEST_DATA.bcateno}"/>');">
	         				<input type="hidden" id="prev_uploadFile2" value="<c:out value="${fileList.FILE_ID}"/>"/>
	         		</c:if>	
	         		<c:if test="${REQUEST_DATA.nullVideo eq 'Y'}">
         			<input type="file" id="uploadFile2" name="uploadFile2" class="file_input_hidden">
         			</c:if>
	         	</c:forEach>
	         	<c:if test="${empty fileList }">
   				<input type="file" id="uploadFile2" name="uploadFile2" class="file_input_hidden">
   				</c:if>
         	</c:if>
        	 <c:if test="${REQUEST_DATA.qu eq 'insert'}">
         		<input type="file" id="uploadFile2" name="uploadFile2" class="file_input_hidden">
         	</c:if>
       	 </td>
      </tr>
   </table>
</c:when>
<c:when test="${REQUEST_DATA.bcateno == bbsTranslation}">  
    <table class="table-type1 search_form">
      <colgroup>
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
      </colgroup>
      <tr>
            <th><em>*</em>제목</th>
            <td colspan="3">
            	<c:set var="retitle"></c:set>
        		<c:if test="${REQUEST_DATA.qu == 'reply'}"><c:set var="retitle">[RE]</c:set></c:if>
        		<input type="text" class="line" name="title" id="title" style="width:600px" value="<c:out value="${retitle}"/><c:out value="${map.TITLE}"/>"/>
            </td>
      </tr>
      <tr>
          <th><em>*</em>공개여부</th>
          <td>
        		 <input type="radio" name="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked" </c:if> <c:if test="${REQUEST_DATA.qu eq 'insert'}"> checked </c:if>/> 공개 &nbsp;
				<input type="radio" name="openAt" value="N" <c:if test="${map.OPEN_AT eq 'N'}"> checked="checked" </c:if> /> 미공개         
          </td>
      </tr>
      <tr>
         <th><input type="radio" id="bbsTranslationRadio1" name="bbsTranslationRadio"<c:if test="${map.FILE_AT eq 'Y'}">checked</c:if>>파일 첨부</th>
         <td>
         	<c:if test="${REQUEST_DATA.qu eq 'update'}">
	         	<c:forEach var="fileList" items="${fileList}" varStatus="status">
	         			첨부된 파일 : <a id="prevFile2" value="${fileList.FILE_ID}" href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
							<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
						</a>
						  </br><input type="file"  id="uploadFile1" name="uploadFile1" class="file_input_hidden" onchange="fnChange('${fileList.FILE_ID}','${fileList.SAVPATH}', '${fileList.SAVFILE}','prevFile2','<c:out value="${map.BBSNO}"/>','T','<c:out value="${REQUEST_DATA.bcateno}"/>');">
	         				<input type="hidden" id="prev_uploadFile1" value="<c:out value="${fileList.FILE_ID}"/>"/>
	         	</c:forEach>
   				<c:if test="${empty fileList }">
   				<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden">
   				</c:if>
         	</c:if>
        	 <c:if test="${REQUEST_DATA.qu eq 'insert'}">
         		<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden">
         	</c:if>
        </td>
      </tr>
      <tr>
         <th><input type="radio" id="bbsTranslationRadio2" name="bbsTranslationRadio" <c:if test="${map.FILE_AT eq 'N'}">checked</c:if>>URL</th>
         <td><input type="text" id="url" name="url" value="<c:out value="${map.LINK_URL}"/>">※ 제목에 걸리는 새창링크 경로 입니다.</td>
      </tr>
   </table>
</c:when>
<c:when test="${REQUEST_DATA.bcateno == bbsAdv || REQUEST_DATA.bcateno == bbsBcateYtnCampaign || REQUEST_DATA.bcateno == bbsBcateResultMovie || REQUEST_DATA.bcateno == bbsBcateOpenEdu}">  
    <table class="table-type1 search_form">
      <colgroup>
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
      </colgroup>
      <tr>
            <th><em>*</em>제목</th>
            <td colspan="3">
            	<c:set var="retitle"></c:set>
        		<c:if test="${REQUEST_DATA.qu == 'reply'}"><c:set var="retitle">[RE]</c:set></c:if>
        		<input type="text" class="line" name="title" id="title" style="width:600px" value="<c:out value="${retitle}"/><c:out value="${map.TITLE}"/>"/>
            </td>
      </tr>
      <tr>
          <th><em>*</em>공개여부</th>
          <td>
        		 <input type="radio" name="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked" </c:if><c:if test="${REQUEST_DATA.qu eq 'insert'}"> checked </c:if> /> 공개 &nbsp;
				<input type="radio" name="openAt" value="N" <c:if test="${map.OPEN_AT eq 'N'}"> checked="checked" </c:if> /> 미공개         
          </td>
          <th><em>*</em>분류</th>
          <td>
          	<c:if test="${REQUEST_DATA.qu != 'update'}">
			<select id="mtCateCode" name="mtCateCode" title="분류">
				<option value="">선택</option>
				<c:forEach var="code" items="${categoryData3}"> 
					<option name="mtCateCode" value="${code.MT_SUB_CODE}" <c:if test="${code.MT_SUB_CODE eq map.MT_CATE_CODE}">selected="selected"</c:if>>${code.MT_SUB_NAME}</option>
				</c:forEach>
			</select>
          	</c:if>
          	<c:if test="${REQUEST_DATA.qu == 'update'}">
          		<c:forEach var="code" items="${categoryData3}"> 
          		<input type="hidden" name="mtCateCode" value="${map.MT_CATE_CODE }"/>
          		<c:if test="${code.MT_SUB_CODE eq map.MT_CATE_CODE}">${code.MT_SUB_NAME}</c:if>
          		</c:forEach>
          	</c:if>
		</td>
      </tr>
      <tr>
         <th>한줄설명</th>
         <td colspan="3">
         <textarea name="content" id="content" rows="10" style="width:100%;" ><c:out value="${map.CONTENT}" escapeXml="false"/></textarea>
         </td>
      </tr>
      <tr>
         <th><em>*</em>썸네일 이미지</th>
         <td colspan="3">
         
	         <c:if test="${REQUEST_DATA.qu eq 'update'}">
	         
	         	<c:forEach var="fileList" items="${fileList}" varStatus="status">
	         		<c:if test = "${fileList.FGUBUN eq 'IMG'}">
	         			첨부된 파일 : <a id="prevFile1" value="${fileList.FILE_ID}" href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
							<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
						</a>
						</br><input type="file"  id="uploadFile1" name="uploadFile1" class="file_input_hidden"  onchange="fnChange('${fileList.FILE_ID}','${fileList.SAVPATH}', '${fileList.SAVFILE}','prevFile1','<c:out value="${map.BBSNO}"/>','A','<c:out value="${bbsAdv}"/>');">
	         			<input type="hidden" id="prev_uploadFile1" value="<c:out value="${fileList.FILE_ID}"/>"/>
	         		</c:if>	
	         		<c:if test="${REQUEST_DATA.nullImg eq 'Y'}">
         			<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden">
         			</c:if>
	         	</c:forEach>
	         	
	         	<c:if test="${empty fileList }">
   					<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden">
   				</c:if>
   				
         	</c:if>
         	
         	<c:if test="${REQUEST_DATA.qu eq 'insert'}">
         		<input type="file" id="uploadFile1" name="uploadFile1" class="file_input_hidden" >
			</c:if>
			    
         </td>
      </tr>
       <tr>
         <th><em>*</em>영상 파일</th>
         <td colspan="3">
         	<c:if test="${REQUEST_DATA.qu eq 'update'}">
	         	<c:forEach var="fileList" items="${fileList}" varStatus="status">
	         		<c:if test = "${fileList.FGUBUN eq 'VIDEO'}">
	         			첨부된 파일 : <a id="prevFile2" value="${fileList.FILE_ID}" href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
							<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
						</a>
						  </br><input type="file"  id="uploadFile2" name="uploadFile2" class="file_input_hidden" onchange="fnChange('${fileList.FILE_ID}','${fileList.SAVPATH}', '${fileList.SAVFILE}','prevFile2','<c:out value="${map.BBSNO}"/>','A','<c:out value="${bbsAdv}"/>');">
	         			<input type="hidden" id="prev_uploadFile2" value="<c:out value="${fileList.FILE_ID}"/>"/>
	         		</c:if>	
	         		<c:if test="${REQUEST_DATA.nullVideo eq 'Y'}">
         			<input type="file" id="uploadFile2" name="uploadFile2" class="file_input_hidden">
         			</c:if>
	         	</c:forEach>
	         	<c:if test="${empty fileList }">
   				<input type="file" id="uploadFile2" name="uploadFile2" class="file_input_hidden">
   				</c:if>
         	</c:if>
        	 <c:if test="${REQUEST_DATA.qu eq 'insert'}">
         		<input type="file" id="uploadFile2" name="uploadFile2" class="file_input_hidden">
         	</c:if>
         </td>
      </tr>
   </table>
</c:when>
</c:choose>
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

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>