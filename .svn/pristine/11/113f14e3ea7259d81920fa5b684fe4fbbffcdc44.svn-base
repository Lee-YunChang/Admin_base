<%
/*********************************************************
system 	: jqChart
title	: 원형그래프(pitTest)
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
- pieChart : plugins/jqplot.pieRenderer.js, plugins/sangs.pieRenderer.js
 -->
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.pieRenderer.js"></script>


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
<div id="chartArea01" style="height:400px; width:400px;"></div>
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
	// (필수) 챠트데이타 : [[<항목명>, <값>],...] 
	var chart01Data = [['법정관리', 57.44],['수선관리',20.55], ['일상관리', 10.44], ['하자관리', 19.00]];
	// (필수) 챠트 rendering 실행 (setBarLineChartOptions()--> sangs.chart.js)
	var chart01 = $.jqplot (chart01Id, [chart01Data], $.setPieChartOptions(chart01Title) );

});
</script>

</body>
</html>