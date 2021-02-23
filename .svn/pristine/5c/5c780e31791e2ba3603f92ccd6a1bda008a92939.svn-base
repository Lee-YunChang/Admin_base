<%
/****************************************
	system	: ClassDesk > 강사 > 설문 리스트
	title	: 설문 메인
	summary	: 
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

<style>
	.hGraph ul{ margin:0 50px 0 50px; padding:1px 0 0 0; border:1px solid #ddd; border-top:0; border-right:0; font-size:11px; font-family:Tahoma, Geneva, sans-serif; list-style:none;}
	.hGraph li{ position:relative; margin:10px 0; white-space:nowrap; vertical-align:top;}
	.more2 { display: none; border:solid 1px #ddd;background:#e6eed1; }
	.more { display: none; }
	
	#answerTd{max-width: 800px;text-overflow: ellipsis;white-space: nowrap;display: block;overflow: hidden}
</style>
<script type="text/javascript">
$( document ).ready(function() {
	/* 객관식 통계 */
	var cntQno = new Array;
	var cntItem = new Array;
	var cnt = new Array;
	var jbbaQno = new Array;
	
	$(".cntQno").each(function(i, val) {//통계용 수치(문항 번호)
		cntQno.push($(this).val());
	});
	
	$(".cntItem").each(function(i, val) {//통계용 수치(문항 보기 번호)
		cntItem.push($(this).val());
	});
	
	$(".cnt").each(function(i, val) {//통계용 수치(답변 번호)
		cnt.push($(this).val());
	});
	
	$(".jbbaQno").each(function(i, val) {//설문지 객관식 문항 번호
		jbbaQno.push($(this).val());
	});
	
	var totalCnt = $("#totalCnt").val();//총 응답자 수 
	
	/* 객관식 문항 보기 통계 */
	for(var i = 0 ; i < cntQno.length ; i++) {
		for(var j = 0 ; j < jbbaQno.length ; j++) {
			if(cntQno[i]==jbbaQno[j]){
				var result = cnt[i]/totalCnt * 100;
				result = Math.round(result);
 				document.getElementById(cntQno[i]+cntItem[i]+2).innerHTML = cnt[i]+'명 ('+result+'%)';
				document.getElementById(cntQno[i]+cntItem[i]).style.width = result+'%';
			}
		}
	}
	
	/* 주관식 답안 No 추출 */
	$(".answerTable").each(function(i, val) { 
		$(this).find(".org").find(".answer").each(function(i, val) { 
			i++;
			$(this).html(i);
		});
	});
	
});

function fnAnsPop(pollsceqno,qno){
	var frm= document.form;
    frm.target = 'hiddenSaveFrame';  // hidden frame 에 submit

    var form = $("#form").serialize();

    $("#form").attr("action", "/classdesk/tutor/poll/poll_answer_pop.do");
    $("#pollcSeqNo").val(pollsceqno);
    $("#qNo").val(qno);
     window.open("", "poll_answer_pop", "width="+1000+" height="+600); 
    $("#form").attr("target", "poll_answer_pop");
    $("#form").submit();
}

function fnList() {
	$('#form').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/poll/list.do').submit();
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div id="Right_Area" >
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">설문 통계</h3>
	</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="form" action="/classdesk/tutor/poll/exec.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" id="pollcseqno" name="pollcseqno" value="<c:out value="${surveyInfo.POLLCSEQNO}"/>"/>
    <input type="hidden" id="qu" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
	<input type="hidden" id="pollcseqno2" name="pollcseqno2" value="<c:out value="${REQUEST_DATA.pollcseqno2}"/>"/>
	<input type="hidden" id="pageMode" name="pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
	<input type="hidden" id="cnt" name="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>"/>
	<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}"/>
	<!--주관식 답변보기 파라미터 -->
	<input type="hidden" name="qNo" id="qNo" value=""/>
	<input type="hidden" name="pollcSeqNo" id="pollcSeqNo" value=""/>
	

<div class="table-type3" style="padding-top: 10px;">
	<table>
		<colgroup>
			<col style="width:15%;" />
			<col style="width:35%;" />
			<col style="width:15%;" />
			<col style="width:35%;" />
		</colgroup>
		<tbody>
			<tr>
				<th>설문명</th>
				<td>
					<c:out value="${surveyInfo.TITLE}"/>
				</td>
				<th>작성자</th>
				<td><c:out value="${surveyInfo.WRITER}"/></td>
			</tr>
			<tr>
				<th>설문기간</th>
				<td>
					<c:out value="${surveyInfo.SDATE}"/>
					~
					<c:out value="${surveyInfo.EDATE}"/>
				</td>
				<th>응답수</th> 
				<td><input type='hidden' id='totalCnt' value='<c:out value="${surveyInfo.CNT}"/>'/><c:out value="${surveyInfo.CNT}"/>/<c:out value="${surveyInfo.TOTALMEMBER}"/></td>
			</tr>
			<tr>
				<th>설문설명</th>
				<td colspan="3">
					<c:out value="${surveyInfo.SUMMARY}"/>
				</td>
			</tr>
		</tbody> 
	</table>
</div>
	<c:forEach var="getPollCnt" items="${getPollCnt }" varStatus="status">
		<input type="hidden" id="cntQno" value="${getPollCnt.QNO}" class='cntQno'/>
		<input type="hidden" id="cntItem" value="${getPollCnt.ITEMSEQ}" class='cntItem'/>
		<input type="hidden" id="cnt" value="${getPollCnt.CNT}" class='cnt'/>
	</c:forEach>
	 
	</br>
	<div align='right' class="btn-group">
		<a class="btn-large-green excelDown"><span>엑셀다운로드</span></a>
		<a href="#none" onclick="fnList(); return false;" class="btn-large-orange"><span class="orange">이전</span></a>
	</div>
	
	<div id='table'>
		<c:forEach var="moduleList" items="${moduleList}" varStatus="moduleStatus">
		
		</br></br>
		<font style='font-weight:bold;font-size:15px'><<c:out value='${moduleList.CPOLL_TITLE}'/>></font>
		</br></br>
		
			<ol style='-webkit-margin-start:1em;list-style:decimal'> 
			
				<c:forEach var="questionList" items="${questionList}" varStatus="status">
				
				<c:if test="${moduleList.CPOLL_TITLE == questionList.CPOLL_TITLE}">
				
					<div id='questions'>
						
						<div class='question' id='question' name='question'> </br>
						
							<!-- 객관식 -->
							<c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}"><input type='hidden' class='jbbaQno' value="<c:out value='${questionList.QNO}'/>"/> 
							<input type='hidden' id='qno' name='qno' value="<c:out value='${questionList.QNO}'/>"/>
							<li style='list-style:decimal'>질문 : 
								<c:if test="${not empty questionList.TUTORNM}">&nbsp;[<c:out value='${questionList.PERIOD}'/>교시 <c:out value='${questionList.TUTORNM}'/>]</c:if>
								<c:out value='${questionList.SUBJECT}'/><c:if test="${questionList.DOUBLE_AT eq 'Y'}">(복수응답)</c:if>
								<%-- &nbsp;&nbsp;(응답평균 : ${questionList.AVG_VAL}점) --%>
							</li>
								
								<div id='itemsMenu' style='display: block;'>
									<ol id='items'style='list-style:decimal;-webkit-margin-start: 1em;' class='hGraph' >
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<c:if test="${questionList.QNO == resultList.QNO}">
											<c:if test="${resultList.ITEM_SUBJECT != null && resultList.ITEM_SUBJECT != ''}">
												<!-- 보기 -->
												<li id='item' value="<c:out value='${resultList.ITEMNO}'/>">
													${resultList.ITEMNO }.&nbsp;<c:out value='${resultList.ITEM_SUBJECT}'/> </br>
												</li>
												<!-- 막대그래프 -->
												<li> 
													<!-- 진도율 게이지 표시 : class="gauge"의 width값으로 조절 -->
													<div class="progress-bar">
													<div class="progress-in">
														<span><div id="${questionList.QNO}${resultList.ITEMNO}2">0%</div></span>
														<div class="gauge"  id="${questionList.QNO}${resultList.ITEMNO }" style="width:0%; font-weight:bold;text-align:center;"></div>
													</div>
													</div>
												</li>
											</c:if>
											</c:if>
										</c:forEach>
									</ol>
								</div></br>
							</c:if>
							<!-- 주관식 -->
							<c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">
								<input type='hidden' class='jbaaQno'  value="<c:out value='${questionList.QNO}'/>"/> 
								<input type='hidden' id='qno' name='qno' value="<c:out value='${questionList.QNO}'/>"/>
								<li style='list-style:decimal'>
								<div>
									질문 : <c:if test="${not empty questionList.TUTORNM}">&nbsp;[<c:out value='${questionList.PERIOD}'/>교시 <c:out value='${questionList.TUTORNM}'/>]</c:if><c:out value='${questionList.SUBJECT}'/> 
									<a a href="#none" onclick="fnAnsPop('${questionList.POLLCSEQNO}','<c:out value='${questionList.QNO}'/>'); return false;" id="addQuestion" class="btn-large-green" class="btn-small-orange openAnswer"><span>답변보기</span></a>
									<!-- 주관식 답변 테이블 -->
									<%-- <div class='more'></br>
											<table>
												<colgroup>
													<col style="width: 10%;" />
													<col style="width: 20%" />
													<col style="width: 70%;" />
												</colgroup>	
												<thead>
													<tr  align='center' class="rndbg">
														<th>No</th>
														<th>아이디</th>
														<th colspan='2'>내용</th>
													</tr>
												</thead>
												<tbody class='answerTable'  align='center'>
													<c:if test="${not empty getPollAnswer}">
														<c:forEach var="getPollAnswer" items="${getPollAnswer}" varStatus="answerStat">
															<c:if test="${questionList.QNO == getPollAnswer.QNO}">
																<tr class='org'>
																	<td class='answer'></td>
																	<td><c:out value='${getPollAnswer.USERID}'/></td>
																	<td  id='answerTd' style='text-align:center'><c:out value='${getPollAnswer.ANSWER}'/></td>
																	<td><a class="btn-small-orange openDetail" check="test"><span>v</span></a>
																	<tr><td class="more2" colspan='4' style='text-align:center'><c:out value='${getPollAnswer.ANSWER}'/></td></tr>
																</tr>
															</c:if>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
									</div> --%>
									<!-- //주관식 답변 테이블 -->
					 			</div>
					 			</li>
							</c:if>
							<!-- //주관식 -->
						</div>
					</div>
				</c:if>
				</c:forEach>
			</ol>
		</div>
		</c:forEach>
	</div>
</form>
<script>
$('.openAnswer').click(function(){
	var more = $(this).next("div");
	more.toggle();
});

$('.openDetail').click(function(){
// 	var test = $(":input[type=button]").attr("check").value;
	var more = $(this).closest("tr").next("tr").find(".more2");
	more.toggle();
});
$('.excelDown').click(function(){
	$("#form").attr("target", "");
	$("form[name='form']").attr("method", "post").attr("action", "/classdesk/tutor/poll/poll_excel.do").submit();
	
});
</script>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>