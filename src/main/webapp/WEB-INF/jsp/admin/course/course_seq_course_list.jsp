<%
/****************************************************
    system	: 과정관리 > 교육과정개설
    title	: 차수 등록
    summary	:
    wdate	: 2016-05-21
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
        if ('DAAA00' == code) {
            $('#mtCgrpCode option:eq(0)').prop('selected',true);
            $('#mtCgrpCode').hide();
        } else {
            $('#mtCgrpCode').show();
        }
    });

    $('#mtCtypeCode').trigger('change');

    $("input[name=courseTitle]").keypress(function(e) {
        e.preventDefault();
        e.stopPropagation();
        if (e.keyCode == 13){
            list_page();
        }
    });

});

//페이지 이동
function move_page(cPage){
    var frm = document.pform;
    frm.target = "";
    frm.cPage.value = cPage;
    $("#pform").attr("action", "/admin/course/seqCourseList.do");
    frm.submit();
}

//검색
function list_page(){
    var frm = document.pform;
    frm.target = "";
    frm.cPage.value = "1";
    $("#pform").attr("action", "/admin/course/seqCourseList.do");
    frm.submit();
}

// 차수등록
function goForm(no, mtCtype){
    var frm = document.pform;
    var cno = no;
    frm.target = "";
      frm.courseno.value = cno;
      frm.pageMode.value = "reg";
      frm.mtCtype.value = mtCtype;
      $("#pform").attr("action", "/admin/course/seqForm.do");
     frm.qu.value = "insert";
    frm.submit();
}

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정개설<span></span></div>
    <!-- 본문 > 상단 > 검색영역 시작 -->
    <form name="pform" id="pform" action="/admin/course/seqCourselist.do" method="post">
        <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
        <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
         <input type="hidden" name="courseno" id="courseno" value=""/>
         <input type="hidden" name="mtCtype" id="mtCtype" value=""/>
         <input type="hidden" name="qu" id="qu" value=""/>
         <input type="hidden" name="pageMode" id="pageMode" value=""/>

        <table class="table-type1 search_form">
             <colgroup>
                <col class="cellc" width="8%">
                <col class="celll" width="42%">
                <col class="cellc" width="8%">
                <col class="celll" width="42%">
            </colgroup>
            <tbody>
              <tr>
                <th>교육형태</th>
                <td>

                    <select name="mtCtypeCode" id="mtCtypeCode" title="교육형태">
                        <option value="">전체</option>
                        <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
                            <option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
                        </c:forEach>
                     </select>
                 </td>
                 <th>교육대상</th>
                <td>
                     <select name="mtCgrpCode" id="mtCgrpCode" title="교육대상">
                        <option value="">전체</option>
                        <c:forEach var="emap" items="${categoryData2}" varStatus="status1">
                            <option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCgrpCode == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
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
                <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</td>
                <td align="right">

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
            <th>차수추가</th>
        </tr>
        <colgroup>
            <col align=middle width="4%">
            <col align=middle width="8%">
            <col align=middle width="15%">
            <col align=middle width="*">
            <col align=middle width="8%">
            <col align=middle width="8%">
        </colgroup>
        <c:forEach var="result" items="${resultList}" varStatus="status">
            <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
                <td><c:out value='${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
                <td><c:out value="${result.MT_CTYPE_NAME}"/></td>
                <td><c:if test="${result.MT_SC_CODE != 'SC0000'}"><c:out value="${result.MT_SC_NAME}"/></c:if></td>
                <%-- <td align="left"><a href="#" onclick="goForm('<c:out value="${result.COURSENO}"/>');return false;"><c:out value="${result.COURSETITLE}"/></a></td> --%>
                <td align="left">${result.COURSETITLE}</td>
                <td><c:out value="${result.USEYN}"/></td>
                <td><a href="#" onclick="goForm(${result.COURSENO},'${result.MT_CTYPE_CODE}');return false;" class="btn small green">추가</a></td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${not empty resultList}">
        <div class="admin-paging paging_wrap">
            <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
        </div>
    </c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>