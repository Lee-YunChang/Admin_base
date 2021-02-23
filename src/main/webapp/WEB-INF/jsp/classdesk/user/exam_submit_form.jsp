<%
/****************************************
	system	: ClassDesk > 사용자 > 시험
	title	: 시험 목록
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

<!-- 복사방지 스크립트 추가 ctrl+a, ctrl+c, 마우스 우클릭 제한. -->
<script type="text/javascript" src="<c:out value='/classdesk/common/js/jquery-control.js'/>"></script>

<script type="text/javascript">
	$('#gnb').hide();		// 시험시 상단 메뉴 제어
</script>
	<!-- 시험정보 -->
	<div>
		<div class="round-box beige">
		
		<form name="ansFrm" id="ansFrm" action="<c:out value="${ctx}"/>/classdesk/user/exam.do" method="post" >
			<input type="hidden" name="examNo" id="examNo" value="<c:out value="${listData[0].EXAMNO}"/>">
			<input type="hidden" name="qNo" id="qNo">
			<input type="hidden" name="qSeq" id="qSeq">
			<input type="hidden" name="qType" id="qType">
			<input type="hidden" name="examTime" id="examTime">
			<input type="hidden" name="answer" id="answer">
			<input type="hidden" name="itemSeq" id="itemSeq">
			<input type="hidden" name="submitYn" id="submitYn">
			<input type="hidden" name="subcmd" id="subcmd">
			<input type="hidden" name="pubType" id="pubType" value="<c:out value="${listData[0].PUB_TYPE}"/>">	
		</form>
		
		
			<!-- 시험정보 테이블 영역 -->
			<div class="table-type3">
				<table summary="상상스토리 교육시스템 클래스데스크의 시험정보입니다.">
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
							<td><c:out value="${listData[0].TITLE}"/></td>
							<th>응시자</th>
							<td><c:out value="${listData[0].USERNAME}"/>(<c:out value="${listData[0].USERID}"/>)</td>
						</tr>
						<tr>
							<th>시험유형</th>
							<td><c:out value="${listData[0].EXAM_TYPE_NM}"/> </td>
							<th>배점</th>
							<td><c:out value="${listData[0].EVAL}"/> </td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //시험정보 테이블 영역 -->
		</div>
	</div>
	<!-- //시험정보 -->
	<!-- 시험문제 -->
	<div class="mg-t18 clearfix" style="position:relative;">
		<form id="markingForm" name="markingForm">
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
								<pre><c:out value="${stat.count}"/>. <c:out value="${fn:replace(result.QSUBJECT, crlf, '<br />')}" escapeXml="false"/></pre>
								<br/>&nbsp;&nbsp;&nbsp;&nbsp;배점 : <span style="margin-left: 5px;"><strong style="color: red;"><c:out value="${result.ALLOT}" default="0" /></strong></span>점
								<c:if test="${not empty result.QSUBJECT_FILE}">
								<br>
									<%-- <img alt="" style="padding-top: 10px;" src="<c:out value="${FILEROOTURL}${result.QSUBJECT_FILE}"/>"> --%>
									 
									<img src="/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
								</c:if>
							</div>
						</dt>
						
						<input type="hidden" name="qNo<c:out value="${stat.index}"/>" id="qNo<c:out value="${stat.index}"/>" value="<c:out value="${result.QNO}" />" />
						<input type="hidden" name="qSeq<c:out value="${stat.index}"/>" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QSEQ}" />" />
						<input type="hidden" name="qType<c:out value="${stat.index}"/>" id="qType<c:out value="${stat.index}"/>" value="<c:out value="${result.QTYPE}" />" />
						
  						<!-- 주관식 단답형 -->
						<c:if test="${result.QTYPE == 4 }">
							<dd>
							<input type="text" title="단답형" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" value="<c:out value="${result.ANSWER}" />" class="w90">
							
							</dd>
						</c:if>
						
						<!-- 주관식 서술형-->
						<c:if test="${result.QTYPE == 5  }">
							<dd>
							<pre><textarea title="서술형" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" class="w90" rows="5"><c:out value="${result.ANSWER}" /></textarea></pre>
							</dd>
						</c:if>
						
						<c:if test="${result.QTYPE == 1 || result.QTYPE == 2 }">
						<!-- 답이 길어질 경우 정렬 문제를 고려하여 텍스트 부분에 blockquote 적용 // 시험 볼때만 해당 -->
						
						<c:if test="${not empty result.A01 || not empty result.A02_FILE}">
						<dd>
							<label for="question1-1">문제1</label>
							<input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="1" <c:if test="${result.ITEMSEQ == 1 }"> checked="checked" </c:if>/>
							<strong>1)</strong> <blockquote><pre><c:out value="${result.A01 }" /></pre></blockquote>
							<c:if test="${not empty result.A01_FILE}">
								<%-- <br><img alt="" style="padding-top: 10px;" src="<c:out value="${FILEROOTURL}${result.A01_FILE}"/>"> --%>
								<br><img src="/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A01_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
							</c:if>
						</dd>
						</c:if>
						<c:if test="${not empty result.A02 || not empty result.A02_FILE}">
						<dd>
							<label for="question1-2">문제2</label>
							<input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="2" <c:if test="${result.ITEMSEQ == 2 }"> checked="checked" </c:if>/> 
							<strong>2)</strong> <blockquote><pre><c:out value="${result.A02 }" /></pre></blockquote>
							 <c:if test="${not empty result.A02_FILE}">
								<br><img src="/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A02_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
							</c:if>
						</dd>
						</c:if>
						<c:if test="${not empty result.A03 || not empty result.A03_FILE}">
						<dd>
							<label for="question1-3">문제3</label>
							<input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="3" <c:if test="${result.ITEMSEQ == 3 }"> checked="checked" </c:if>/> 
							<strong>3)</strong> <blockquote><pre><c:out value="${result.A03 }" /></pre></blockquote>
							<c:if test="${not empty result.A03_FILE}">
								<br><img src="/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A03_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
							</c:if>
						</dd>
						</c:if>
						<c:if test="${not empty result.A04 || not empty result.A04_FILE}">
						<dd>
							<label for="question1-4">문제4</label>
							<input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="4" <c:if test="${result.ITEMSEQ == 4 }"> checked="checked" </c:if>/> 
							<strong>4)</strong> <blockquote><pre><c:out value="${result.A04 }" /></pre></blockquote>
							 <c:if test="${not empty result.A04_FILE}">
								<br><img src="/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A04_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
							</c:if>
						</dd>
						</c:if>
						<c:if test="${not empty result.A05 || not empty result.A05_FILE}">
						<dd>
							<label for="question1-5">문제5</label>
							<input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="5" <c:if test="${result.ITEMSEQ == 5 }"> checked="checked" </c:if>/>
							<strong>5)</strong> <blockquote><pre><c:out value="${result.A05 }" /></pre></blockquote>
						 	<c:if test="${not empty result.A05_FILE}">
								<br><img src="/classdesk/fileview.do?type=<c:out value="${listData[0].PUB_TYPE}"/>&qno=<c:out value="${result.QNO}"/>&targetFile=A05_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
							</c:if>
						</dd>
						</c:if>
						</c:if>
					
					</dl>
					 
					</c:forEach>
				
				</div>
		
			</c:when>
		</c:choose>
		
		<!-- //시험문제 리스트 -->
		<!-- 답안지 -->
		<div class="marking">
			<div class="table-type5">
				<table summary="상상스토리 교육시스템 클래스데스크의 시험정보입니다.">
					<thead>
						<tr>
							<th>남은시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="red_b" id="monitor"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="table-type4">
				<table class="mg-t10" id="ansList" summary="상상스토리 교육시스템 클래스데스크의 답안지입니다.">
					<caption>답안지</caption>
					<colgroup>
						<col width="50" />
						<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th>문제</th>
							<th>제출 답안</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${listData}" var="ansVal" varStatus="stat">
						<tr>
							<td><a href="#none" onclick="showScrollTop('<c:out value="${stat.index}"/>'); return false;" ><c:out value="${stat.count}"/></a></td>
							<td id="ans_<c:out value="${stat.index}"/>" style="word-break:break-all" >
							<c:choose>
								<c:when test="${ansVal.QTYPE == 1  }">
									<!-- OX 정답일경우 -->
									<c:out value="${ansVal.ITEMSEQ_OX }"/>
								</c:when>
								<c:when test="${ansVal.QTYPE == 2  }">
									<!-- 객관식 정답일경우 -->
									<c:out value="${ansVal.ITEMSEQ }"/>
								</c:when>
								<c:otherwise>
									<!-- 객관식이 아닌경우 -->
									<c:out value="${ansVal.ANSWER }"/>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- //답안지 -->
		</form>
	</div>
	<!-- //시험문제 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnSave(); return false;" class="btn-large-blue"><span>시험지제출</span></a>
		</div>
	</div>
	<div id="shortly" style="display: none;" ></div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	<style>
	   #quickmenu {position:absolute; left:50%; top:10px; width:13%; margin-left:35%; } 
	</style>
	<script type="text/javascript">
	<!--
    	var examTime = '<c:out value="${listData[0].EXAM_TIME_MS}"/>'; //제한시간 MMSS
    	var userExamTime = '<c:out value="${listData[0].USER_EXAM_TIME}"/>'; //응시시간 MMSS
    	var currentTime = 0;
    	
    	$(document).ready(function(e){
    	document.onkeydown = doNotReload; //새로고침 막음
    		
    		//var currentTop = parseInt($('#quickmenu').css('top'));
    		
    		$(window).scroll(function() {
    			var currentTop = -250;
    			if($(window).scrollTop() < 275 ){
    				currentTop =  10;//parseInt($('#quickmenu').css('top'));
    			}
    			
    			$('#quickmenu').stop().animate({'top': $(window).scrollTop()+currentTop+'px'}, 500);
    			  
    		});
    		
    		currentTime = examTime - userExamTime; //현재 카운트
    		
    		/**************************************************
    		 이벤트명 :  $('#shortly').countdown
    		 설 명 : 카운트 이벤트
    		***************************************************/ 
    		 $('#shortly').countdown({until: currentTime, compact: true, description: '',  format: 'MS', layout: '{mn}:{sn}",
    			    onExpiry: liftOff, onTick: watchCountdown}); 
    		
    		/**************************************************
    		 이벤트명 : $('input:radio').bind('click', function(e){
    		 설 명 : 정답 오답 라디오 바인딩
    		***************************************************/ 
    		 $('input:radio').bind('click', function(e){
    			var index = $(this).attr('id').replace('itemSeq',''); // 클릭한 인덱스
    			
    			/*****************************************************
    				시험 답 바인딩 영역
    			*****************************************************/
    			var itemSeq = 'itemSeq'+index;
    			//객관식
    			if($('#qType'+index).val() == 2){
    				//$('#ans_'+index).html($('#itemSeq'+index +':checked').val()); 
    				$('#ans_'+index).html($(':radio[name='+itemSeq+']:checked').val()); 
    			 
    			//OX
    			}else if($('#qType'+index).val() == 1){
    				
    				//if($('#itemSeq'+index +':checked').val() == 1){
    				if($(':radio[name='+itemSeq+']:checked').val() == 1){
    					$('#ans_'+index).html('O');
    				}else{
    					$('#ans_'+index).html('X');
    				}
    			}
    			
    			fnSubmit(index);
    		});
    		 
    		 
    		 /**************************************************
    		 이벤트명 : $('input:text, textarea').bind('focusout', function(e){
    		 설 명 : 주관식 답 바인딩
    		***************************************************/ 
    	 	 $('input:text, textarea').bind('focusout', function(e){
    	 		var index = $(this).attr('id').replace('answer','');
    			$('#ans_'+index).html($('#answer'+index).val());
    			fnSubmit(index);
       	     }); 
    		 
    	});
    	
    	//응시시간 세팅
    	function fnExTimeControll(){
    		var sp = $('#shortly').html().split(':');
    		if(sp[0] != 0){
    			$('#examTime').val(examTime - (Number(sp[0])*60 + Number(sp[1]))); //응시시간
    			
    		}else{
    			$('#examTime').val(examTime - Number(sp[1])); //응시시간
    		}
    	}
    	
    	/**************************************************
    	 함수명 : fnSubmit
    	 설 명 : 실시간 정답 UPDATE 
    	***************************************************/ 
    	function fnSubmit(index){
    		//응시시간 세팅
    		fnExTimeControll();
    		var itemSeq = 'itemSeq'+index;
    		 
    		$('#qNo').val($('#qNo'+index).val()); //문제번호
    		$('#qSeq').val($('#qSeq'+index).val()); //출제문제 순번
    		$('#qType').val($('#qType'+index).val()); //문제유형 : 1.OX 2.객관식 4.단답형 5.서술형
    		$('#answer').val($('#answer'+index).val()); //주관식응시답안
    		$('#itemSeq').val($(':radio[name='+itemSeq+']:checked').val()); //선택답안
    		//$('#itemSeq').val($('#itemSeq'+index +':checked').val()); //선택답안
    		$('#submitYn').val('N'); //제출여부(Y,N)
    		SANGS.Util.ajax('/classdesk/user/exam/ajaxSaveRealTmAns.do', $('#ansFrm').serialize(), 'json', eval('fnSucces'));
    		
    	}
    	
    	function fnSucces(result){
    		//alert(result);
    	}
    
    	function liftOff() { 
    	    alert('제한시간이 초과하여 자동 제출됩니다.');
    	    $('#examTime').val(examTime); 
    	    $('#submitYn').val('Y'); 
    		$('form[name=ansFrm]').attr('target', '_cm').attr('action', '<c:out value="${ctx}"/>/classdesk/user/exam/submit_exec.do').submit();
    	} 
    	 
    	function watchCountdown(periods) { 
    	    $('#monitor').text(periods[5] + '분' + periods[6] + '초'); 
    	}
    	
    	function showScrollTop(index){
    	    var val =$('.exam-list dl').eq(index).offset();
    	    $('body,html').animate({scrollTop:val.top},300);
    	    
    	}
    	
    	function fnSave(){
    		if(confirm('제출한 시험지는 수정할 수 없습니다. \n제출하시겠습니까?')){
    			//응시시간 세팅
    			fnExTimeControll();
    			$('#submitYn').val('Y'); 
    			$('form[name=ansFrm]').attr('target', '_cm').attr('action', '<c:out value="${ctx}"/>/classdesk/user/exam/submit_exec.do').submit();
    		}
    	}
    	
    	
    	function fnList() { 
    	    $('#subcmd').val('list');
    		$('form[name=ansFrm]').attr('target', '_self').attr('action', '/classdesk/user/exam/list.do').submit();
    	} 
      	
      	document.onkeydown = function(){
      	   	if(event.srcElement.type != 'text' && event.srcElement.type != 'textarea'){
      	   		if(event.keyCode == 116){
      	   			event.keyCode = 2;
      	   			return false;
      	   		}
      	  		else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
      	   			return false;
      	   		}else if(event.keyCode == 8){
      	  			return false;
      	  		}
      	  	}
      	}
	
  	//-->
	</script>

