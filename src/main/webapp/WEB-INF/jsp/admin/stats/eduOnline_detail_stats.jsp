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
<div class="title title_top">온라인교육 통계</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/eduStats02.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>

 <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
      <tbody>
      	<tr>
      		<th>년도</th>
			<td>
				<span><c:out value=""/>${REQUEST_DATA.sdate} ~ ${REQUEST_DATA.edate}</span>
			</td>	
      	</tr>
      	<tr>
      		<th>과정</th>
      		 <td>
	      		
	      		<span><c:out value=""/>${result[0].COURSETITLE}</span>
	      		 	
      		 </td>
      	</tr>   
      </tbody>
</table> 
</form>
<br/>
<br/>
<br/>

<!-- 교육대상 선택시 보여주는 테이블 -->
<div id="select1">
<table class="tb table-type1 stats_tb">

    <colgroup>
        <col style="width:15%">
        <col style="width:8%">
        <col style="width:8%">
        <col style="width:8%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        
    </colgroup>
    <thead>
	<tr>
    	<th scope="col">연령</th>
    	<th scope="col">총 인원(명)</th>
    	<th scope="col">사전시험(평균)</th>
    	<th scope="col">사후시험(평균)</th>
    	<th scope="col">변동폭</th>
    	<th scope="col">순위</th>

    </tr>
</thead>
<tbody>
	<c:forEach var="result" items="${result}">
			<tr>
				<td>${result.AGE}</td>
		    	<td>${result.CNT}</td>
		    	<td>${result.AVG_BEFORE}</td>
		    	<td>${result.AVG_AFTER}</td>
		    	<td>${result.MOVVAL}</td>
		    	<td>${result.RNK}</td>
		    </tr>
	</c:forEach>
</tbody>
</table>
</div>
<br/>



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

