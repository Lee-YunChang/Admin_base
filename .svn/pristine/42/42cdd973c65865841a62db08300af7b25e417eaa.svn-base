<%
/****************************************************
    system	: 결제관리 > 교육비입금관리
    title	: 교육비입금관리
    summary	:
     wdate	: 2016-05-12
     writer	: 이진영
 *****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

    // 날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
    function caldate(day){
    }
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

    //페이지 이동
    function move_page(cPage){
        var frm = document.pform;
        frm.target = "";
        $("#pform").attr("action", "/admin/payment/resultList.do");
        frm.cPage.value = cPage;
        frm.submit();
    }
    // 검색
    function list_page(){
        var frm = document.pform;
        frm.target = "";
        frm.cPage.value = "1";
    	$("#pform").attr("action", "/admin/payment/resultList.do");
        frm.submit();
    }

    function openDateSelect(value){

        if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>'){
            document.getElementById("dateSelect").style.display = "block";

        } else if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>' || value == '') {
            document.getElementById("dateSelect").style.display = "none";
        }
    }

    function enterChk(){
        if (event.keyCode==13) list_page();
    }

    // 강의형태가 전체, 전문가 과정이 아닐때만 개설상태 검색 노출
    function fnChStatus(a){
        var ctype = a;
    }

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육비입금관리<span> </span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/payment/resultList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>  

    <table class="table-type1 search_form">
        <colgroup>
            <col class="cellc" width="15%">
            <col class="celll" width="35%">
            <col class="cellc" width="15%">
            <col class="celll" width="35%">
        </colgroup>
            <tbody>
                <tr>
                    <th>과정분류</th>
                    <td >
                         <select name="mtCgrpCode" id="mtCgrpCode" title="과정분류">
                                <option value="">전체</option>
                                <c:forEach var="emap" items="${categoryData2}" varStatus="status1">
								<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCgrpCode == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
							</c:forEach>
                         </select>
                     </td>
                     <th>개설상태</th>
                    <td>
                    <div id="statusType1"style="display: block">
                            <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="개설상태" >
                                    <option value="" >전체</option>
                                   	<c:forEach var="emap4" items="${categoryData4}" varStatus="status2">
										<option value="<c:out value="${emap4.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCseqStatusCode == emap4.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap4.MT_SUB_NAME}"/></option>
									</c:forEach>
                             </select>
                    </div>
                    <!-- <div id="statusType2">개설상태는 집합교육 검색시만 사용 가능합니다.</div> -->
                     </td>
                </tr>

                <tr>
                    <th>기간</th>
                    <td>
                        <input type="radio" id="openType" name="openType" value=""  onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq '' || REQUEST_DATA.openType eq null}"> checked="checked"</c:if>/> 전체&nbsp;
                        <input type="radio" id="openType" name="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>" onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType == 'A'}"> checked = "checked"</c:if>/> 상시운영&nbsp;
                        <input type="radio" id="openType" name="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>" onclick="openDateSelect(this.value);"  <c:if test="${REQUEST_DATA.openType == 'D'}"> checked = "checked"</c:if>/> 기간운영&nbsp;

                        <div id="dateSelect" style="display: none;">
                            <input type="text" class="line" name="sdate" id="sdate" value="${REQUEST_DATA.sdate}" readonly="readonly" style="width: 110px;"/>
                                 <a href="#" onclick="$('#sdate').focus(); return false;" class="">
                                     <img src="/resource/images/btn_calendar.png" alt="시작일">
                                 </a>
                            ~
                            <input type="text" class="line" name="edate" id="edate" value="${REQUEST_DATA.edate}" readonly="readonly" style="width: 110px;"/>
                                <a href="#" onclick="$('#edate').focus(); return false;" class="">
                                    <img src="/resource/images/btn_calendar.png" alt="종료일">
                                </a>
                        </div>
                    </td>
                    <th>강의형태</th>
                    <td>
                         <select name="mtCtypeCode" id="mtCtypeCode" title="상태" >
                                <option value="A">전체</option>
                                <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
									<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
								</c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>과정명</th>
                    <td colspan="3">
                        <input type="text" class="line" id="searchWord" name="searchWord" style="width:500px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();"/>
                    </td>
                </tr>
            </tbody>
    </table>
        <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${fn:length(resultList)}" groupingUsed="true" /></span> 건</td>
        <td align="right">
        </td>
    </tr>
  </tbody>
  </table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>NO</th>
        <th>강의형태</th>
        <th>과정분류</th>
        <th>개설상태</th>
        <th>과정명</th>
        <th>학습기간</th>
        <th>총 대상자</th>
        <th>미납</th>
        <th>승인</th>
        <th>환불</th>
    </tr>
    <colgroup>
        <col align=middle width="4%">
        <col align=middle width="8%">
        <col align=middle width="9%">
        <col align=middle width="7%">
        <col align=middle width="19%">
        <col align=middle width="15%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="5%">
    </colgroup>
    <c:forEach var="map" items="${resultList}" varStatus="status">
    <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
        <td><c:out value='${fn:length(resultList) - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
        <td><c:out value="${map.MT_CTYPE_NAME}"/></td>
        <td><c:out value="${map.MT_CGRP_NAME}"/></td>
        <td>[<c:out value="${map.MT_COUR_STATUS_NAME}"/>]</td>
        <td align="left"><font color="blue"></font>&nbsp;<c:out value="${map.SEQ_TITLE}"/></td>
        <td>
        	<c:choose>
        		<c:when test="${map.OPENTYPE == 'A'}">상시운영</c:when>
        		<c:otherwise><c:out value="${map.STUDY_SDATE}"/> ~ <c:out value="${map.STUDY_EDATE}"/></c:otherwise>
        	</c:choose>
        </td>
        <td><a href="/admin/payment/resultForm.do?cseqno=${map.CSEQNO}&mtPmTypeCode=${map.MT_PM_TYPE_CODE}&targetYn=Y&mtCtypeCode=${map.MT_CTYPE_CODE}&useYn=A"><font size="3"><b>${map.SUKANG_TOT}</b></font></a></td>
        <td><a href="/admin/payment/resultForm.do?cseqno=${map.CSEQNO}&mtPmTypeCode=${map.MT_PM_TYPE_CODE}&targetYn=Y&mtPmStatusCode=${map.MT_PM_STATUS_NOPAY_CODE}&mtCtypeCode=${map.MT_CTYPE_CODE}&useYn=S"><font size="3"><b><c:out value="${map.NOPAY}"/></b></font></a></td>
        <td><a href="/admin/payment/resultForm.do?cseqno=${map.CSEQNO}&mtPmTypeCode=${map.MT_PM_TYPE_CODE}&targetYn=Y&mtPmStatusCode=${map.MT_PM_STATUS_INPAY_CODE}&mtCtypeCode=${map.MT_CTYPE_CODE}&useYn=Y"><font size="3"><b><c:out value="${map.INPAY}"/></b></font></a></td>
        <td><a href="/admin/payment/resultForm.do?cseqno=${map.CSEQNO}&mtPmTypeCode=${map.MT_PM_TYPE_CODE}&targetYn=Y&mtPmStatusCode=${map.MT_PM_STATUS_CANCELINPAY_CODE}&mtCtypeCode=${map.MT_CTYPE_CODE}&useYn=Y"><font size="3"><b><c:out value="${map.CANCELINPAY}"/></b></font></a></td>
    </tr>
   </c:forEach>
</table>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	