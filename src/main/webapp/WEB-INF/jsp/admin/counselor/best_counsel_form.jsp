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

<script id="itemRow" type="text/template">
<tr align="middle" class="onFocusBgCh" id="cmtrow_{{=cmtno}}_{{=rpyno}}">
	<td>{{=rowname}}</td>
	<td>{{=writer}}</td>
	<td style="text-align:left;padding-left:15px">{{=content}}</td>
	<td>{{=wdate}}</td>
	<td>
		{{=btn}}
		<a href="#" onclick="reply_exec('DEL',{{=bbsno}},{{=cmtno}},{{=rpyno}}); return false;" class="btn red small">삭제</a>
	</td>
</tr>
</script>

<script type="text/javascript">
$(document).ready(function() {
	reply_exec();
});
function fnAdd() {
	if ( $(".td-input-wrap").children(".input-wrap").length > 8) {
		alert('9개까지 등록 가능합니다.');
		return;
	}
	$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='hidden' id='fileName' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'> <input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange(this.value , 0);'>	<span class='timebtn'><a class='scale-up btn blue small' onclick='fnAdd();return false' title='추가'>추가</a> <a class='scale-down btn red small' id='fnDel' title='삭제'>삭제</a></span></div></div></div>");
}

var delNum = "";
var replystatus = "N";
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
        var form = document.pform;
		$("#pform").attr("action", "/admin/counselor/bbsList.do");
        form.submit();
    }

    function go_exec(){
    	var form = document.pform;
    	
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
		
		oEditors.getById["anContent"].exec("UPDATE_CONTENTS_FIELD", []);
		form.anContent.value = document.getElementById("anContent").value;
		
	    //내용
		var str2=form.anContent.value;
		
		str2 = str2.replace(/&nbsp;/g,"");
		str2 = str2.replace(/<p>/g,"");
		str2 = str2.replace(/<\/p>/g,"");
		str2 = str2.replace(/\r\n/g,"");
		
    	  //상위고정
	    if(!$(':input:radio[name=topYn]:checked').val()) {
	    	alert("상위고정을 선택해주세요.");
	        return;
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
			$("#pform").attr("action", "/admin/counselor/bestBbsExec.do");
	        form.submit();
		}
    } 
    
    function delete_exec(){ 
    	var form = document.pform;
    	form.qu.value='delete';
		if(confirm("삭제하시겠습니까?")) {
			$("#pform").attr("action", "/admin/counselor/bbsExec.do");
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
		            url : "/admin/tutor/deleteEdBbsFileAjax.do",
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
	
	//파일다운로드
	function filedown(fileId,fname,type,orgFile,fileSeq){ 
		$('#fileId').val(fileId);
		$('#filename').val(encodeURIComponent(fname));
		$('#fileName').val(encodeURIComponent(orgFile));
		$('#ftype').val(type);
		$('#fileSeq').val(fileSeq);
		$('form[name=pform]').attr('action', '/admin/tutor/filedown.do').submit();
	}
	
	//댓글실행
	function reply_exec(pmode,bbsNo,cmtno,rpyno){
		var replyContent = "";
		
		bbsNo = $('#bbsNo').val();
		
		if(pmode == 'SUB' || pmode == 'RESUB'){ //입력일 경우 글번호 설정
			if($('#replyContent').valueEmpty('내용을 입력해주세요.')){
				return false;
			} 
			replyContent = $('#replyContent').val();
		} else if(pmode == 'DEL'){
			if(confirm("삭제하시겠습니까?")){
			}else{
				return false;
			}
		}
		$.ajax({
			url : '/admin/site/tutorCommentExe.do',
			type : "POST",
			data : {pmode:pmode,bbsNo:bbsNo
					,cmtno:cmtno,rpyno:rpyno
					,content:replyContent},
			dataType : "json",
			success : function(data) {
				replystatus = 'N';
				$('#replyContent').empty();
				
				$('#commentTable').empty();	
				$('#commentTable').append('<colgroup><col width="6%"><col width="8%"><col width="*"><col width="17%"><col width="9%">');
				$('#commentTable').append('</colgroup><tbody><tr class="rndbg"><th>NO</th><th>이름</th><th>내용</th><th>작성일</th><th><a class="scale-down btn blue small" onclick="fnCmtForm();return false" title="댓글">댓글</a></th></tr>');
				
				if(data.list.length == 0){
					$('#commentTable').append('<tr><td colspan="5">등록된 댓글이 없습니다.</td></tr>');
				} else {
					var rowname = 1;
					var rowno = 1;
					var rowcmtno = 1;
					var btn ="";
					
					$.each(data.list, function(i, item){
						if(i != 0){
							if(data.list[i].CMTNO != data.list[i-1].CMTNO){
								rowno += 1;
								rowcmtno = 1;
								btn = '<a href="#" onclick="cmt_reply_form(\'cmtrow_'+data.list[i].CMTNO+'_1\','+data.list[i].BBSNO+','+data.list[i].CMTNO+'); return false;" class="btn blue small">답글</a>';
								
								rowname = rowno;
							} else{
								rowname = rowno +"-"+rowcmtno;
								btn = "";
								rowcmtno += 1;
							}
						} else if(i == 0){
							btn = '<a href="#" onclick="cmt_reply_form(\'cmtrow_'+data.list[i].CMTNO+'_1\','+data.list[i].BBSNO+','+data.list[i].CMTNO+'); return false;" class="btn blue small">답글</a>';
						}
			        		$('#commentTable').append(_.template($('#itemRow').html())(
			        				{ cmtno:item.CMTNO,rpyno:item.RPYNO	
			        				  ,bbsno:item.BBSNO,writer:item.WRITER
			        				  ,wdate:item.WDATE
			        				  ,content:$.trim(item.CONTENT.replace(/\n/g,"<br />")) 
			        				  ,userno:item.USERNO
			        				  ,rowname:rowname
			        				  ,btn:btn
			        				}
			        		));
					 }); 
					
				} 
			}
		});
	}
	
	function fnCmtForm() {
		if(replystatus != 'Y'){
			replystatus = 'Y';
			$('#commentTable').append('<tr><td></td><td></td><td><textarea id="replyContent" name="replyContent" style="width:98%;height:50px"></textarea></td><td></td><td><a class="scale-down btn blue small" onclick="reply_exec(\'SUB\');return false" title="입력">입력</a></td></tr>');
			
		} else {
			alert("입력을 완료해 주세요.");
		}
	}
	
	function cmt_reply_form(cmtrow,bbsNo,cmtno) {
		var target = '#'+cmtrow;
		var subString = "";
		
		if(replystatus != 'Y'){
			replystatus = 'Y';
			subString = '<tr><td></td><td></td><td><textarea id="replyContent" name="replyContent" style="width:98%;height:50px"></textarea></td><td></td><td><a class="scale-down btn blue small" onclick="reply_exec(\'RESUB\','+bbsNo+','+cmtno+');return false" title="입력">입력</a></td></tr>';
			$(target).after(subString);
		} else {
			alert("입력을 완료해 주세요.");
		}
	}
	
	function popCounsel(){
		window.open("/admin/counselor/CounselorSearch.do","tutorPop","width=900,height=650,scrollbars=yes");	
	}
	
	function PopupCallBack(data){
		$('#counselorUserno').val(data.lecUserno);
		$('#counselorNm').val(data.lecUsernm);
	} 
	
	function counselorSave(flag){
		
		if($('#counselorNm').valueEmpty('강사를 선택해주세요.')){
			popTutor();
			return false;
		}
		
		if(confirm(flag === 'Y' ?'선택한 강사를 배정하시겠습니까?' : '배정된 강사정보를 삭제하시겠습니까?')){
			$.ajax({
				url : '/admin/counselor/personalCounselorExec.do',
				data : {finalAt:flag, counselorUserno:$('#counselorUserno').val(), bbsNo:$('#bbsNo').val()},
				dataType : 'json',
				type : 'post',
				async: 'false',
				success : function(res) { 
					if(res === 'SUCCESS'){
						//$('#mtLecStatusCode').val('LE0004').prop('selected',true);
						$('#finalAt').val(flag);
						if(flag === 'Y'){
							alert('상담사 배정이 완료되었습니다.');
							$('#emptyCounselor').hide();
							$('#compCounselor').show();
							$('#CounselorText').text('상담사배정이 확정되었습니다.');
						
						}else{
							alert('배정된 상담사정보를 삭제하였습니다.');
							$('#emptyCounselor').show();
							$('#compCounselor').hide();
							$('#CounselorUserno').val('');
							$('#counselorNm').val('');
							$('#CounselorText').text('등록된 강사가 없습니다.');
						}
						
					}else{
						alert('오류발생');
					}
				},
				error : function(e) {
					alert("error :" + e.responseText);
				}
			});	
		}
		
	}
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"><c:out value="${cmap.BCATENAME}"/><span> 게시물을 관리합니다.</span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="replyForm" id="replyForm" method="post">
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
</form>
<form name="pform" id="pform" action="/admin/site/bbsForm.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="oFileNo" value="<c:out value="${map.FILENO}"/>"/>
    <input type="hidden" name="delFile" value=""/>
    <input type="hidden" name="counselorUserno" id="counselorUserno" value="${map.TUTOR_USERNO}"/>
    <input type="hidden" name="bbsNo" id="bbsNo" value="<c:out value="${map.bbsNo}"/>"/>
    <input type="hidden" name="grpNo" value="<c:out value="${map.GRPNO}"/>"/>
    <input type="hidden" name="refLevel" value="<c:out value="${map.REFLEVEL}"/>"/>
    <input type="hidden" name="refStep" value="<c:out value="${map.REFSTEP}"/>"/>
    <input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bbsTutorNoticeFilePath")%>"/>
    <input type="hidden" name="delCheckFile" value=""/>
    <input type="hidden" name="fileId" id="fileId" value=""/>
	<input type="hidden" name="filename" id="filename" value=""/>
	<input type="hidden" name="fileName" id="fileName" value=""/>
	<input type="hidden" name="ftype" id="ftype" value=""/>
	<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
	<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />
	
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
        		<input type="text" class="line" name="title" id="title" style="width:600px" value="<c:out value="${retitle}"/><c:out value="${map.TITLE}"/>"/>
            </td>
      </tr>
          <th><em>*</em>공개여부</th>
          <td colspan="3">
 				<input type="radio" name="openAt" value="Y" <c:if test="${map.OPEN_AT eq 'Y'}"> checked="checked" </c:if>checked /> 공개 &nbsp;
				<input type="radio" name="openAt" value="N" <c:if test="${map.OPEN_AT eq 'N'}"> checked="checked" </c:if> /> 미공개         
          </td>
            <th style="display: none;"><em>*</em>상위고정</th>
            <td style="display: none;">
   				<input type="radio" name="topYn" value="Y" <c:if test="${map.TOPYN eq 'Y'}"> checked="checked" </c:if> /> 고정 &nbsp;
				<input type="radio" name="topYn" value="N" <c:if test="${map.TOPYN eq 'N'}"> checked="checked" </c:if> checked/> 고정안함&nbsp;<font class=extext> 게시글을 상단에 고정합니다.</font> 
            </td>
      <tr>
      	<th><em>*</em>분야</th>
        <td>
        	<select id="mtCateCode" name="mtCateCode" title="분류">
			<option value="">선택</option>
			<c:forEach var="code" items="${categoryData}"> 
				<option name="mtCateCode" value="${code.MT_SUB_CODE}" <c:if test="${code.MT_SUB_CODE eq map.MT_CATE_CODE}">selected="selected"</c:if>>${code.MT_SUB_NAME}</option>
			</c:forEach>
			</select>
        </td>
        <th><em>*</em>직종</th>
        <td>
        	<select id="mtJobCode" name="mtJobCode" title="직종">
			<option value="">선택</option>
			<c:forEach var="code" items="${jobData}"> 
				<option name="mtJobCode" value="${code.MT_SUB_CODE}" <c:if test="${code.MT_SUB_CODE eq map.MT_JOB_CODE}">selected="selected"</c:if>>${code.MT_SUB_NAME}</option>
			</c:forEach>
			</select>
        </td>
      </tr>
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
				<td class="td-input-wrap" colspan="3">
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
									<a class="scale-down btn red small" onclick="delBtn('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${status.count}"/>' , '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>','<c:out value="${map.bbsNo}"/>');return false" title="삭제">삭제</a>
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
    
	    <br/>
	    <br/>
	    
	    <div class="title title_top">답변내용</div>
	    
	    <table class="table-type1 search_form">
	      <colgroup>
	          <col class="cellc" width="15%">
	          <col class="celll" width="35%">
	          <col class="cellc" width="15%">
	          <col class="celll" width="35%">
	      </colgroup>
	      	<tr>
	      	<th><em>*</em>작성자</th>
	        <td>
	        	임꺽정
	        </td>
	        <th><em>*</em>작성일</th>
	        <td>작성일</td>
	      </tr>
	    	<tr>
	    		<th>답변<br/>내용</th>
		         <td style="padding:20px 10px 20px 10px;" colspan="3">
		               <div>
		                   <!-- [필수]에디터 안에 글내용 영역 -->
		                   <textarea name="anContent" id="anContent" rows="22" style="width:100%;" ><c:out value="${map.AN_CONTENT}" escapeXml="false"/></textarea>
		               </div>
		         </td>
	    	</tr>
	    </table>
    
<div class="button" >
	
    <c:if test="${map.bbsNo eq null}">
	  	<a href="#" onclick="go_exec(); return false;" class="btn green big">등록</a>
  	</c:if>
	<c:if test="${map.bbsNo ne null}">
		<c:if test="${map.USERNO == REQUEST_DATA.SES_USERNO}">
	    	<a href="#" onclick="go_exec(); return false;" class="btn green big">수정</a>
	    </c:if>
	    <a href="#" onclick="delete_exec(); return false;" class="btn orange big">삭제</a>
    </c:if>
    <a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
</div>

</form>

<!-- 댓글 리스트 테이블 -->
<c:if test="${map.bbsNo ne null}">
	<c:if test="${cmap.ISCMT == 'Y'}">
		<table id="commentTable" class="tb table-type1">
		</table> 
	</c:if>
</c:if>
<!-- //댓글 리스트 테이블 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "anContent",
    sSkinURI: "/admin/common/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%> 