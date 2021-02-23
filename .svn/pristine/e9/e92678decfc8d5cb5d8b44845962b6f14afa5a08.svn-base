<%
/****************************************************
    system	: 통계관리
    title	: 접속통계
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
//월간접속 엑셀다운로드
function goExcel(){
    var frm = document.pForm;
    frm.target = "";
    $("input[name='listType']").val('EXCEL_MONTH');
	$("form[name='pform']").attr("action", "/admin/stats/accessStats.do").submit();
    frm.submit();
}


//일간접속 엑셀다운로드
function goExcel2(){
    var frm = document.pForm;
    frm.target = "";
    $("input[name='listType']").val('EXCEL_DAY');
	$("form[name='pform']").attr("action", "/admin/stats/accessStats.do").submit();
    frm.submit();
}
//검색
function goStats(){
    var frm = document.pForm;
    frm.target="";
    $("input[name='listType']").val('LIST');
    frm.submit();
}
</script>

<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){

    //월별 챠트 조회처리
    var chart01Tick = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
    var chart01Data01;
    var chart01Data02;
    <c:forEach var="monthMap" items="${accesslogMonthList}" varStatus="status">
        <c:if test="${monthMap.ACCES_YEAR == REQUEST_DATA.prevAccessYear}">
            chart01Data01 = ['${monthMap.ACCES_MONTH1}', '${monthMap.ACCES_MONTH2}', '${monthMap.ACCES_MONTH3}', '${monthMap.ACCES_MONTH4}',
                             '${monthMap.ACCES_MONTH5}', '${monthMap.ACCES_MONTH6}', '${monthMap.ACCES_MONTH7}', '${monthMap.ACCES_MONTH8}',
                             '${monthMap.ACCES_MONTH9}', '${monthMap.ACCES_MONTH10}', '${monthMap.ACCES_MONTH11}', '${monthMap.ACCES_MONTH12}'
                             ];

        </c:if>

        <c:if test="${monthMap.ACCES_YEAR == REQUEST_DATA.accessYear}">
            chart01Data02 = ['${monthMap.ACCES_MONTH1}', '${monthMap.ACCES_MONTH2}', '${monthMap.ACCES_MONTH3}', '${monthMap.ACCES_MONTH4}',
                             '${monthMap.ACCES_MONTH5}', '${monthMap.ACCES_MONTH6}', '${monthMap.ACCES_MONTH7}', '${monthMap.ACCES_MONTH8}',
                             '${monthMap.ACCES_MONTH9}', '${monthMap.ACCES_MONTH10}', '${monthMap.ACCES_MONTH11}', '${monthMap.ACCES_MONTH12}'
                            ];
        </c:if>
    </c:forEach>

    if(chart01Data01 == null || chart01Data01.length == 0) chart01Data01 = [0,0,0,0,0,0,0,0,0,0,0,0];
    if(chart01Data02 == null || chart01Data02.length == 0) chart01Data02 = [0,0,0,0,0,0,0,0,0,0,0,0];

    var chart01SeriesLabel = [{label : '전년도'}, {label : '기준년도'}];
    $.jqplot ('chartArea01', [chart01Data01, chart01Data02], $.setMultiBarChartOption03("", chart01Tick, '', chart01SeriesLabel, 0, 100000, false));


    // 일별
    <c:if test="${fn:length(accesslogDayList)> 0}">
        var chart02Tick = [
			<c:forEach var="dayMap" items="${accesslogDayList}" varStatus="status">
					'${dayMap.ACCES_DAY}일',
             </c:forEach>
        ];

        var chart02Data = [
					<c:forEach var="dayMap" items="${accesslogDayList}" varStatus="status">
					'${dayMap.CNT}',
					</c:forEach>
                    ];

        if(chart02Data != null && chart02Data.length !=0 )
            $.jqplot ('chartArea02', [chart02Data], $.setBarChartOption01(chart02Tick, '',0, 7000));

   </c:if>
});
//]]>
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">접속 통계</div>


<form name="pForm" id="pForm" action="/admin/stats/accessStats.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td align="right"><a href="#" onclick="goExcel();" class="btn down sky">엑셀다운</a></td>
    </tr>
  </tbody>
</table>
<table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
         <tbody>
          <tr>
              <th>월간 접속현황</th>
            <td>

                <select name="year" id="year" title="연도" onchange="goStats();" >
                	<c:forEach items="${accesslogYearForCombo}" var="emap" varStatus="stat">
                       <option value="<c:out value="${emap.ACCES_YEAR}"/>" <c:if test="${REQUEST_DATA.year == emap.ACCES_YEAR}"> selected="selected"</c:if>><c:out value="${emap.ACCES_YEAR}"/></option>
                    </c:forEach>
                 </select>
            </td>
          </tr>
        </tbody>
</table>

<div class="space5"></div>

<table class="tb table-type1 stats_tb">
    <colgroup>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
        <col style="width:5%"/>
    </colgroup>
    <tr class="rndbg">
        <th>연도</th>
        <th>1월</th><th>2월</th><th>3월</th><th>4월</th><th>5월</th><th>6월</th><th>7월</th><th>8월</th><th>9월</th><th>10월</th><th>11월</th><th>12월</th><th>합계</th>
    </tr>
    <c:forEach var="monthMap" items="${accesslogMonthList}" varStatus="status">
    <tr>
        <th><c:out value="${monthMap.ACCES_YEAR}"/></th>
        <td align="right"><c:set var="month1"><c:out value="${monthMap.ACCES_MONTH1}"/></c:set><fmt:formatNumber value="${month1}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month2"><c:out value="${monthMap.ACCES_MONTH2}"/></c:set><fmt:formatNumber value="${month2}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month3"><c:out value="${monthMap.ACCES_MONTH3}"/></c:set><fmt:formatNumber value="${month3}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month4"><c:out value="${monthMap.ACCES_MONTH4}"/></c:set><fmt:formatNumber value="${month4}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month5"><c:out value="${monthMap.ACCES_MONTH5}"/></c:set><fmt:formatNumber value="${month5}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month6"><c:out value="${monthMap.ACCES_MONTH6}"/></c:set><fmt:formatNumber value="${month6}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month7"><c:out value="${monthMap.ACCES_MONTH7}"/></c:set><fmt:formatNumber value="${month7}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month8"><c:out value="${monthMap.ACCES_MONTH8}"/></c:set><fmt:formatNumber value="${month8}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month9"><c:out value="${monthMap.ACCES_MONTH9}"/></c:set><fmt:formatNumber value="${month9}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month10"><c:out value="${monthMap.ACCES_MONTH10}"/></c:set><fmt:formatNumber value="${month10}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month11"><c:out value="${monthMap.ACCES_MONTH11}"/></c:set><fmt:formatNumber value="${month11}" type="number" groupingUsed="true" /></td>
        <td align="right"><c:set var="month12"><c:out value="${monthMap.ACCES_MONTH12}"/></c:set><fmt:formatNumber value="${month12}" type="number" groupingUsed="true" /></td>
        <td align="right">
            <c:set var="total">${month1+month2+month3+month4+month5+month6+month7+month8+month9+month10+month11+month12}</c:set>
            <fmt:formatNumber value="${total}" type="number" groupingUsed="true" />
        </td>
    </tr>
   </c:forEach>
</table>
<div class="space5"></div>

<table class="tb table-type1">
    <tr>
        <td style="background-color: #ddd;">
            <div align="center">
                <div id="chartArea01" style="height:200px; width:100%;"></div>
            </div><br/>
        </td>
    </tr>
</table>

<div class="space"></div>
<div class="space"></div>
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td align="right"><a href="#" onclick="goExcel2();" class="btn down sky">엑셀다운</a></td>
    </tr>
  </tbody>
</table>
<table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
         <tbody>
          <tr>
              <th>일별 접속현황</th>
            <td>

                <select name="month" id="month" title="월별" onchange="goStats();" >
                	<c:forEach begin="1" end="12" step="1" var="m">
	                    <option value="<c:out value="${m}"/>" <c:if test="${REQUEST_DATA.month == m}"> selected="selected"</c:if>><c:out value="${m}"/>월</option>
	                </c:forEach>
                 </select>
            </td>
          </tr>
        </tbody>
</table>

<div class="space5"></div>

<table class="tb table-type1 stats_tb">
    <colgroup>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
        <col align=middle>
    </colgroup>
    <tr>
    <c:set var="total_cnt" value="0"/>
    	<c:forEach var="dayMap" items="${accesslogDayList}" varStatus="status">
     		<c:set var="total_cnt" value="${total_cnt + dayMap.CNT}"/>
    		<th><c:out value="${dayMap.ACCES_DAY}"/>일</th>
		    <td align="right">
		        <c:out value="${dayMap.CNT}"/>
		    </td>
    <c:if test="${(status.index+1)%10 == 0}"></tr><tr></c:if>
    </c:forEach>
    <th>합계</th>
    <td align="right">
        <c:set var="total" value="${total_cnt}"/>
        <fmt:formatNumber value="${total}" type="number"/>
    </td>
    </tr>
</table> 

<div class="space5"></div>

<table class="tb table-type1">
    <tr>
        <td style="background-color: #ddd;">
            <div align="center">
                <div id="chartArea02" style="height:200px; width:100%;"></div>
            </div><br/>
        </td>
    </tr>
</table>
</form>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	