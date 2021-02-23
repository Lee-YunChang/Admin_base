<%
/****************************************************
    system	: 시스템관리 > 커뮤니티코드관리 > 리스트
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2013-08-23
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

	var cnt = 1;
	function fnAdd() {
		cnt = $("#filesCount").val();
		if (cnt > 9) {
			alert('9개까지 등록 가능합니다.');
			return;
		}
		cnt ++;
		var str = '';
		    
		    str = str + "<div  id='eduDate_"+cnt+"' class='input-wrap mb15'>";
		    str = str + "<input type='file' id='uploadFile"+cnt+"' name='uploadFile"+cnt+"' >";
		    str = str + "<button class='scale-up' onclick='fnAdd();return false' title='추가'>추가</button>";
		    str = str + "<button class='scale-down' onclick='fnDel("+cnt+");return false' title='삭제'>삭제</button>";
		    str = str + "</div>";
		    
		 $(".td-input-wrap").append(str);
	     $("#cnt").val(cnt);
	     $("#filesCount").val(cnt);
	}
	
	var delNum = "";
	//파일 변경값
	function fnChange(num, fileId) {
		if(fileId != 0){
			if(confirm("기존파일은 삭제됩니다 수정하시겠습니까")){
				delNum = fileId + "," + delNum ;
				$("#delNum").val(delNum);
			}else{
				return false;
			}
		}
	}
	
	function fnDel(val) {
		
		if ( $(".td-input-wrap").children().length == 1) {
			alert("더이상 삭제하실 수 없습니다.");
			$(".td-input-wrap").children().attr("id","eduDate_1");
			$(".td-input-wrap").children().find(".file_input_hidden").attr("id","uploadFile1");
			$(".td-input-wrap").children().find(".file_input_hidden").attr("name","uploadFile1");
			$(".td-input-wrap").children().find(".file_input_hidden").attr("onchange","1, this.value, 0");
			$(".td-input-wrap").children().find(".scale-down").attr("onclick","fnDel(1);return false");
			return;
		}
		
		var row = $("#eduDate_"+val);
		row.fadeOut("fast", function()
		{
			cnt--;
			row.remove();
			$("#cnt").val(cnt);
			$("#filesCount").val(cnt);
		});
	}
	
	//삭제
	function delBtn(fileId , cnt , savePath , saveFile){
		var fileId = fileId;
		var cnt = cnt;
		var savePath = savePath;
		var saveFile = saveFile;
		
		if(fileId != ''){
			if(confirm("기존파일을 삭제하시겠습니까?")){
		        $.ajax({
		            url : "/academy/tutor/deleteCmmntyFileAjax.do",
		            data : {fileId : fileId, type : 'D' , savePath : savePath , saveFile : saveFile},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == "SUCCESS"){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	
		            	//parentsTr.remove();
		            	$("#eduDate_"+cnt).remove();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		}else{
			//parentsTr.remove();
			$("#eduDate_"+cnt).remove();
		}
	}

	function tutorSubFormCheck(qu){
		var form = document.insertForm;
		
    	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
        if(form.title.value == ''){
            alert('제목을 입력해 주세요.');
            form.title.focus();
            return;
        }
        
		form.content.value = document.getElementById("content").value;
		
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		} 
		
		var qu = $('#qu').val();
		var context = '';
		
		if(qu == 'insert' || qu == 'reply'){
			context = '등록 하시겠습니까';
		}else if(qu == 'update'){
			context = '수정 하시겠습니까';
		}
		
		if(confirm(context)){
			$('.td-input-wrap div').each(function(i){
				$(this).children().attr("id","uploadFile"+(i+1));
				$(this).children().attr("name","uploadFile"+(i+1));
			});
			
			$("#insertForm").attr("mothod" , "post").attr("action" , "/admin/tutor/cmmntySubInsert.do");
			form.submit();
		}
	};
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">커뮤니티관리 - 게시판 <c:if test="${REQUEST_DATA.qu ne 'update' }">등록</c:if><c:if test="${REQUEST_DATA.qu eq 'update' }">수정</c:if>
</div>

<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />

<form name="insertForm" id="insertForm" action="" method="post" enctype="multipart/form-data">
	<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}">
	<input type="hidden" name="mode" id="mode" value="${REQUEST_DATA.mode}">
	<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
	<input type="hidden" name="nttNo" id="nttNo" value="${REQUEST_DATA.nttNo}">
	<input type="hidden" name="nttDepth" id="nttDepth" value="${REQUEST_DATA.nttDepth}">
	<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}">
	<input type="hidden" name="cnt" id="cnt" value="">
	<input type="hidden" name="delNum" id="delNum" value=""/>
	<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.tutorFilePath"))%>"/>
	<input type="hidden" name="filesCount" id="filesCount" value="${REQUEST_DATA.fileSCount+1}" />
		
	<table class="table-type1 search_form" >
		<colgroup>
			<col class="cellc" width="8%">
	        <col class="celll" width="35%">
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
		</colgroup>
		
		<tbody>
			
			<tr>
				<th>제목</th>
				<c:choose>
					<c:when test="${UPDATE_DATA.NTTNO eq '' }">
						<td colspan="3"><input type="text" name="title" id="title" class="lline" /></td>
					</c:when>
					<c:when test="${MAIN_DATA.NttNo ne '' && REQUEST_DATA.qu eq 'reply'}">
						<td colspan="3"><input type="text" name="title" id="title" class="lline" value="RE: ${MAIN_DATA.TITLE} "/></td>
					</c:when>
					<c:otherwise>
						<td colspan="3"><input type="text" name="title" id="title" class="lline" value="${UPDATE_DATA.TITLE} "/></td>
					</c:otherwise>
				</c:choose>
				
			</tr>
			
			<tr>
				<c:choose>
					<c:when test="${REQUEST_DATA.qu eq 'reply'}">
						<th>공개여부</th>
						<td>
							<input type="radio" name="useYn" id="useYn" value="Y" <c:if test="${UPDATE_DATA.useYn eq 'Y' || UPDATE_DATA.useYn eq null }">checked="checked"</c:if> />&nbsp공개 
							<input type="radio" name="useYn" id="useYn" value="N" <c:if test="${UPDATE_DATA.useYn eq 'N' }">checked="checked"</c:if> />&nbsp미공개
						</td>
						<!-- 디폴트값 -->
						<input type="hidden" name="noticeYn" id="noticeYn" value="N" />
					</c:when>
					<c:otherwise>
						<th>공개여부</th>
						<td>
							<input type="radio" name="useYn" id="useYn" value="Y" <c:if test="${UPDATE_DATA.useYn eq 'Y' || UPDATE_DATA.useYn eq null }">checked="checked"</c:if> />&nbsp공개 
							<input type="radio" name="useYn" id="useYn" value="N" <c:if test="${UPDATE_DATA.useYn eq 'N' }">checked="checked"</c:if> />&nbsp미공개
						</td>
						<c:if test="${REQUEST_DATA.depth <= 1 && REQUEST_DATA.bbsNoticeAt eq 'Y'}">
							<th>공지여부</th>
							<td>
								<input type="radio" name="noticeYn" id="noticeYn" value="Y" <c:if test="${UPDATE_DATA.NOTICE_AT eq 'Y' }">checked="checked"</c:if> />&nbsp공지
							 	<input type="radio" name="noticeYn" id="noticeYn" value="N" <c:if test="${UPDATE_DATA.NOTICE_AT eq 'N' || REQUEST_DATA.qu eq 'insert'}">checked="checked"</c:if> />&nbsp공지 안함
							</td>
						</c:if>
						<c:if test="${REQUEST_DATA.depth > 1 && REQUEST_DATA.bbsNoticeAt ne 'Y'}">
							<!-- 디폴트값 -->
						<input type="hidden" name="noticeYn" id="noticeYn" value="N" />
						</c:if>
					</c:otherwise>
				</c:choose>	
			</tr>
			
			<tr>
				<th>내용</th>
				<td style="padding:20px 10px 20px 10px;" colspan="3">
	               <div>
	                   <!-- [필수]에디터 안에 글내용 영역 -->
	                   <textarea name="content" id="content" rows="22" style="width:100%;" >
	                   		<c:if test="${REQUEST_DATA.qu eq 'update' }">
	                   			<c:out value="${UPDATE_DATA.CONTENT}" escapeXml="false"/>
	                   		</c:if>
	                   		<c:if test="${REQUEST_DATA.qu eq 'reply' }">
	                   			<br>
	                   			<br>
	                   			<br>
	                   			<br>
	                   			<span>------------------------------------------------------------------------------------------------------</span>
	                   			<br>
	                   			<c:out value="${MAIN_DATA.CONTENT}" escapeXml="false"/>
	                   			
	                   		</c:if>
	                   </textarea>
	               </div>
         		</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td colspan="3" class="td-input-wrap">
				<c:if test="${REQUEST_DATA.qu eq 'update'}">
					<c:forEach items="${fileList}" var="fileList" varStatus="status">
						<div  id="eduDate_${status.count}" class="input-wrap mb15">
							<input type="hidden" name="fileId${status.count}" id="fileId${status.count}" value="${fileList.FILE_ID}"> 
							<input type="text" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
							<input type="file" id="uploadFile${status.count}" name="uploadFile${status.count}" onchange="fnChange( ${status.count} , ${fileList.FILE_ID});">
							<button class="scale-up" onclick="fnAdd();return false" title="추가">추가</button>
							<button class="scale-down" onclick="delBtn('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${status.count}"/>' , '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>');return false" title="삭제">삭제</button>
						</div>
					</c:forEach>
				</c:if>
				<div  id="eduDate_${REQUEST_DATA.fileSCount+1}" class="input-wrap mb15">
				  	<input type="file" id="uploadFile${REQUEST_DATA.fileSCount+1}" name="uploadFile${REQUEST_DATA.fileSCount+1}"  onchange="fnChange(${REQUEST_DATA.fileSCount+1}, 0);">
					<button class="scale-up" onclick="fnAdd();return false" title="추가">추가</button>
					<button class="scale-down" onclick="fnDel(${REQUEST_DATA.fileSCount+1});return false" title="삭제">삭제</button>
				</div>
				</td>
			</tr>
		 </tbody>
	 </table>
	<div class="button">
		<c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
        	<a href="#" onclick="tutorSubFormCheck('<c:out value="${REQUEST_DATA.nttNo}" />'); return false;" class= "btn big blue">등록</a>
         </c:if>
         <c:if test="${REQUEST_DATA.pageMode ne pageModeReg}">
             <a href="#" onclick="tutorSubFormCheck('update'); return false;" class= "btn big green">수정</a>
         </c:if>
        <a href="javascript:window.history.back();" class="btn gray big">취소</a>
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
