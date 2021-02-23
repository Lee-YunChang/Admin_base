<%
/****************************************************
    system  : 시스템관리 > 메뉴권한관리
    title   : 메뉴권한 등록/수정
    summary :
    wdate   : 2016-06-13
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
    $("#pform").submit();
}

function selectGrade(gradeCode) {
    $("#gradeCode_1").val(gradeCode);
    list_page();
}

function selectSysGb(sysGb) {
    $("#sysGb").val(sysGb);
    if ($("#gradeCode_1").val() != '') {
        list_page();
    } else  {
        alert("권한을 먼저 선택하세요!");
    }
}

function writeFormCheck(){
    $("#writeForm").attr("action", '/admin/sysman/menumngGradeExec.do');
    $("#writeForm").submit();
}

function totSelect(totUseYn) {
    var form = document.writeForm;

    if (totUseYn != '') {
        for(i = 0; i<form.useYn.length; i++){
            form.useYn[i].value = totUseYn;
        }
    }
}
</script>
<c:set var="mbrTransSysGbAcademy" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY") %>' />
<c:set var="mbrTransSysGbAdmin" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN") %>' />

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">메뉴 권한 관리<span></span></div>


<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/sysman/menumngGradeForm.do" method="post">
<input type="hidden" name="subcmd"	id="subcmd"	value="grade_form"/>
<input type="hidden" name="sysGb"	id="sysGb"	value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.sysGb)}"/>"/>
<input type="hidden" name="gradeCode"	id="gradeCode_1"	value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.gradeCode)}"/>"/>
</form>
 <!-- 본문 > 상단 > 검색영역 끝 -->

<br/>


<!-- 본문 > 메인 > 목록 시작  -->

<table board="0" width="100%">
    <tr>
        <td width="30%" valign="top">

            <table class="tb table-type1" width="100%">
                <tr class="rndbg">
                    <th>권한코드</th>
                    <th>권한명</th>
                </tr>
                <colgroup>
                    <col align=middle width="10%">
                    <col align=middle width="10%">
                </colgroup>

                 <c:if test="${fn:length(GRADE_LIST_DATA) > 0}">
                    <c:forEach var="result" items="${GRADE_LIST_DATA}" varStatus="status">
                        <tr align="meddle" <c:if test="${result.MT_SUB_CODE eq REQUEST_DATA.gradeCode}">style="bgcolor='#ffcc33';"</c:if>>
                            <td><c:out value="${cfn:clearXSSMinimum(result.MT_SUB_CODE)}"/></td>
                            <td>
                                <a href="javascript:selectGrade('<c:out value="${cfn:clearXSSMinimum(result.MT_SUB_CODE)}"/>');"><b><c:out value="${cfn:clearXSSMinimum(result.MT_SUB_NAME)}"/></a></b>
                            </td>
                    </c:forEach>
                </c:if>
            </table>

        <td>
        <td width="2%"></td>
        <td width="68%" valign="top">

            <form name="gradeForm">
                <table class="table-type1 search_form">
                  <colgroup>
                    <col class="cellc" width="12%">
                    <col class="celll" width="88%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>구분</th>
                        <td>
                             <select name="sysGb" id="sysGb" title="시스템구분옵션" onchange="selectSysGb(this.value);">
                                <option value="<c:out value="${cfn:clearXSSMinimum(mbrTransSysGbAcademy)}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAcademy}">selected</c:if>>학습시스템</option>
                                <option value="<c:out value="${cfn:clearXSSMinimum(mbrTransSysGbAdmin)}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAdmin}">selected</c:if>>관리시스템</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>

            <br/>

            <form name="writeForm" id="writeForm" action="menumng.do" method="post">
            <input type="hidden" name="sysGb"	id="sysGb"	value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.sysGb)}"/>"/>
            <input type="hidden" name="gradeCode"	id="gradeCode"	value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.gradeCode)}"/>"/>

            <table class="tb table-type1">
                <tr class="rndbg">
                    <th>code</th>
                    <th>메뉴명</th>
                    <th>
                    사용여부
                        <select name="totUseYn" id="totUseYn" title="사용구분" onchange="totSelect(this.value);">
                            <option value="">선택</option>
                            <option value="Y">전체허용</option>
                            <option value="N">전체허용안함</option>
                        </select>
                    </th>
                </tr>
                <colgroup>
                    <col align=middle width="20%">
                    <col align=middle width="40%">
                    <col align=middle width="40%">
                </colgroup>
                <c:if test="${fn:length(MENU_LIST_DATA) > 0}">
                    <c:forEach var="result" items="${MENU_LIST_DATA}" varStatus="status">
                    <input type="hidden" name="menuCode"    id="menuCode"   value="<c:out value="${cfn:clearXSSMinimum(result.MENU_CODE)}"/>"/>
                    <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
                    <td align="left"><c:out value="${cfn:clearXSSMinimum(result.MENU_CODE)}"/> </td>
                    <td align="left">
                        <c:if test="${result.MENU_DIV ==1}">
                            <b><c:out value="${cfn:clearXSSMinimum(result.MENU_NAME)}"/></b>
                        </c:if>
                        <c:if test="${result.MENU_DIV ==2}">
                            <img src="/admin/images/icon_list.gif" alt="list">&nbsp;<img src="/admin/images/icon_list.gif" alt="list">&nbsp;<b><c:out value="${cfn:clearXSSMinimum(result.MENU_NAME)}"/></b>
                        </c:if>
                        <c:if test="${result.MENU_DIV ==3}">
                            <img src="/admin/images/icon_list.gif" alt="list">&nbsp;<img src="/admin/images/icon_list.gif" alt="list">&nbsp;<img src="/admin/images/icon_list.gif" alt="list">&nbsp;
                            <c:out value="${cfn:clearXSSMinimum(result.MENU_NAME)}"/>
                        </c:if>
                        </td>
                        <td>
                        <select name="useYn" id="useYn" title="사용구분">
                            <option value="Y" <c:if test="${result.USEYN eq 'Y'}">selected</c:if>>허용</option>
                            <option value="N" <c:if test="${result.USEYN eq 'N'}">selected</c:if>>허용안함</option>
                        </select>
                    </td>
                    </c:forEach>
                </c:if>

            </table>

            <c:if test="${fn:length(MENU_LIST_DATA) > 0}">
            <div class="button" align="center">
                <a href="#" onclick="writeFormCheck(); return false;" class="btn orange big">등록</a>
            </div>
            </c:if>

            </form>

        </td>
    </tr>
</table>


<!-- 본문 > 메인 > 목록 끝 -->