<%
/****************************************************
    system	: 시스템관리 > 로그관리 > 권한변경로그
    title	: 권한변경로그 리스트 및 엑셀 다운
    summary	:
    wdate	: 2013-06-26
    writer	: sangs
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

    // 날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
    var dateFormat={
         dayNamesMin:['일','월','화','수','목','금','토'],
         monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         showMonthAfterYear: true, //연월 순서로 보여줌
         changeMonth: true, //월을 셀렉트박스로 표현
         changeYear: true, //년을 셀렉트박스로 표현
         dateFormat: "yy-mm-dd"
    };

    $(document).ready(function(){
        $("#sdate").datepicker(dateFormat);
        $("#edate").datepicker(dateFormat);
    });

    //페이징
    function move_page(cPage){
        $("#listType").val("");
        $("#cPage").val(cPage);
        $("#pform").attr("action", '/admin/sysman/admlogGradeList.do');
        $("#pform").submit();
    }

    // 검색
    function list_page(){
        $("#listType").val("");
        $("#cPage").val(1);
        $("#pform").attr("action", '/admin/sysman/admlogGradeList.do');
        $("#pform").submit();
    }

    //엑셀다운
    function excelList(){
        $("#pform").attr("action", '/admin/sysman/admlogGradeList.do');
        $("#listType").val("EXCEL");
        $("#pform").submit();
    }

</script>

<c:set var="mbrTransSysGbAcademy" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY") %>' />
<c:set var="mbrTransSysGbAdmin" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN") %>' />

<c:set var="mbrLoginGbSucess" value='<%=SangsProperties.getProperty("Globals.MBR_LOGIN_GB_SUCESS") %>' />
<c:set var="mbrLoginGbFail" value='<%=SangsProperties.getProperty("Globals.MBR_LOGIN_GB_FAIL") %>' />
<c:set var="mbrLoginGbLogout" value='<%=SangsProperties.getProperty("Globals.MBR_LOGIN_GB_LOGOUT") %>' />

<c:set var="TOTAL" value="${total}"/><!-- 총 건수 -->
<c:set var="cPage" value="${REQUEST_DATA.cPage}"/><!-- 현재 페이지 -->
<c:if test="${cPage eq 1}">
    <c:set var="cPage" value="1"/>
</c:if>
<c:if test="${cPage > '1'}">
    <c:set var="cPage" value="${cPage}"/>
</c:if>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">권한변경로그<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="admlog.do" method="post">
    <input type="hidden" name="cPage"			id="cPage"				value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="listType" id="listType"    value=""/>
    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="42%">
        <col class="cellc" width="8%">
        <col class="celll" width="42%">

        </colgroup><tbody>
        <tr>
            <th>기간</th>
            <td>

                 <input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.sdate)}"/>" readonly="readonly"/>
                     <a href="#" onclick="$('#sdate').focus(); return false;" class="">
                         <img src="/admin/images/btn_calendar.png" alt="시작일">
                     </a>
                ~
                <input type="text" class="line" name="edate" id="edate" value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.edate)}"/>" readonly="readonly"/>
                    <a href="#" onclick="$('#edate').focus(); return false;" class="">
                        <img src="/admin/images/btn_calendar.png" alt="종료일">
                    </a>
            </td>
            <th>구분</th>
            <td>
                 <select name="sysGb" id="sysGb" title="시스템구분옵션">
                    <option value="">시스템구분 전체</option>
                    <option value="<c:out value="${mbrTransSysGbAcademy}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAcademy}">selected</c:if>>학습시스템</option>
                    <option value="<c:out value="${mbrTransSysGbAdmin}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAdmin}">selected</c:if>>관리시스템</option>
                </select>

            </td>
        </tr>
          <tr>
            <th>검색</th>
            <td colspan="3">
                 <select name="searchMode" id="searchMode" title="검색옵션">
                        <option value="">전체</option>
                        <option value="TRANS_USERID" <c:if test="${REQUEST_DATA.searchMode eq 'TRANS_USERID'}">selected</c:if>>처리자회원아이디</option>
                        <option value="TRANS_IP" <c:if test="${REQUEST_DATA.searchMode eq 'TRANS_IP'}">selected</c:if>>처리자IP주소</option>
                        <option value="TG_USERID" <c:if test="${REQUEST_DATA.searchMode eq 'TG_USERID'}">selected</c:if>>변경회원아이디</option>
                </select>
                <input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.searchWord)}"/>"/>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><c:out value="${TOTAL}"/></span> 건</td>
        <td align="right">
            <a href="#" onclick="excelList();" class="btn down sky">엑셀다운</a>
        </td>
    </tr>
  </tbody>
  </table>
<!-- 본문 > 메인 > 서브   영역 끝 -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>NO</th>
        <th>시스템구분</th>
        <th>일자</th>
        <th>처리자아이디</th>
        <th>처리자IP주소</th>
        <th>회원아이디</th>
        <th>변경권한</th>
        <th>설명</th>
    </tr>
    <colgroup>
    	<col align=middle width="4%">
        <col align=middle width="10%">
        <col align=middle width="15%">
        <col align=middle width="8%">
        <col align=middle width="10%">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="*">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status" begin="0">
    <tr align="middle"  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">

        <td><c:out value="${TOTAL-(status.index)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.SYS_GB_NAME)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TRANS_DT)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TRANS_USERID)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.ipAddr)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TG_USERID)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TG_GRADE_NAME)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.SUMMARY)}"/></td>
    </tr>
    </c:forEach>
    </c:if>
</table>

<div class="admin-paging paging_wrap">
        <paging:page cpage="${cPage}" total="${total}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
<!-- 본문 > 메인 > 목록 끝 -->