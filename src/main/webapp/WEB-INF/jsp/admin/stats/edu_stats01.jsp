<%
/****************************************************
	system	: 통계관리
	title	: 교육실적 통계
	summary	:
	wdate	: 2016-05-26
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	// 달력
	$("#sdate").datepicker(dateFormat);
	$("#edate").datepicker(dateFormat);
});


//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("form[name='pform']").attr("action", "/admin/stats/eduStats01.do").submit();
    frm.submit();
}


//검색
function list_page(){
    var frm = document.pform;
    $("input[name='listType']").val('LIST');
    $("form[name='pform']").attr("action", "/admin/stats/eduStats01.do").submit();
    frm.submit();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">전체 교육 운영 현황</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/eduStats01.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>
	<!-- 검색영역 -->
	<table class="table-type1 search_form" >
	      <colgroup>
	          <col class="cellc" width="8%">
	          <col class="celll" width="92%">
	      </colgroup>
	         <tbody>
	          <tr>
	          	<th>기간검색</th>
				<td>
					<select name="searchDate" id="searchDate" title="년도">
						<c:set var="cnt" value="0"/>
					 	<c:forEach begin="1" end="20" step="1">
					 		<option value="${REQUEST_DATA.nowDate-cnt}" <c:if test="${REQUEST_DATA.searchDate eq REQUEST_DATA.nowDate-cnt}"> selected="selected" </c:if>>${REQUEST_DATA.nowDate-cnt}</option>
					 		<c:set var="cnt" value="${cnt+1}"/>
					 	</c:forEach> 
					 	
					 </select>
					<%-- <span id="dateSelect">
					<input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
					 	<a href="#" onclick="$('#sdate').focus(); return false;" class="">
					 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
					 	</a>
					~
					<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
						<a href="#" onclick="$('#edate').focus(); return false;" class="">
							<img src="/admin/images/btn_calendar.png" alt="가입기간 종료일">
						</a>
					</span>  --%>
				</td>	
	          </tr>
	        </tbody>
	</table>
    <div class="button_top">
    <a href="#" onclick="list_page();" class="btn search brown">검색</a>
    </div>
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->
<div class="space5"></div>
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td align="right"><a href="#" onclick="goExcel();" class="btn down sky">엑셀다운</a></td>
    </tr>
  </tbody>
</table>

<!-- 전체 교육 운영 현황 -->
<table class="tb table-type1 stats_tb">

<tr>
	<th rowspan="1" colspan="2" style="width: 150px">구분</th>
	<th rowspan="1" style="width:100px">교육과정</th>
	<th colspan="1">1월</th>
	<th colspan="1">2월</th>
	<th colspan="1">3월</th>
	<th colspan="1">4월</th>
	<th colspan="1">5월</th>
	<th colspan="1">6월</th>
	<th colspan="1">7월</th>
	<th colspan="1">8월</th>
	<th colspan="1">9월</th>
	<th colspan="1">10월</th>
	<th colspan="1">11월</th>
	<th colspan="1">12월</th>
	<th colspan="1">년간 총 누계</th>
</tr>
<c:set var="trCnt1" value="0"/>
<c:set var="trCnt2" value="0"/>
<c:set var="trCnt3" value="0"/>
<c:set var="trRef2Nm" value=""/>
<c:set var="trAbcYn" value="N"/>
<c:forEach var="result" items="${resultList}">
	<c:set var="trCnt1" value="${trCnt1+1 }"/>
	<tr>
		<c:choose>
			<c:when test="${trCnt1 == 1}">
				<td rowspan="${resultCateList1[trCnt2].CNT-1}" style="text-align: center">${result.REF2}</td>
				<td rowspan="${resultCateList2[trCnt3].CNT}" style="text-align: center">${result.ABC_CD}</td>
				<td>${result.REF3}</td>
				<c:set var="trCnt2" value="${trCnt2+1}"/>
				<c:set var="trCnt3" value="${trCnt3+1}"/>
			</c:when>
			<c:when test="${trCnt1 != 1 and result.TYPE=='A'}">
				<c:if test="${trRef2Nm != result.REF2}">
					<td rowspan="${resultCateList1[trCnt2].CNT-1}" style="text-align: center">${result.REF2}</td>
					<c:set var="trCnt2" value="${trCnt2+1}"/>
				</c:if>
				<c:if test="${trAbcYn == 'Y'}">
					<td rowspan="${resultCateList2[trCnt3].CNT}" style="text-align: center">${result.ABC_CD}</td>
					<c:set var="trCnt3" value="${trCnt3+1}"/>
				</c:if>
				<c:if test="${result.ABC_CD != '교육별소계'}">
					<td>${result.REF3}</td>
				</c:if>
				<c:set var="trAbcYn" value="N"/>
			</c:when>
			<c:when test="${trCnt1 != 1 and result.TYPE=='B'}">
				<td colspan="2" style="text-align: center">${result.ABC_CD} 소계</td>
				<c:set var="trAbcYn" value="Y"/>
			</c:when>
			<c:when test="${trCnt1 != 1 and result.TYPE=='B+B'}">
				<td colspan="3" style="text-align: center">${result.REF2} 소계</td>
				<c:set var="trAbcYn" value="Y"/>
			</c:when>
			<c:when test="${result.TYPE=='ALL'}">
				<td colspan="3" style="text-align: center">합계</td>
			</c:when>
		</c:choose>
		<td>${result.MONTH1}</td>
		<td>${result.MONTH2}</td>
		<td>${result.MONTH3}</td>
		<td>${result.MONTH4}</td>
		<td>${result.MONTH5}</td>
		<td>${result.MONTH6}</td>
		<td>${result.MONTH7}</td>
		<td>${result.MONTH8}</td>
		<td>${result.MONTH9}</td>
		<td>${result.MONTH10}</td>
		<td>${result.MONTH11}</td>
		<td>${result.MONTH12}</td>
		<td>${result.TOT_YEAR}</td>
	</tr>
	<c:set var="trRef2Nm" value="${result.REF2}"/>
</c:forEach>

</table>
<br/><br/>


<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	