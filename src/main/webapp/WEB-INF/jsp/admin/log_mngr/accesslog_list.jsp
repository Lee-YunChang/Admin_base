<%
/****************************************************
    system	: 시스템관리 > 로그관리 > 접속로그
    title	: 로그 리스트
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
		var frm = document.pform;
		frm.target = "";
		frm.cPage.value = cPage;
		frm.submit();
	}
	
	// 검색
	function list_page(){
		var frm = document.pform;
		frm.target = "";
		frm.cPage.value = "1";
		frm.submit(); 
	}
	
	// 로그삭제 팝업
	function delLogWin(){
		popup3("accesslogDelForm.do",500,500,1,1);
	}

</script>

<c:set var="mbrTransSysGbAcademy" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY") %>' />
<c:set var="mbrTransSysGbAdmin" value='<%=SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN") %>' />

<c:set var="TOTAL" value="${total}"/><!-- 총 건수 -->
<c:set var="cPage" value="${REQUEST_DATA.cPage}"/><!-- 현재 페이지 -->
<c:if test="${cPage eq 1}">
    <c:set var="cPage" value="1"/>
</c:if>
<c:if test="${cPage > '1'}">
    <c:set var="cPage" value="${cPage}"/>
</c:if>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">접속로그<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/sysman/accesslog.do" method="post">
    <input type="hidden" name="cPage"	id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="42%">
        <col class="cellc" width="8%">
        <col class="celll" width="42%">

        </colgroup><tbody>
        <tr>
            <th>구분</th>
            <td>
                 <select name="sysGb" id="sysGb" title="시스템구분옵션">
                    <option value="">시스템구분 전체</option>
                    <option value="<c:out value="${mbrTransSysGbAcademy}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAcademy}">selected</c:if>>학습시스템</option>
                    <option value="<c:out value="${mbrTransSysGbAdmin}"/>" <c:if test="${REQUEST_DATA.sysGb eq mbrTransSysGbAdmin}">selected</c:if>>관리시스템</option>
                </select>
            </td>

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

        </tr>
          <tr>
            <th>검색</th>
            <td>
                <select name="searchMode" id="searchMode" title="검색옵션">
                        <option value="">전체</option>
                        <option value="accessUserId" <c:if test="${REQUEST_DATA.searchMode eq 'accessUserId'}">selected</c:if>>아이디</option>
                        <option value="accessIp" <c:if test="${REQUEST_DATA.searchMode eq 'accessIp'}">selected</c:if>>IP주소</option>
                        <option value="accessUrl" <c:if test="${REQUEST_DATA.searchMode eq 'accessUrl'}">selected</c:if>>URL</option>
                </select>
                <input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
            </td>
            <th>사용자별최근이력</th>
            <td>
                <input type="checkbox" name="isGroupList" value="Y" <c:if test="${REQUEST_DATA.isGroupList eq 'Y'}">checked</c:if>/>
                <FONT class=extext>접속로그를 사용자별 최근 이력만 조회</FONT>
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
            <a href="javascript:delLogWin();" class="btn red">삭제</a>
        </td>
    </tr>
  </tbody>
  </table>
<!-- 본문 > 메인 > 서브   영역 끝 -->
<table class="tb table-type1">
    <colgroup>
        <col class="cellc" width="4%">
        <col class="cellc" width="10%">
        <col class="cellc" width="8%">
        <col class="cellc" width="10%">
        <col class="cellc" width="15%">
        <col class="cellc" width="*">
    </colgroup>
    
    <tbody>
    <tr>
        <th>NO</th>
        <th>시스템구분</th>
        <th>아이디</th>
        <th>IP주소</th>
        <th>일자</th>
        <th>URL주소</th>
    </tr>
    <c:if test="${fn:length(LIST_DATA) > 0}">
 		<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
            
		    <tr align="middle"  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		        <td><c:out value="${TOTAL-(status.index)}"/> </td>
		        <td><c:out value="${result.SYS_GB_NAME}" /></td>
		        <td><c:out value="${result.ACCES_USERID}" /></td>
		        <td><c:out value="${result.ipAddr}" /><input type="hidden" id="ipAddr" value="<c:out value="${result.ACCES_IP}" />"></td>
		        <td><c:out value="${result.ACCES_DE}" /> <c:out value="${result.ACCES_TM}" /></td>
		        <td align="left"><c:out value="${result.ACCES_URL}" /></td>
		    </tr>
	    </c:forEach>
    </c:if>
    </tbody>
</table>

<div class="admin-paging paging_wrap">
    <paging:page cpage="${cPage}" total="${total}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
</div>
<!-- 본문 > 메인 > 목록 끝 -->