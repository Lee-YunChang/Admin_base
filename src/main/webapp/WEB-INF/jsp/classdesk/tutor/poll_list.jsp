<%
/****************************************
	system	: ClassDesk > 강사 > 설문
	title	: 설문 메인
	summary	:	
	wdate	: 2015-04-01
	writer	: SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

<script>

//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
var dateFormat={
	dayNamesMin:['일','월','화','수','목','금','토'],
	monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	showMonthAfterYear: true, //연월 순서로 보여줌
	changeMonth: true, //월을 셀렉트박스로 표현
	changeYear: true, //년을 셀렉트박스로 표현
	dateFormat: "yy-mm-dd",
	changeMonth: true,   
	changeYear: true,	
	yearRange: '2014:2025'
};	

$(document).ready(function(){
	$("#sdate").datepicker(dateFormat);
	$("#edate").datepicker(dateFormat);
});

function fnViewPage(pollcseqno,cnt){
	var frm = document.sform;
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>";
	frm.qu.value = "update";
	frm.pollcseqno.value = pollcseqno;
	frm.pollcseqno2.value = pollcseqno;
	frm.cnt.value = cnt;
	$("#sform").attr("action", "/classdesk/tutor/poll/form.do");
	frm.submit();
}
function fnStatistics(pollcseqno,cnt,writer){
	var frm = document.sform;
	frm.pollcseqno.value = pollcseqno;
	frm.pollcseqno2.value = pollcseqno;
	frm.writer.value = writer;
	frm.cnt.value = cnt;
	$("#sform").attr("action", "/classdesk/tutor/poll/statistics.do");
	frm.submit();
}
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div id="Right_Area" >
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">설문 관리</h3>
	</div>
	<!-- 본문 > 상단 > 검색영역 시작 -->
	<form name="sform" id="sform" action="/classdesk/tutor/poll/list.do" method="post">
		<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
   		<input type="hidden" name="total" id="total" value="<c:out value="${totalCount}"/>"/>
		<input type="hidden" name="pollcseqno" id="pollcseqno" value=""/>
		<input type="hidden" name="pollcseqno2" id="pollcseqno2" value=""/>
		<input type="hidden" name="writer" id="writer" value=""/>
		<input type="hidden" name="qu" id="qu" value=""/>
		<input type="hidden" name="pageMode" id="pageMode" value=""/>
		<input type="hidden" name="cnt" id="cnt" value=""/>
		<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}"/>
		
		<div class="table-type3" style="padding-top: 10px;">
			<table>
					<caption>기간조회</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>설문기간</th>
							<td colspan="3">
<%-- 								<input type ="radio" class="line" name="openType" id="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>" onclick="openDateSelect(this.value);" checked/> 상시 &nbsp; --%>
<%-- 								<input type ="radio" class="line" name="openType" id="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>" onclick="openDateSelect(this.value);" /> 기간 --%>
								
								<span id="dateSelect" style="padding-top:10px">
									<input type="text" class="line" style="width:100px"name="sdate" id="sdate" value='<fmt:formatDate value="${listData[0].SDATE}" pattern="yyyy-MM-dd" />' readonly="readonly" /> 
									<a href="#none" onclick="$('#sdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="시작날짜선택" /></a> 
									
									<span class="date-cut">~</span> 
									<input type="text" class="line" style="width:100px" name="edate" id="edate" value='<fmt:formatDate value="${listData[0].EDATE}" pattern="yyyy-MM-dd" />' readonly="readonly">
									<a href="#none" onclick="$('#edate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="마지막날짜선택" /></a>
								</span>
							</td>
						</tr>	
						
						<tr>
							<th>검색</th>
							<td colspan="3"> 
								<select id="searchMode" name="searchMode" title="검색 설정">
									<option value="" <c:if test="${empty REQUEST_DATA.searchMode}"> selected="selected" </c:if>>선택</option>
									<option value="writer" <c:if test="${REQUEST_DATA.searchMode eq 'writer' }">selected="selected" </c:if>>작성자</option>
									<option value="title" <c:if test="${REQUEST_DATA.searchMode eq 'title' }">selected="selected" </c:if>>설문명</option>
								</select>
								<input type="text" id="searchWord" name="searchWord" title="검색어" style="width:150px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
							</td>
						</tr>
						
					</tbody>
				</table>
				<div class="table-btn-group">
					<a href="#" class="btn-large-brown" onclick="fnSearch('1');return false;"><span>검색</span></a>
				</div>
		</div>
	</form>
	<!-- 본문 > 상단 > 검색영역 끝 -->

	<!-- 본문 > 메인 > 서브   영역 시작 -->
	</br>
	<table width="100%" class="btn_Group">
	 <tbody>
	  <tr>
	   <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</td></td>
	  </tr>
	 </tbody>
	</table></br>
	
	<!-- 본문 > 메인 > 목록 시작  -->
	<div class="table-type1">
			<div class="table-header-left"></div>
	<table class="tb table-type1">
	<colgroup>
		<col style="width: 8%;" />
		<col style="width: 37%" />
		<col style="width: 10%;" />
		<col style="width: 12%;" />
		<col style="width: 8%;" />
		<col style="width: 8%;" />
		<col style="width: 8%;" />
		<col style="width: 13%;" />
	</colgroup>	
	<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>설문명</th>
			<th>작성자</th>
			<th>설문기간</th>
			<th>사용여부</th>
			<th>응답수</th> 
			<th>통계보기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		  	<td><c:out value='${result.RNUM}'/></td>
		  	<td style="text-align:left;padding-left:15px">
				<a href="#" onclick="fnViewPage('<c:out value="${result.POLLCSEQNO}"/>','<c:out value="${result.CNT}"/>')"><c:out value="${result.TITLE}"/></a>
		  	</td>
		  	<td><c:out value='${result.WRITER}'/></td>
		  	<td><c:out value='${result.SDATE}'/> ~ <c:out value='${result.EDATE}'/></td>
		  	<td><c:out value='${result.USEYN}'/></td>
		  	<td><c:out value='${result.CNT}'/>/<c:out value='${result.TOTALMEMBER}'/></td>
		  	<td><a href="#none" class="btn-large-green" onclick="fnStatistics('<c:out value="${result.POLLCSEQNO}"/>','<c:out value="${result.CNT}"/>','<c:out value="${result.WRITER}"/>')"><span>보기</span></a></td>
		</tr> 
		</c:forEach>
	</tbody>
	</table>
	</div>
	<!-- 본문 > 메인 > 목록 끝 -->
	</br>
	
	
<c:if test="${not empty resultList}">
		<div class="table-btn-group">
			<paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
		</div>
</c:if>

	<!-- 게시판 버튼영역 -->
	</div>
	<div id="Right_Area">
		<div class="btn-table right">
			<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
 				<a href="#none"  onclick="fnFormPage();"  class="btn-large-blue" ><span>등록</span></a>
			</c:if>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>

<script>
//날짜 검색
function openDateSelect(value){
	if(value == 'D'){
		document.getElementById('dateSelect').style.display = 'block';
		
	} else if(value == 'A' || value == '') {
		document.getElementById('dateSelect').style.display = 'none';
	
	}
}
//검색
	function fnSearch(page) {
		if(page) {
			$('#cPage').val(page);
		}
		$('#sform').attr('target', '_self');
		$('#sform').submit();
	}
	
//등록
	function fnFormPage(){
		var frm = document.sform;
		frm.qu.value = "insert";
		frm.pollcseqno.value = 0;
		frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>";
		$("#sform").attr("action", "/classdesk/tutor/poll/form.do");
		frm.submit();
	}

</script>
 
 
