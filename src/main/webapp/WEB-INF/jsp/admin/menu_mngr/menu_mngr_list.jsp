<%
/****************************************************
    system  : 시스템관리 > 메뉴관리
    title   : 메뉴목록조회
    summary :
    wdate   : 2016-06-10
    writer  : 김학규
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

//검색
function list_page(){
    $("#pform").attr("action", '/admin/sysman/menumngList.do');
    $("#pform").submit();
}

function insertMenu(pMenuCode){
    formWin('insert', '', pMenuCode);
}

function updateMenu(menuCode){
    formWin('update', menuCode, '');
}

function formWin(mode, menuCode, pMenuCode){
    var sysGb = $("#sysGb").val();
    var param = "";
    if(mode == 'insert') {
        param = "&pageMode=reg";
    } else {
        param = "&pageMode=mod";
    }
    popup3("menumngFormPop.do?mode="+mode+"&menuCode="+menuCode+"&pMenuCode="+pMenuCode+"&sysGb="+sysGb+param,700,400,1,1);
}

function deleteMenu(menuCode){
    var sysGb = document.pform.sysGb.value;

    if (confirm("메뉴를 삭제하겠습니까?")){
        //location.href="menumng.do?subcmd=del_exec&menuCode="+menuCode+"&sysGb="+sysGb;
        $("#pform").attr("action" , '/admin/sysman/menumngDelExec.do');
        $("#menuCode").val(menuCode);
        $("#sysGb").val(sysGb);
        $("#pform").submit();

    }
}

</script>
<c:set var="mbrTransSysGbAcademy" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY") %>' />
<c:set var="mbrTransSysGbAdmin" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN") %>' />

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">메뉴 관리<span></span></div>


<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="menumng.do" method="post">

<input type="hidden" name="menuCode" id="menuCode" value=""/>

    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        </colgroup>
        <tbody>
        <tr>
            <th>구분</th>
            <td>
                <select name="sysGb" id="sysGb" title="시스템구분옵션">
                    <option value="<c:out value="${cfn:clearXSSMinimum(mbrTransSysGbAcademy)}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAcademy}">selected</c:if>>학습시스템</option>
                    <option value="<c:out value="${cfn:clearXSSMinimum(mbrTransSysGbAdmin)}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAdmin}">selected</c:if>>관리시스템</option>
                </select>

                <select name="useState" id="useState" title="사용구분">
                    <option value="T" <c:if test="${REQUEST_DATA.useState eq 'T' }">selected</c:if>>전체</option>
                    <option value="Y" <c:if test="${REQUEST_DATA.useState eq 'Y' }">selected</c:if>>사용</option>
                    <option value="N" <c:if test="${REQUEST_DATA.useState eq 'N' }">selected</c:if>>사용안함</option>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>
 <!-- 본문 > 상단 > 검색영역 끝 -->

<br/>


<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>code</th>
        <th>메뉴명</th>
        <th>링크주소</th>
        <th>연결구분</th>
        <th>depth</th>
        <th>조회순서</th>
        <th>사용여부</th>
        <th><a href="javascript:insertMenu('')" class="btn green small">추가</a></th>
        <th></th>
    </tr>
    <colgroup>
        <col align=middle width="10%">
        <col align=middle width="15%">
        <col align=middle width="*">
        <col align=middle width="10%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="8%">
        <col align=middle width="8%">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status">

    <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
        <td align="left"><c:out value="${cfn:clearXSSMinimum(result.MENU_CODE)}"/></td>
        <td align="left">
            <a href="javascript:updateMenu('<c:out value="${cfn:clearXSSMinimum(result.MENU_CODE)}"/>')">

            <c:if test="${result.MENU_DIV == 1}">
                <b><c:out value="${cfn:clearXSSMinimum(result.MENU_NAME)}"/></b>
            </c:if>
            <c:if test="${result.MENU_DIV == 2}">
                <img src="/admin/images/icon_list.gif" alt="list">&nbsp;<img src="/admin/images/icon_list.gif" alt="list">&nbsp;<b><c:out value="${cfn:clearXSSMinimum(result.MENU_NAME)}"/></b>
            </c:if>
            <c:if test="${result.MENU_DIV == 3}">
                <img src="/admin/images/icon_list.gif" alt="list">&nbsp;<img src="/admin/images/icon_list.gif" alt="list">&nbsp;<img src="/admin/images/icon_list.gif" alt="list">&nbsp;
                <c:out value="${cfn:clearXSSMinimum(result.MENU_NAME)}"/>
            </c:if>
            </a>
        </td>
        <td align="left"><c:out value="${cfn:clearXSSMinimum(result.LINK)}"/> </td>
        <td><c:out value="${cfn:clearXSSMinimum(result.LINKTARGET)}"/> </td>
        <td><c:out value="${result.MENU_DIV}"/> </td>
        <td><c:out value="${result.ORDR}"/> </td>
        <td><c:out value="${cfn:clearXSSMinimum(result.USE_STATE)}"/> </td>
        <td>
            <c:if test="${result.MENU_DIV < 3}">
                <a href="#" onclick="javascript:insertMenu('<c:out value="${cfn:clearXSSMinimum(result.MENU_CODE)}"/>'); return false;" class="btn green small">추가</a>
            </c:if>
        </td>
        <td>
            <c:if test="${result.SUB_CNT == 0}">
                <a href="#" onclick="javascript:deleteMenu('<c:out value="${cfn:clearXSSMinimum(result.MENU_CODE)}"/>'); return false;" class="btn red small">삭제</a>
             </c:if>
        </td>
    </tr>
    </c:forEach>
    </c:if>
</table>
<!-- 본문 > 메인 > 목록 끝 -->