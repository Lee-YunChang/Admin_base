<%
/*********************************************************
system 	: jqChart
title	: 바챠트(barTest)
**********************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- [JQPLOT] 공통 필수 코드 -->
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="../jqplotModule/excanvas.js"></script><![endif]-->
<script type="text/javascript" src="../jqplotModule/jquery.js"></script>
<script type="text/javascript" src="../jqplotModule/jquery.jqplot.js"></script>
<link rel="stylesheet" type="text/css" href="../jqplotModule/jquery.jqplot.css" /> 
<script type="text/javascript" src="../jqplotModule/sangs.chart.js"></script> <!-- 챠트 유형별 option 함수 정의 -->

<!-- 
[JQPLOT] 차트유형별 필수 코드
- barChart : plugins/jqplot.barRenderer.js, plugins/jqplot.categoryAxisRenderer.js, plugins/sangs.barRenderer.js
 -->
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.cursor.js"></script>


<!-- 예제 소스코드 뷰어 관련 코드 -->
<link rel="stylesheet" type="text/css" href="../jqplotModule/examples.css" />
<link type="text/css" rel="stylesheet" href="../jqplotModule/syntaxhighlighter/styles/shCoreDefault.min.css" />
<link type="text/css" rel="stylesheet" href="../jqplotModule/syntaxhighlighter/styles/shThemejqPlot.min.css" />
<script type="text/javascript" src="../jqplotModule/syntaxhighlighter/scripts/shCore.min.js"></script>
<script type="text/javascript" src="../jqplotModule/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
<script type="text/javascript" src="../jqplotModule/syntaxhighlighter/scripts/shBrushXml.min.js"></script>
<script type="text/javascript" src="../jqplotModule/example.js"></script>

</head>
<body> 


<!-- 챠트 출력영역설정 -->
<div id="chartArea01" style="height:400px; width:700px;"></div>
<pre class="code brush: js"></pre>


<script class="code" type="text/javascript"> 

/**
 * 챠트 조회처리 
 */
$(document).ready(function(){
	
	// (선택) 챠트 상단 타이틀명
	var chart01Title = '장비수선통계현황(2013년도)';
	// (필수) 챠트 출력 html id
	var chart01Id = 'chartArea01';
	// (필수) 챠트데이타 : 바수만큼 처리 [<값>,...] 
	var chart01Data01 = [80, 60, 20, 30, 220, 10, 30, 90, 120, 50, 160, 200]; 
	
	// (필수) bar 항목라벨 정의 : 바수만큼 등록 ex)[{label : '항목명'}, ...];
	var chart01SerLabel = '';
	
	// (필수) x축 항목정의 : data 항목수와 동일하게 처리
	var chart01TicksLabel = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	// (선택) x축 라벨
	var chart01XLabel = '';
	// (선택) y축 라벨
 	var chart01YLabel = '';
	// (필수) 챠트 rendering 처리
	var chart01 = $.jqplot (chart01Id, [chart01Data01], 
			$.setBarChartOptions(chart01Title, chart01SerLabel, chart01TicksLabel, chart01XLabel, chart01YLabel) );


});
</script>

</body>
</html>