<%
/****************************************************
	system	: 특강강사 검색
	title	: 특강강사 검색
	summary	: 
	wdate	: 2016-09-01
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	
	var mtTutorCode = $('#mtTutorCode').val();
	
	if(mtTutorCode == 'JGAA00') {
		$('#distanceTd').css('color', '#cccccc');
		$('input[name="distance"]').attr('disabled', true);
		$('#payment').attr('disabled', true);
		$('#calExecBtn').hide();	
	}
	
	// 강사분류 체크박스
	if($("#tutorArr").val() == '') {
		$("input[name=mtTutorCode]").eq(0).attr('checked','checked');
		$("input[name=mtTutorCode]").attr('checked','checked');
	}
	else {
		$("input[name=mtTutorCode]").eq(0).attr('checked',false);
		var tutorArr = $("#tutorArr").val().split(',');
		for (var nArrCnt in tutorArr) {

	         $("input[name=mtTutorCode][value="+tutorArr[nArrCnt]+"]").prop("checked",true);

		} 
		 
	}
    $("#isall").click(function() {
        // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
        if($(this).is(':checked')) {
            $("input[name=mtTutorCode]").attr('checked','checked');
        } else {
              $("input[name=mtTutorCode]").prop("checked", false);
        }
    });
    
    calcuExec();
    
   
});

function move_page(cPage){
	var frm = document.pform;
	frm.cPage.value = cPage;
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	
	
    var fieldArr = new Array;
	$('input:checkbox[name=mtFieldCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			fieldArr.push($(this).val());
		}
	});	 
	var tutorArr = new Array;
	$('input:checkbox[name=mtTutorCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			tutorArr.push($(this).val());
		}
	});	
	$("#fieldArr").val(fieldArr.join(','));
	$("#tutorArr").val(tutorArr.join(','));
	
	frm.target = '';
	frm.cPage.value = '1';
	frm.submit();
}

function chkEnter(){
	if (event.keyCode==13) list_page();
}

// 강사 선택 등록
function goExec() {
	var totalPay = $('#payment').val();
	
	if(confirm('강사료를 입력 하시겠습니까?')){	

		var data ={
				'lectotalPay' : $('#payment').val(),
				'lectutorPay' : $('#paymentLec').val()
		}
		window.opener.PayPopupCallBack(data);
		window.close();
	}
}

function calcuExec(){
	var distanceNo = $(':radio[name="distance"]:checked').val();
	var totalPay = 0;
	var lecPay = 80000;
	var addPay1 = lecPay*0.25;
	var addPay2 = lecPay*0.25;
	var addPay3 = lecPay*0.25;
	
	if(distanceNo == '1'){
		totalPay = totalPay + 10000;
	}else if(distanceNo == '2') {
		totalPay = totalPay + 30000;
	}else if(distanceNo == '3'){
		totalPay = totalPay + 60000;
	}else if(distanceNo == '4'){
		totalPay = totalPay + 90000;
	}
	
	if($('#weekendYn').val() == 'Y'){/*주말 강의 수당*/
		lecPay = lecPay + addPay1;
	}
	
	if(distanceNo > 1){/*급지 추가 수당*/
		lecPay = lecPay + addPay2;
	}
	
	if($('#workOverYn').val() == 'Y'){/*야간 강의 수당*/
		lecPay = lecPay + addPay3;
	}
	
	lecPay = lecPay + Number($('#etcPayment').val()) + Number($('#addPay').val());
	
	$('#payment').val(totalPay);
	$('#paymentLec').val(lecPay);
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강사풀</div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/lecture/lectureTutorSearch.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTAL_CNT}"/>"/>
<input type="hidden" name="fieldArr" id="fieldArr" value="${REQUEST_DATA.fieldArr}"/>
<input type="hidden" name="tutorArr" id="tutorArr" value="${REQUEST_DATA.tutorArr}"/>
<input type="hidden" name="index" id="index" value="${REQUEST_DATA.index}"/>
<input type="hidden" name="weekendYn" id="weekendYn" value="${REQUEST_DATA.WK_YN}"/>
<input type="hidden" name="workOverYn" id="workOverYn" value="${REQUEST_DATA.WO_YN}"/>
<input type="hidden" name="addPay" id="addPay" value="${REQUEST_DATA.addPay}"/>
<input type="hidden" name="atciveYn" id="atciveYn" value="popup"/>
<input type="hidden" id="mtTutorCode" value="<c:out value='${resultList[0].MT_TUTOR_CODE}'/>"/>
	<div class="space5"></div>	
	<table class="tb table-type1">
	    <tr>
	    	<th>출발지</th>
	    	<td>
    			<c:if test="${fn:length(resultList) eq 1}"> 
    				<c:out value="${REQUEST_DATA.stAddr}"/>
    			</c:if>
	    		<c:if test="${fn:length(resultList) ne 1}">
	    			<c:forEach var="result" items="${resultList}" end="${fn:length(resultList)}" varStatus="status">
						<c:if test="${REQUEST_DATA.slno eq result.SLNO}">
							<c:if test="${result.PRE_PLACE eq null}">
								<c:out value='${REQUEST_DATA.stAddr}'/>
							</c:if>
							<c:if test="${result.PRE_PLACE ne null}">
								<c:out value='${result.PRE_PLACE}'/>
							</c:if>								
						</c:if>	    				
	    			</c:forEach>
	    		</c:if>
		    </td>
	    	<th>교육지</th>
	    	<td><c:out value="${REQUEST_DATA.edAddr}"/></td>
	    </tr>
	    <tr>
	    	<th>일자</th>
	    	<td><c:out value="${REQUEST_DATA.dsDay}"/></td>
	    	<th>시간</th>
	    	<td><c:out value="${REQUEST_DATA.dsSdate}"/> ~ <c:out value="${REQUEST_DATA.dsEdate}"/></td>
	    </tr>
	    <tr>
	    	<th>야간유뮤</th>
	    	<td><c:out value="${REQUEST_DATA.WO_YN}"/>-(Y일시 25% 추가지급)</td>
	    	<th>주말유무</th>
	    	<td><c:out value="${REQUEST_DATA.WK_YN}"/>-(Y일시 25% 추가지급)</td>
	    </tr>
	    <tr>
            <th>초과수당</th>
            <td colspan="3"><c:out value="${REQUEST_DATA.addPay}"/></td>
        </tr>
	    <tr>
            <th>급지등급</th>
            <td colspan="3" id="distanceTd">
            	<input type="radio" name="distance" id="distance1" <c:if test="${REQUEST_DATA.grade == 1}" >checked="checked"</c:if> value="1">1급지 &nbsp;&nbsp;
            	<input type="radio" name="distance" id="distance2" <c:if test="${REQUEST_DATA.grade == 2}" >checked="checked"</c:if> value="2">2급지 &nbsp;&nbsp;
            	<!-- 2급지가 3급지 / 3급지가 4급지 -->
            	<input type="radio" name="distance" id="distance3" <c:if test="${REQUEST_DATA.grade == 3}" >checked="checked"</c:if> value="3">3급지 &nbsp;&nbsp; 
            	<input type="radio" name="distance" id="distance4" <c:if test="${REQUEST_DATA.grade == 4}" >checked="checked"</c:if> value="3">4급지 &nbsp;&nbsp;
            	(2,3급지의 경우 추가 25% 추가지급)
            </td>
        </tr>
        <tr>
            <th>출장비</th>
            <td colspan="3" id="paymentTd">
            	<input type="text" name="payment" id="payment" value="">
            </td>
        </tr>
        <tr>
            <th>강사료</th>
            <td colspan="3">
            	<input type="text" name="paymentLec" id="paymentLec" value="">
            	<a href="#" onclick="calcuExec();" id="calExecBtn" class= "btn small orange">계산</a>
            </td>
        </tr>
        <tr>
            <th>기타추가금액</th>
            <td colspan="3">
            	<input type="text" name="etcPayment" id="etcPayment" value="">
            </td>
        </tr>
    </table>
    <div class="title">수강정보<span></span></div>
    <table class="tb table-type1">    
    	<colgroup>
    		<!-- <col class="celll" width="12%">
    		<col class="celll" width="12%"> -->
	        <col class="cellc" width="5%">
	        <col class="celll" width="15%">
	        <col class="cellc" width="5%">
	        <col class="celll" width="8%">
	        <col class="celll" width="5%">
	        <col class="celll" width="*%">
	    </colgroup>
        <tr>
        	<!-- <th>출발지</th>
        	<th>도착지</th> -->
            <th>기관</th>
            <th>지역</th>
            <th>상태</th>
            <th>시간</th>
            <th>강의료</th>
            <th>교통비</th>
        </tr>
        <c:forEach  var="result" items="${resultList}">
        	<c:if test="${REQUEST_DATA.slno ne result.SLNO}">
	        	<tr>	
	        		<%-- <td> 
	            		<c:out value="${result.dtaddr}"/>
	            	</td>
	        		<td>
	            		<c:out value="${result.dtaddr}"/>
	            	</td> --%>
	            	<td>
	            		<c:out value="${result.APPLY_ORGAN_NM}"/>
	            	</td>
	            	<td>
	            		<c:out value="${result.LE_LNM_ADRES1}"/>
	            	</td>
	            	<td>
	            		<c:out value="${result.MT_STATUS_NAME}"/>
	            	</td>
	            	<td>
	            		<c:out value="${fn:substring(result.DS_SDATE,10,16)}"/>~<c:out value="${fn:substring(result.DS_EDATE,10,16)}"/>
	            	</td>
	            	<td>
	            		<input type="text" value="<c:out value="${result.PAY}"/>"/>
	            		
	            	</td>
	            	<td>
	            		<input type="text" value="<c:out value="${result.PTRPS}"/>"/>
	            	</td>
	        	</tr>
	        	</c:if>
        </c:forEach>
	</table>
</form>
<br/>
<div class="space"></div>
<table style="width:100%;text-align:center">
	<tr>
		<td align="center">
		<a href="#" onclick="goExec()" class= "btn big orange">등록</a>
		<a href="#" onclick="window.close();" class= "btn big gray">취소</a>
		</td>
	</tr>
</table>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	