<%
/****************************************************
    system	: 과정관리 > 과정정보관리
    title	: 교육과정 등록/수정 양식
    summary	:
    wdate	: 2016-04-18
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>

<!-- 본문 > 상단 > 타이틀 -->
<c:if test="${not empty REQUEST_DATA.courseno && REQUEST_DATA.courseno > 0}">
	<c:set var="titleMode" value="수정"/>
	<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%></c:set>
</c:if>
<c:if test="${empty REQUEST_DATA.courseno || REQUEST_DATA.courseno == 0}">
	<c:set var="titleMode" value="등록"/>
	<c:set var="reg"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
	<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
</c:if>
<c:if test="${!empty REQUEST_DATA.pageMode}"><c:set var="pageMode">${REQUEST_DATA.pageMode}</c:set></c:if>
<div class="title title_top">교육과정등록 - 유관기관교육 ${titleMode}<span></span></div>

<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/courseExec.do" method="POST" onsubmit="writeFormCheck(); return false;" enctype="multipart/form-data">
<input type="hidden" name="mt_ctype_code" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_RELATION")%>"/>
<input type="hidden" name="mt_cgrp_code" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_CGRP_DEFAULT_CODE")%>"/>
<input type="hidden" name="courseno" value="${pageMode == reg ? '0' : map.COURSENO}"/>
<input type="hidden" name="class_desk" id="class_desk" value=""/>
<input type="hidden" name="del_files" id="del_files" value=""/>
<input type="hidden" name="sample_yn" id="sample_yn" value=""/>

<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>
<input type="hidden" id="count" value="${fn:length(course_Loan_Info)}"/>
<input type="hidden" id="insClassDesk" value=""/>

<input type="hidden" id="imageCnt" value="${fn:length(fileMap)}"/>

<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="35%">
        <col class="cellc" width="8%">
        <col class="celll" width="35%">
    </colgroup>
    <tbody>
        <tr>
        	<th>* 과정구분</th>
            <td colspan="3">
                <select name="mt_sc_code" id="mt_sc_code" title="과정구분" style="width: 300px">
                    <option value="">선택</option>
                    <c:forEach var="emap" items="${course_title}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${map.MT_SC_CODE == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>* 과정명</th>
            <td colspan="3"><input type="text"  class="line" name="coursetitle" id="coursetitle" value="${map.COURSETITLE}" style="width: 400px;"/></td>
        </tr>
        <tr>
            <th>* 과정설명</th>
            <td colspan="3">
                <textarea rows="4" name="description"  id="description"  style="width:100%;">${map.DESCRIPTION }</textarea>
            </td>
        </tr>
        <tr>
        	<th>사용여부</th>
            <td colspan="3">
            	<input type="radio" name="useyn" value="Y" <c:if test="${pageMode eq reg}">checked="checked"</c:if><c:if test="${map.USEYN == 'Y'}">checked="checked"</c:if>>사용&nbsp;&nbsp;&nbsp;
            	<input type="radio" name="useyn" value="N" <c:if test="${map.USEYN == 'N'}">checked="checked"</c:if>>사용안함
            </td>
        </tr>
        <tr>
        	<th>* 썸네일</th>
	            <td class="td-input-wrap" colspan="3">
				<c:if test="${not empty fileMap}">
					<c:forEach var="fileList" items="${fileMap}" varStatus="status">
						<div class="file-wrap">
							<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
								<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>')" class="btn-down">
									<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
								</a>
							<span class="timebtn">
<%-- 								<a class="scale-down btn red small" onclick="delBtn('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${status.count}"/>' , '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>','<c:out value="${fileList.COURSENO}"/>');return false" title="삭제">삭제</a> --%>
								<a class="scale-down btn red small" onclick="delThumBtn('<c:out value="${fileList.FILE_ID}"/>', '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>','<c:out value="${fileList.COURSENO}"/>');return false" title="삭제">삭제</a>
							</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty fileMap}">
					<input type='file' name='thumbnail' id="thumbnail" style='width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;'/>
				</c:if>
	            </td>
        </tr>
        
        <tr>
        	<th>* 콘텐츠 구분</th>
            <td colspan="3">
            	<c:if test="${empty REQUEST_DATA.courseno || REQUEST_DATA.courseno == 0}">
		          	<c:forEach var="contentsList" items="${contentsList}" varStatus="stauts">
		      			<input type="radio" value="${contentsList.MT_SUB_CODE}" name="mtContentsCode" id="mtContentsCode_${stauts.count}">&nbsp;<c:out value='${contentsList.MT_SUB_NAME }'/>&nbsp;&nbsp;
		      		</c:forEach>
        		</c:if>
        		
        		<c:if test="${not empty REQUEST_DATA.courseno || REQUEST_DATA.courseno != 0}">
        			<c:choose>
        				<c:when test="${map.MT_CONTENTS_CODE eq 'CT0001'}">youtube</c:when>
        				<c:when test="${map.MT_CONTENTS_CODE eq 'CT0002'}">mp4</c:when>
        			</c:choose>
        		</c:if>
            </td>    
        </tr>
        
        
        <tr>
        	<th>유튜브 URL</th>
            <td colspan="3">
            	<input type="text" name="youtubeUrl" id="youtubeUrl" value="" class="line" style="width: 400px;"/>
            	<font color="#ff0000">※ https://www.youtube.com/watch?v=</font><font color="#ff0000" style="font-weight: bold;">"아이디"</font> <font color="#ff0000">: 아이디 영역 내용을 넣어주세요.</font>
            </td>
        </tr>
        
        <!-- 201905 END -->
    </tbody>
</table>


<div class="button">
	<c:if test="${not empty REQUEST_DATA.courseno && REQUEST_DATA.courseno > 0}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
	</c:if>
	<c:if test="${empty REQUEST_DATA.courseno || REQUEST_DATA.courseno == 0}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
        
	</c:if>
    <a href="#" onclick="history.back()" class="btn big gray">취소</a>
</div>
</form>

<!-- 본문 > 메인 > 목록 끝 -->
<script type="text/javascript">


	$(document).ready(function() {
		
		// radio 버튼 > 유튜브 default
		$('input:radio[id=mtContentsCode_1]').attr("checked", true);
		
		if( $('input[name="courseno"]').val() == 0 ) {
			$('#youtubeUrl').val('');
		} else {
			$('#youtubeUrl').val('${map.YOUTUBE_URL}');
		}
		
		$('input[name="mtContentsCode"]').on("click", function() {
			
			if( 'CT0002' == ($('input[name="mtContentsCode"]:checked').val()) ) {
				$('#youtubeUrl').attr('disabled', true);
				if( $('input[name="courseno"]').val() == 0 ) {
					$('#youtubeUrl').val('');
				} else {
					$('#youtubeUrl').val('${map.YOUTUBE_URL}');
				}
				
			} else {
				$('#youtubeUrl').attr('disabled', false);
				
				if( $('input[name="courseno"]').val() == 0 ) {
					$('#youtubeUrl').val('');
				} else {
					$('#youtubeUrl').val('${map.YOUTUBE_URL}');
				}
			}
			
		})
		
		if('${map.MT_CONTENTS_CODE}' == 'CT0002') {
			$('#youtubeUrl').attr('disabled', true);
		}
		
	});
	


    //등록
    function writeFormCheck(){
    	
    	var f1 = document.pform;
        var calssTotal = 0;			// 교재, 출석, 시험, 과제 중 체크한 점수의 합이 100 이어야함.
        var classDeskIn="";			// 최종 classDask 값 지정을 위한 변수 선언

        if(f1.mt_sc_code.value==''){
            alert('과정구분을 선택해 주세요');
            f1.mt_sc_code.focus();
            return;
        }
        
        if(f1.coursetitle.value==''){
            alert('과정명을 입력해주세요');
            f1.coursetitle.focus();
            return;
        }

        if(f1.description.value==''){
            alert('과정설명을 입력해주세요.');
            f1.description.focus();
            return;
        }
        
        
        if( $('input[name="courseno"]').val() == 0) {
        	
	        if(f1.thumbnail.value == ''){
	            alert('썸네일을 첨부해주세요.');
	            f1.thumbnail.focus();
	            return;
	        }
	        
	       		
	        if(f1.thumbnail.value != ''){
	        	
	        	var thumbnail = f1.thumbnail.value;
	        	var thumbnailSub = thumbnail.slice(thumbnail.lastIndexOf(".") + 1).toLowerCase();
	        	
	        	if (!(thumbnailSub == 'gif' || thumbnailSub == 'jpg' || thumbnailSub == 'png' || thumbnailSub == 'bmp')) {
			    	alert("이미지파일 (.jpg, .png, .gif, .bmp) 만 업로드 가능합니다.");
			    	f1.thumbnail.value = '';
			        return false;
			    }
	        }
	        
        } else if( "0" == $('#imageCnt').val() ) {
        	
        	if(f1.thumbnail.value == ''){
	            alert('썸네일을 첨부해주세요.');
	            f1.thumbnail.focus();
	            return;
	        }
	        
	       		
	        if(f1.thumbnail.value != ''){
	        	
	        	var thumbnail = f1.thumbnail.value;
	        	var thumbnailSub = thumbnail.slice(thumbnail.lastIndexOf(".") + 1).toLowerCase();
	        	
	        	if (!(thumbnailSub == 'gif' || thumbnailSub == 'jpg' || thumbnailSub == 'png' || thumbnailSub == 'bmp')) {
			    	alert("이미지파일 (.jpg, .png, .gif, .bmp) 만 업로드 가능합니다.");
			    	f1.thumbnail.value = '';
			        return false;
			    }
	        }
        	
        }
        
        if( 'CT0001' == $('input[name="mtContentsCode"]:checked').val() ) {
        	
        	var youtubeUrl = f1.youtubeUrl.value;
        	
        	if( '' == $('#youtubeUrl').val() ) {
        		alert("유튜브 URL 경로를 입력해 주세요.");
        		f1.youtubeUrl.focus();
        		return false;
        	} 
        	
        } else if('mod' == '${REQUEST_DATA.pageMode}' && $('#mtContentsCode').val() == 'CT0001'  && $('#youtubeUrl').val() == '') {
        	alert("유튜브 URL 경로를 입력해 주세요.");
    		f1.youtubeUrl.focus();
    		return false;
        }
        	
        
        if($('#edu_loan_seq').val()==''){
        	$('#edu_loan_seq').empty();
        }

        
        var msg = '${titleMode}';
        if(confirm( msg+ " 하시겠습니까?")){
            //f1.encoding = "multipart/form-data";
            if ($('input[name=chk_del_file]:checked').length > 0) {
            	var delArr = [];
            	$('input[name=chk_del_file]:checked').each(function(){
            		delArr.push($(this).val());
            		f1.del_files.value = delArr.join(',');
            	});
            }
            f1.submit();
        }

    }

    //수료코드 안내 팝업
    function helpPop(src,width,height,scrollbars, resize) {
        if ( scrollbars=='' ) scrollbars=1;
        if ( resize=='' ) resize=1;
        window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars+',resizable='+resize);
    }
    
    
    // 썸네일 삭제
	function delThumBtn(fileId, savePath, saveFile, courseNo) {
		
		var fileId = fileId;
		var savePath = savePath;
		var saveFile = saveFile;
		var courseNo = courseNo;
		var ajaxChk='Y';
		
		if(fileId != ''){
			if(confirm("등록된 썸네일을 삭제하시겠습니까?")){
		        $.ajax({
		            url : "/admin/course/deleteThumbnailAjax.do",
		            data : {fileId : fileId, savePath : savePath , saveFile : saveFile, courseNo : courseNo, ajaxChk : ajaxChk},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == "SUCCESS"){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	location.reload();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		}
		
	}
</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	