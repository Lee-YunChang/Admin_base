<%@page import="com.sangs.util.StringUtil"%>
<%
/****************************************
	system	: ClassDesk > 강사 > 과제출제 등록폼
	title	: 과제 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassData')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassNotice')}">notice</c:if>
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassData')}">data</c:if>
</c:set>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

<script type="text/javascript">
		jQuery(document).ready(function(){
			SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));
		});	
		//파일추가
		function fnAdd() {
			if ( $(".td-input-wrap").children(".input-wrap").length > 8) {
				alert('9개까지 등록 가능합니다.');
				return;
			}
			$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='hidden' id='fileName' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'> <input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange(this.value , 0);'>	<span class='timebtn'><a class='btn-small-brown' onclick='fnAdd();return false' title='추가'><span>+</span></a> <a class='btn-small-purple' id='fnDel' title='삭제'><span>-</span></a></span></div></div></div>");
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
		
		// 페이징 이동 함수
		function fnList() {
			$('#bbsForm').attr('target', '_self').attr('method', 'get').attr('action', '/classdesk/bbs/list.do').submit();
		}
		
		function fnSave(){ 
	       
			var form = document.bbsForm; 

	        /* 유효성 체크 시작 */
	        if($('#title').valueEmpty()){
	            alert('제목을 입력해 주세요.');
	            $('#title').focus();
	            return false;
	        }  
	        
	      //공개여부
		    if(!$(':input:radio[name=openAt]:checked').val()) {
		    	alert("공개여부를 선택해주세요.");
		        return;
		    }
	      
		    //상위고정
		    if(!$(':input:radio[name=topYn]:checked').val()) {
		    	alert("상위고정을 선택해주세요.");
		        return;
		    }
		    
	        oEditors.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
	        form.summary.value = document.getElementById("summary").value;
	     	//내용 
			var str=form.summary.value;
			
			str = str.replace(/&nbsp;/g,"");
			str = str.replace(/<p>/g,"");
			str = str.replace(/<\/p>/g,"");
			str = str.replace(/\r\n/g,"");
			
			if(str.length<=0) {
				alert("내용을 입력해 주세요.");
				return false;
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
				
				$('#bbsForm')
				.attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/exec.do')
				.attr('target', '_cm')
				.submit();
			}
		}

		//파일 삭제
		function delBtn(fileId , cnt , savePath , saveFile,bbsno){ 
			var fileId = fileId;
			var cnt = cnt;
			var savePath = savePath;
			var saveFile = saveFile;
			var bbsno = bbsno;
			if(fileId != ''){
				if(confirm("기존파일을 삭제하시겠습니까?")){
			        $.ajax({
			            url : "/classdesk/bbs/deleteEdBbsFileAjax.do",
			            data : {fileId : fileId, savePath : savePath , saveFile : saveFile, bbsno : bbsno},
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
	
	<div class="round-box-small blue">

		<div class="table-title clearfix">
			<c:if test="${topMenuCode eq 'notice'}"><h3 class="ico-table-blue">공지사항</h3></c:if>
			<c:if test="${topMenuCode eq 'data'}"><h3 class="ico-table-blue">자료실</h3></c:if>
		</div>
		<!-- 테이블 -->
		<form id="bbsForm"  name="bbsForm"  action="" enctype="multipart/form-data" method="post">
 			<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
 			<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
			<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
			<input type="hidden" name="fileId" id="fileId" value=""/>
			<input type="hidden" name="filename" id="filename" value=""/>
			<input type="hidden" name="fileName" id="fileName" value=""/>
			<input type="hidden" name="ftype" id="ftype" value=""/>
			<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
			<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />
 			<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.classdeskFilePath"))%>"/>
 			<input type="hidden" name="delNum" id="delNum" value=""/>
 			
			<div class="table-type2">
				<table summary="상상스토리 교육시스템의 클래스데스크 게시판입니다.">
					<caption>클래스데스크 게시판</caption>
					<colgroup>
						<col width="13%" />
						<col width="35%" />
						<col width="15%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<th><em>* </em>제목</th>
							<td colspan="3"><label for="task-title">제목</label>
							<input type="text" class="line" id="title" name="title" id="task-title" value='<c:out value="${rowData.TITLE}" />' style="height:20px;width:600px;"/></td>
						</tr>
						
						<tr>
							<th><em>* </em>공개여부</th>
							<td>
								<input type="radio" name="openAt" id="openAt" value="Y" <c:if test="${rowData.OPEN_AT eq 'Y'}"> checked="checked"</c:if> checked/><span>공개</span>
								<input type="radio" name="openAt" id="openAt" value="N"<c:if test="${rowData.OPEN_AT eq 'N'}"> checked="checked"</c:if>/><span>비공개</span>
							</td>
							<th><em>* </em>상위고정</th>
							<td>
			       				<input type="radio" name="topYn" value="Y" <c:if test="${rowData.TOPYN eq 'Y'}"> checked </c:if>/> 고정 &nbsp;
								<input type="radio" name="topYn" value="N" <c:if test="${rowData.TOPYN eq 'N' || rowData.TOPYN eq null}"> checked </c:if>/> 고정안함 
				            </td>
						</tr>
						
						<tr>
							<th><em>* </em>내용</th>
							<td style="padding:20px 10px 20px 10px;" colspan="3">
					               <div>
					                   <!-- [필수]에디터 안에 글내용 영역 -->
					                   <textarea title="내용" name="summary" id="summary" rows="22" style="width:100%;" ><c:out value="${rowData.CONTENT}" escapeXml="false"/></textarea>
					               </div>
					         </td>
						</tr>
						
						<tr>
							<th>파일첨부</th>
							<td class="td-input-wrap"  colspan="3">
							<c:if test="${!empty fileList}">
								<c:forEach var="fileList" items="${fileList}" varStatus="status">
								<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
									<div  id="eduDate_${status.count}" class="input-wrap mb15"  style="height:25px">
										<div class="file-wrap">
											<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
												<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
											<span class="timebtn">
												<a class="scale-down btn red small" onclick="delBtn('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${status.count}"/>' , '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>','<c:out value="${rowData.BBSNO}"/>');return false" title="삭제">삭제</a>
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
											<a class="btn-small-brown" onclick="fnAdd();return false" title="추가"><span>+</span></a>
											<a class="btn-small-purple" id="fnDel" title="삭제"><span>-</span></a>
										</span>
									</div>
								</div>
							</div>
							</td>
						</tr>
						
						
					</tbody>
				</table>
			</div>
		
		<!-- //과제출제 테이블 -->
	</div>
	<!-- //과제출제 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div>
			<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
				<a href="#none"  onclick="fnSave(); return false;" class="btn-large-blue"><span>등록</span></a>
 			</c:if>
 			<a href="#none"  onclick="fnList(); return false;"  class="btn-large-orange"><span>취소</span></a> 
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	</form>
	
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "summary",
		    sSkinURI: "/admin/common/smarteditor/SmartEditor2Skin.html",
		    fCreator: "createSEditor2"
		});
		
	</script>
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
