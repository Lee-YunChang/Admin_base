<%
/****************************************************
    system	: 시스템관리 > 커뮤니티코드관리 > 리스트
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2013-08-29
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">
	function tutorUpdateForm(){
		var form = document.insertForm;
		form.qu.value = "update";
		form.mode.value = "mt";
		
		$("#insertForm").attr("method" , "post").attr("action" , "/admin/tutor/tutorCmmntyInsertForm.do");
		form.submit();
		
	}
	
	function tutorDeleteForm(){
		var form = document.insertForm;
		form.qu.value = "delete";
		
		$("#insertForm").attr("method" , "post").attr("action" , "/admin/tutor/tutorCmmntyDelete.do");
		if(confirm("삭제하시겠습니까?")){
			form.submit();
		}
	}
	
	
</script>

<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">커뮤니티코드관리  >  수정/삭제<span></span></div>
<br>

<form name="insertForm" id="insertForm" action="" method="post">
	<input type="hidden" name="bbsNo" id="bbsNo" value="${INFO_DATA.bbsNo}">
	<input type="hidden" name="qu" id="qu" value="">
	<input type="hidden" name="mode" id="mode" value="">
	<input type="hidden" name="registId" id="registId" value="${INFO_DATA.registId}">
	<input type="hidden" name="bbsName" id="bbsName" value="${INFO_DATA.bbsName}">
	
	
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
				<td colspan="3"><c:out value="${INFO_DATA.bbsName}" /></td>
			</tr>
			
			<tr>
				<th>사용용도</th>
				<td colspan="3">
					<c:out value="${INFO_DATA.bbsDesc}" />
				</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>
					<c:if test="${INFO_DATA.useAt eq 'Y' }">
						<c:out value="사용"/>
					</c:if>
					<c:if test="${INFO_DATA.useAt eq 'N' }">
						<c:out value="사용안함"/>
					</c:if>
				</td>
				<th>신청자</th>
				<td><c:out value="${INFO_DATA.registId }"/></td>
			</tr>
			<tr>
				<th>공지기능 포함여부</th>
				<td>
					<c:if test="${INFO_DATA.bbsNoticeAt eq 'Y' }">
						<c:out value="사용"/>
					</c:if>
					<c:if test="${INFO_DATA.bbsNoticeAt eq 'N' }">
						<c:out value="사용안함"/>
					</c:if>
				</td>
				<th>답글 포함여부</th>
				<td>
					<c:if test="${INFO_DATA.bbsAnswerAt eq 'Y' }">
						<c:out value="사용"/>
					</c:if>
					<c:if test="${INFO_DATA.bbsAnswerAt eq 'N' }">
						<c:out value="사용안함"/>
					</c:if>
				</td>
				
			</tr>
		</tbody>
	</table>
	<div class="button">
		<c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
        	<a href="#" onclick="tutorFormCheck(); return false;" class= "btn big blue">등록</a>
         </c:if>
         <c:if test="${REQUEST_DATA.pageMode ne pageModeReg}">
             <a href="#" onclick="tutorUpdateForm(); return false;" class= "btn big green">수정</a>
             <!-- <a href="#" onclick="tutorDeleteForm(); return false;" class= "btn big red">삭제</a> -->
         </c:if>
		
        <a href="javascript:window.history.back();" class="btn gray big">취소</a>
    </div> 

</form>
