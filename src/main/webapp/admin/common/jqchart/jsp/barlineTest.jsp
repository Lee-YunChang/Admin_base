<%
/*********************************************************
system 	: jqChart
title	: 바챠트+라인챠트(barTest)
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
 -->
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.cursor.js"></script>
<script type="text/javascript" src="../jqplotModule/plugins/jqplot.pointLabels.js"></script>

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
	
	// (필수) 챠트데이타(BAR) : [[X축값, Y축값], ...]
	var chart01DataBar = [[2002, 10200], [2003, 10800], [2004, 11200], [2005, 11800], [2006, 12400],      
	                     [2007, 12800], [2008, 13200], [2009, 12600], [2010, 13100]]; 
	
	// (필수) 챠트데이타(LINE) : [[X축값, Y축값], ...]
	var chart01DataLine = [[2002, 112000], [2003, 122000], [2004, 104000], [2005, 99000], [2006, 121000],      
	                     [2007, 148000], [2008, 114000], [2009, 133000], [2010, 161000], [2011, 173000]];     
	
	// (선택) X축 라벨
	var chart01XLabel = "월별추이";
	// (선택) Y축 라벨(BAR)
	var chart01YLabel = "월별 전기사용금액";
	// (선택) Y축 라벨(LINE)
	var chart01Y2Label = "월별 수도사용금액";
	
	// (필수) 챠트 rendering 처리 (setBarLineChartOptions()--> sangs.chart.js)
	var chart01 = $.jqplot (chart01Id, [chart01DataBar, chart01DataLine], 
			$.setBarLineChartOptions(chart01Title, chart01XLabel, chart01YLabel, chart01Y2Label) );


});
</script>

<!-- 
[JQPLOT] 차트유형별 필수 코드
 -->
<script type="text/javascript" src="../jqplotModule/syntaxhighlighter/scripts/shCore.min.js"></script>
<script type="text/javascript" src="../jqplotModule/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
<script type="text/javascript" src="../jqplotModule/syntaxhighlighter/scripts/shBrushXml.min.js"></script>



</body>
</html>