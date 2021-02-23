<%
/****************************************************
	system	: 통계관리
	title	: 사업장별 수료 통계
	summary	:
   	wdate	: 2016-05-26
   	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){

    // form에서 엔터로 검색시 1페이지로 셋팅하게 한다.
    $('#searchWord').keydown(function(e) {
        if(e.keyCode == 13) {
            $("#cPage").val(1);
    		$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/compStats.do").submit();
            $("#pform").submit();
        }
    });

});


//검색
function list_page(){
    $("#cPage").val(1);
    $("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/compStats.do").submit();
    $("#pform").submit();
}


//페이징
function move_page(cPage){
    $("#cPage").val(cPage);
    $("#pform").submit();
}



function compView(comNo){
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/compStatsForm.do").submit();
    $("#comNo").val(comNo);
    $("#pform").submit();
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">사업장별 수료통계</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/compStats.do" method="post">
    <input type="hidden" name="comNo" id="comNo" value=""/>
    <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>

<!-- 검색영역 -->
<table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
      </colgroup>
         <tbody>
          <tr>
              <th>년도</th>
            <td>
                <select name="searchYear" id="searchYear" title="년도">
                    <c:forEach var="result" items="${yearList}">
                    <option value="<c:out value="${result.code}"/>" <c:if test="${REQUEST_DATA.searchYear eq result.code}">selected</c:if>><c:out value="${result.name}"/></option>
                    </c:forEach>
                </select>
            </td>
            <th>검색</th>
            <td>
                <select name="searchMode" id="searchMode" title="검색유형">
                <option value="">선택</option>
                <option value="comName" <c:if test="${REQUEST_DATA.searchMode eq 'comName'}">selected</c:if>>회사명</option>
                <option value="bizrNo" <c:if test="${REQUEST_DATA.searchMode eq 'bizrNo'}">selected</c:if>>사업자번호</option>
                </select>
                <input type="text" class="line" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>

            </td>

          </tr>
        </tbody>
</table>
    <div class="button_top">
    <a href="#" onclick="list_page();" class="btn search brown">검색</a>
    </div>
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->
<div class="space5"></div>
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <!-- <td align="right"><a href="#" onclick="goExcel();" class="btn down sky">엑셀다운</a></td> -->
    </tr>
  </tbody>
</table>

<c:set var="TOTAL" value="${fn:length(resultList)}"/><!-- 총 건수 -->
<c:set var="cPage" value="${REQUEST_DATA.cPage}"/><!-- 현재 페이지 -->

<!-- 번호매김 -->
<c:if test="${cPage eq 1}">
    <c:set var="cPage" value="0"/>
</c:if>
<c:if test="${cPage > '1'}">
    <c:set var="cPage" value="${cPage -1}"/>
</c:if>


<table width="100%" class="btn_Group">
        <tbody>
              <tr>
                   <td class="pageinfo">조회건수 <span class="red"><c:out value="${TOTAL}"/></span> 건</td></td>
                   <!-- <td align="right">
                    <a href="#" onclick="goExcel();return false;" class="btn down sky">엑셀 다운로드</a>
                 </td> -->
              </tr>
         </tbody>
    </table>


<!-- 사업장별 신청/수료자 통계 -->
<table class="tb table-type1 stats_tb">
    <tr class="rndbg">
        <th rowspan="2">NO</th>
        <th rowspan="2">년도</th>
        <th rowspan="2">회사명</th>
        <th rowspan="2">사업자번호</th>
        <th colspan="2">온라인과정</th>
        <th colspan="2">집합과정</th>
        <th rowspan="2">상세과정</th>
    </tr>
    <tr>
        <th>신청인원</th><th>수료인원</th><th>신청인원</th><th>대상자선정인원 </th>
    </tr>
    <colgroup>
        <col align=middle width="4%"><!-- 순번 -->
        <col align=middle width="10%"><!-- 년도 -->
        <col align=middle width="16%"><!-- 회사명 -->
        <col align=middle width="10%"><!-- 사업자번호 -->
        <col align=middle width="10%"><!-- 온라인과정 - 신청인원 -->
        <col align=middle width="10%"><!-- 온라인과정 - 수료인원 -->
        <col align=middle width="10%"><!-- 집합과정 - 신청인원 -->
        <col align=middle width="10%"><!-- 집합과정 - 대상자선정인원 -->
        <col align=middle width="10%"><!-- 상세보기 -->
    </colgroup>

    <c:if test="${not empty resultList}">
        <c:forEach var="result" items="${resultList}" varStatus="status" begin="0">
            <tr height=40 align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
                <td><c:out value="${fn:length(resultList)-((cPage * 20 ) + status.index)}"/></td><!-- 순번 -->
                <td><c:out value="${REQUEST_DATA.searchYear}"/></td><!-- 년도 -->
                <td><c:out value="${result.COMNAME}"/></td><!-- 회사명 -->
                <td><c:out value="${result.BIZNO}"/></td><!-- 사업자번호 -->
                <td><c:out value="${result.ONLINE_CNT}"/></td><!-- 온라인과정 - 신청인원 -->
                <td><c:out value="${result.ONLINE_ISPASS}"/></td><!-- 온라인과정 - 수료인원 -->
                <td><c:out value="${result.JIB_CNT}"/></td><!-- 집합과정 - 신청인원 -->
                <td><c:out value="${result.JIB_TARGET}"/></td><!-- 집합과정 - 대상자선정인원 -->
                <td><a href="#" onclick="compView('<c:out value="${result.COMNO}"/>');" class="btn green">상세보기</a></td><!-- 상세보기 -->
            </tr>
        </c:forEach>
        </c:if>
        <c:if test="${empty resultList}">
            <td colspan="12" align="center">조회된 내역이 없습니다.</td>
        </c:if>


</table>

<div class="admin-paging paging_wrap">
    <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
</div>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	