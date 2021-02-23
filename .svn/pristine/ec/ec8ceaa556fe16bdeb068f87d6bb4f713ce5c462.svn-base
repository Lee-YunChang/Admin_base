<%
/****************************************************
    system  : 시스템관리 > 메뉴관리
    title   : 메뉴 등록 수정 양식 팝업
    summary :
    wdate   : 2016-06-10
    writer  : 김학규
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">

//등록실행 체크
function writeFormCheck(){
    var form = document.pform;
    if ($("#i_menuCode").val() == ''){
        alert("메뉴코드를 입력하세요!");
        form.i_menuCode.focus();

    } else if ($("#menuName").val() == ''){
        alert("메뉴명을 입력하세요!");
        form.menuName.focus();
    } else if ($("#menuDiv").val() == '') {
        alert("메뉴 댑스를 입력하세요!");
        form.menuDiv.focus();
    } else {
        if ($("#mode").val() == 'insert') {
            if($("#pMenuCode").val() != null) {
                $("#menuCode").val($("#pMenuCode").val() + $("#i_menuCode").val())
            } else{
                $("#menuCode").val($("#i_menuCode").val())
            }
        }

        if (confirm("저장 하시겠습니까?")){
            $("#pform").attr("action", '/admin/sysman/menumngFormExec.do');
            $("#pform").submit();
        }
    }
}
</script>
<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">메뉴 <c:if test="${pageModeReg eq pageMode}">등록</c:if><c:if test="${pageModeReg ne pageMode}">수정</c:if><span>메뉴정보를 등록 할 수 있습니다.</span></div>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/sysman/menumngExec.do" method="post">
<input type="hidden" name="subcmd" id="subcmd" value="exec"/>
<input type="hidden" name="mode" id="mode" value="<c:out value="${REQUEST_DATA.mode}"/>"/>
<input type="hidden" name="sysGb" id="sysGb" value="<c:out value="${REQUEST_DATA.sysGb}"/>"/>
<input type="hidden" name="pMenuCode" id="pMenuCode" value="<c:out value="${REQUEST_DATA.pMenuCode}"/>"/>
<input type="hidden" name="menuCode" id="menuCode" value="<c:out value="${REQUEST_DATA.menuCode}"/>"/>
<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="15%">
        <col class="celll">
    </colgroup>
    <tbody>
        <tr>
            <th>메뉴코드</th>
            <td>
                <c:if test="${REQUEST_DATA.mode eq 'update'}">
                    <input class="line" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MENU_CODE)}"/>" name="i_menuCode" id="i_menuCode"/>
                </c:if>
                <c:if test="${REQUEST_DATA.mode ne 'update'}">
                    <c:out value="${REQUEST_DATA.pMenuCode}"/> <input name="i_menuCode" id="i_menuCode" class="line" value=""/>
                </c:if>
                 <font class=extext>시스템구분(3) + 대메뉴(3) + 중메뉴(3) + 소메뉴(3)</font>
            </td>
        </tr>
        <tr>
            <th>메뉴명</th>
            <td><input class="lline" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MENU_NAME)}"/>" name="menuName" id="menuName"/></td>
        </tr>
        <tr>
            <th>링크주소</th>
            <td><input class="lline" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.LINK)}"/>" name="link"/> <font class=extext>도메인을 제외한 서버 URI만 입력</font></td>
        </tr>
        <tr>
            <th>연결구분</th>
            <td><input class="line" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.LINKTARGET)}"/>" name="linkTarget" id="linkTarget"/> <font class=extext>_blank, _self, _parent</font></td>
        </tr>
        <tr>
            <th>depth</th>
            <td><input class="line" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MENU_DIV)}"/>" name="menuDiv" id="menuDiv"/> <font class=extext>숫자로 설정 1~3</font> </td>
        </tr>
        <tr>
            <th>조회순서</th>
            <td>
                <input class="line" value="<c:out value="${VIEW_DATA.ORDR}"/>" name="ordr" id="ordr"/> <font class=extext>숫자로 설정</font>
            </td>
        </tr>
        <tr>
            <th>사용여부</th>
            <td>
                <select name="useState" id="useState">
                    <option value="Y" <c:if test="${VIEW_DATA.USE_STATE eq 'Y'}">selected</c:if>>사용</option>
                    <option value="N" <c:if test="${VIEW_DATA.USE_STATE eq 'N'}">selected</c:if>>사용안함</option>
                </select>
            </td>
        </tr>
    </tbody>
</table>
</form>

<br/>
<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />
<div class="button" align="center">
    <c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
    </c:if>
    <c:if test="${REQUEST_DATA.pageMode ne pageModeReg}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
    </c:if>
    <a href="#" onclick="window.close();" class="btn gray big">취소</a>
</div>

<!-- 본문 > 메인 > 목록 끝 -->