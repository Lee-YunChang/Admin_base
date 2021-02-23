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
	      		 	<option>2017</option>
	      		 	<option>2016</option>
				 </select>
			</td>	
      	</tr>
      	<tr>
      		<th>과정</th>
      		<%-- <td>
      			<input type="radio" id="mtCtypeCode" name="mtCtypeCode" value=""  <c:if test="${REQUEST_DATA.mtCtypeCode eq '' || REQUEST_DATA.mtCtypeCode eq null}"> checked="checked"</c:if>/> 전체&nbsp;
	            <input type="radio" id="mtCtypeCode" name="mtCtypeCode" value="DAAA00" <c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA00'}"> checked="checked"</c:if>/> 온라인교육&nbsp;
	            <input type="radio" id="mtCtypeCode" name="mtCtypeCode" value="DAAA01" <c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA01'}"> checked="checked"</c:if>/> 집합교육
      		</td> --%>
      		 <td>
	      		 <select name="" id="" title="">
	      		 	<option>전체(구분)</option>
	      		 	
	      		 </select>
	      		 <select name="" id="" title="">
	      		 	<option>전체(과정명)</option>
	      		 	
	      		 </select>
      		 </td>
      	</tr>   
      		<tr>
      		<th>구분</th>
      		 <td>
	      		 <select name="" id="" title="">
	      		 	<option>전체/성별/연령</option>
	      		 	
	      		 </select>
	      		 <select name="" id="" title="">
	      		 	<option>전체/연령(상세)</option>
	      		 	
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
        <col style="width:15%">
        <col style="width: *">
        <col style="width:8%">
        <col style="width:6%">
        <col style="width:8%">
        <col style="width:8%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        
    </colgroup>
    <thead>
	<tr>
    	<th scope="col">과정구분</th>
    	<th scope="col">과정명</th>
    	<th scope="col">총 인원(명)</th>
    	<th scope="col">총점</th>
    	<th scope="col">사전시험(평균)</th>
    	<th scope="col">사후시험(평균)</th>
    	<th scope="col">변동폭</th>
    	<th scope="col">변동률</th>
    	<th scope="col">순위</th>
    	<th scope="col"></th>

    </tr>
</thead>
<tbody>
    <tr>
    	<td>창업</td>
    	<td>기업가 정신</td>
    	<td>320</td>
    	<td>20</td>
    	<td>10</td>
    	<td>15.2</td>
    	<td>+5.2</td>
    	<td>52%</td>
    	<td>1</td>
    	<td><a href="#" class= "btn sm blue">상세</a></td>
    
    </tr>
     <tr>
    	<td>창업</td>
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
    	<td>창업</td>
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
    	
    </tr>
    <tr>
    	<td></td>
    	<td>합계</td>
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



<!-- 상세보기 클릭 시 출력되는 jsp -->
 <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
      <tbody>
      	<tr>
      		<th>년도</th>
			<td>
				<span><c:out value=""/>2017</span>
			</td>	
      	</tr>
      	<tr>
      		<th>과정</th>
      		 <td>
	      		
	      		<span><c:out value=""/>창업 - 기업가 정신</span>
	      		 	
      		 </td>
      	</tr>   
      		<tr>
      		<th>구분</th>
      		 <td>
	      		 <select name="" id="" title="">
	      		 	<option>연령</option>
	      		 	
	      		 </select>
	
      		 </td>
      	</tr> 
      </tbody>
</table> 
  	<div class="button_top">
    	<a href="#" onclick="list_page();" class="btn search brown">검색</a>
    </div>
</form>

<!-- 교육대상 선택시 보여주는 테이블 -->
<div id="select1">
<table class="tb table-type1 stats_tb">

    <colgroup>
        <col style="width:20%">
        <col style="width:8%">
        <col style="width:8%">
        <col style="width:8%">
        <col style="width:6%">
        <col style="width:6%">
        <col style="width:6%">
        
    </colgroup>
    <thead>
	<tr>
    	<th scope="col">과정명</th>
    	<th scope="col">총 인원(명)</th>
    	<th scope="col">사전시험(평균)</th>
    	<th scope="col">사후시험(평균)</th>
    	<th scope="col">변동폭</th>
    	<th scope="col">변동률</th>
    	<th scope="col">순위</th>

    </tr>
</thead>
<tbody>
    <tr>
    	<td>10대</td>
    	<td>320</td>
    	<td>10</td>
    	<td>15.2</td>
    	<td>+5.2</td>
    	<td>52%</td>
    	<td>1</td>

    </tr>
     <tr>
    	<td>20대</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>30대</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>40대</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>50대</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    <tr>
    	<td>60대</td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
     <tr>
    	<td>70대</td>
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
    </tr>
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
