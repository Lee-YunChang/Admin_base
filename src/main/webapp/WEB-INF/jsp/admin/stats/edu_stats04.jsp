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
	// 달력
	$("#sdate").datepicker(dateFormat);
	$("#edate").datepicker(dateFormat);
});

//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("#pform").attr("action", "/admin/stats/eduStats04.do");
    frm.submit();
}
//검색
function list_page(){
    var frm = document.pform;
    $("input[name='listType']").val('LIST');
    $("#pform").attr("action", "/admin/stats/eduStats04.do");
    frm.submit();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수료 통계</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/eduStats02.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>
<!-- 검색영역 -->
 <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
      <tbody>
      	<tr>
      		<th>년도</th>
			<td>
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
				 <select name="" id="" title="년도">
				 	<option></option>
	      		 	<option>2016</option>
	      		 	<option>2015</option>
				 </select>
			</td>	
      	</tr>
      	<tr>
      		<th>구분</th>
      		<%-- <td>
      			<input type="radio" id="mtCtypeCode" name="mtCtypeCode" value=""  <c:if test="${REQUEST_DATA.mtCtypeCode eq '' || REQUEST_DATA.mtCtypeCode eq null}"> checked="checked"</c:if>/> 전체&nbsp;
	            <input type="radio" id="mtCtypeCode" name="mtCtypeCode" value="DAAA00" <c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA00'}"> checked="checked"</c:if>/> 온라인교육&nbsp;
	            <input type="radio" id="mtCtypeCode" name="mtCtypeCode" value="DAAA01" <c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA01'}"> checked="checked"</c:if>/> 집합교육
      		</td> --%>
      		 <td>
	      		 <select name="" id="" title="과정형태">
	      		 	<option>교육대상</option>
	      		 	<option>교육주제</option>
	      		 	<option>강사</option>
	      		 </select>
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

<!-- 교육대상 선택시 보여주는 테이블 -->
<div id="select1">
<table class="tb table-type1 stats_tb">

    <colgroup>
        <col style="width: *">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:8%">
    </colgroup>
    <thead>
	<tr>
    	<th scope="col">구분(교육대상)</th>
    	<th scope="col">1월</th>
    	<th scope="col">2월</th>
    	<th scope="col">3월</th>
    	<th scope="col">4월</th>
    	<th scope="col">5월</th>
    	<th scope="col">6월</th>
    	<th scope="col">7월</th>
    	<th scope="col">8월</th>
    	<th scope="col">9월</th>
    	<th scope="col">10월</th>
    	<th scope="col">11월</th>
    	<th scope="col">12월</th>
    	<th scope="col">합계</th>
    </tr>
</thead>
<tbody>
    <tr>
    	<td>어르신</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>다문화가정</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>군인/사회복무요원</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>상담종사자</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>청년/대학생</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>초/중/고교생</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td stlye="text-align: center;">기타</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>합계</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
</tbody>
</table>
</div>
<br/>
<!-- 교육주제 선택시 보여주는 테이블 style="display: none" -->
<div id="select2" >
<table class="tb table-type1 stats_tb">
	   <colgroup>
        <col style="width: *">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:8%">
    </colgroup>
    <thead>
	<tr>
    	<th scope="col">구분(교육주제)</th>
    	<th scope="col">1월</th>
    	<th scope="col">2월</th>
    	<th scope="col">3월</th>
    	<th scope="col">4월</th>
    	<th scope="col">5월</th>
    	<th scope="col">6월</th>
    	<th scope="col">7월</th>
    	<th scope="col">8월</th>
    	<th scope="col">9월</th>
    	<th scope="col">10월</th>
    	<th scope="col">11월</th>
    	<th scope="col">12월</th>
    	<th scope="col">합계</th>
    </tr>
</thead>
<tbody>
    <tr>
    	<td>재무설계</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>저축과 소비</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>부채관리</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>신용관리</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>위험관리</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>서민금융의 이해</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>생활복지</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>취업</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>노후설계</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>창업금융</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td stlye="text-align: center;">기타</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>합계</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
</tbody>
</table>
</div>
<br/>
<!-- 강사 선택시 보여주는 테이블 style="display: none" -->
<div id="select3">
<table class="tb table-type1 stats_tb">
	   <colgroup>
        <col style="width: *">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:8%">
    </colgroup>
    <thead>
	<tr>
    	<th scope="col" colspan="2">구분(강사)</th>
    	<th scope="col">1월</th>
    	<th scope="col">2월</th>
    	<th scope="col">3월</th>
    	<th scope="col">4월</th>
    	<th scope="col">5월</th>
    	<th scope="col">6월</th>
    	<th scope="col">7월</th>
    	<th scope="col">8월</th>
    	<th scope="col">9월</th>
    	<th scope="col">10월</th>
    	<th scope="col">11월</th>
    	<th scope="col">12월</th>
    	<th scope="col">합계</th>
    </tr>
</thead>
<tbody>
    <tr>
    	<td rowspan="2" style="text-align: cednter; width: 90px;">내부강사</td>
    	<td>횟수</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td style="border-left:1px solid #ddd;">비용</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
     <tr>
    	<td rowspan="2">외부강사</td>
    	<td>횟수</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td style="border-left:1px solid #ddd;">비용</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td rowspan="2">합계</td>
    	<td>횟수</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td style="border-left:1px solid #ddd;">비용</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
</tbody>
</table>
</div>

<%-- <table class="tb table-type1 stats_tb">
    <tr>
    	<th>NO</th>
    	<th>과정형태</th>
    	<th>과정명</th>
    	<th>신청인원</th>
    	<th>수강인원</th>
    	<th>수료인원</th>
    	<th>수료평균점수</th>
    </tr>
    <c:forEach var="map" items="${resultList}" varStatus="status">
    <tr>
    	<td><c:out value='${map.RNUM}'/></td>
        <td><c:out value="${map.MT_CTYPE_NAME}"/></td>
        <td align="left"><c:out value="${map.COURSETITLE}"/></td>
        <td align="right">
            <c:set var="totApplyUser"><c:out value="${totApplyUser + map.TOT_APPLY_USER}"/></c:set>
            <fmt:formatNumber value="${map.TOT_APPLY_USER}" type="number" groupingUsed="true" />
        </td>
        <td align="right">
            <c:set var="totStudyUser"><c:out value="${totStudyUser + map.TOT_STUDY_USER}"/></c:set>
            <fmt:formatNumber value="${map.TOT_STUDY_USER}" type="number" groupingUsed="true" />
        </td>
        <td align="right">
            <c:set var="totCompUser"><c:out value="${totCompUser +map.TOT_COMP_USER}"/></c:set>
            <fmt:formatNumber value="${map.TOT_COMP_USER}" type="number" groupingUsed="true" />
        </td>
        <td align="right">
            <c:set var="avgFinalVal"><c:out value="${avgFinalVal + map.AVG_FINAL_VAL}"/></c:set>
            <c:if test="${map.AVG_FINAL_VAL > 100}">100</c:if>
            <c:if test="${map.AVG_FINAL_VAL < 101}"><fmt:formatNumber value="${map.AVG_FINAL_VAL}" type="number" groupingUsed="true" /></c:if>
        </td>
    </tr>
    </c:forEach>
    <tr>
    	<th colspan="3">합계</th>
    	<td align="right"><c:out value="${totApplyUser}"/></td>
    	<td align="right"><c:out value="${totStudyUser}"/></td>
    	<td align="right"><c:out value="${totCompUser}"/></td>
    	<td align="right"></td>
    </tr>
</table> --%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	