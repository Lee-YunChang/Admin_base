<%
/****************************************************
	system	: 통계관리
	title	: 사업장별 수료 통계
	summary	:
	wdate	: 2016-03-28
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
//차트 스크립트 실행
$(document).ready(function(){

//<c:out value=""/>
    //종사자수 차트부분
    var chart01Tick = ['<c:out value="${REQUEST_DATA.searchYear5}"/>','<c:out value="${REQUEST_DATA.searchYear4}"/>','<c:out value="${REQUEST_DATA.searchYear3}"/>','<c:out value="${REQUEST_DATA.searchYear2}"/>','<c:out value="${REQUEST_DATA.searchYear1}"/>'];
    var chart01Data01;
    var chart01Data02;


    chart01Data01 = ['<c:out value="${result.ONLINE_CNT_YEAR5_A}"/>','<c:out value="${result.ONLINE_CNT_YEAR4_A}"/>','<c:out value="${result.ONLINE_CNT_YEAR3_A}"/>','<c:out value="${result.ONLINE_CNT_YEAR2_A}"/>','<c:out value="${result.ONLINE_CNT_YEAR1_A}"/>'];
    chart01Data02 = ['<c:out value="${result.ONLINE_ISPASS_YEAR5_A}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR4_A}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR3_A}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR2_A}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR1_A}"/>'];

    if(chart01Data01 == null || chart01Data01.length == 0) chart01Data01 = [0,0,0,0,0];
    if(chart01Data02 == null || chart01Data02.length == 0) chart01Data02 = [0,0,0,0,0];

    var chart01SeriesLabel = [{label : '신청자수'}, {label : '수료자수'}];
    $.jqplot ('chartArea01', [chart01Data01, chart01Data02], $.setMultiBarChartOption03("종사자 교육", chart01Tick, '', chart01SeriesLabel, 0, 20000, true));


    //취급자수 차트 부분
    var chart02Tick = ['<c:out value="${REQUEST_DATA.searchYear5}"/>','<c:out value="${REQUEST_DATA.searchYear4}"/>','<c:out value="${REQUEST_DATA.searchYear3}"/>','<c:out value="${REQUEST_DATA.searchYear2}"/>','<c:out value="${REQUEST_DATA.searchYear1}"/>'];
    var chart02Data01;
    var chart02Data02;


    chart02Data01 = ['<c:out value="${result.ONLINE_CNT_YEAR5_B}"/>','<c:out value="${result.ONLINE_CNT_YEAR4_B}"/>','<c:out value="${result.ONLINE_CNT_YEAR3_B}"/>','<c:out value="${result.ONLINE_CNT_YEAR2_B}"/>','<c:out value="${result.ONLINE_CNT_YEAR1_B}"/>'];
    chart02Data02 = ['<c:out value="${result.ONLINE_ISPASS_YEAR5_B}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR4_B}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR3_B}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR2_B}"/>','<c:out value="${result.ONLINE_ISPASS_YEAR1_B}"/>'];

    if(chart02Data01 == null || chart02Data01.length == 0) chart01Data01 = [0,0,0,0,0];
    if(chart02Data02 == null || chart02Data02.length == 0) chart01Data02 = [0,0,0,0,0];

    var chart02SeriesLabel = [{label : '신청자수'}, {label : '수료자수'}];
    $.jqplot ('chartArea02', [chart02Data01, chart02Data02], $.setMultiBarChartOption03("취급자 교육", chart02Tick, '', chart02SeriesLabel, 0, 20000, true));

});


//검색
function list_page(){
    $("#cPage").val(1);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/compStats.do").submit();
    $("#pform").submit();
}


//페이징
function move_page(cPage){
    $("#cPage").val(cPage);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/compStats.do").submit();
    $("#pform").submit();
}



function compView(comNo){
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/stats/compStatsForm.do").submit();
    $("#comNo").val(comNo);
    $("#pform").submit();
}


//집합과정 년도별 검색
function searchJibStatis(yearVal){
   $("#searchYear").val(yearVal);
   $("#pform").submit();
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">사업장별 수료통계</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/compStatsForm.do" method="post">
    <input type="hidden" name="subcmd" id="subcmd" value="form"/>
    <input type="hidden" name="comNo" id="comNo" value="<c:out value="${REQUEST_DATA.comNo }"/>"/>
    <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchYear" id="searchYear" value="<c:out value="${REQUEST_DATA.searchYear}"/>"/>


<!-- 본문 > 상단 > 검색영역 끝 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <!-- <td align="right"><a href="#" onclick="goExcel();" class="btn down sky">인쇄</a></td> -->
    </tr>
  </tbody>
</table>
<!-- 월별수익통계 -->
<table class="tb table-type1 stats_tb">
    <colgroup>
      <col class="cellc" width="15%">
      <col class="celll" width="35%">
      <col class="cellc" width="15%">
      <col class="celll" width="35%">
    </colgroup>

    <tbody>
    <tr class="rndbg">
        <th>회사명</th><td><c:out value="${result.COMNAME}"/></td><th>사업자번호</th><td><c:out value="${result.BIZNO}"/></td>
    </tr>
    <tr class="rndbg">
        <th>총가입자수</th><td colspan="3" align="center"><c:out value="${result.COMP_EMP_CNT}"/></td>
    </tr>
    <tr>
        <th>온라인과정(수료/신청)</th><td><c:out value="${result.ONLINE_CNT}"/> / <c:out value="${result.ONLINE_ISPASS}"/></td>
        <th>집합과정(대상자/신청)</th><td><c:out value="${result.JIB_CNT}"/> / <c:out value="${result.JIB_TARGET}"/></td>
    </tr>
    </tbody>
</table>

<div class="title title_top">온라인과정</div>


<table class="tb table-type1">
<tr>
    <td style="background-color: #ddd;">
    <div align="center">
        <div id="chartArea01" style="height:200px; width:100%;"></div><!-- 종사자 차트 부분 -->
</div><br/>
</td>
</tr>
</table>

<table class="tb table-type1">
<tr>
    <td style="background-color: #ddd;">
    <div align="center">
        <div id="chartArea02" style="height:200px; width:100%;"></div><!-- 취급자 차트 부분 -->
</div><br/>
</td>
</tr>
</table>


<div class="title title_top selectBoxAlign">집합과정 신청 목록

<select name="searchYear" id="searchYear" title="년도" onchange="javascript:searchJibStatis(this.value);" >
    <option value="0" <c:if test="${REQUEST_DATA.searchYear eq '' or REQUEST_DATA.searchYear eq null}">selected</c:if>>전체</option>
    <c:forEach var="result" items="${yearList}">
    <option value="<c:out value="${result.code}"/>" <c:if test="${REQUEST_DATA.searchYear eq result.code}">selected</c:if>><c:out value="${result.name}"/></option>
    </c:forEach>
</select>

</div>

<table class="tb table-type1 stats_tb">
    <colgroup>
      <col class="cellc" width="30%">
      <col class="celll" width="35%">
      <col class="celll" width="35%">
    </colgroup>
    <tbody>
    <tr>
    <th>교육과정</th><th>신청인원</th><th>대상인원</th>
    </tr>
    <c:if test="${not empty compJibResultList}">
        <c:forEach var="result" items="${compJibResultList}" varStatus="status" begin="0">
        <tr>
            <th><c:out value="${result.SEQ_TITLE}"/></th><td align="center"><c:out value="${result.JIB_CNT}"/></td><td align="center"><c:out value="${result.JIB_TARGET}"/></td>
        </tr>
        </c:forEach>
    </c:if>
    </tbody>
<c:if test="${empty compJibResultList}">
<tr>
<td colspan="3" align="center">목록이 없습니다.</td>
</tr>
</c:if>
</table>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	

