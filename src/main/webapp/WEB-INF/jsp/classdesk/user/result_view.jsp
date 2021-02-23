<%
/****************************************
	system	: ClassDesk > 강사 > 과제
	title	: 과제 목록
	summary	:	
	wdate	: 2015-04-01
	writer	: SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="result"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

<link rel="stylesheet" type="text/css" href="/classdesk/common/jqchart/jquery.jqplot.css" />

<!-- script type="text/javascript" src="/classdesk/common/jqchart/jquery.js"></script -->
<script type="text/javascript" src="/classdesk/common/jqchart/jquery.jqplot.js"></script>
<script type="text/javascript" src="/classdesk/common/jqchart/sangs.chart.js"></script> 

<script type="text/javascript" src="/classdesk/common/jqchart/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/classdesk/common/jqchart/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/classdesk/common/jqchart/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript" src="/classdesk/common/jqchart/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="/classdesk/common/jqchart/plugins/jqplot.cursor.js"></script> 
  <!-- [JQPLOT] 공통 필수 코드 -->
 
 
    
	<!-- //개설과목명 -->
	 <!-- 성적정보 
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">수강생 성적 정보</h3>
	</div>
	-->
	<form id="resultForm" name="resultForm">
	<input type="hidden" name="subcmd" id="subcmd"/>
	<table summary="상상스토리 교육시스템 클래스데스크의 과제 정보입니다." style="width:100%;">
			<colgroup>
				<col width="" />
				<col width="500" /> 
			</colgroup>
			<tr>
				<td style="vertical-align:top;">
					<div class="table-type6" style="margin-top:10px;">
						 <table id="itemList" summary="상상스토리 교육시스템 클래스데스크의 과제 정보입니다.">
							<caption>과제</caption>
							<colgroup>
								<col width="60" />
								<col width="60" />
								<col width="35%" />
								<col width="35%" />
							</colgroup>
							<thead>
								<tr>
				 					<th colspan="2">항목</th>
				 					<th>점수</th>
				 					<th>학습자 평균</th> 
								</tr>
								<tr>
				 					<th colspan="2">
				 						출석(<c:out value="${rowData.EVAL_ATTEND}"  default="0"/>)
				 					</th>
				 					<td><c:out value="${rowData.ATTEND_VAL}" default="0"/></td>
				 					<td><c:out value="${rowData.AVG_ATTEND_VAL}"  default="0"/></td> 
								</tr>
								<tr>
				 					<th colspan="2">
				 						진도(<c:out value="${rowData.EVAL_PROGRESS}" default="0" />)
				 					</th>
				 					<td><c:out value="${rowData.PROGRESS_VAL}" default="0"/></td>
				 					<td><c:out value="${rowData.AVG_PROGRESS_VAL}" default="0"/></td> 
								</tr>
								<tr>
				 					<th colspan="2">
				 						과제(<c:out value="${rowData.EVAL_REPORT}"  default="0"/>)
				 					</th>
				 					<td><c:out value="${rowData.REPORT_VAL}" default="0"/></td>
				 					<td><c:out value="${rowData.AVG_REPORT_VAL}" default="0"/></td> 
								</tr>
								<tr>
				 					<th rowspan="2">
				 						시험
				 					</th>
				 					<th>중간(<c:out value="${rowData.EVAL_EXAM_MT}" default="0"/>)</th>
				 					<td><c:out value="${rowData.EXAM_MT_VAL}" default="0"/></td>
				 					<td><c:out value="${rowData.AVG_EXAM_MT_VAL}" default="0"/></td> 
								</tr>
								<tr>
				 					<th>
				 						최종(<c:out value="${rowData.EVAL_EXAM_FINAL}" default="0" />)
				 					</th>
				 					<td><c:out value="${rowData.EXAM_FINAL_VAL}" default="0"/></td>
				 					<td><c:out value="${rowData.AVG_EXAM_FINAL_VAL}" default="0"/></td> 
								</tr>
								<tr>
				 					<th colspan="2">총점(<c:out value="${ rowData.EVAL_ATTEND + rowData.EVAL_PROGRESS + rowData.EVAL_REPORT + rowData.EVAL_EXAM_MT + rowData.EVAL_EXAM_FINAL }"  default="0"/>)</th>
				 					<td><c:out value="${rowData.FINAL_VAL}" default="0"/></td>
				 					<td><c:out value="${rowData.AVG_FINAL_VAL}" default="0"/></td> 
								</tr>
								
							<!-- 접근성 인증을 위해 각각의 label과 id를 번호화 시켜야함 // 접근은 name으로 할 것 -->
					 
						</table>			
					</div>
				</td>
				<td style="vertical-align:top;">
					<!-- 챠트 출력영역설정 -->
					<div id="chartArea01" style="height:250px; width:100%;"></div>
				</td>
			</tr>
	</table>
	
	
	</form>
	
	<!-- //성적정보 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
 		</div>
	</div>
    
    <%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
    
	<!-- //게시판 버튼영역 -->
	<script type="text/javascript"> 
	/** 챠트 조회처리 */
	$(document).ready(function(){
		
		// (필수) 챠트데이타 : 바수만큼 처리 [<값>,...] 
		var chart01Tick =  ['내점수','학습자 평균','최고점수',];
		var chart01Data =  [<c:out value="${rowData.FINAL_VAL}" />,<c:out value="${rowData.AVG_FINAL_VAL}" />,<c:out value="${rowData.MAX_FINAL_VAL}" />,];
		/* var chart01Tick = [<c:forEach var='result' items="${resultList}" varStatus='status'>"${result.bmtNm}"/>',</c:forEach>];
		var chart01Data = [<c:forEach var='result' items="${resultList}" varStatus='status'><c:out value="${result.cnt}"/>,</c:forEach>]; */

		// (필수) 챠트 rendering 처리
		var chart01 = $.jqplot ('chartArea01', [chart01Data], $.setBarChartOption01(chart01Tick, '점')); 
    
        $('#chartArea01').bind('jqplotDataClick', 
            function (ev, seriesIndex, pointIndex, data) {
                //$('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
            }
        );  
        
	});

	</script> 	 	 