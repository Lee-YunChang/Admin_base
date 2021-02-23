<%
/****************************************************
	system	: 사이트관리> 공지사항, 자료실 게시판
	title	: 게시판 상세보기
	summary	:
	wdate	: 2016-04-14
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
    function go_list(){
        var form = document.form;
		$("#pform").attr("action", "/admin/site/lastSurveyList.do");
        form.submit();
    }
    function go_update(){
        var form = document.form;
        form.qu.value = 'update';
		$("#pform").attr("action", "/admin/site/lastSurveyForm.do");
        form.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>";
        form.submit();
    }
    function go_delete(){
        if(confirm("삭제하시겠습니까?")){
            var form = document.form;
    		$("#pform").attr("action", "/admin/site/lastSurveyExec.do");
            form.qu.value = 'delete';
            form.submit();
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

<div class="space"></div><!-- 공백 default 20px -->

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="pform" action="/admin/site/bbsView.do" method="post" >
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="oFileNo" value="<c:out value="${map.FILE_ID}"/>"/>
    <input type="hidden" name="bbsNo" value="<c:out value="${map.BBSNO}"/>"/>
    <input type="hidden" name="pageMode" id="pageMode" value=""/>
    <input type="hidden" name="qu" value=""/>
    <input type="hidden" name="cmtNo" value=""/>
    <input type="hidden" name="fileId" id="fileId" value=""/>
	<input type="hidden" name="filename" id="filename" value=""/>
	<input type="hidden" name="fileName" id="fileName" value=""/>
	<input type="hidden" name="ftype" id="ftype" value=""/>
	<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
	<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bbsFilePath")%>"/>
	<input type="hidden" name="savePath" value="${fileList[0].SAVPATH}"/>
	
    <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
      </colgroup>
      <tr>
            <th>제목</th>
            <td colspan="3"><c:out value="${map.TITLE}"/></td>
      </tr>
      <tr>
            <th>공개여부</th>
            <td>
	            <c:if test="${map.OPEN_AT eq 'Y'}">공개</c:if>
				<c:if test="${map.OPEN_AT eq 'N'}">비공개</c:if>
			</td>
      </tr>
      <tr>
            <th>내용</th>
            <td  colspan="3" style="height: 100">
                <div>
                    <c:out value="${map.CONTENT}" escapeXml="false"/>
                </div>
            </td>
      </tr>
       <tr>
        	<th>파일첨부</th>
			  <td  colspan="3">
			  	<c:if test="${not empty fileList}">
					<c:forEach var="fileList" items="${fileList}" varStatus="status">
					<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
						<div  id="eduDate_${status.count}" class="input-wrap mb15"  style="height:25px">
							<div class="file-wrap">
								<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
								<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
									<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
								</a>
							</div>
						</div>
					</c:forEach>
				</c:if>	
				<c:if test="${empty fileList}">
					<c:out value="등록된 파일이 없습니다."/>
				</c:if>	
			</td>
        </tr>
    </table>

<!-- 본문 > 상단 > 검색영역 끝 -->
<div class="button_top" style="text-align:right;">
    <a href="#" onclick="go_update();"class="btn green">수정</a>
    <a href="#" onclick="go_delete();" class="btn red">삭제</a>
    <a href="#" onclick="go_list();" class="btn orange">목록</a>
</div>

</form> 
	 