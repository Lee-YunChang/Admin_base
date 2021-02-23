<%
/****************************************
	system	: ClassDesk > 강사 > 시험
	title	: 시험 채점 폼
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="test"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %>

	<!-- 시험정보 -->
	<div>
		<div class="round-box beige">
			<!-- 시험정보 테이블 영역 -->
			<div class="table-type3">
				<table>
					<caption>시험정보</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>시험명</th>
							<td colspan="3"><c:out value="${listData[0].TITLE}"/></td>
						</tr>
						<tr>
							<th>응시자</th>
							<td colspan="3"><c:out value="${listData[0].USERNAME}"/></td>
						</tr>
					 	<tr>
							<%-- <th>시험유형</th>
							<td><c:out value="${listData[0].EXAM_TYPE_NM}"/> </td> --%>
							<th>배점</th>
							<td colspan="3"><c:out value="${listData[0].EVAL}"/> </td>
						</tr> 
					</tbody>
				</table>
			</div>
			<!-- //시험정보 테이블 영역 -->
		</div>
	</div>
	<!-- //시험정보 -->
	<!-- 시험문제 -->


	<form name="listFrm" id="listFrm">
		<input type="hidden" name="subcmd">
		<input type="hidden" name="examNo">
	</form>
	
	<div class="mg-t18 clearfix" style="position:relative;">
		<form id="markingForm" name="markingForm">
		<input type="hidden" name="sumVal" id="sumVal">	
		<input type="hidden" name="examNo" id="examNo" value="<c:out value="${listData[0].EXAMNO}" />" >
		<input type="hidden" name="cUserNo" id="cUserNo" value="<c:out value="${listData[0].CUSERNO}" />" >
		<!-- 시험문제 리스트 -->
		<c:choose>
			<c:when test="${not empty listData}">
				<div class="exam-list">
					<!-- 각 문항별로 name은 같아야함. 문항의 정답별로 label과 id값이 달라야함 -->
					<!-- 접근성 인증을 위해 각 문항별 정답별로 아이디는 전부 다르게 설정해줄 것 // 한 html 파일 내에 같은 id값이 존재해서는 안됨 -->
					
					<c:forEach items="${listData}" var="result" varStatus="stat">
                    
					<dl>
						<dt>
							<div>
								<c:if test="${result.RCODE eq result.ITEMSEQ}"><img src="/classdesk/images/ico_true.png" alt="정답" class="exam_check_ico" /></c:if>
								<c:if test="${result.RCODE ne result.ITEMSEQ}"><img src="/classdesk/images/ico_false.png" alt="오답" class="exam_check_ico" /> </c:if>
								<!-- 오답일 경우 <img src="/classdesk/images/ico_false.png" alt="오답" class="exam_check_ico" /> -->
								<pre style="white-space: pre-wrap;"><c:out value="${stat.count}"/>. <c:out value="${fn:replace(result.QSUBJECT, crlf, '<br />')}" escapeXml="false"/></pre>
								<c:if test="${not empty result.QSUBJECT_FILE}">
									<%-- <br><img alt="" style="padding-top: 10px;" src="<c:out value="${FILEROOTURL}${result.QSUBJECT_FILE}"/>"> --%>
									<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
								</c:if>
							</div>
						</dt>
						
						<input type="hidden" name="qSeq" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QSEQ}" />" />
						
						<!-- 주관식 단답형/서술형-->
						<c:if test="${result.QTYPE == 4 || result.QTYPE == 5}">
								<dd style="color: <c:choose>
									<c:when test="${result.ISRIGHT eq 'N' }">red</c:when>
									<c:otherwise >blue</c:otherwise>
								</c:choose>
										;" >
								<pre style="white-space: pre-wrap;">정답 : <c:out value="${fn:replace(result.RTEXT, crlf, '<br />')}" escapeXml="false"/></pre>
								</dd>
						</c:if>
				
				
					
					<!-- OX , 객관식  -->
						<c:if test="${result.QTYPE == 1  || result.QTYPE == 2 }">
							<!-- 답이 길어질 경우 정렬 문제를 고려하여 텍스트 부분에 blockquote 적용 // 시험 볼때만 해당 -->
							<!-- 정답은 class="txt_true" // 오답은 class="txt_false" , 오답에 정답 표시는 class="txt_true2" -->
							<!-- 보기 1번 시작  -->
							<c:if test="${not empty result.A01 || not empty result.A01_FILE}">
								<dd> 
									<blockquote 
										<c:choose>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.ITEMSEQ == 1}">	class="txt_false"	</c:when>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.RCODE == 1}">	class="txt_true2"	</c:when>
											<c:when test="${result.RCODE eq result.ITEMSEQ && result.ITEMSEQ == 1}"> class="txt_true"	</c:when>
										</c:choose>
									>
										<span class="exam-num">1)</span> <pre class="exam-txt" style="margin-left:5px;"><c:out value="${result.A01 }" /></pre>
									</blockquote>
									<c:if test="${not empty result.A01_FILE}">
										<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A01_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
									</c:if>
								</dd>
							</c:if>
								
							<!-- 보기2번 시작  -->
							<c:if test="${not empty result.A02 || not empty result.A02_FILE}">
								<dd>
									<blockquote 
										<c:choose>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.ITEMSEQ == 2}">	class="txt_false"	</c:when>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.RCODE == 2}">	class="txt_true2"	</c:when>
											<c:when test="${result.RCODE eq result.ITEMSEQ && result.ITEMSEQ == 2}"> class="txt_true"	</c:when>
										</c:choose>
									>
										<span class="exam-num">2)</span> <pre class="exam-txt" style="margin-left:5px;"><c:out value="${result.A02 }" /></pre>
									</blockquote>
									<c:if test="${not empty result.A02_FILE}">
										<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A02_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
									</c:if>
								</dd>
							</c:if>
								
							<!-- 보기3번 시작  -->
							<c:if test="${not empty result.A03 || not empty result.A03_FILE}">
								<dd> 
									<blockquote 
										<c:choose>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.ITEMSEQ == 3}">	class="txt_false"	</c:when>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.RCODE == 3}">	class="txt_true2"	</c:when>
											<c:when test="${result.RCODE eq result.ITEMSEQ && result.ITEMSEQ == 3}"> class="txt_true"	</c:when>
										</c:choose>
									>
										<span class="exam-num">3)</span> <pre class="exam-txt" style="margin-left:5px;"><c:out value="${result.A03 }" /></pre>
									</blockquote>
									<c:if test="${not empty result.A03_FILE}">
										<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A03_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
									</c:if>
								</dd>
							</c:if>
							
							<!-- 보기4번 시작  -->
							<c:if test="${not empty result.A04 || not empty result.A04_FILE}">
								<dd>
									<blockquote 
										<c:choose>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.ITEMSEQ == 4}">	class="txt_false"	</c:when>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.RCODE == 4}">	class="txt_true2"	</c:when>
											<c:when test="${result.RCODE eq result.ITEMSEQ && result.ITEMSEQ == 4}"> class="txt_true"	</c:when>
										</c:choose>
									>
										<span class="exam-num">4)</span> <pre class="exam-txt" style="margin-left:5px;"><c:out value="${result.A04 }" /></pre>
									</blockquote>
									<c:if test="${not empty result.A04_FILE}">
										<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A04_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
									</c:if>
								</dd>
							</c:if>
													
							<!-- 보기5번 시작  -->
							<c:if test="${not empty result.A05 || not empty result.A05_FILE}">
								<dd>
									<blockquote 
										<c:choose>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.ITEMSEQ == 5}">	class="txt_false"	</c:when>
											<c:when test="${result.RCODE ne result.ITEMSEQ && result.RCODE == 5}">	class="txt_true2"	</c:when>
											<c:when test="${result.RCODE eq result.ITEMSEQ && result.ITEMSEQ == 5}"> class="txt_true"	</c:when>
										</c:choose>
									>
										<span class="exam-num">5)</span> <pre class="exam-txt" style="margin-left:5px;"><c:out value="${result.A05 }" /></pre>
									</blockquote>
									<c:if test="${not empty result.A05_FILE}">
										<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A05_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
									</c:if>
								</dd>
							</c:if>
						</c:if>
						
						<c:if test="${result.QTYPE == 4  || result.QTYPE == 5 }">
							<dd>
								<pre style="white-space: pre-wrap;"><c:out value="${fn:replace(result.ANSWER, crlf, '<br />')}" escapeXml="false"/></pre>
							</dd>
						</c:if>
						
						<!-- 정답/오답 점수입력 영역 -->
						<dd>
							<input type="radio" name="isRight<c:out value="${stat.index}"/>" id="isRight<c:out value="${stat.index}"/>" class="mid" value="Y" <c:if test="${result.RCODE eq result.ITEMSEQ}"> checked="checked" </c:if>/><label for="true-answer1" class="visible">정답</label>
							<input type="radio" name="isRight<c:out value="${stat.index}"/>" id="isRight<c:out value="${stat.index}"/>" class="mid" value="N" <c:if test="${result.RCODE ne result.ITEMSEQ}"> checked="checked" </c:if>/><label for="false-answer1" class="visible">오답</label>
							<strong>점수입력</strong> <label for="score-write1">점수입력</label>
							<input type="text" class="w5" name="val<c:out value="${stat.index}"/>" id="val<c:out value="${stat.index}"/>" value="<c:out value="${result.VAL}"/>" onkeyup="lfn_keychk(this);"   maxlength="3" style="ime-mode:disabled" />
							
							<span style="margin-left: 5px;"> / <strong style="color: red;"><c:out value="${result.T_ALLOT}" default="0" /></strong></span>
							
						</dd>
						<!-- 정답/오답 점수입력 영역 -->
					</dl>
					 
					</c:forEach>
				</div>
			</c:when>
		</c:choose>
		
		<!-- //시험문제 리스트 -->
		<!-- 답안지 -->
		<div class="table-type4 marking">
			<table id="ansList" >
				<caption>답안지</caption>
				<colgroup>
					<col width="33%" />
					<col width="33%" />
					<col width="34%" />
				</colgroup>
				<thead>
					<tr>
						<th>문제</th>
						<th>정답여부</th>
						<th>점수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listData}" var="ansVal" varStatus="stat">
					<tr>
						<td><a href="#none" onclick="showScrollTop('<c:out value="${stat.index}"/>'); return false;" ><c:out value="${stat.count}"/></a></td>
						<td id="ans_<c:out value="${stat.index}"/>">
						<c:choose>
								<c:when test="${ansVal.RCODE eq ansVal.ITEMSEQ}"><span class="blue_b">O</span></c:when>
								<c:otherwise><span class="red_b">X</span></c:otherwise>
							</c:choose>
						</td>
						<td id="val_<c:out value="${stat.index}"/>"><c:out value="${ansVal.VAL }" default="0" /></td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><strong>총점</strong></td>
						<td id="sumArea"  class="red_b"><c:out value="${listData[0].SUM_VAL}" default="0" /></td>
					
					</tr>
				</tfoot>
			</table>
		</div>
		<!-- //답안지 -->
		</form>
	  
	</div>

	<!-- //시험문제 -->
	<!-- 게시판 버튼영역 -->
	
	<div style="font-weight:bold; color:#f05a00; "> 총점은 <span id="viewTotal" name="viewTotal"><c:out value="${listData[0].SUM_VAL}" default="0" /></span>점 입니다.</div>
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-orange"><span class="orange">이전</span></a>
 			<a href="#none" onclick="fnSave(); return false;" class="btn-large-blue"><span>채점완료</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	<style>
	 #quickmenu {position:absolute; left:50%; top:10px; width:13%; margin-left:35%; } 
	</style>
	<script type="text/javascript">
	
	$(document).ready(function(e){
		
		$(window).scroll(function() {
			var currentTop = -250;
			
			if($(window).scrollTop() < 275 ){
				currentTop =  10;//parseInt($("#quickmenu").css("top"));
			}
		});
	});
	
	// 이전버튼
	function fnList() {
		$('#markingForm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/exam/user_list.do').submit();
	}
	
	 /**************************************************
	 함수명 : dynamicValSummary
	 설 명 : 시험 점수 합계구하기 
	***************************************************/	
	function dynamicValSummary(){
		var sumVal = 0;
		
		$("#ansList tbody tr").each(function(i){
			 sumVal += Number($(this).find("td").eq(2).html());
		});
		 
		$("#sumArea").html(sumVal);	
		$("#viewTotal").html(sumVal);	
	}
	
	  
	/**************************************************
	 이벤트명 : $("input[name*=isRight]:radio").click(function(e){
	 설 명 : 정답 오답 라디오 바인딩
	***************************************************/  
	$('input[name*=isRight]:radio').click(function(e){
		  //var index = $(this).attr('id').substring($(this).attr('id').length-1, $(this).attr('id').length);
		  
		 
		  var index = $(this).attr('id').replace('itemSeq',''); // 클릭한 인덱스
		  index =$(this).attr('id').replace(/[^0-9]/g,''); 
		  if($(this).val() == 'Y'){
			  $('#ans_'+index).html('<span class="blue_b">O</span>');
		  }else{
			  $('#ans_'+index).html('<span class="red_b">X</span>');
		  }
	});
	  
	/**************************************************
	 이벤트명 : $("input[name*=val]:text").keyup(function(e){
	 설 명 : 점수 바인딩 : 정답 바인딩
	***************************************************/ 
	$('input[name*=val]:text').keyup(function(e){
		 
		 var index =$(this).attr('id').replace(/[^0-9]/g,''); 
		 $('#val_'+index).html($(this).val());
		  dynamicValSummary();
	});

	/**************************************************
	 함수명 : showScrollTop
	 설 명 : 오른쪽 상단 문제번호 클릭시 contents 문제번호 scrollTop
	***************************************************/ 
	function showScrollTop(index){
	    var val =$('.exam-list dl').eq(index).offset();
	    $('body,html').animate({scrollTop:val.top},300);
	    
	}
	
	
	/**************************************************
	 함수명 : fnSave
	 설 명 : 채점완료 
	***************************************************/ 
	function fnSave(){
		//LE_EXAM_APPLY 업데이트 파라미터
		$('#sumVal').val(Number($('#sumArea').html())); //채점 점수
		var xhtml = '';
		
		$('.exam-list dl').each(function(i){
			//console.log($("#val"+i).val());
			//console.log($("#isRight"+i +":checked").val());
			xhtml += '<input type="hidden" id="val" name="val" value="'+$("#val"+i).val()+'" />';
			//xhtml += '<input type="hidden" id="isRight" name="isRight" value="'+$("#isRight"+i +":checked").val()+'" />';
			var rname = "isRight" + i;			
			xhtml += '<input type="hidden" id="isRight" name="isRight" value="'+$(':radio[name='+rname+']:checked').val()+'" />';
			//$("#isRight"+i +":checked").remove();
			//$("#val"+i).remove();
		});

		$('form[name=markingForm]').append(xhtml);

		$('form[name=markingForm]').attr('method', 'post').attr('target', '_cm').attr('action', '/classdesk/tutor/exam/eval_exec.do').submit();
		
	}
	
	/**************************************************
	 함수명 : fnDetail
	 설 명 : 저장후 수행하는 스크립트
	***************************************************/ 
	function fnDetail(examNo) { 
	    $('input[name=examNo]').val(examNo);
		$('form[name=listFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/user_list.do').submit();
	} 

	</script>

