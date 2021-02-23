<%
/****************************************************
    system	: 시스템관리 > 게시판코드 관리
    title	: 게시판코드 코드 목록 조회
    summary	:
    wdate	: 2015-05-31
    writer	: SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>


<script type="text/javascript">

//검색
function list_page(){
    $("#pform").submit();
}

//카테고리 등록
function insertBoardCategory(){
	
    $("#pageMode").val('reg');
    $("#qu").val('insert');
    $("#mode").val('bbs');
    $("#pform").attr("action", '/admin/sysman/bbscateForm.do');
    $("#pform").submit();

}

//카테고리 수정
function updateBoardCategory(bCateNo){
	
    $("#pageMode").val('mod');
    $("#qu").val('update');
    $("#mode").val('bbs');
    $("#bCateNo").val(bCateNo);

    $("#pform").attr("action", '/admin/sysman/bbscateForm.do');
    $("#pform").submit();
}

//카테고리 상세 조회
function getBoardSubCategory(bCateNo){
    $("#bCateNo").val(bCateNo);
    $("#pform").attr("action", '/admin/sysman/bbscateSubList.do');
    $("#pform").submit();

}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">게시판코드 관리<span></span></div>


<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="bbscateList.do" method="post">
<input type="hidden" name="qu" id="qu" value=""/>
<input type="hidden" name="mode" id="mode" value=""/>
<input type="hidden" name="bCateNo" id="bCateNo" value=""/>


    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        </colgroup>
        <tbody>
        <tr>
            <th>사용여부</th>
            <td>
                <select name="ISUSE" id="ISUSE" title="사용여부옵션">
                    <option value="">전체</option>
                    <option value="Y" <c:if test="${isUse eq 'Y'}">selected</c:if> >사용</option>
                    <option value="N" <c:if test="${isUse eq 'N'}">selected</c:if>>사용안함</option>
                </select>
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
        <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${fn:length(LIST_DATA)}" groupingUsed="true" /> </span> 건</td>
        <td align=right>
            <a href="#" onclick="insertBoardCategory();" class="btn blue">등록</a>
      </td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>고유번호</th>
        <th>게시판명</th>
        <th>답글사용여부</th>
        <th>TOP공지여부</th>
        <th>글쓰기권한여부</th>
        <th>사용여부</th>
        <th></th>
    </tr>
    <colgroup>
        <col align=middle width="4%">
        <col align=middle width="*">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="10%">
        <col align=middle width="8%">
        <col align=middle width="15%">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status">

    <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">

        <td><c:out value="${result.BCATENO}" /> </td><!-- 고유번호 -->
        <td align="left"><a href="#" onclick="getBoardSubCategory('<c:out value="${result.BCATENO}" />');"><b><c:out value="${result.BCATENAME}" /></b></a></td><!-- 게시판명 -->
        <td><c:if test="${result.ISANSWER eq 'Y'}">사용</c:if><c:if test="${result.ISANSWER eq 'N'}">미사용</c:if></td><!-- 답글사용여부 -->
        <td><c:if test="${result.ISTOP eq 'Y'}">사용</c:if><c:if test="${result.ISTOP eq 'N'}">미사용</c:if></td><!-- TOP공지여부 -->
        <td><c:if test="${result.INTYPE eq 'Y'}">사용</c:if><c:if test="${result.INTYPE eq 'N'}">미사용</c:if></td><!-- 글쓰기권한여부 -->
        <td><c:if test="${result.ISUSE eq 'Y'}">사용</c:if><c:if test="${result.ISUSE eq 'N'}">미사용</c:if></td><!-- 사용여부 -->
        <td>
            <a href="#" onclick="javascript:updateBoardCategory('<c:out value="${result.BCATENO}" />'); return false;" class="btn green small">수정</a>
            <a href="#" onclick="javascript:getBoardSubCategory('<c:out value="${result.BCATENO}" />'); return false;" class="btn sky small">상세보기</a>
        </td>
    </tr>
    </c:forEach>
    </c:if>
</table>
<!-- 본문 > 메인 > 목록 끝 -->