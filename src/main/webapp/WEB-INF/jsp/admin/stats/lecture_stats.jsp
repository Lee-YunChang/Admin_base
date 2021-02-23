<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("#pform").attr("action", "/admin/stats/lecture_stats.do");
    frm.submit();
}

//검색
function list_page(){
    var frm = document.pform;
    $("input[name='listType']").val('LIST');
    $("#pform").attr("action", "/admin/stats/lecture_stats.do");
    frm.submit();
}

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
	
	if('${REQUEST_DATA.searchType}' != 'TU'){
		$('#tutorSearchDate').css("display",'none');
		$('#SearchYear').css("display",'table-row');
		$('#searchTutorMode').css("display",'none');
	} else if('${REQUEST_DATA.searchType}' == 'TU'){
		$('#tutorSearchDate').css("display",'table-row');
		$('#SearchYear').css("display",'none');
		$('#searchTutorMode').css("display",'table-row');
	}
});

//구분값 체크
function gnbChk(){
	if($('input:radio[name=searchType]:checked').val()=='TU'){
		$('#tutorSearchDate').css("display",'table-row');
		$('#searchTutorMode').css("display",'table-row');
		$('#SearchYear').css("display",'none');
	} else {
		$('#searchTutorMode').css("display",'none');
		$('#tutorSearchDate').css("display",'none');
		$('#SearchYear').css("display",'table-row');
	}
}

function move_page(cPage){
	var frm = document.pform;
	$("input[name='listType']").val('LIST');
	$("#pform").attr("action", "/admin/stats/lecture_stats.do");
	frm.cPage.value = cPage;
	frm.submit();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">방문교육 통계 </div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/lecture_stats.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
<!-- 검색영역 -->
 <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
      <tbody>
      	<tr id="SearchYear">
      		<th>년도</th>
			<td>
		
				 <select name="searchDate" id="searchDate" title="년도">
				 	<c:forEach items="${yearCombo}" var="result" varStatus="status">
				 		<option value="${result.key }" <c:if test="${REQUEST_DATA.searchDate eq result.key}"> selected="selected" </c:if>>${result.value }</option>
				 	</c:forEach> 
				 	
				 </select>
			</td>	
      	</tr>
      	<tr id="tutorSearchDate">
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
      	<tr>
      		<th>구분</th>
      		<td>
      			<input type="radio" id="type1" name="searchType" onchange="gnbChk()" value="TG"  <c:if test="${REQUEST_DATA.searchType eq 'TG'}"> checked="checked"</c:if>/>교육대상&nbsp;
	            <input type="radio" id="type2" name="searchType" onchange="gnbChk()" value="HP" <c:if test="${REQUEST_DATA.searchType eq 'HP'}"> checked="checked"</c:if>/> 교육주제&nbsp;
	            <input type="radio" id="type3" name="searchType" onchange="gnbChk()" value="TC" <c:if test="${REQUEST_DATA.searchType eq 'TC'}"> checked="checked"</c:if>/> 강사구분&nbsp;
	            <input type="radio" id="type4" name="searchType" onchange="gnbChk()" value="TM" <c:if test="${REQUEST_DATA.searchType eq 'TM'}"> checked="checked"</c:if>/> 강사월별&nbsp;
	            <input type="radio" id="type4" name="searchType" onchange="gnbChk()" value="TU" <c:if test="${REQUEST_DATA.searchType eq 'TU'}"> checked="checked"</c:if>/> 강사강의내역&nbsp;
      		</td>
      		 <!-- <td>
	      		 <select name="" id="" title="과정형태">
	      		 	<option>교육대상</option>
	      		 	<option>교육주제</option>
	      		 	<option>강사</option>
	      		 </select>
      		 </td> -->
      	</tr> 
      	<tr id="searchTutorMode">	
			<th>검색</th>
			<td>
		  		<select name="searchMode" title="검색옵션">
		  			<option value="">선택</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if> value="userId">아이디</option>
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'userName'}">selected="selected" </c:if> value="userName">이름</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode eq 'applyName'}">selected="selected" </c:if> value="applyName">신청자</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode eq 'organName'}">selected="selected" </c:if> value="organName">신청기관</option>
	            </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();" />
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

<c:choose>
	<c:when test="${REQUEST_DATA.searchType eq 'TC' }">
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
				<c:forEach items="${resultList}" var="result" varStatus="status">
				    <tr>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MT_SUB_NAME }</td>
				    	<td>횟수</td>
				    	<td><c:out value="${result.M01}" /></td>
				    	<td><c:out value="${result.M02}" /></td>
				    	<td><c:out value="${result.M03}" /></td>
				    	<td><c:out value="${result.M04}" /></td>
				    	<td><c:out value="${result.M05}" /></td>
				    	<td><c:out value="${result.M06}" /></td>
				    	<td><c:out value="${result.M07}" /></td>
				    	<td><c:out value="${result.M08}" /></td>
				    	<td><c:out value="${result.M09}" /></td>
				    	<td><c:out value="${result.M10}" /></td>
				    	<td><c:out value="${result.M11}" /></td>
				    	<td><c:out value="${result.M12}" /></td>
				    	<td><c:out value="${result.MTOT}" /></td>
				    </tr>
				     <tr>
				    	<td style="border-left:1px solid #ddd;">인원</td>
				    	<td><c:out value="${result.SUM01}" /> </td>
				    	<td><c:out value="${result.SUM02}" /></td>
				    	<td><c:out value="${result.SUM03}" /></td>
				    	<td><c:out value="${result.SUM04}" /></td>
				    	<td><c:out value="${result.SUM05}" /></td>
				    	<td><c:out value="${result.SUM06}" /></td>
				    	<td><c:out value="${result.SUM07}" /></td>
				    	<td><c:out value="${result.SUM08}" /></td>
				    	<td><c:out value="${result.SUM09}" /></td>
				    	<td><c:out value="${result.SUM10}" /></td>
				    	<td><c:out value="${result.SUM11}" /></td>
				    	<td><c:out value="${result.SUM12}" /></td>
				    	<td><c:out value="${result.SUMTOT}" /></td>
				    </tr>
			    </c:forEach> 
			</tbody>
			</table>
			</div>
	</c:when>
	<c:when test="${REQUEST_DATA.searchType eq 'TU' }">
		<div id="select4">
			<table class="tb table-type1 stats_tb">
				   <colgroup>
			        <col style="width:6%">
			        <col style="width:5%">
			        <col style="width:7%">
			        <col style="width:6%">
			        <col style="width:10%">
			        <col style="width:14%">
			        <col style="width:8%">
			        <col style="width:16%">
			        <col style="width: *">
			        <col style="width:9%">
			    </colgroup>
			    <thead>
				<tr>
					<th scope="col">아이디</th>
			    	<th scope="col">이름</th>
			    	<th scope="col">구분(강사)</th>
			    	<th scope="col">신청자</th>
			    	<th scope="col">신청기관</th>
			    	<th scope="col">교육주제</th>
			    	<th scope="col">교육대상</th>
			    	<th scope="col">교육일시</th>
			    	<th scope="col">주소</th>
			    	<th scope="col">교육장소</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="status">
				    <tr>
				    	<td><c:out value="${result.UNITY_ID}" /></td>
				    	<td><c:out value="${result.MBERNM}" /></td>
				    	<td><c:out value="${result.MT_TUTOR_NAME}" /></td>
				    	<td><c:out value="${result.APPLY_NM}" /></td>
				    	<td><c:out value="${result.APPLY_ORGAN_NM}" /></td>
				    	<td><c:out value="${result.mtLctreName}" /></td>
				    	<td><c:out value="${result.MT_LEC_TARGET_NAME}" /></td>
				    	<td><c:out value="${result.DS_SDATE}" />~<c:out value="${result.DS_EDATE}" /></td>
				    	<td><c:out value="${result.LE_LNM_ADRES1}" />&nbsp;<c:out value="${result.LE_LNM_ADRES2}" /></td>
				    	<td><c:out value="${result.EDU_AREA}" /></td>
				    </tr>
			    </c:forEach> 
			</tbody>
			</table>
			</div>
			
	</c:when>
	<c:when test="${REQUEST_DATA.searchType eq 'TM' }">
		<div id="select3">
			<table class="tb table-type1 stats_tb">
				   <colgroup>
			        <col style="width: *">
			        <col style="width:6%">
			        <col style="width:7%">
			        <col style="width:5%">
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
			    </colgroup>
			    <thead>
				<tr>
			    	<th scope="col">아이디</th>
			    	<th scope="col">이름</th>
			    	<th scope="col" colspan="2">구분</th>
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
				<c:forEach items="${resultList}" var="result" varStatus="status">
				    <tr>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.UNITY_ID}</td>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MBERNM}</td>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MT_TUTOR_NAME}</td>
				    	<td>횟수</td>
				    	<td><c:out value="${result.M01}" /></td>
				    	<td><c:out value="${result.M02}" /></td>
				    	<td><c:out value="${result.M03}" /></td>
				    	<td><c:out value="${result.M04}" /></td>
				    	<td><c:out value="${result.M05}" /></td>
				    	<td><c:out value="${result.M06}" /></td>
				    	<td><c:out value="${result.M07}" /></td>
				    	<td><c:out value="${result.M08}" /></td>
				    	<td><c:out value="${result.M09}" /></td>
				    	<td><c:out value="${result.M10}" /></td>
				    	<td><c:out value="${result.M11}" /></td>
				    	<td><c:out value="${result.M12}" /></td>
				    	<td><c:out value="${result.MTOT}" /></td>
				    </tr>
				     <tr>
				    	<td style="border-left:1px solid #ddd;">인원</td>
				    	<td><c:out value="${result.SUM01}" /> </td>
				    	<td><c:out value="${result.SUM02}" /></td>
				    	<td><c:out value="${result.SUM03}" /></td>
				    	<td><c:out value="${result.SUM04}" /></td>
				    	<td><c:out value="${result.SUM05}" /></td>
				    	<td><c:out value="${result.SUM06}" /></td>
				    	<td><c:out value="${result.SUM07}" /></td>
				    	<td><c:out value="${result.SUM08}" /></td>
				    	<td><c:out value="${result.SUM09}" /></td>
				    	<td><c:out value="${result.SUM10}" /></td>
				    	<td><c:out value="${result.SUM11}" /></td>
				    	<td><c:out value="${result.SUM12}" /></td>
				    	<td><c:out value="${result.SUMTOT}" /></td>
				    </tr>
			    </c:forEach> 
			</tbody>
			</table>
			</div>
	</c:when>
	<c:otherwise>
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
			    	<th scope="col" colspan="2">구분(교육대상)</th>
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
				<c:forEach items="${resultList}" var="result" varStatus="status">
					 <tr>
				    	<td rowspan="2" style="text-align: cednter; width: 90px;">${result.MT_SUB_NAME }</td>
				    	<td>횟수</td>
				    	<td><c:out value="${result.M01}" /></td>
				    	<td><c:out value="${result.M02}" /></td>
				    	<td><c:out value="${result.M03}" /></td>
				    	<td><c:out value="${result.M04}" /></td>
				    	<td><c:out value="${result.M05}" /></td>
				    	<td><c:out value="${result.M06}" /></td>
				    	<td><c:out value="${result.M07}" /></td>
				    	<td><c:out value="${result.M08}" /></td>
				    	<td><c:out value="${result.M09}" /></td>
				    	<td><c:out value="${result.M10}" /></td>
				    	<td><c:out value="${result.M11}" /></td>
				    	<td><c:out value="${result.M12}" /></td>
				    	<td><c:out value="${result.MTOT}" /></td>
				    </tr>
				     <tr>
				    	<td style="border-left:1px solid #ddd;">인원</td>
				    	<td><c:out value="${result.SUM01}" /> </td>
				    	<td><c:out value="${result.SUM02}" /></td>
				    	<td><c:out value="${result.SUM03}" /></td>
				    	<td><c:out value="${result.SUM04}" /></td>
				    	<td><c:out value="${result.SUM05}" /></td>
				    	<td><c:out value="${result.SUM06}" /></td>
				    	<td><c:out value="${result.SUM07}" /></td>
				    	<td><c:out value="${result.SUM08}" /></td>
				    	<td><c:out value="${result.SUM09}" /></td>
				    	<td><c:out value="${result.SUM10}" /></td>
				    	<td><c:out value="${result.SUM11}" /></td>
				    	<td><c:out value="${result.SUM12}" /></td>
				    	<td><c:out value="${result.SUMTOT}" /></td>
				    </tr>
				</c:forEach> 
			</tbody>
			</table>
			</div>
	</c:otherwise>
</c:choose>
<c:if test="${not empty resultList && totalCount > 20}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	