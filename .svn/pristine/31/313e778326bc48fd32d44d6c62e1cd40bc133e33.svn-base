<%
/****************************************************
    system	: 시스템관리 > 공통코드 관리
    title	: 공통 코드 목록 조회
    summary	:
    wdate	: 2016-05-16
    writer	: sangs
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
//페이지 이동
function move_page(cPage){
	$("input[name=cPage]").val(cPage);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/sysman/mtcodeList.do").submit();
}
//검색
function list_page(cPage){
	$("input[name=cPage]").val(cPage);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/sysman/mtcodeList.do").submit();
}

//등록
function insertMtCode(){
    location.href="/admin/sysman/mtcodeForm.do?qu=insert&mode=mt&pageMode=reg";
}

//수정
function updateMtCode(mtCode){
    location.href="/admin/sysman/mtcodeForm.do?mtCode="+mtCode+"&qu=update&mode=mt&pageMode=mod";
}

//상세보기
function goMtSub(mtCode){
    location.href="/admin/sysman/mtcodeSubList.do?mtCode="+mtCode;
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">공통코드 관리<span></span></div>


<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="/admin/sysman/mtcodeList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        </colgroup>
        <tbody>
        <tr>
            <th>구분</th>
            <td>
                 <select name="useGb" id="useGb" title="사용용도옵션">
                    <option value="">사용용도 전체</option>
                    <option value="U" <c:if test="${REQUEST_DATA.useGb eq 'U'}">selected="selected"</c:if>>업무용도</option>
                    <option value="S" <c:if test="${REQUEST_DATA.useGb eq 'S'}">selected="selected"</c:if>>시스템용도</option>
                </select>

                <select name="useYn" id="useYn" title="사용여부옵션">
                    <option value="Y" <c:if test="${REQUEST_DATA.useYn eq 'Y'}">selected="selected"</c:if>>사용</option>
                    <option value="N" <c:if test="${REQUEST_DATA.useYn eq 'N'}">selected="selected"</c:if>>사용안함</option>
                </select>
            </td>
        </tr>
        <tr>	
			<th>검색</th>
			<td colspan="3">
		  		<select name="searchMode" title="검색옵션">
		  			<option value="">선택</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode eq 'mtCode'}">selected="selected" </c:if> value="mtCode">코드ID</option>
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'mtName'}">selected="selected" </c:if> value="mtName">코드명</option>
	            </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
			</td>
		  </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>
 <!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCnt}" groupingUsed="true" /></span> 건</td>
        <td align=right>
            <a href="#" onclick="insertMtCode();" class="btn blue">등록</a>
      </td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>사용구분</th>
        <th>코드ID</th>
        <th>코드명</th>
        <th>설명</th>
        <th>사용여부</th>
        <th></th>
    </tr>
    <colgroup>
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="15%">
        <col align=middle width="*">
        <col align=middle width="8%">
        <col align=middle width="15%">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status">

    <tr align=middle onmouseover="onFocusBgCh(this);" class="onFocusBgCh">

        <td><c:out value="${cfn:clearXSSMinimum(result.USE_GB_NAME)}" /></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.MT_CODE)}" /></td>
        <td align="left"><a href="#" onclick="goMtSub('<c:out value="${result.MT_CODE}"/>');"><b><c:out value="${result.MT_NAME}"/></b></a></td>
        <%-- <td align="left"><c:out value="${result.CID}"/></td> --%>
        <td align="left"><c:out value="${cfn:clearXSSMinimum(result.ETC)}" /></td>
        <td><c:if test="${cfn:clearXSSMinimum(result.USEYN) eq 'Y'}">사용</c:if><c:if test="${cfn:clearXSSMinimum(result.USEYN) eq 'N'}">미사용</c:if></td>
        <td>
            <a href="#" onclick="javascript:updateMtCode('<c:out value="${cfn:clearXSSMinimum(result.MT_CODE)}" />'); return false;" class="btn green small">수정</a>
            <a href="#" onclick="javascript:goMtSub('<c:out value="${cfn:clearXSSMinimum(result.MT_CODE)}" />'); return false;" class="btn sky small">상세보기</a>
        </td>
    </tr>
    </c:forEach>
    </c:if>

</table>
<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<!-- 페이징, 버튼 영역 -->
  <c:if test="${not empty LIST_DATA}">
       <div class="admin-paging paging_wrap">
           <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCnt}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
       </div>
   </c:if>
<!-- // 페이징, 버튼 영역 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	