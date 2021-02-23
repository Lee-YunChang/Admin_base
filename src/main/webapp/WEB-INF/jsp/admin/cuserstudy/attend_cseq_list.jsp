<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 출석부 목록
	title	: 출석부 출력 목록
	summary	:	
	wdate	: 2016-05-10
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript"> 
//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
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
	$("#pform").attr("action", "/admin/study/attendCseqList.do");
	frm.cPage.value = cPage;
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	frm.cPage.value = "1";
	$("#pform").attr("action", "/admin/study/attendCseqList.do");
	frm.submit(); 
}

// 출석부 출력
function goAttendDown(){
	var chk = $("input:radio[name=cseqno]:checked");
	var chklen = $("input:radio[name=cseqno]:checked").length;
	
  	if(chklen < 1 ){
		alert('최소 한개 이상 선택 해 주세요.');
		return ;
	} 
 	
	var cseqno= chk.val();
	var chkMtCtypeCode=chk.siblings('.chkMtCtypeCode').val();
	var gubun=chk.siblings('.gubun').val();
	var seq = $("#seq_"+cseqno).val();
	var frm = document.pform;
	
	frm.cseqno.value = cseqno;
	frm.seq.value = seq;
	frm.chkMtCtypeCode.value = chkMtCtypeCode;
	frm.gubun.value = gubun;
// 	$("#pform").attr("action", "/admin/study/attendExcel02.do");
	$("#pform").attr("action", "/admin/study/excelList.do");
	frm.submit(); 
}

function openDateSelect(value){
	if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>'){
        $("#dateSelect").show();

    } else if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>' || value == '') {
    	$("#dateSelect").hide();
    }
}

function enterChk(){
	if (event.keyCode==13) list_page();
}
 
//이름표 인쇄
function goPrint(){
	var chk = $("input:radio[name=cseqno]:checked");
	var chklen = $("input:radio[name=cseqno]:checked").length;
	
 	if(chklen < 1 ){
		alert('최소 한개 이상 선택 해 주세요.');
		return ;
	} 
 	
	var cseqno= chk.val();
	var seq = $("#seq_"+cseqno).val();//seq
  	window.open("/admin/study/labelPrint.do?cseqno="+cseqno+"&seq="+seq, "printInfo","scrollbars=yes, width=730,height=750");
}


//메일발송 - 일괄
//2016.03.28 수정
function mailFormGroup(){
	var chk = $("input:radio[name=cseqno]:checked");
	var chklen = $("input:radio[name=cseqno]:checked").length;
	
 	if(chklen < 1 ){
		alert('최소 한개 이상 선택 해 주세요.');
		return ;
	} 
	
	var form = document.aform;
	
	if( chk.val()==null || chk.val()=='' ){
		form.cseqno.value='';
	} else {
		form.cseqno.value=chk.val();
		form.chkMtCtypeCode.value=chk.siblings('.chkMtCtypeCode').val();
	}
	
	var specs = "left=10,top=10,width=980,height=800";
	specs += ",menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
	
	var mailpop = window.open("","mailform",specs); 
	
	
	
	form.method = "post";
	form.action = "/admin/common/mailForm2.do";
	form.target = "mailform"; 
	form.submit();
	mailpop.focus();
}

//SMS발송 - 일괄
//2016.03.28 수정
function smsFormGroup(){
	var chk = $("input:radio[name=cseqno]:checked");
	var chklen = $("input:radio[name=cseqno]:checked").length;
	
 	if(chklen < 1 ){
		alert('최소 한개 이상 선택 해 주세요.');
		return ;
	} 
	
	var form = document.aform;
	
	var chk = $("input:radio[name=cseqno]:checked");
	if( chk.val()==null || chk.val()=='' ){
		form.cseqno.value='';
	} else {
		form.cseqno.value=chk.val();
	}
	
	var smspop = window.open("","smsform","width=520,height=650"); 

	form.method = "post";
	form.action = "/admin/common/smsForm2.do";
	form.target = "smsform"; 
	form.submit();
	smspop.focus();
}

//설문 SMS발송 - 일괄
function smsFormGroup2() {
	var chk = $("input:radio[name=cseqno]:checked");
	
	
	var chklen = $("input:radio[name=cseqno]:checked").length;
	
 	if(chklen < 1 ){
		alert('최소 한개 이상 선택 해 주세요.');
		return ;
	} 
	
	var form = document.aform;
	
	if( chk.val()==null || chk.val()=='' ){
		form.cseqno.value='';
		form.paramCourseNo.value='';
	} else {
		form.cseqno.value=chk.val();
		form.paramCourseNo.value=chk.next().val(); 
	}
	
	var smspop = window.open("","smsform","width=520,height=650"); 

	form.method = "post";
	form.action = "/admin/common/smsForm3.do";
	form.target = "smsform"; 
	form.submit();
	smspop.focus();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">진행 관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/study/attendCseqList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>  
<input type="hidden" name="cseqno"id="cseqno" value=""/>
<input type="hidden" id="paramCourseNo" value=""/>
<input type="hidden" id="seq" value=""/>	
<input type="hidden" id="chkMtCtypeCode" name="chkMtCtypeCode" value=""/>
<input type="hidden" id="gubun" name="gubun" value=""/>
	<table class="table-type1 search_form">
	  <colgroup>
			<col class="cellc" width="8%">
            <col class="celll" width="42%">
            <col class="cellc" width="8%">
            <col class="celll" width="42%">
		</colgroup>
		<tbody>
	  	<tr>
 			<th>과정형태</th>
			<td colspan="3">
				 <select name="mtCtypeCode" id="mtCtypeCode" title="강의형태">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData2}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
		</tr> 
		<tr>
			<th>과정상태</th>
			<td>
				 <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="개설상태">
                    <option value="" >전체</option>
                    <c:forEach var="emap4" items="${categoryData4}" varStatus="status2">
						<option value="<c:out value="${emap4.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCseqStatusCode == emap4.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap4.MT_SUB_NAME}"/></option>
					</c:forEach>
                 </select>
 			</td>
			<th>기간</th>
			<td colspan="3">
				<input type="radio" id="openType" name="openType" value=""  onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq '' || REQUEST_DATA.openType eq null}"> checked="checked"</c:if>/> 전체&nbsp;
                <input type="radio" id="openType" name="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>" onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq 'A'}"> checked="checked"</c:if>/> 상시운영&nbsp;
                <input type="radio" id="openType" name="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>" onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq 'D'}"> checked="checked"</c:if>/> 기간운영&nbsp;

                <span id="dateSelect" <c:if test="${REQUEST_DATA.openType ne 'D'}">style="display: none;"</c:if>>
                <input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
                     <a href="#" onclick="$('#sdate').focus(); return false;" class="">
                         <img src="/admin/images/btn_calendar.png" alt="시작일">
                     </a>
                ~
                <input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
                    <a href="#" onclick="$('#edate').focus(); return false;" class="">
                        <img src="/admin/images/btn_calendar.png" alt="종료일">
                    </a>
			</td>
		</tr> 
		<tr>		 
			<th>과정명</th>
			<td colspan="3">
                  <input type="text" class="line" id="seqTitle" name="seqTitle" style="width:350px" title="과정명" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" onkeypress="enterChk();"/>
            </td>
		</tr>   
		</tbody>
	</table>
	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>

</form> 
<!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
 <!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
	<tbody>
		<tr>
			<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</font></td>
			<td align="right">
				<a href="#" onclick="goPrint();" class="btn small sky">이름표 출력</a>
				<a href="#" onclick="goAttendDown();" class="btn small sky">출석표 출력</a>
				<a href="#" onclick="mailFormGroup();" class="btn small sky">메일 발송</a>
				<a href="#" onclick="smsFormGroup();" class="btn small sky">SMS 발송</a>
				<a href="#" onclick="smsFormGroup2();" class="btn small sky">설문 SMS 발송</a>
			</td> 
		</tr>
	</tbody>
</table>

<!-- 본문 > 메인 > 서브   영역 끝 -->
<form id="aform" name="aform"  action="" method="post">
<input type="hidden" id="chkMtCtypeCode" name="chkMtCtypeCode" value=""/>
<table class="tb table-type1">
	<tr class="rndbg">
 		<th>선택</th>
		<th>NO</th>
		<th>과정상태</th>
		<th>과정형태</th>
		<th>과정명</th>
		<th>교육기간</th>
		<th>수강인원</th>  
	</tr>
	
	<colgroup>
		<col align=middle width="4%">
        <col align=middle width="4%">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="*">
        <col align=middle width="17%">
        <col align=middle width="5%">
	</colgroup>	
	<c:forEach var="result" items="${resultList}" varStatus="status">
	 
	<input type="hidden" id="seq_${result.CSEQNO}" value="${result.SEQ}"/>
	<input type="hidden" id="studytime_${result.CSEQNO}" value="${result.STUDYTIME}"/>
	
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
			<td><input type="radio" class="attendRadio" name="cseqno"  value="${result.CSEQNO}">
			<input type="hidden" name="paramCourseNo"  id="paramCourseNo" value="${result.COURSENO }"/>
			<input type="hidden" class="chkMtCtypeCode" value="${result.MT_CTYPE_CODE }"/>
			<input type="hidden" class="gubun" value="${result.GUBUN }"/>
			</td>
			<td><c:out value="${result.NUM}"/></td>
			<td><c:out value="${result.MT_CSEQ_STATUS_NAME}"/></td>
			<td><c:out value="${result.MT_CTYPE_NAME}"/></td>
			<td align="left"><font color="blue"><c:out value="${result.SITE_NAME}"/></font><c:out value="${result.SEQ_TITLE}"/></td>
			<td>	
				<c:choose> 
		        	<c:when test="${result.OPENTYPE eq 'A'}">
		                 	상시운영
		            </c:when>
		            <c:otherwise>
		                 <c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/>
		            </c:otherwise>
	            </c:choose>
	        </td>
			<td> 
				<c:set var="MT_CTYPE_CODE_ONLINE"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%></c:set>
				<c:set var="MT_CTYPE_CODE_OFFLINE"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%></c:set>
				<c:if test="${result.MT_CTYPE_CODE eq MT_CTYPE_CODE_ONLINE}"><c:out value="${result.ONLINE_STUDY_USER_CNT }"/></c:if>
				<c:if test="${result.MT_CTYPE_CODE eq MT_CTYPE_CODE_OFFLINE}"><c:out value="${result.OFFLINE_STUDY_USER_CNT }"/></c:if>
			</td>
		</tr>	 
	</c:forEach>
</table>
</form>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if> 
<!-- 본문 > 메인 > 목록 끝 -->

<script>
$(".attendRadio").click(function(){
		//체크했다면 자신을 제외한 다른 체크를 해제
		if($(this).attr('checked')) {
			$(".attendRadio").not(this).prop('checked', false);
		}
});
</script>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>

