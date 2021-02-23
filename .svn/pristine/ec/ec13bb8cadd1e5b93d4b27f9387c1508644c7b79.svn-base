<%
/****************************************************
    system  : 시스템관리 > 공통코드 상세 리스트
    title   : 공통 코드 목록 조회
    summary :
    wdate   : 2016-05-16
    writer  : sangs
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

function goMtSub(mtcode){

    var form = document.writeform;
    var mtCode=mtcode;

}
function writeFormCheck(){

    var form = document.listform;
    form.submit();
}

//상세 수정
function subUpdate(mtcode){

    var codevalue=mtcode;

    var pageModeUpd = '<%=SangsProperties.getProperty("Globals.PAGE_MODE_UPD")%>';

    $("#mtSubCode").val(codevalue);
    $("#qu").val('update');
    $("#pageMode").val('<c:out value="${cfn:clearXSSMinimum('+pageModeUpd+')}" />');

    $("#listform").submit();

}

//상세 등록
function subInsert(){
	
    var pageModeReg = '<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>';

    $("#mtSubCode").val();
    $("#qu").val('insert');
    $("#pageMode").val('<c:out value="${cfn:clearXSSMinimum('+pageModeReg+')}" />');
    $("#listform").submit();
}

//상세 삭제
function mtSubDel(mtcode){

    var codevalue=mtcode;

    $("#mtSubCode").val(codevalue);


    $("#listform").attr("action", '/admin/sysman/deleteMtcodeSubInfo.do');


    if(confirm("삭제하시겠습니까?")){
        $("#listform").submit();
    }
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">공통코드 관리  > <c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_NAME)}" /> (<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_CODE)}" />) </div>

<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class=pageinfo> </td>
        <td align=right>
        <a href="#" onclick="subInsert();" class="btn blue">등록</a>
        <a href="/admin/sysman/mtcodeList.do?cmmnRootMenuCode=ADM007&cmmnSubMenuCode=ADM007001" class="btn orange">목록</a></td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<form name="listform" id="listform" action="/admin/sysman/mtcodeForm.do" method="post"  >
    <input type="hidden" name="mtCode" id="mtCode" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_CODE)}" />"/>
    <input type="hidden" name="mtSubCode" id="mtSubCode" value=""/>
    <input type="hidden" name="mode" id="mode" value="mtsub"/>
    <input type="hidden" name="qu" id="qu" value=""/>
    <input type="hidden" name="pageMode" id="pageMode" value=""/>
</form>

<table class="tb table-type1">
    <tr class="rndbg">
        <th>코드</th>
        <th>코드명</th>
        <th>숫자형</th>
        <th>문자형</th>
        <th>순서</th>
        <th>사용여부</th>
        <th></th>
    </tr>
    <colgroup>
        <col align="middle" width="10%">
        <col align="middle" width="10%">
        <col align="middle" width="10%">
        <col align="middle" width="10%">
        <col align="middle" width="10%">
        <col align="middle" width="10%">
        <col align="middle" width="10%">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status">
    <tr align="middle">
        <td><c:out value="${cfn:clearXSSMinimum(result.MT_SUB_CODE)}" /></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.MT_SUB_NAME)}" /></td>
        <td><c:out value="${result.NUM_CD}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.ABC_CD)}" /></td>
        <td><c:out value="${result.ORDR}" /></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.USEYN)}" /></td>
        <td>
            <a href="#" onclick="subUpdate('<c:out value="${cfn:clearXSSMinimum(result.MT_SUB_CODE)}" />');" class="btn green small">수정</a>
            <a href="#" onclick="mtSubDel('<c:out value="${cfn:clearXSSMinimum(result.MT_SUB_CODE)}" />');" class="btn red small">삭제</a>
        </td>
    </tr>
    </c:forEach>
    </c:if>
</table>
<!-- 본문 > 메인 > 목록 끝 -->