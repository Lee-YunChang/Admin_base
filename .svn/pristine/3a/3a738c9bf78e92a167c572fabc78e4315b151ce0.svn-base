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
	
    function go_list(){
        var form = document.form;
		$("#pform").attr("action", "/admin/site/bbsList.do");
        form.submit();
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
		
		var bcateno = $("#bcateno").val();//현재게시판
    	var bbsBcateSiteNotice = $("#bbsBcateSiteNotice").val();//공지사항
    	var bbsBcateSiteGuide = $("#bbsBcateSiteGuide").val();//교육안내
    	var bbsBcateSiteFaq = $("#bbsBcateSiteFaq").val();//자주묻는질문
    	
    	if(bcateno == bbsBcateSiteFaq) {//자주묻는질문
    		if ( $("#mtCateCode").val() == ''||  $("#mtCateCode").val() == null) {
    			alert("분류를 선택해주세요.");
    			return;
    		}
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
			$("#pform").attr("action", "/admin/site/bbsExec.do");
	        form.submit();
		}
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
		            url : "/admin/site/deleteEdBbsFileAjax.do",
		            data : {fileId : fileId, type : 'D' , savePath : savePath , saveFile : saveFile, bbsNo : bbsno, ajaxChk : ajaxChk},
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
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"><c:out value="${titleMap.TITLENAME}"/> <span>사이트 게시물을 관리합니다.</span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="pform" action="/admin/site/bbsForm.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="bbsNo" value="<c:out value="${map.BBSNO}"/>"/>
    <input type="hidden" name="grpNo" value="<c:out value="${map.GRPNO}"/>"/>
    <input type="hidden" name="refLevel" value="<c:out value="${map.REFLEVEL}"/>"/>
    <input type="hidden" name="refStep" value="<c:out value="${map.REFSTEP}"/>"/>
    <input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bbsFilePath")%>"/>
    <input type="hidden" id="bbsBcateSiteFaq" value="<%=SangsProperties.getProperty("Globals.bbsBcateSiteFaq")%>"/>
    <input type="hidden" id="bbsBcateSiteGuide" value="<%=SangsProperties.getProperty("Globals.bbsBcateSiteGuide")%>"/>
    <input type="hidden" id="bbsBcateSiteNotice" value="<%=SangsProperties.getProperty("Globals.bbsBcateSiteNotice")%>"/>
    <input type="hidden" name="delNum" id="delNum" value=""/>
    <input type="hidden" name="oFileNo" value="<c:out value="${map.FILENO}"/>"/>
    <input type="hidden" name="delFile" value=""/>
     <input type="hidden" name="delCheckFile" value=""/>
    <input type="hidden" name="fileId" id="fileId" value=""/>
	<input type="hidden" name="filename" id="filename" value=""/>
	<input type="hidden" name="fileName" id="fileName" value=""/>
	<input type="hidden" name="ftype" id="ftype" value=""/>
	<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
	<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />
		
    <c:set var="bbsGuide"><%=SangsProperties.getProperty("Globals.bbsBcateSiteGuide")%></c:set>
	
    <table class="table-type1 search_form">
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
      <tr>
            <th><em>*</em>제목</th>
            <td>
            	<c:set var="retitle"></c:set>
        		<c:if test="${REQUEST_DATA.qu == 'reply'}"><c:set var="retitle">[RE]</c:set></c:if>
        		<input type="text" class="line" name="title" id="title" style="width:600px" value="<c:out value="${retitle}"/><c:out value="${map.TITLE}"/>"/>
            </td>
      </tr>
      <tr>
          <th><em>*</em>공개여부</th>
          <td>
 				<input type="radio" name="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked" </c:if><c:if test="${REQUEST_DATA.qu eq 'insert'}">checked </c:if> /> 공개 &nbsp;
				<input type="radio" name="openAt" value="N" <c:if test="${map.OPEN_AT eq 'N'}"> checked="checked" </c:if> /> 비공개         
          </td>
      </tr>
      <c:set var="bbsFaq"><%=SangsProperties.getProperty("Globals.bbsBcateSiteFaq")%></c:set>
      <c:if test="${REQUEST_DATA.bcateno ==  bbsFaq}">
      <tr>
          <th><em>*</em>분류</th>
          <td>
          	<select id="mtCateCode" name="mtCateCode" title="분류">
			<option value="">선택</option>
			<c:forEach var="code" items="${categoryData2}"> 
				<option name="mtCateCode" value="${code.MT_SUB_CODE}" <c:if test="${code.MT_SUB_CODE eq map.MT_CATE_CODE}">selected="selected"</c:if>>${code.MT_SUB_NAME}</option>
			</c:forEach>
			</select>
          </td>
 	  </tr>
	  </c:if>
	  <c:if test="${cmap.ISTOP ==  'Y'}">
      <tr>
            <th><em>*</em>상위고정</th>
            <td>
      			<input type="radio" name="topYn" value="Y" <c:if test="${map.TOPYN eq 'Y'}"> checked </c:if>/> 고정 &nbsp;
				<input type="radio" name="topYn" value="N" <c:if test="${map.TOPYN eq 'N'}"> checked </c:if><c:if test="${REQUEST_DATA.qu eq 'insert'}">checked </c:if>  /> 고정안함&nbsp;<font class=extext> 게시글을 상단에 고정합니다.</font> 
            </td>
      </tr>
	  </c:if>
      <tr>
         <th><em>*</em>내용</th>
         <td style="padding:20px 10px 20px 10px;">
               <div>
                   <textarea name="content" id="content" rows="22" style="width:100%;" ><c:out value="${map.CONTENT}" escapeXml="false"/></textarea>
               </div>
         </td>
      </tr>
      <c:if test="${titleMap.TITLENAME != '자주묻는질문'}">
	      <tr>
	        	<th>파일첨부</th>
				<td class="td-input-wrap">
				<c:if test="${REQUEST_DATA.qu eq 'update'}">
					<c:forEach var="fileList" items="${fileList}" varStatus="status">
					<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
						<div  id="eduDate_${status.count}" class="input-wrap mb15"  style="height:25px">
							<div class="file-wrap">
								<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
									<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
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
       	</c:if>
    </table>
<div class="button" >
    <c:if test="${map.BBSNO eq null}">
	  	<a href="#" onclick="go_exec(); return false;" class="btn green big">등록</a>
  	</c:if>
	<c:if test="${map.BBSNO ne null}">
	    <a href="#" onclick="go_exec(); return false;" class="btn green big">수정</a>
    </c:if>
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