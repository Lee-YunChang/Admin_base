<%
/****************************************************
    system	: 결제관리 > 계산서발급
    title	: 계산서발급
    summary	:
	wdate	: 2016-06-10
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

    //페이지 이동
    function move_page(cPage){
        var frm = document.pform;
        frm.target = "";
        $("input[name=listType]").val('LIST');
		$("form[name=pform]").attr("method", "post").attr("action", "/admin/payment/billStats.do");
        frm.cPage.value = cPage;
        frm.submit();
    }

    // 검색
    function list_page(){
        var frm = document.pform;
        frm.target = "";
        frm.cPage.value = "1";
        $("input[name=listType]").val('LIST');
        $("form[name=pform]").attr("method", "post").attr("action", "/admin/payment/billStats.do");
        frm.submit();
    }

    //엑셀다운
    function goExcel(){
        var frm = document.pform;
        frm.target = "";
        $("input[name=listType]").val('EXCEL');
        $("form[name=pform]").attr("method", "post").attr("action", "/admin/payment/billStats.do");
        frm.submit();
    }


    //일반영수증
    function fnReceiptPop(paymentUid, mtPmTypeCode, userNo){
        var w1 =1070;
        var h1 = 900;

        $("form[name=pform]").attr("method", "post").attr("action", "/admin/payment/billPrint.do");
        //$("#pform > input[name='subcmd']").val("bill_print");
        $("#pform > input[name='paymentUid']").val(paymentUid);
        $("#pform > input[name='mtPmTypeCode']").val(mtPmTypeCode);

        window.open("/admin/payment/billPrint.do?"
                +$("#pform").serialize()
                , "bill_pop","width="+w1+" height="+h1+", top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no");
    }

</SCRIPT>


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">영수증발급현황<span> </span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/payment/billStats.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
    <input type="hidden" name="paymentUid"		id="paymentUid"	value="" />
    <input type="hidden" name="mtPmTypeCode"	id="mtPmTypeCode" value="" />
    <input type="hidden" name="listType"	id="listType" value="" />

    <table class="table-type1 search_form">
        <colgroup>
            <col class="cellc" width="15%">
            <col class="celll" width="35%">
            <col class="cellc" width="15%">
            <col class="celll" width="35%">
        </colgroup>
            <tbody>
                <tr>
                    <th>연도</th>
                    <td>
                        <select id="selectYear" name="selectYear">
                            <option value="">선택</option>
                            <c:forEach begin="2012" end="2020" step="1" var="y">
		                     <option value="<c:out value="${y}"/>" <c:if test="${REQUEST_DATA.selectYear == y}"> selected="selected"</c:if>><c:out value="${y}"/></option>
		                    </c:forEach>
                         </select> 년
                    </td>
                    <th>월</th>
                    <td >
                        <select name="selectMonth" id="selectMonth">
                            <option value="">선택</option>
                            <c:forEach begin="1" end="12" step="1" var="m">
		                     <option value="<c:out value="${m}"/>" <c:if test="${REQUEST_DATA.selectMonth == m}"> selected="selected"</c:if>><c:out value="${m}"/></option>
		                    </c:forEach>
                        </select> 월
                     </td>
                </tr>

            </tbody>
    </table>
    <div class="button_top">
        <a class="btn search brown" onclick="list_page();" href="#">검색</a>
    </div>
</form>

 <!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
 <!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red">${fn:length(resultList)}</span> 건</td>
        <td align="right"><a class="btn down small sky" onclick="goExcel();return false;" href="#">엑셀다운로드</a></td>
    </tr>
  </tbody>
  </table>
<!-- 본문 > 메인 > 서브   영역 끝 -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>No</th>
        <th>이름</th>
        <th>아이디</th>
        <th>과정명</th>
        <th>교육기간</th>
        <th>금액</th>
        <th>영수증</th>
    </tr>
    <colgroup>
        <col align=middle width="10%">
        <col align=middle width="12%">
        <col align=middle width="12%">
        <col align=middle width="*">
        <col align=middle width="15%">
        <col align=middle width="12%">
        <col align=middle width="12%">
    </colgroup>
    <c:forEach var="result" items="${resultList}" varStatus="status">
        <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
            <td><c:out value='${fn:length(resultList) - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
            <td>${result.USERNAME}</td>
            <td>${result.UNITY_ID}</td>
            <td>${result.SEQ_TITLE}</td>
            <td>${result.UDATE}</td>
            <td align="right"><fmt:formatNumber value="${result.PAYMENT_PRC}" groupingUsed="true" /></td>
            <td>
                <c:set var="MT_PM_STATUS_CODE_INPAY" value='<%=SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_INPAY") %>' />
                <c:choose>
                    <c:when test="${result.MT_PM_STATUS_CODE eq MT_PM_STATUS_CODE_INPAY && (result.MT_PM_BILL_CODE < 'DHAB00') && result.PAYMENT_PRC > 0}"> <!-- result.MT_PM_PAY_CODE eq 'SGBANK' -->
                        <a href="#none" onclick="fnReceiptPop('<c:out value="${result.PAYMENT_UID}"/>', '<c:out value="${result.MT_PM_TYPE_CODE}"/>', '<c:out value="${result.UNITY_MBERNO}"/>'); return false;" class="btn brown small">출력</a>
                    </c:when>
                    <c:when test="${result.MT_PM_STATUS_CODE eq MT_PM_STATUS_CODE_INPAY && (result.MT_PM_BILL_CODE eq 'DH0002') && result.PAYMENT_PRC > 0}">
                        신청안함
                    </c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
     <!--%
            }
        }
    %-->
</table>
<c:if test="${not empty resultList}">
     <div class="admin-paging paging_wrap">
         <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
     </div>
 </c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	