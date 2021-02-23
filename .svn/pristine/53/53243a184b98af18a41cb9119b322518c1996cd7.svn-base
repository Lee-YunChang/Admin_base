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
	//수정
	function tutorSubFormCheck(qu){
		var form = document.insertForm;
		form.qu.value = qu;
		$("#insertForm").attr("mothod" , "post").attr("action" , "/admin/tutor/tutorCmmntyInsertSubForm.do");
		form.submit();
	};
	
	//삭제
	function tutorSubFormDelete(){
		var form = document.insertForm

		if(confirm("삭제하시겠습니까!")){
			form.qu.value = 'delete';
			form.useAt.value = 'N';
			$("#insertForm").attr("action" , "/admin/tutor/tutorCmmntySubInsert.do");
			form.submit();
		}
	}
	
	//답글
	function subInfoReply(){
		var form = document.insertForm;
		form.qu.value = "reply";
		form.mode.value = "mt";
		form.pageMode.value = "reg";
		$("#insertForm").attr("action" , "/admin/tutor/tutorCmmntyInsertSubForm.do").submit();
	}
	
	//파일다운로드
	function filedown(fileNo){
		$('#fileNo').val(fileNo);
		$('form[name=insertForm]').attr('action', '/admin/common/filedown.do').submit();
	}
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">커뮤니티코드관리 > 게시판 상세<span></span></div>

<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />

<form name="insertForm" id="insertForm" action="" method="post">
	<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}">
	<input type="hidden" name="mode" id="mode" value="${REQUEST_DATA.mode}">
	<input type="hidden" name="pageMode" id="pageMode" value="${REQUEST_DATA.pageMode}">
	<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
	<input type="hidden" name="nttNo" id="nttNo" value="${REQUEST_DATA.nttNo}">
	<input type="hidden" name="nttDepth" id="nttDepth" value="${VIEW.NTT_DEPTH}">
	<input type="hidden" name="useAt" id="useAt" value="${VIEW.useAt }">
	<input type="hidden" name="bbsNoticeAt" id="bbsNoticeAt" value="${VIEW.NOTICE_AT}">
	<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}">
	<input type="hidden" name="fileNo" id="fileNo" value=""/>
	<input type="hidden" name="cmmntydown" id="cmmntydown" value=""/>
	<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
	
	<table class="table-type1 search_form" >
		<colgroup>
			<col class="cellc" width="15%">
	        <col class="celll" width="35%">
	        <col class="cellc" width="15%">
	        <col class="celll" width="35%">
		</colgroup>
		<tbody>
			
			<tr>
				<th>제목</th>
				<td colspan="3"><c:out value="${VIEW.TITLE}" /></td>
			</tr>
			
			<tr>
				<th>공개여부</th>
				<td>
					<c:if test="${VIEW.useAt eq 'Y'}" >
						<c:out value="공개" />
					</c:if>
					<c:if test="${VIEW.useAt ne 'Y'}" >
						<c:out value="공개 안함" />
					</c:if>
				</td>
				<th>공지여부</th>
				<td>
					<c:if test="${VIEW.NOTICE_AT eq 'Y'}" >
						<c:out value="공개" />
					</c:if>
					<c:if test="${VIEW.NOTICE_AT ne 'Y'}" >
						<c:out value="공개 안함" />
					</c:if>
				</td>	
			</tr>
			<tr>
				<th>내용</th>
				<td style="padding:20px 10px 20px 10px;" colspan="3">
	               <div>
	                   <!-- [필수]에디터 안에 글내용 영역 -->
	                  <c:out value="${VIEW.CONTENT}" escapeXml="false"/>
	               </div>
         		</td>
			</tr>
			
			<tr>
				<th scope="row" class="p-left30">첨부파일</th>
				<td colspan="3">
					<c:if test="${not empty fileList}">
						<c:forEach items="${fileList}" varStatus="status" var="fileList">
							<div id="simple">
								<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>')" class="btn-down">
									<span><c:out value="${fileList.ORGFILE}"/>&nbsp;(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
								</a>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty fileList}">
						<p>첨부파일이 없습니다.</p>
					</c:if>	
				</td>	
			</tr>
		 </tbody>
	 </table>
${REQUEST_DATA.qu }
	<div class="button">
		<c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
        	<a href="#" onclick="tutorSubFormCheck('<c:out value="${REQUEST_DATA.qu}"/>'); return false;" class= "btn big blue">등록</a>
        </c:if>
        <c:if test="${REQUEST_DATA.useAt eq 'Y' && REQUEST_DATA.registId eq REQUEST_DATA.SES_USERID}">
            <a href="#" onclick="tutorSubFormCheck('update'); return false;" class= "btn big green">수정</a>
            <a href="#" onclick="tutorSubFormDelete();" class="btn red big">삭제</a>
        </c:if>
        <c:if test="${REQUEST_DATA.bbsAnswerAt eq 'Y' && REQUEST_DATA.useAt eq 'Y' }">
        	<a href="#" onclick="subInfoReply();" class="btn green big">답글</a> 
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
