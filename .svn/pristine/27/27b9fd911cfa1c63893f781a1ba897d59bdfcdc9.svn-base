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

	//페이징
	function move_page(cPage){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/tutor/tutorCmmntyList.do");
		frm.cPage.value = cPage;
		frm.submit();
	}
	//검색
	function list_page(){
		$("form[name=pform]").attr("action" , "/admin/tutor/tutorCmmntyList.do").submit();
	}
	
	//등록
	function inserTutorCmmnty(){
		location.href="/admin/tutor/tutorCmmntyInsertForm.do?qu=insert&mode=mt&pageMode=reg";
	};
	
	//이동
	function subCmmnty(bbsNo , bbsAnswerAt){
		location.href="/admin/tutor/tutorCmmntySubList.do?bbsNo="+bbsNo+"&bbsAnswerAt="+bbsAnswerAt ;
	};
	
	//상세보기
	function detaiList(bbsNo){
		location.href="/admin/tutor/tutorCmmntyDetailForm.do?bbsNo="+bbsNo ;
	}
	

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">커뮤니티코드관리 <span></span></div>

<form name="pform" id="pform" action="" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="total" id="total" value="<c:out value="${totalCount}"/>"/>
	<table class="table-type1 search_form">
		<colgroup>
	        <col class="cellc" width="8%">
	        <col class="celll" width="92%">
        </colgroup>
		<tbody>
			<tr>
				<th>사용여부</th>
				<td>
					<input type="radio" name="useYn" id="useYn" value="" checked="checked">전체
					<input type="radio" name="useYn" id="useYn" value="Y" <c:if test="${REQUEST_DATA.useYn eq 'Y' }">checked="checked"</c:if> >사용
					<input type="radio" name="useYn" id="useYn" value="N" <c:if test="${REQUEST_DATA.useYn eq 'N' }">checked="checked"</c:if> >사용안함
				</td>
			</tr>
			<tr>
				<th>검색</th>
				<td>
					<select name="searchMode" id="searchMode" title="검색옵션">
						<option value="">전체</option>
						<option value="bName" <c:if test="${REQUEST_DATA.searchMode eq 'bName' }">selected="selected"</c:if> >게시판명</option>
						<option value="regiId" <c:if test="${REQUEST_DATA.searchMode eq 'regiId' }">selected="selected"</c:if>>신청자</option>
					</select>
					<input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" <c:if test="${REQUEST_DATA.searchWord ne null}" >value="${REQUEST_DATA.searchWord}"</c:if>>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>

<table width="100%" class="btn_Group">  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCnt}" groupingUsed="true" /></span>건</td>
		<td align="right">
			<a href="#" onclick="inserTutorCmmnty();" class="btn blue" >등록</a>
		</td>
    </tr>
  </tbody>
</table>

<table class="tb table-type1">
	<tr class="rndbg">
		<th>No</th>
		<th>게시판명</th>
		<th>사용용도</th>
		<th>신청자</th>
		<th>사용여부</th>
		<th>등록일</th>
		<th>게시판이동</th>
	</tr>
	<colgroup>
		<col align=middle width="4%">
        <col align=middle width="10%">
        <col align=middle width="*">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="15%">
        <col align=middle width="8%">
	</colgroup>

	<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
		<tr align=middle>
			<td name="bbsNo" id="bbsNo"><c:out value="${totalCnt - (REQUEST_DATA.cPage-1)*20 - status.count+1}"/></td>
			<td><a href="#" onclick="detaiList('<c:out value="${result.bbsNo}" />');"><c:out value="${result.bbsName}"/></a></td>
			<td>
				<c:out value="${result.bbsDesc}"/>
			</td>
			<td><c:out value="${result.registId}"/></td>
			<td>
				<c:if test="${result.useAt eq 'Y'}">
					<c:out value="사용"/>
				</c:if>
				<c:if test="${result.useAt eq 'N'}">
					<c:out value="사용안함"/>
				</c:if>
			</td>
			<td><c:out value="${result.registDate}"/></td>
			<td><a href="#" onclick="subCmmnty('<c:out value="${result.bbsNo}" />' ,'<c:out value="${result.bbsAnswerAt}" />');" class="btn green small">이동</a></td> 	
		</tr>
	</c:forEach>
</table>


<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<c:if test="${not empty LIST_DATA}">
     <div class="admin-paging paging_wrap">
         <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCnt}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
     </div>
 </c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	

