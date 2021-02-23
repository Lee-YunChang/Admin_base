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

<script type="text/javascript">
	function tutorFormCheck(){
		var qu=$("#qu").val();
		var pageMode = "<c:out value='${REQUEST_DATA.pageMode}'/>";
		var pageModeReg = '<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>';
		var useYn = $("input[type=radio][name=useYn]:checked").val();
		var noticeYn = $("input[type=radio][name=noticeYn]:checked").val();
		var answerAt = $("input[type=radio][name=answerAt]:checked").val();

		if(qu == 'insert' && qu == 'update' && $("#bbsName").val() == ''){
			alert("게시판명을 입력하세요!");
			$("#bbsName").focus();
			return;
		}else if($("#bbsDesc").val() == ''){
			alert("사용용도를 입력하세요!");
			$("#bbsDesc").focus();
			return;
		}else if($("#inputId").val() == ''){
			alert("신청자를 입력하세요!");
			$("#inputId").focus();
			return;
		}else if(useYn == null ){
			alert("사용여부를 선택해주세요!");
			$("#useYn").focus();
			return;
		}else if(noticeYn == null ){
			alert("사용여부를 선택해주세요!");
			$("#noticeYn").focus();
			return;
		}else if(answerAt == null ){
			alert("답글 포함여부를 선택해주세요!");
			$("#answerAt").focus();
			return;
		}  else {

            if(pageMode == pageModeReg){
                titleMode = "등록";
            }else {
                titleMode = "수정";
            }

            if(confirm("등록하시겠습니까?")){
				$("#insertForm").submit();
			};
        }
	};
	
	
	//글자수 제한
	function keyUpLimit(){
		var text = document.insertForm.bbsName.value;
		if(text.length > 10){
			alert("글자수는 10글자로 제한됩니다.");
			text = text.substring(0,10);
			$("#bbsName").val(text) ;
			text.focus();
		}
	}
	
</script>

<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">커뮤니티코드관리  >  등록<span></span></div>
<br>

<form name="insertForm" id="insertForm" action="/admin/tutor/tutorCmmntyInsert.do" method="post">
	<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}">
	<input type="hidden" name="mode" id="mode" value="${REQUEST_DATA.mode}">
	<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
	<table class="table-type1 search_form" >
		<colgroup>
			<col class="cellc" width="15%">
	        <col class="celll" width="35%">
	        <col class="cellc" width="15%">
	        <col class="celll" width="35%">
		</colgroup>
		
		<tbody>
			<tr>
				<th>게시판명</th>
				<td colspan="3"><input type="text" name="bbsName" id="bbsName" class="lline" value="${UPDATE_DATA.bbsName }" onkeyup="keyUpLimit(); return false"/></td>
			</tr>
			
			<tr>
				<th>사용용도</th>
				<td colspan="3">
					<textarea name="bbsDesc" id="bbsDesc" rows="10" cols="150" style="resize: none;"> <c:out value="${UPDATE_DATA.bbsDesc}" /></textarea>
				</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td> 
					<input type="radio" name="useYn" id="useYn" value="Y" <c:if test="${UPDATE_DATA.useAt eq 'Y' || empty UPDATE_DATA.useAt}">  checked="checked" </c:if> />사용 
					<input type="radio" name="useYn" id="useYn" value="N" <c:if test="${UPDATE_DATA.useAt eq 'N'}">  checked="checked" </c:if> />사용안함
				</td>
				<th>신청자</th>
				<td><input type="text" name="registId" id="registId" class="lline" value="${UPDATE_DATA.registId}"/></td>
			</tr>
			<tr>
				<th>공지기능 포함여부</th>
				<td>
					<input type="radio" name="noticeYn" id="noticeYn" value="Y" <c:if test="${UPDATE_DATA.bbsNoticeAt eq 'Y' || empty UPDATE_DATA.bbsNoticeAt}">  checked="checked" </c:if> />사용 
					<input type="radio" name="noticeYn" id="noticeYn" value="N" <c:if test="${UPDATE_DATA.bbsNoticeAt eq 'N'}">  checked="checked" </c:if> />사용안함
				</td>
				<th>답글 포함여부</th>
				<td>
					<input type="radio" name="answerAt" id="answerAt" value="Y" <c:if test="${UPDATE_DATA.bbsAnswerAt eq 'Y' || empty UPDATE_DATA.bbsAnswerAt}">  checked="checked" </c:if> />사용 
					<input type="radio" name="answerAt" id="answerAt" value="N" <c:if test="${UPDATE_DATA.bbsAnswerAt eq 'N'}">  checked="checked" </c:if> />사용안함
				</td>
				
			</tr>
		</tbody>
	</table>
	<div class="button">
		<c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
        	<a href="#" onclick="tutorFormCheck(); return false;" class= "btn big blue">등록</a>
         </c:if>
         <c:if test="${REQUEST_DATA.pageMode ne pageModeReg}">
             <a href="#" onclick="tutorFormCheck(); return false;" class= "btn big green">수정</a>
         </c:if>
		
        <a href="javascript:window.history.back();" class="btn gray big">취소</a>
    </div> 

</form>
