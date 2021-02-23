<%/****************************************************
system	: 배너 등록/수정 폼
title	: 배너 등록/수정 폼
summary	:
wdate	: 2015-09-08
writer	: 황두은
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">배너 ${titleMode}</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="form" action="/admin/site/bannerExec.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="qu" id="qu"  value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="bannerno" id="bannerno" value="<c:out value="${bannerInfo.BANNERNO}"/>"/>
    <input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bannerFilePath")%>"/>
    <input type="hidden" name="orgfile" id="orgfile"value="<c:out value="${bannerInfo.ORGFILE}"/>"/>
	<input type="hidden" name="UPLOAD_FILE" id="UPLOAD_FILE" value=""/>    
    <input type="hidden" name="delFile" value=""/>
	<input type="hidden" name="useAtCnt" id="useAtCnt" value="${useAtCnt}"/>   
	<input type="hidden" name="filechange" id="filechange" value=""/> 
	
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<input type="hidden" name="useBanner" id="useBanner" value="${result.BANNERNO}"/>    
	</c:forEach>
	
	<table class="table-type1 search_form">
		<colgroup>
			<col style="width:15%;" />
			<col style="width:85%;" />
		</colgroup>
		<tbody>
			<tr>
				<th><em>*</em>제목</th>
				<td><input type="text" class="line" name="title" id="title" style="width:85%" value="<c:out value="${bannerInfo.TITLE}"/>"/></td>
			</tr>
			<tr>
				<th><em>*</em>공개여부</th>
				<td>
					<input type="radio" name="useAt" value="Y" <c:if test="${bannerInfo.USE_AT eq 'Y'}"> checked="checked" </c:if> <c:if test="${REQUEST_DATA.qu eq 'insert'}"> checked </c:if> /> 공개 &nbsp;
					<input type="radio" name="useAt" value="N" <c:if test="${bannerInfo.USE_AT eq 'N'}"> checked="checked" </c:if>/> 미공개
				</td>
			</tr>
			<tr>
				<th>URL</th>
				<td><input type="text" name="url" id="url" class="line" value="<c:out value="${bannerInfo.URL}"/>" style="width:85%"/></td>
			</tr>
			<tr>
				<th><em>*</em>파일첨부</th>
				 <td> 
				 	<font class="extext">※ 이미지 파일은 높이 300px에 넓이 500px 여야 합니다.</font></br>
				 	PC : <input type="file" name="uploadFile1" id="uploadFile1"/></br>
				 	<c:if test="${!empty bannerInfo.ORGFILE}">
				 		첨부된 파일 : <c:out value="${bannerInfo.ORGFILE}"/>(<c:out value="${bannerInfo.FSIZE}"/>KB)<br/>
					</c:if>
					MOBILE : <input type="file" name="uploadFile2" id="uploadFile2"/></br>
				 	<c:if test="${!empty bannerInfo.MOB_ORGFILE}">
				 		첨부된 파일 : <c:out value="${bannerInfo.MOB_ORGFILE}"/><br/>
					</c:if>
			 	</td>
		 	</tr>
			<tr>
				<c:if test="${fn:length(fileList) > 0}">
					<th>첨부된 파일</th>
					<td>
						<c:forEach var="result" items="${fileList}" varStatus="status">
							<input type="checkbox" name="delFileChk" value="<c:out value="${result.FILENO}"/>" /><a href="#" onclick="filedown('<c:out value="${result.FILENO}"/>')"><c:out value="${result.ORGFILE}"/></a>(<c:out value="${result.FSIZE}"/> KB)<br/>
						</c:forEach>
					</td>
				</c:if>
			</tr>
		</tbody>
	</table>
	
    <div class="button" >
        <c:choose>
        	<c:when test="${pageMode eq REQUEST_DATA.pageMode}">
            	<a href="#" onclick="fnExec(); return false;" class= "btn big blue">등록</a>
        	</c:when>
        	<c:otherwise>
            	<a href="#" onclick="fnExec(); return false;" class= "btn big green">수정</a>
            	<a href="#" onclick="fnExec('bannerDelete'); return false;" class= "btn big orange">삭제</a>
        	</c:otherwise>
        </c:choose>
        <a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
    </div>
    
</form>

<script type="text/javascript">
var filechange;
//수정 시 첨부파일 변경
	$( "#uploadFile1" ).click(function() {
		if($("#orgfile").val() != '' ){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$('#filechange').val('Y');
			}
		}
	});
    // 저장
    function fnExec(bannerDelete) {
    	
       var useAtCnt = $("#useAtCnt").val();
       var maxBannerYn = '';


       	 if(useAtCnt > 7 ){
	       if($(':input:radio[name=useAt]:checked').val() == 'Y') {
	       		var bannerno = $("#bannerno").val();
	        	$(':input[name=useBanner]').each(function( i, val ){
	        		  if($(this).val() == bannerno){
	       				maxBannerYn ='Y';
	        		  }
	       		});
	       }
       	 } else { 
       		maxBannerYn ='Y';
       	 }
       
       var form = document.form;
 
       //유효성 체크 시작
       //제목
       if('' ==$("#title").val()){
           alert("제목을 입력해주세요.");
           $("#title").focus();
           return;
       }
 
       //공개여부
	    if(!$(':input:radio[name=useAt]:checked').val()) {
	    	alert("공개여부를 선택해주세요.");
	        return;
	    }
       
       //등록일 때 첨부파일
       var bannerno = $("#bannerno").val()
       if(bannerno == null || bannerno == ''){
	        if($("#uploadFile1").val() == '' ){
	        	alert("파일을 첨부해주세요.");
		        return;
	        }
	        if($("#uploadFile2").val() == '' ){
	        	alert("파일을 첨부해주세요.");
		        return;
	        }
       }
       
		var ext1 = $('#uploadFile1').val().split('.').pop().toLowerCase();
		if($("#uploadFile1").val().length > 0 && $.inArray(ext1, ['gif','png','jpg','jpeg','bmp']) == -1) {
		    alert('등록할 수 없는 파일 형식입니다. 파일은 이미지 형식의 파일만 등록하여 주세요.');
		    return;
		}
		var ext2 = $('#uploadFile2').val().split('.').pop().toLowerCase();
		if($("#uploadFile2").val().length > 0 && $.inArray(ext1, ['gif','png','jpg','jpeg','bmp']) == -1) {
		    alert('등록할 수 없는 파일 형식입니다. 파일은 이미지 형식의 파일만 등록하여 주세요.');
		    return;
		}
		
       if(bannerDelete){
       	form.qu.value="delete";
       	if(confirm('삭제 하시겠습니까?')){
               $("#form").attr("action", "/admin/site/bannerExec.do");
               form.target = '_self';
               form.submit();
           }
       } else {
    	   
			  var msg = '${titleMode}';
		       if(maxBannerYn == 'Y') {
				  if(confirm( msg+ ' 하시겠습니까?')){
				      $("#form").attr("action", "/admin/site/bannerExec.do");
				      form.target = '_self';
				      form.submit();
				  }
		       } else {
		    	   if($(':input:radio[name=useAt]:checked').val() == 'N') {
						  if(confirm( msg+ ' 하시겠습니까?')){
						      $("#form").attr("action", "/admin/site/bannerExec.do");
						      form.target = '_self';
						      form.submit();
						  }
		    		   
		    	   } else {
			    	   alert('배너는 최대 8개까지만 공개할 수 있습니다.')
			    	   return;
		    		   
		    	   }
		       }
       }
    }
    
</script>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>