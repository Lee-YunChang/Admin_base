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
	// 달력
	$("#sdate").datepicker(dateFormat);
	$("#edate").datepicker(dateFormat);
});

//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("#pform").attr("action", "/admin/stats/eduStats03.do");
    frm.submit();
}
//검색
function list_page(){
    var frm = document.pform;
    $("input[name='listType']").val('LIST');
    $("#pform").attr("action", "/admin/stats/eduStats03.do");
    frm.submit();
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">집합 교육 운영 현황</div>

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
            <th>기간검색</th>
			<td>
				<span id="dateSelect">
				<input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#sdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
				 	</a>
				~
				<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
					<a href="#" onclick="$('#edate').focus(); return false;" class="">
						<img src="/admin/images/btn_calendar.png" alt="가입기간 종료일">
					</a>
				</span> 
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

<table class="tb table-type1 stats_tb">
    <tr>
    	<th>순번</th>
    	<th>구분</th>
    	<th>과정명</th>
    	<th>시작일</th>
    	<th>종료일</th>
    	<th>실제인원</th>
    	<th>교육장소</th>
    </tr>
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <tr>
    	<td><c:out value="${result.RNUM}"/></td>
    	<td><c:out value="${result.COURSETITLE}"/></td>
    	<td><c:out value="${result.SEQ_TITLE}"/></td>
    	<td><c:out value="${result.STUDY_SDATE}"/></td>
    	<td><c:out value="${result.STUDY_EDATE}"/></td>
    	<td><c:out value="${result.CNT}"/></td>
    	<td><c:out value="${result.EDU_PLACE}"/></td>
    </tr>
    </c:forEach>
</table>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	