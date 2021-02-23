<%
    /****************************************************
    안쓰는것같음
     system	: 결제관리
     title	: 입금대상자관리
     summary:
     wdate	: 2016-05-12
     writer	: 이진영
  *****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<%

    // 결제상태(환불취소 승인)
    String pmStatusCancelInpaycode = SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_CANCELINPAY");
    String pmStatusInpayCode = SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_INPAY");

    //현금영수증, 계산서
    String billPrintPerson = SangsProperties.getProperty("Globals.mtCode_MT_PM_BILL_PERSON"); //영수증
    String billPrintCompany = SangsProperties.getProperty("Globals.mtCode_MT_PM_BILL_COMPANY"); //계산서

    //영수증 신청
    String noBillApply = SangsProperties.getProperty("Globals.mtCode_MT_PM_BILL_NOAPPLY");
    String billApply = SangsProperties.getProperty("Globals.mtCode_MT_PM_BILL_APPLY");

    //무료수강증빙, 해당사항 없음.
    String noPrice= SangsProperties.getProperty("Globals.mtCode_MT_PM_FREE_CODE_NOPRICE");
%>

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
    $("#paymentDate").datepicker(dateFormat);
    $("#allSelectPaymentDate").datepicker(dateFormat);

});

//다중달력
function setCalendarMulti(objId, idx){
    var objFiledId = '#'+objId+idx;
    $(objFiledId).datepicker(dateFormat).focus();
}


function statusCheck(idx, obj){

    var pmStatusCancelInpaycode = '<%=StringUtil.getContent(pmStatusCancelInpaycode)%>';
    //입금완료
    var pmStatusInpayCode = '<%=StringUtil.getContent(pmStatusInpayCode)%>';

    //환불시 금액 오픈
    if(obj.value == pmStatusCancelInpaycode){
        document.getElementById("reprc"+idx).style.display = "block";

    }else{
        document.getElementById("reprc"+idx).style.display = "none";
    }

}

//상태 업뎃 등록
function go_update(){
    var form =document.pform;
    var chk = $("input:checkbox[name=msg_user]:checked");
    var chklen = $("input:checkbox[name=msg_user]:checked").length;

    if(chklen < 1 ){
        alert("입금 대상자를 선택해주세요.");
        return ;
    }

    <%-- 고객사 요청으로 주석처리 입금일 없이도 입력되게.
    if(form.mtPmStatusCode.value == '<%=pmStatusInpayCode%>'){
        if(form.paymentDate.value == null || form.paymentDate.value == ''){
            alert("입금 날짜를 입력해주세요.");
            return false;
        }
    }--%>
    if(confirm("저장 하시겠습니까?")){
            //$("form[name=pform]").attr("action", "/admin/payment/result.do").submit();
            $("#pform").attr("action", "/admin/payment/resultExec.do");
            ///$("#pform").attr("method", "get");
            $("#pform").submit();
     }
    //form.subcmd.value = "exec";
    //form.submit();
}

//ID카드, 무료수강증, 강사모드 금액 0원 처리
function free_price(idx, obj){
    var form =document.pform;
    var nopay = obj;
    var noPrice = '<%=StringUtil.getContent(noPrice)%>';

    if(nopay != noPrice){
        document.getElementById("paymentPrc"+idx).value = 0;
        /* form.paymentPrc.value = 0; */
    } else {
        document.getElementById("paymentPrc"+idx).value = document.getElementById("paymentPrcOld"+idx).value;
    }
}


//결제 일괄처리
function pmStatusAllSelect(){
    var selectVal = $('#allSelectPmStatusCode').val();

     if(selectVal== ''){
        alert("결제처리 상태를 선택해주세요");
        return false;
    }else{
          if(confirm( "결제상태를 일괄 [" +  $('#allSelectPmStatusCode option:selected').text()  + "] 하시겠습니까?")){
              $('select[name=mtPmStatusCode]').val(selectVal);
          }
    }

}
//입금일 일괄처리
function paymentDateAllSelect() {
    var selectVal = $('#allSelectPaymentDate').val();
    $('input[name=paymentDate]').val(selectVal);
}

function bill_check(idx) {

    //개인영수증(현금)
    var billApply = '<%=StringUtil.getContent(billApply)%>';
    //입금완료
    var pmStatusInpayCode = '<%=StringUtil.getContent(pmStatusInpayCode)%>';

    var statusCode = $('#mtPmStatusCode' +idx).val();
    var billCode = $('#mtPmBillCode' +idx).val();

    if(statusCode == pmStatusInpayCode && billCode == billApply) {
        $("#billUid"+idx).show();
    } else {
        $("#billUid"+idx).hide();
    }

}


function user_info(payUid, pmno){
    var paymentUid = payUid;
    var pmNo = pmno;
    window.open("/admin/payment/resultView.do?paymentUid="+paymentUid + "&cseqno=" + pmNo,"resultView", "width=600, height=530", "scrollbars=no");

}

function list_page(){
    $("#pform").attr("action", "/admin/payment/resultForm.do");
    $("#pform").submit();
}

function enterChk(){
    if (event.keyCode==13) list_page();
}

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">입금대상자관리<span> </span></div>

<form name="pform" id="pform" action="/admin/payment/resultForm.do" method="post">
<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
<input type="hidden" name="mtPmTypeCode" id="mtPmTypeCode" value="<c:out value="${REQUEST_DATA.mtPmTypeCode}"/>"/>
<input type="hidden" name="targetYn" id="targetYn" value="<c:out value="${REQUEST_DATA.targetYn}"/>"/>
<input type="hidden" name="mtCtypeCode" id="mtCtypeCode"value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
<input type="hidden" name="useYn" id="useYn" value="<c:out value="${REQUEST_DATA.useYn}"/>"/>

    <table class="table-type1 search_form">
          <colgroup>
                <col class="cellc" width="15%">
                <col class="celll" width="35%">
                <col class="cellc" width="15%">
                <col class="celll" width="35%">
        </colgroup>

        <tbody>
            <tr>
                <th>과정명</th>
                <td><c:out value="${payInfo.SEQ_TITLE}"/></td>
                <th>학습기간</th>
                <td><c:out value="${payInfo.STUDY_SDATE}"/> ~ <c:out value="${payInfo.STUDY_EDATE}"/></td>
            </tr>
            <tr>
            <th>결제상태</th>
            <td>
            <select name="searchPmStatusCode" id="searchPmStatusCode" title="결제상태검색옵션" style="width: 100px;">
                <option <c:if test="${REQUEST_DATA.searchPmStatusCode eq ''}"> selected="selected"</c:if> value="">전체</option>
                <option <c:if test="${REQUEST_DATA.searchPmStatusCode eq 'SE2002'}"> selected="selected"</c:if> value="SE2002">입금</option>
                <option <c:if test="${REQUEST_DATA.searchPmStatusCode eq 'SE2001'}"> selected="selected"</c:if> value="SE2001">미입금</option>
            </select>
            </td>

            <th>검색</th>
            <td>
            <select name="searchMode" title="검색옵션" style="width: 100px;">
                <option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}"> selected="selected"</c:if> value="userId">아이디</option>
                <option <c:if test="${REQUEST_DATA.searchMode eq 'userNm'}"> selected="selected"</c:if> value="userNm">이름</option>
            </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();"/>
            </td>
      </tr>
        </tbody>
    </table>

    <div class="button_top">
        <a href="#" onclick="list_page();" class="btn search brown">검색</a>
    </div>


<div class="space"></div>
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
    <c:if test="${REQUEST_DATA.useYn != 'A'}"><!-- requestMap.containsKey("mtPmStatusCode") -->
        <td>
            <input type="text" class="line" name="allSelectPaymentDate" id="allSelectPaymentDate" value="" style="width: 70px;" readonly="readonly"/>
                 <a href="#" onclick="$('#allSelectPaymentDate').focus();" class=""> <img src="/admin/images/btn_calendar.png" alt="입금일"> </a>
             <a href="#" onclick="paymentDateAllSelect();" class="btn sky small">입금일일괄처리</a>
             <select name="allSelectPmStatusCode" id="allSelectPmStatusCode" title="결제처리상태">
                     <option value="">- 선택 - </option>
                     <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.allSelectPmStatusCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
                     <%-- <%
                    for(int j=0; j<statusList.size(); j++){
                        EduMap jmap = (EduMap)statusList.get(j);
                    %>
                        <%if(jmap.getString("MT_SUB_CODE").equals(SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_INPAY"))){} %>
                        <option value="<%=StringUtil.getContent(jmap.getString("MT_SUB_CODE"))%>" <%if(jmap.getString("MT_SUB_CODE").equals(SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_INPAY"))){ %>selected="selected"<%} %> ><%=StringUtil.getContent(jmap.getString("MT_SUB_NAME"))%></option>
                    <%
                    }
                    %> --%>
            </select>
            <a href="#" onclick="pmStatusAllSelect();" class="btn sky small">결제일괄처리</a>
        </td>
   </c:if>
        <td align="right">
            <a href="#" onclick="mailFormGroup(document.pform);" class="btn sky">메일발송</a>
            <a href="#" onclick="smsFormGroup(document.pform);" class="btn sky">SMS발송</a>
        </td>
    </tr>
  </tbody>
  </table>

<table class="tb table-type1">
        <tr class="rndbg">
            <th>NO</th>
            <th>소속</th>
             <th>성명<br/>(아이디)</th>
             <th>연락처</th>
             <th>신청일자</th>
             <th>금액/결제방법/입금일</th>

             <th>영수증/결제처리/무료수강</th>

             <th>비고</th>

             <th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall" onclick="payIscheck();" /></th>
         </tr>
         <colgroup>
            <col align=middle width="5%"><!-- NO -->
            <col align=middle width="15%"><!-- 소속 -->
            <col align=middle width="10%"><!-- 성명 -->
            <col align=middle width="10%"><!-- 연락처 -->
            <col align=middle width="10%"><!-- 신청일자 -->
            <col align=middle width="20%"><!-- 금액/결제방법/입금일 -->
            <col align=middle width="20%"><!-- 영수증/결제처리/무료수강 -->
            <col align=middle width="10%"><!-- 비고 -->
        </colgroup>
        <c:forEach var="result" items="${resultList}" varStatus="stats">
        <%-- <%
        if(payInputList.size() > 0 ){
        String reprcStyle = "";
        String billUid = "";

        for(int i = 0; i < payInputList.size(); i++){
            EduMap map = (EduMap)payInputList.get(i);
            String PAYMENT_PRC=NumberFormatUtil.toString(result.getInt("PAYMENT_PRC"));
            String mtPmStatusCode = result.getString("MT_PM_STATUS_CODE");
            if(pmStatusCancelInpaycode != null) {
                if (pmStatusCancelInpaycode.equals(mtPmStatusCode)) {
                    reprcStyle = "block";
                } else {
                    reprcStyle = "none";
                }
            }
        %> --%>
        <c:set var="mtPmStatusCode">${result.MT_PM_STATUS_CODE}</c:set>
        <c:set var="reprcStyle"></c:set>
        <c:if test="${pmStatusCancelInpaycode eq mtPmStatusCode}">
        	<c:set var="reprcStyle" value="block"/>
        </c:if>
        <c:if test="${pmStatusCancelInpaycode ne mtPmStatusCode}">
        	<c:set var="reprcStyle" value="none"/>
        </c:if>
        
         <input type="hidden" name="paymentUid" 			id="paymentUid" 	value="<c:out value="${result.PAYMENT_UID}"/>"/>
         <input type="hidden" name="userno" 				id="userno" 		value="<c:out value="${result.USERNO}"/>"/>
         <input type="hidden" name="mtPmTypeCode" 		id="mtPmTypeCode" 		value="<c:out value="${result.MT_PM_TYPE_CODE}"/>"/>
         <input type="hidden" name="pmno" 				id="pmno" 				value="<c:out value="${result.PMNO}"/>"/>
         <input type="hidden" name="pgsysOid" 			id="pgsysOid" 			value="<c:out value="${result.PGSYS_OID}"/>"/>
         <input type="hidden" name="payAccno" 			id="payAccno" 			value="<c:out value="${result.PAY_ACCNO}"/>"/>
         <input type="hidden" name="pmUsrCd" 			id="pmUsrCd" 			value="<c:out value="${result.PMUSRCD}"/>"/>

          <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
            <td><c:out value="${result.NUM}"/></td>
             <td><c:out value="${result.COMNAME}"/></td>
             <td>
             <a href="#" onclick="user_info('<c:out value="${result.PAYMENT_UID}"/>', '<c:out value="${result.PMNO}"/>');"><c:out value="${result.USERNAME}"/><br/>(<c:out value="${result.USERID}"/>)</a></td>
             <td><c:out value="${result.MOBILE}"/></td>
             <td><c:out value="${result.WDATE}"/></td>
             <td align="left" valign="top">
                 <div style="line-height:30px">
                     <font color="#8c8c8c">결제방법 : 통장입금</font>
                 </div>
                 <div style="line-height:30px">
                     <font color="#8c8c8c">결제금액 : </font><input class="line" type="text" id="paymentPrc${stats.index}" name="paymentPrc" value="<c:out value="${result.PAYMENT_PRC}"/>" style="width:70px; text-align: right;"/>
                     <%-- <input type="hidden" id="paymentPrcOld${stats.index}" name="paymentPrcOld${stats.index}" value="<%=StringUtil.getContent(PAYMENT_PRC)%>"/> --%>
                 </div>
                 <div style="line-height:30px">
                     <font color="#8c8c8c">입금일자 :</font>
                     <input type="text" class="line" name="paymentDate" id="paymentDate${stats.index}" value="<c:out value="${result.PAYMENT_DATE}"/>" style="width:70px;" readonly="readonly"/>
                     <a href="#"  onclick="setCalendarMulti('paymentDate', ${stats.index}); return false;" class=""> <img src="/admin/images/btn_calendar.png" alt="입금일"> </a>
                 </div>
             </td>


             <td align="left">
                 <div style="line-height:30px">
                     <font color="#8c8c8c">영수증출력 : </font>
                     <select name="mtPmBillCode" id="mtPmBillCode${stats.index}" title="영수증선택" onchange="bill_check('${stats.index}');">
                     	 <c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${result.MT_PM_BILL_CODE == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
                    <%--  <%
                            for(int j=0; j<BillList.size(); j++){
                                EduMap jmap = (EduMap)BillList.get(j);
                            %>
                                <option value="<%=StringUtil.getContent(jresult.getString("MT_SUB_CODE"))%>" <%if(jresult.getString("MT_SUB_CODE").equals(result.getString("MT_PM_BILL_CODE"))) out.print("selected"); %>><%=StringUtil.getContent(jresult.getString("MT_SUB_NAME"))%></option>
                            <%
                            }
                            %> --%>
                    </select>
                    <div id="billUid${stats.index}" <c:if test="${result.MT_PM_BILL_CODE eq noBillApply}"> style="display:none" </c:if>>
                        <input type="hidden" name="pmUid" value="<c:out value="${result.PMUID}"/>"/>
                        <font color="#8c8c8c">&nbsp;&nbsp;- 영수증번호 : <c:out value="${payInfo.BILL_NO}"/></font><br/>
                        <font color="#8c8c8c">&nbsp;&nbsp;- 발급일자 : </font><input type="text" id="pmDate" name="pmDate" value="<c:out value="${result.PMDATE}"/>" style="width:120px;" class="line" maxlength="8"/>
                    </div>

                </div>

                <div style="line-height:30px">
                    <font color="#8c8c8c">결제상태처리 : </font>
                      <select name="mtPmStatusCode" id="mtPmStatusCode${stats.index}" title="결제처리상태" onchange="statusCheck('${stats.index}', this); bill_check('${stats.index}');" >
                      	<c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${result.MT_PM_STATUS_CODE == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
						
                            <%--  <%
                            for(int j=0; j<statusList.size(); j++){
                                EduMap jmap = (EduMap)statusList.get(j);
                            %>
                                <option value="<%=StringUtil.getContent(jresult.getString("MT_SUB_CODE"))%>" <%if(jresult.getString("MT_SUB_CODE").equals(result.getString("MT_PM_STATUS_CODE"))) out.print("selected"); %>><%=StringUtil.getContent(jresult.getString("MT_SUB_NAME"))%></option>
                            <%
                            }
                             String CANCEL_PRC=NumberFormatUtil.toString(result.getInt("CANCEL_PRC"));
                            %> --%>
                    </select>
                    <div id="reprc${stats.index}" style="display:${reprcStyle}">&nbsp;&nbsp;환불액 : <input type="text" id="cancelPrc" name="cancelPrc" value="${result.CANCEL_PRC}" style="width: 75px; text-align: right;"></div>
                </div>
                <script type="text/javascript">
                 <%-- document.pform.mtPmStatusCode.value = "<%=StringUtil.getContent(result.getString("MT_PM_STATUS_CODE"))%>"; --%>
                 <%-- document.pform.mtPmBillCode.value = "<%=result.getString("MT_PM_BILL_CODE")%>"; --%>
                 <%-- bill_check(${stats.index}); --%>
                </script>
             </td>
            <td> <textarea name="etc" id="etc" style="width:120px; height:80px;">${result.ETC}</textarea></td>

            <td>
                 <input type="checkbox" name="msg_user" id="msg_user" value="${result.USERID}/${result.USERNAME}/${result.EMAIL}/${result.MOBILE}/${result.USERNO}/${stats.index}"/>
             </td>
         </tr>
     </c:forEach>
</table>
    <!--  %if(requestresult.containsKey("mtPmStatusCode")){ %-->
    <!-- <div style="text-align:center;margin-top:25px;">
        <input type="checkbox" value="Y" name = "sendYn" id = "sendYn" style="border:0;"/>
        <font style="color:red;">해당 수강생에게 결과 메시지를 발송</font>(체크시 수강생에게 결과 메시지/메일이 발송됩니다.)
    </div>	 -->
    <div class="button" >
        <a href="#" onclick="go_update(); return false;" class="btn blue big">등록</a>
        <a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
    </div>
    <!-- %} %-->
</form>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	
