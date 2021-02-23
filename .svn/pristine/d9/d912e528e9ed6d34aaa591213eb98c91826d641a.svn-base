<%@page import="com.sangs.util.StringUtil"%>
<%
/****************************************
	system	: ClassDesk > 강사 > 토론 등록폼
	title	: 토론 목록
	summary	:	
	wdate   : 2016-08-19
	writer  : 황두은 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>

<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassDiscuss')}">discuss</c:if>
</c:set>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

<script type="text/javascript">
		
		// 상시참여 체크하면 날짜 선택란 안보임
		jQuery(document).ready(function(){
					if($('#bbsNo').val() > 0) {
						$('#ordtmAt').change(function () {
							if (!this.checked) 
					        	 $('#hideshowdate').show();
							else 
					        	$('#hideshowdate').hide();
						});
					} else {
						//alert('등록창');
						$('#ordtmAt').change(function () {
					        if (!this.checked) 
					        	 $('#hideshowdate').show();
					        else 
					        	$('#hideshowdate').hide();
					    });
					}
					
				$('#ordtmAt').change(function(){
					   if (this.checked) {
				        	 document.discussForm.dscsnSdate.value=null;
				        	 document.discussForm.dscsnEdate.value=null;
				        	 document.discussForm.ordtmAt.value='Y';
				        }
				});
				
				SANGS.Util.datepickerCallOptions($('#dscsnSdate'), $('#dscsnEdate'));
			
		});	 
		//파일추가
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
		
		// 페이징 이동 함수
		function fnList() {
			$('#discussForm').attr('target', '_self').attr('method', 'get').attr('action', '/classdesk/tutor/discuss/list.do').submit();
		}
		
		function fnSave(bbsNo){ 
	        
			var form = document.discussForm; 
	        
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
	     	//내용 필수 입력
			var str=form.summary.value;
			
			str = str.replace(/&nbsp;/g,"");
			str = str.replace(/<p>/g,"");
			str = str.replace(/<\/p>/g,"");
			str = str.replace(/\r\n/g,"");
			
			if(str.length<=0) {
				alert("내용을 입력해 주세요.");
				return false;
			} 
			
			
			$('#discussForm input').on('change', function() {
			   $('input[name=openAt]:checked', '#discussForm').val(); 
			   $('input[name=topYn]:checked', '#discussForm').val(); 
			});
			
			if ($('#ordtmAt').is(":checked")) {
				$("#ordtmAt").val('Y');
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
  				
  					$("#bbsNo").val(bbsNo);
					$('#discussForm')
					.attr('action', '/classdesk/tutor/discuss/exec.do')
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
			            url : "/classdesk/tutor/discuss/deleteEdBbsFileAjax.do",
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

	<!-- //개설과목명 -->
	<div class="round-box-small blue">
	<!-- 토론 테이블 -->
	<form id="discussForm" name="discussForm" action="" enctype="multipart/form-data" method="post">
		<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
 		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
		<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
		<input type="hidden" name="qu"  id="qu" value="${REQUEST_DATA.qu }"/>
		<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.tutorFilePath"))%>"/>
 		<input type="hidden" name="refLevel"  id="refLevel" value="<c:out value="${REQUEST_DATA.refLevel}" />"/>
		<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${REQUEST_DATA.refStep}" />"/>
		<input type="hidden" name="grpno"  id="grpno" value="<c:out value="${REQUEST_DATA.grpno}" />"/>
		<input type="hidden" id="userno" value="<c:out value="${REQUEST_DATA.userno}" />"/>
		<input type="hidden" id="sesuserno" value="<c:out value="${REQUEST_DATA.SES_USERNO}" />"/>
		<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />
 		<div class="table-title clearfix">
		<c:if test="${rowData.BBSNO == null && rowData.BBSNO ==''}"><h3 class="ico-table-blue">토론 등록</h3></c:if>
		</div>
		<c:if test="${rowData.ISTOP eq 'N'}">
	        <input type="hidden" name="topYn" value="N"/>
	    </c:if>
		<div class="table-type2">
			<table>
				<caption>토론등록 테이블</caption>
				<colgroup>
					<col width="13%" />
					<col width="37%" />
					<col width="13%" />
					<col width="37%" />
				</colgroup>
				<tbody>
					<tr>
						<th><em>*</em>제목</th>
						<td colspan="3"><label for="task-title">제목</label><input type="text" style="height:20px" class="w98" id="title" name="title" id="task-title" value='<c:out value="${rowData.TITLE}" />' /></td>
					</tr>
					
					<tr>
						<th><em>*</em>참여 기간</th>
						<td colspan="3">
							<div id="hideshowdate">
								<label for="task-date1">시작날짜선택</label>
								<input type="text" class="w15" name="dscsnSdate" id="dscsnSdate"  style="height:20px"value='<c:out value="${rowData.DSCSN_SDATE}"/>' readonly="readonly"  style="width: 115px"/> 
								<a href="#none" onclick="$('#dscsnSdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="시작날짜선택" /></a>  &nbsp;
								<span class="date-cut">&nbsp;~&nbsp;</span> 
								<label for="task-date2">마지막날짜선택</label>
								<input type="text" class="w15" name="dscsnEdate" id="dscsnEdate"  style="height:20px"value='<c:out value="${rowData.DSCSN_EDATE}"/>' readonly="readonly" style="width: 115px"/> 
								<a href="#none" onclick="$('#dscsnEdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="마지막날짜선택" /></a>  &nbsp; 
							</div>
							<input type="checkbox" id="ordtmAt" name="ordtmAt" <c:if test="${rowData.ORDTM_AT eq 'Y'}"> checked="checked"</c:if>>상시참여(기간없음)
						</td>
					</tr>
					
					<tr>
						<th><em>*</em>공개 여부</th>
						<td>
							<input type="radio" id="openAt" name="openAt" value="Y" <c:if test="${rowData.OPEN_AT eq 'Y'}"> checked="checked"</c:if>checked>공개
							<input type="radio" id="openAt" name="openAt" value="N" <c:if test="${rowData.OPEN_AT eq 'N'}"> checked="checked"</c:if>>미공개 
						</td>
						
						<th><em>*</em>상위 고정</th>
						<td colspan="3">
							<input type="radio" id="topYn" name="topYn" value="Y" <c:if test="${rowData.TOPYN eq 'Y'}"> checked="checked"</c:if>>고정
							<input type="radio" id="topYn" name="topYn" value="N" <c:if test="${rowData.TOPYN eq 'N'}"> checked="checked"</c:if><c:if test="${REQUEST_DATA.qu eq 'insert'}"> checked</c:if>>고정 안함
					</tr>
					
					<tr>
						<th><em>*</em>내용</th>
						<td style="padding:20px 10px 20px 10px;" colspan="3">
							<div>
								<textarea title="내용" name="summary" id="summary" rows="22" style="width:100%;"><c:out value="${rowData.CONTENT}" escapeXml="false"/></textarea>
							</div>
						</td>
					</tr>
					 
					 <tr>
							<th>파일첨부</th>
							<td class="td-input-wrap">
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
											<a class="scale-down btn blue small" onclick="fnAdd();return false" title="추가">추가</a>
											<a class="scale-down btn red small" id="fnDel" title="삭제">삭제</a>
										</span>
									</div>
								</div>
							</div>
							</td>
						</tr>
					 
				</tbody>  
			</table>
		</div>
		
		<!-- 라운드박스 구성요소 -->
		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div>
		<!-- //라운드박스 구성요소 -->
		
	</div>
	<!-- // 토론 등록 테이블 -->
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
	
		<div>
			<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
				<a href="#none" id="fnSave" onclick="fnSave('<c:out value="${REQUEST_DATA.bbsNo}" />'); return false;" class="btn-large-blue"><span>등록</span></a>
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