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
	
	if('${REQUEST_DATA.searchMode}' == 'person'){
		$("[name=searchWord]").css("display",'none');
		$('#searcgGnb').css("display",'none');
	}
});

//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("#pform").attr("action", "/admin/stats/eduOnline_stats.do");
    frm.submit();
}
//검색
function list_page(){
    var frm = document.pform;
    $("input[name=cPage]").val(1);
    $("input[name='listType']").val('LIST');
    $("#pform").attr("action", "/admin/stats/eduOnline_stats.do");
    frm.submit();
}
//페이지 이동
function move_page(cPage){
		$("input[name=cPage]").val(cPage);
		$("input[name=listType]").val('LIST');
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/eduOnline_stats.do").submit();
}
//페이지 이동
function move_detail(courseNo){
	$("input[name=courseNo]").val(courseNo);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/eduOnline_stats_detail.do").submit();
}
//분류값 체크
function modeChk(){
	if($("[name=searchMode]").val()=='person'){
		$("[name=searchWord]").val('');
		$("[name=searchWord]").css("display",'none');
		$('#searcgGnb').css("display",'none');
	} else {
		$("[name=searchWord]").css("display",'inline-block');
		$('#searcgGnb').css("display",'table-row');
	}
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">온라인교육 통계</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/eduOnline_stats.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${totalCount}"/>"/>
<input type="hidden" name="courseNo" id="courseNo" value=""/>
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
      	<%-- <tr>
      		<th>년도</th>
			<td>
				 <select name="searchDate" id="searchDate" title="년도">
				 	<c:forEach items="${yearCombo}" var="result" varStatus="status">
				 		<option value="${result.key }" <c:if test="${REQUEST_DATA.searchDate eq result.key}"> selected="selected" </c:if>>${result.value }</option>
				 	</c:forEach> 
				 </select>
			</td>	
      	</tr> --%>
      	<tr>
      		<th>과정분류</th>
      		 <td>
	      		 <select name="searchMode" title="과정분류" onchange="modeChk();">
	      		 	<option value="">전체</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchMode eq 'searchName'}">selected="selected" </c:if> value="searchName">과정명</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchMode eq 'searchTarget'}">selected="selected" </c:if> value="searchTarget">대상자</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchMode eq 'person'}">selected="selected" </c:if> value="person">수료생</option>
	      		 </select>
	      		 <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();" />
      		 </td>
      	</tr>   
      		<tr id="searcgGnb">
      		<th>구분</th>
      		 <td>
	      		 <select name="searchSex" id="searchSex" title="성별">
	      		 	<option value="">전체</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchSex eq 'M'}"> selected="selected" </c:if> value="M">남자</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchSex eq 'F'}"> selected="selected" </c:if> value="F">여자</option>
	      		 </select>
	      		 <select name="searchAge" id="searchAge" title="연령">
	      		 	<option value="">전체</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchAge eq '10'}"> selected="selected" </c:if> value="10">10대</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchAge eq '20'}"> selected="selected" </c:if> value="20">20대</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchAge eq '30'}"> selected="selected" </c:if> value="30">30대</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchAge eq '40'}"> selected="selected" </c:if> value="40">40대</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchAge eq '50'}"> selected="selected" </c:if> value="50">50대</option>
	      		 	<option <c:if test="${REQUEST_DATA.searchAge eq '60'}"> selected="selected" </c:if> value="60">60대</option>
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
<c:choose>
	<c:when test="${REQUEST_DATA.searchMode eq 'person'}">
		<!-- 교육대상 선택시 보여주는 테이블 -->
			<div id="select1">
			<table class="tb table-type1 stats_tb">
			
			    <colgroup>
			    	<col style="width:2%">
			        <col style="width:12%">
			        <col style="width: *">
			        <col style="width:10%">
			        <col style="width:10%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:8%">
			        <col style="width:6%">
			        <col style="width:6%">
			    </colgroup>
			    <thead>
				<tr>
					<th scope="col">NO</th>
			    	<th scope="col">대상자 ID</th>
			    	<th scope="col">과정명</th>
			    	<th scope="col">신청일</th>
			    	<th scope="col">수료일</th>
			    	<th scope="col">이름</th>
			    	<th scope="col">회원구분</th>
			    	<th scope="col">사전시험점수</th>
			    	<th scope="col">사후시험점수</th>
			    	<th scope="col">변동폭</th>
			    	<th scope="col">순위</th>
			
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${totalCount-((REQUEST_DATA.cPage-1)*20+status.index)}"/></td>
						<td><c:out value="${result.USERID}"/></td>
						<td><c:out value="${result.SEQ_TITLE}"/></td>
						<td><c:out value="${result.WDATE}"/></td>
						<td><c:out value="${result.COMPDATE}"/></td>
						<td><c:out value="${result.MBERNM}"/></td>
						<td><c:out value="${result.MT_GRADE_NAME}"/></td>
						<td><c:out value="${result.BEFORE}"/></td>
						<td><c:out value="${result.AFTER}"/></td>
						<td><c:out value="${result.MOV}"/></td>
						<td><c:out value="${result.RNK}"/></td>
					</tr>
				</c:forEach>
			    
			</tbody>
			</table>
			</div>
	</c:when>
	<c:otherwise>
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
			        
			    </colgroup>
			    <thead>
				<tr>
			    	<th scope="col">대상자</th>
			    	<th scope="col">과정명</th>
			    	<th scope="col">총 인원(명)</th>
			    	<th scope="col">총점</th>
			    	<th scope="col">사전시험(평균)</th>
			    	<th scope="col">사후시험(평균)</th>
			    	<th scope="col">변동폭</th>
			    	<th scope="col">순위</th>
			    	<th scope="col"></th>
			
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}">
					<tr>
						<td><c:out value="${result.REF2}"/></td>
						<td><c:out value="${result.COURSETITLE}"/></td>
						<td><c:out value="${result.TOTCNT}"/></td>
						<td><c:out value="${result.TOTSUM}"/></td>
						<td><c:out value="${result.AVG_BEFORE}"/></td>
						<td><c:out value="${result.AVG_AFTER}"/></td>
						<td><c:out value="${result.MOVVAL}"/></td>
						<td><c:out value="${result.RNK}"/></td>
						<td><a href="#" onclick="move_detail(<c:out value="${result.COURSENO}"/>)" class= "btn sm blue">상세</a></td>
					</tr>
				</c:forEach>
			    
			</tbody>
			</table>
			</div>
	</c:otherwise>
</c:choose>

<br/>
<!-- 본문 > 메인 > 목록 끝 -->
	<!-- 페이징, 버튼 영역 -->
    <c:if test="${not empty resultList}">
         <div class="admin-paging paging_wrap">
             <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
         </div>
     </c:if>
	<!-- // 페이징, 버튼 영역 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	

