<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 이름표출력 목록
	title	: 이름표 출력 목록
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

// 페이징
function move_page(cPage){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = cPage;
	$("#pform").attr("action", "/admin/study/labelCseqList.do");
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = "1";
	$("#pform").attr("action", "/admin/study/labelCseqList.do");
	frm.submit(); 
}

//인쇄
function goPrint(cno, seq){
	var cseqno=cno;
  	window.open("/admin/study/labelPrint.do?cseqno="+cseqno+"&seq="+seq, "printInfo","scrollbars=yes, width=730,height=750");
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

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">이름표출력<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/study/labelCseqList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTALCOUNT}"/>"/>  
	
	<table class="table-type1 search_form">
	  <colgroup>
		<col class="cellc" width="15%">
		<col class="celll" width="35%">
		<col class="cellc" width="15%" >
		<col class="celll" width="35%">
	  </colgroup>
		<tbody>
	  	<tr>
			<th>과정분류</th>
			<td>
				 <select name="mtCgrpCode" id="mtCgrpCode" title="과정분류">
					<option value="">전체</option>
					<c:forEach var="emap" items="${categoryData1}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCgrpCode == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
 			<th>강의형태</th>
			<td>
				 <select name="mtCtypeCode" id="mtCtypeCode" title="강의형태">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData2}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
		</tr> 
		<tr>
 			<th>개설상태</th>
			<td colspan="3">
				 <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="개설상태">
                    <option value="" >전체</option>
                    <c:forEach var="emap4" items="${categoryData4}" varStatus="status2">
						<option value="<c:out value="${emap4.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCseqStatusCode == emap4.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap4.MT_SUB_NAME}"/></option>
					</c:forEach>
                 </select>
 			</td>
		</tr> 
		<tr>
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
 
<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
	<tbody>
		<tr>
			<td class="pageinfo">조회건수 <span class="red"><c:out value="${resultList[0].TOTALCOUNT}"/></span> 건</font></td>
			<td align="right">
 			</td>
		</tr>
	</tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<table class="tb table-type1">
	<tr class="rndbg">
		<th>개설코드</th>
		<th>개설상태</th>
		<th>과정명</th>
		<th>기간</th>
		<th>차수</th>
		<th>수강생</th>
		<th>출력</th>
	</tr>
	<colgroup>
		<col align=middle width="8%">
		<col align=middle width="10%">
		<col align=middle width="30%">
		<col align=middle width="15%">
		<col align=middle width="5%">
		<col align=middle width="5%">
		<col align=middle width="5%">	
	</colgroup>	
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		<td><c:out value="${result.CSEQNO}"/></td>
		<td><c:out value="${result.MT_CSEQ_STATUS_NAME}"/></td>
		<td align="left"><font color="blue"><c:out value="${result.SITE_NAME}"/></font>&nbsp;<c:out value="${result.SEQ_TITLE}"/></td>
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
 		<td><c:out value="${result.SEQ}"/></td>
 		<td><c:out value="${result.USER_CNT}"/></td>
		<td><a href="#" onclick="goPrint('<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.SEQ}"/>');" class="btn small sky">출력</a></td>
	</tr> 
	</c:forEach>
</table>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if> 
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>