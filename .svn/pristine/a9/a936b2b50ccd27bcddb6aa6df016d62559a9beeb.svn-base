<%
/****************************************************
	system	: 과정관리 > 교육과정등록
	title	: 교육과정 상태(서비스,중지)별 조회
	summary	:	
	wdate	: 2016-04-18
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	$('#mtCtypeCode').change(function(){
		var code = $(this).val();
		if ('DAAA00' == code || 'DAAA02' == code) {
			$('#mtScCode option:eq(0)').prop('selected',true);
			$('#mtScCode').hide();
		} else {
			$('#mtScCode').show();
		}
	});
	
	$('#mtCtypeCode').trigger('change');
});

//페이지 이동
function move_page(cPage){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = cPage;
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	$("#pform").attr("action", "/admin/course/courseList.do");
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = "1";
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	$("#pform").attr("action", "/admin/course/courseList.do");
	frm.submit(); 
}

//등록
function form_page(pMtCtypeCode){
	
	var frm = document.pform;
	frm.target = "";
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>";
	//$("#mtCtypeCode").val(pMtCtypeCode);
	$("#mtCtypeCode option[value='"+pMtCtypeCode+"']").prop('selected',true);
	$("#pform").attr("action", "/admin/course/newCourseForm.do");
	frm.submit(); 
}

//상세
function view_page(courseno, mtCtypeCode){
	var frm = document.pform;
	frm.target = "";
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>";
	frm.courseno.value = courseno;
	$("#MT_CTYPE_CODE").val(mtCtypeCode)
	$("#pform").attr("action", "/admin/course/courseForm.do");
	frm.submit(); 
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정등록</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/course/courseList.do" method="post">
 	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<input type="hidden" name="courseno" id="courseno" value=""/>
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
    <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
	<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>
	
	<table class="table-type1 search_form" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
		<colgroup>
			<col class="cellc" width="8%">
			<col class="celll" width="42%">
			<col class="cellc" width="8%">
			<col class="celll" width="42%">
		</colgroup>
		<tbody>
	  	<tr>
			<th>과정형태</th>
			<td>
				
				<select name="mtCtypeCode" id="mtCtypeCode" title="과정형태" style="width:140px;">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
 			<th>과정구분</th>
			<td>
				 <select name="mtScCode" id="mtScCode" title="과정구분">
					<option value="">전체</option>
					<c:forEach var="emap" items="${categoryData2}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtScCode == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
		</tr>
		<tr>
			<th>과정명</th>
			<td colspan="3"> 	
				<input type="text" class="line" id="courseTitle" name="courseTitle" style="width:350px" title="과정명" value="<c:out value="${REQUEST_DATA.courseTitle}"/>"/>
			</td>		
		</tr> 
		</tbody>
	</table>
	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form> 

	<!-- 본문 > 상단 > 검색영역 끝 -->
	<table width="100%" class="btn_Group">
		<tbody>
			<tr>
				<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</font></td>
				<td align="right">
					<a href="#" onclick="form_page('DAAA01');return false;" class="btn blue">집합교육 등록</a>
					<a href="#" onclick="form_page('DAAA00');return false;" class="btn blue">온라인교육 등록</a>
					<!-- 추가 20190607 -->
					<a href="#" onclick="form_page('DAAA02');return false;" class="btn blue">협력기관교육 등록</a>
					<!-- 추가 20190607 -->
				</td>
			</tr>
		</tbody>
	</table>

	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1">
		<tr class="rndbg">
			<th>NO</th>
			<th>과정형태</th>
			<th>과정구분</th>
			<th>과정명</th>
			<th>사용여부</th>
			<th>상세보기</th>
		</tr>
		<colgroup>
			<col align=middle width="4%">
			<col align=middle width="10%">
			<col align=middle width="18%">
			<col align=middle width="*">
			<col align=middle width="8%">
			<col align=middle width="8%">  	
		</colgroup>	
	
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
				<td><c:out value='${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
				<td><c:out value="${result.MT_CTYPE_NAME}"/></td>
				<td><c:out value="${result.MT_SC_NAME}"/></td>
				<td align="left"><a href="#" onclick="view_page('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.MT_CTYPE_CODE}"/>');"><c:out value="${result.COURSETITLE}"/></a></td>
				<td><c:out value="${result.USEYN}"/></td> 
				<td><a href="/admin/course/courseForm.do?courseno=<c:out value="${result.COURSENO}"/>&pageMode=mod" class="btn sky small">상세보기</a></td>
			</tr> 
		</c:forEach>
	</table>
	<br/>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
	    </div>
	</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	