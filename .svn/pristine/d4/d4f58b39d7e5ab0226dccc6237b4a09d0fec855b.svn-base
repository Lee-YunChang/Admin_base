<%
/****************************************************
    system  : 시스템관리 > 게시판코드  상세 목록 관리
    title   : 게시판코드 코드  상세 목록 조회
    summary :
    wdate   : 2016-06-01
    writer  : SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
var objPopup;
function writeFormCheck(){

    var form = document.listform;

}

//수정
function subUpdate(bCateNo, pbCateNo){

    objPopup = window.open("", "updateForm", "width=500, height=300");
	
    $("#mode").val('bbs');
    $("#qu").val('update');
    $("#bCateNo").val(bCateNo);
    $("#pbCateNo").val(pbCateNo);
    $("#listform").attr("action", '/admin/sysman/bbscateSubFormPop.do');
    $("#listform").attr("target", 'updateForm');
    $("#listform").submit();




}

//등록
function subInsert(bCateNo){
    objPopup = window.open("", "insertForm", "width=500, height=300");

     $("#mode").val('bbs');
     $("#qu").val('insert');
     $("#pbCateNo").val(bCateNo);
     $("#bCateNo").val("");
     $("#bcatename").val('<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.BCATENAME)}"/>');
     $("#listform").attr("action", '/admin/sysman/bbscateSubFormPop.do');
     $("#listform").attr("target", 'insertForm');
     $("#listform").submit();


}

//삭제
function SubDel(bCateNo, pbCateNo){
    if (confirm("삭제하시겠습니까?")){
        $("#bCateNo").val(bCateNo);
        $("#pbCateNo").val(pbCateNo);

        $("#listform").attr("action", '/admin/sysman/bbscateSubDelete.do')
        $("#listform").attr("target", '_self')
        $("#listform").submit();
    }
}


function windowClose(){

    objPopup.close();
    $("#listform").attr("target", '_self');
    $("#listform").attr("action", '/admin/sysman/bbscateSubList.do');
    $("#listform").submit();

}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">게시판코드 관리  > 카테고리관리</div>
<table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        </colgroup>
        <tbody>
        <tr>
            <th>게시판명</th>
            <td><c:out value="${cfn:clearXSSMinimum(VIEW_DATA.BCATENAME)}" /></td>
        </tr>
        </tbody>
</table>
</br>
<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class=pageinfo> </td>
        <td align=right>
        <a href="#" onclick="subInsert('<c:out value="${VIEW_DATA.BCATENO}" />');" class="btn blue">등록</a>
        <a href="/admin/sysman/bbscateList.do" class="btn orange">목록</a>
          </td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<form name="listform" id="listform" action="/admin/sysman/bbscateSubList.do" method="post"  >
    <input type="hidden" name="bcatename" id="bcatename" value=""/>
    <input type="hidden" name="pbCateNo" id="pbCateNo" value="<c:out value="${VIEW_DATA.PBCATENO}" />"/>
    <input type="hidden" name="bCateNo" id="bCateNo" value="<c:out value="${VIEW_DATA.BCATENO}" />"/>
    <input type="hidden" name="rootCateNo" id="rootCateNo" value="<c:out value="${REQUEST_DATA.bCateNo}" />"/>
    <input type="hidden" name="mode" id="mode" value="bbs"/>
    <input type="hidden" name="qu" id="qu" value=""/>
</form>

<table class="tb table-type1">
    <tr class="rndbg">
        <th>NO</th>
        <th>카테고리명</th>
        <th>사용여부</th>
        <th></th>
    </tr>
    <colgroup>
        <col align="middle" width="4%">
        <col align="middle" width="*">
        <col align="middle" width="8%">
        <col align="middle" width="10%">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status">

    <tr align="middle">
        <td><c:out value="${result.BCATENO}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.BCATENAME)}" /></td>
        <td><c:if test="${cfn:clearXSSMinimum(result.ISUSE) eq 'Y'}">사용</c:if><c:if test="${cfn:clearXSSMinimum(result.ISUSE) eq 'N'}">미사용</c:if></td>
        <td>
            <a href="#" onclick="subUpdate('<c:out value="${result.BCATENO}"/>', '<c:out value="${result.PBCATENO}"/>');" class="btn green small">수정</a>
            <a href="#" onclick="SubDel('<c:out value="${result.BCATENO}"/>', '<c:out value="${result.PBCATENO}"/>');" class="btn red small">삭제</a>
        </td>
    </tr>
    </c:forEach>
    </c:if>
</table>
<!-- 본문 > 메인 > 목록 끝 -->