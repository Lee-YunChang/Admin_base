<%
/****************************************
	system	: ClassDesk > 강사 > 시험
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
	<!-- 시험출제 -->
	<div>
		<div class="table-title clearfix">
			<h3 class="ico-table-blue">시험정책</h3>
		</div>
		
		<div class="round-box beige">
			<form id="sFrm" name="sFrm">
				<input type="hidden" name="subcmd">
				<input type="hidden" name="secNo" id="secNo">
				<input type="hidden" name="examNo" value="<c:out value="${rowData.EXAMNO}"/>">
				<input type="hidden" name="lecNum">
				<input type="hidden" name="title">
				<input type="hidden" name="eval">
				<input type="hidden" name="examTime">
				<input type="hidden" name="sdate">
				<input type="hidden" name="edate">
				<input type="hidden" name="qu" id="qu" value="N">
				<input type="hidden" name="examType">
				
			</form>
		
			<!-- 바인더 관리용 팝업 FORM -->
			<form id="popFrm" name="popFrm">
				<input type="hidden" name="qno" id="qno" value="">
				<input type="hidden" name="seq" id="seq" value="">
				<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.SES_COURSENO}" default="0"/>">
				<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.SES_CSEQNO}" default="0"/>">
				<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}" default="0"/>">
				<input type="hidden" name="openType" id="openType" value="<c:out value="${courseData.OPENTYPE}" default="D"/>">
				<input type="hidden" name="searchMode" id="searchMode" value="">
 			</form>
 			
 			<!-- 상시과정 문제 사용여부 수정 관리 -->
			<form id="openAForm" name="openAForm">
				<input type="hidden" name="qno" id="qno" value="">
				<input type="hidden" name="seq" id="seq" value="">
				<input type="hidden" name="useYn" id="useYn" value="">
				<input type="hidden" name="openPubeType" id="openPubeType" value="">
				<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}" default="0"/>">
				<input type="hidden" name="openType" id="openType" value="<c:out value="${courseData.OPENTYPE}" default="D"/>">
				<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.SES_CSEQNO}" default="0"/>">
 			</form>
		
			<form id="examForm" name="examForm">
			<input type="hidden" name="openYn" id="openYn">
			<input type="hidden" name="addObject" id="addObject">
			<input type="hidden" name="examNo" id="examNo" value="<c:out value="${rowData.EXAMNO}"/>">
			<input type="hidden" name="randomYn" id="randomYn" value="<c:out value="${rowData.RANDOM_YN}"/>">
			<input type="hidden" name="secNo" id="secNo">
			<input type="hidden" name="openType" id="openType" value="<c:out value="${courseData.OPENTYPE}" default="D"/>">
			<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}">	<!--  등록 상태 확인  -->
			<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.SES_CSEQNO}" default="0"/>">
			
			<!-- 시험출제 테이블 -->
			<div class="table-type3">
				<table>
					<caption>시험출제</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>시험유형</th>
							<td colspan="3">
								<label for="exam-lecNum">시험유형</label>
								<input type="radio" id="examType1" name="examType" value="B" onclick="fnBeAfterChk(this.value);" <c:if test="${rowData.EXAM_TYPE eq 'B'}"> checked</c:if>><label for="examType1" class="visible" style="cursor:pointer;"  >사전시험</label> 
								<input type="radio" id="examType2" name="examType" value="A" onclick="fnBeAfterChk(this.value);" <c:if test="${rowData.EXAM_TYPE eq 'A'}"> checked</c:if>><label for="examType2" class="visible" style="cursor:pointer;"  >사후시험</label>
								
							</td>
						</tr>
						<tr>
							<th>시험명</th>
							<td colspan="3"><label for="exam-title">시험명</label><input type="text" class="w98" name="title" id="exam-title" value="<c:out value="${empty rowData.TITLE ? REQUEST_DATA.title : rowData.TITLE}" />"  maxlength="66"/></td>
						</tr>
						<tr>
							<th>응시기간</th>
							<td colspan="3"> 
								<div id="openDate">
								<label for="task-date1">시작날짜선택</label>
								
								<c:choose>
									<c:when test="${empty rowData.SDATE}">
										<input type="text" style="width:85px" name="sdate" id="sdate" value='<c:out value="${empty REQUEST_DATA.sdate ? REQUEST_DATA.defultSdate : REQUEST_DATA.sdate}"/>' readonly="readonly"/> 
									
									</c:when>
									<c:otherwise>
										<input type="text" style="width:85px" name="sdate" id="sdate" value='<fmt:formatDate value="${rowData.SDATE}" pattern="yyyy-MM-dd" />' readonly="readonly"/>
									</c:otherwise>
								</c:choose>
								
								<a href="#none" onclick="$('#sdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="시작날짜선택" /></a>  &nbsp;
								<span class="date-cut">&nbsp;&nbsp;~&nbsp;&nbsp;</span> 
								<label for="task-date2">마지막날짜선택</label>
								<c:choose>
									<c:when test="${empty rowData.EDATE}">
										<input type="text" name="edate" id="edate" value='<c:out value="${empty REQUEST_DATA.edate ? REQUEST_DATA.defultEdate : REQUEST_DATA.edate}"/>' readonly="readonly"  style="width: 85px"/> 
									</c:when>
									<c:otherwise>
										<input type="text" name="edate" id="edate" value='<fmt:formatDate value="${rowData.EDATE}" pattern="yyyy-MM-dd" />' readonly="readonly" style="width: 85px"/>  
									</c:otherwise>
								</c:choose> 
								
								<a href="#none" onclick="$('#edate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="마지막날짜선택" /></a>  &nbsp; 
								</div>
								<!-- <div id="openTypeText">상시</div> -->
							</td>
						</tr>
						<%-- <tr>
							<th>배정점수</th>
							<td colspan="3">
								<label for="exam-score">배정점수</label>
								<input type="text" class="w10" name="eval" id="eval" value="<c:out value="${empty rowData.EVAL ? REQUEST_DATA.eval : rowData.EVAL}" />" onkeyup="lfn_keychk(this);" maxlength="3"/> 
 								<div  style="display: inline-block;">
 										<span id = "score" name="score"></span>/<span id = "total_score"><c:out value="${evalData.EVAL_EXAM_FINAL}" /></span> (남은배정점수/총배점점수)
  										<input type ="hidden" name ="pscore" id ="pscore"  value=""/> 
  										<input type ="hidden" name ="tscore" id ="tscore"  value=""/> 
  								</div>
							</td>
						</tr> --%>
						<tr>
							<th>제한시간</th>
							<td colspan="3">
								<label for="exam-time">제한시간</label>
								<input type="text" class="w10" name="examTime" id="examTime" value="<c:out value="${empty rowData.EXAM_TIME ? REQUEST_DATA.examTime : rowData.EXAM_TIME}"/>"  onkeyup="lfn_keychk(this);" maxlength="3"/> 분
							</td>
						</tr>
						<tr>
							<th>출제 방식</th>
							<td colspan="3">
								<label for="exam-lecNum">출제 방식</label>
								<input type="radio" id="way-type1" name="pubType" value="R" <c:if test="${rowData.PUB_TYPE eq 'R'}"> checked</c:if>><label for="way-type1" class="visible"style="cursor:pointer;"  >랜덤 출제</label> 
								<input type="radio" id="way-type2" name="pubType" value="B" <c:if test="${rowData.PUB_TYPE eq 'B'}"> checked</c:if>><label for="way-type2" class="visible"style="cursor:pointer;"  >순차 출제</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //시험출제 테이블 -->
			</form>
		</div>
	</div>
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
		
			<c:if test="${rowData.OPENYN ne 'Y'}">
				<a href="#none" onclick="fnSave('N','<c:out value="${REQUEST_DATA.qu}"/>'); return false;" class="btn-large-green"><span>임시저장</span></a>
			</c:if>
			<c:if test="${not empty REQUEST_DATA.examNo}">
				<a href="#none" onclick="fnSave('Y','<c:out value="${REQUEST_DATA.qu}"/>'); return false;" class="btn-large-blue"><span>시험출제</span></a>
			</c:if>
			<c:if test="${rowData.EXAMNO > 0}">
				<a href="#none" onclick="fnExamDel(); return false;" class="btn-large-orange"><span>삭제</span></a>
			</c:if>
		</div>
		<div class="btn-table left">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-orange"><span>목록</span></a>
		</div> 
	</div>
	<!-- //게시판 버튼영역 -->
	
	<!-- 출제시험 -->
	<div id="sectionAreaEmp" >
		<c:import url="inc/exam_random_inc.jsp" charEncoding="utf-8" />
	</div>

	<!-- //출제시험 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
		
		var examNo = '${REQUEST_DATA.examNo}';
	
    	function fnScore(sval){
    		var cfval = parseInt('<c:out value="${evalData.EVAL_EXAM_FINAL}" />') -  parseInt('<c:out value="${evalData.CUR_FVAL}" />');
    		var cmval =  parseInt('<c:out value="${evalData.EVAL_EXAM_MT}" />') -  parseInt('<c:out value="${evalData.CUR_MVAL}" />');

    		$("#total_score").html('<c:out value="${evalData.EVAL_EXAM_FINAL}" />');
			$("#score").html(cfval);
			$("#tscore").val('<c:out value="${evalData.EVAL_EXAM_FINAL}" />');  
			$("#pscore").val(cfval);  
     	}
     
    	$(function(){
    		
    		 
    		var a = '<c:out value="${rowData.EXAM_TYPE}" />';  
    		if(a== ''){
    		
    		}
     		//fnScore(a);
     		
     	});
    	
    	function fnLeUseYn(a, b){
    		var secTitle = '#secTitle'+ a;
    		var description = '#description'+ a;
    		var allot = "#allot"+ a;
    		var totalQnum = '#totalQnum'+ a;
    		
    		if(a == 'N'){
    			$(secTitle).attr('readonly',true); 
    			$(description).attr('readonly',true); 
    			$(allot).attr('readonly',true); 
    			$(totalQnum).attr('readonly',true); 
    		}else{
    			$('#secTitle').val(''); 
    	        $('#secTitle').removeAttr('readonly');  
    			$('#description').val(''); 
    	        $('#description').removeAttr('readonly');  
    			$('#allot').val(''); 
    	        $('#allot').removeAttr('readonly');  
    			$('#totalQnum').val(''); 
    	        $('#totalQnum').removeAttr('readonly');  
    		}
    	}
    	
		$(function($) {
			<c:if test="${rowData.PUB_TYPE eq 'S'}"> 
				$('#setArea').show();
			</c:if>
			
			SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));
 		 
			
			$(document).ready(function(){
				if (!examNo) {
					/* $('input[name=pubType]:eq(0)').trigger('click'); */
					
					$('#setArea').hide();
					$('#binderList').hide();
					$('#setAllotTotal').hide();
					$('#binderAllotTotal').hide();
					$('#setType').val('');
					$('#randomList').show();
				}
			}); 
			 
			/**************************************************
			 이벤트명 : $('#setType').change(function(e)
			 설 명 : 세트방식 CHANGE EVENT
			***************************************************/ 
			$('#setType').change(function(e){
			    SANGS.Util.ajax('/classdesk/tutor/exam/ajaxSetList.do', {setno : $(this).val()}, 'html', eval('fnSucces'));
			}); 
			
			 // 과정운영상태에 따른 응시기간 조절
			/* if($('#openType').val() == 'A'){
				$('#openDate').hide();	
				$('#openTypeText').show();	
			}else{
				$('#openDate').show();	
				$('#openTypeText').hide();	
			} */
			$('#openDate').show();	
			//$('#openTypeText').hide();
		});	
	
	
		 /**************************************************
		 함수명 : fnSucces
		 설 명 : 문제목록 이동함수
		***************************************************/ 
		function fnExamQform(secNo, examType){
			$('#secNo').val(secNo);
			
			var frm = document.sFrm;
			frm.lecNum.value = $('form[name=examForm] input[name=lecNum]').val();
			frm.title.value = $('form[name=examForm] input[name=title]').val();
			//frm.eval.value = $('form[name=examForm] input[name=eval]').val();
			frm.examTime.value = $('form[name=examForm] input[name=examTime]').val();
			frm.sdate.value = $('form[name=examForm] input[name=sdate]').val();
			frm.edate.value = $('form[name=examForm] input[name=edate]').val();
			frm.qu.value = '<c:out value="${REQUEST_DATA.qu}"/>';
			frm.examType.value = examType;
			$('form[name=sFrm]').attr('action', '/classdesk/tutor/quizbank/q_list.do').submit();
		}
			
		/**************************************************
		 함수명 : fnSucces
		 설 명 : Ajax success 콜백 함수
		***************************************************/ 
		function fnSucces(result){
			$('#sectionAreaEmp').empty().html(result);
		}
	
		function fnBeAfterChk(pval) {
	
			$.ajax({
				url : "/classdesk/tutor/exam/leExamBeAfterCheck.do",
	            data : { cseqno :'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>', examType : pval},
	            dataType : "json",
	            type : 'post',
	            success : function(data) {
	            	if(data.beCheckCnt > 0 && data.afCheckCnt > 0){
	            		alert('이미 사전/사후 시험이 모두 출제되었습니다.');
	            		$(':input:radio[name=examType]').prop('checked', false); 
	            		return;
	            	}
	            	// 사전
	            	if(pval == 'B'){
	            		if(data.beCheckCnt > 0){
	            			alert('이미 등록된 사전시험이 있습니다.');
	            			$(':input:radio[name=examType]:input[value=A]').prop('checked', true); 
	            			return;
	            		}
	            	}
	            	
	            	// 사후
	            	if(pval == 'A'){
	            		if(data.beCheckCnt < 1){
	            			alert('등록된 사전시험이 없습니다. 사전시험 먼저 등록해 주세요.');
	            			$(':input:radio[name=examType]:input[value=B]').prop('checked', true); 
	            			return;
	            		}
	            		if(data.afCheckCnt > 0){
	            			alert('이미 사후시험이 등록되었습니다.');
	            			$(':input:radio[name=examType]').prop('checked', false); 
	            			return;
	            		}
	            	}
	            	
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
			});
 		  
		}
		/**************************************************
		 함수명 : fnSave
		 설 명 : 저장 
		 	   openYnVal : openYn컬럼 N:임시저장  Y:시험출제
		***************************************************/ 
		function fnSave(openYnVal,qu){
		 	if($(':input:radio[name=examType]:checked').length < 1) {
		 		alert('시험유형을 선택해 주세요.');
		 		return;
		 	}
		 	
			if ($('input:text[name=title]').valueEmpty()) {
				alert('시험명을 입력해주세요.');
				$('input[name=title]').focus();
				return;
			}
			
			// 기간제일 경우에만 제어 
			if($('#openType').val()=='D'){
				if ($('#sdate').valueEmpty()) {
					alert('응시시간 시작일자를 입력해주세요.');
					$('#sdate').focus();
					return;
				}
				
				if ($('#edate').valueEmpty()) {
					alert('응시시간 종료일자를 입력해주세요.');
					$('#edate').focus();
					return;
				}
			}

			/* if(!$.isNumeric($('input:text[name=eval]').val())){
				alert('숫자만 입력가능합니다.');			
				$('input[name=eval]').focus();
				return;
			} */
			
			if ($('input:text[name=examTime]').valueEmpty()) {
				alert('제한시간을 입력해주세요.');
				$('input:text[name=examTime]').focus();
				return;
			}
			
			if(!$.isNumeric($('input:text[name=examTime]').val())){
				alert('제한시간은 숫자만 입력가능합니다.');			
				$('input:text[name=examTime]').focus();
				return;
			}
			var chklen = $('input:radio[name=pubType]:checked').length;
			 
		 	if(chklen < 1 ){
				alert('출제 유형을 선택해주세요.');
				return ;
			}
		 	
		 	if(openYnVal == 'Y'){
		 	     	
		 	    /* if( Number($('input[name=eval]').val()) > Number($('input[name=pscore]').val())  ){
		        	 alert('남은 배정 점수를 초과하였습니다.' +  Number($('input[name=eval]').val()) + ' > ' + Number($('input[name=pscore]').val())  );
		        	 $('input[name=eval]').focus();
					return;
	 			} */
		 		<c:if test="${empty subListData}">
		 			alert(  '출제 문제가 없습니다.');
		 			return false;
		 		</c:if>
		 		
		 	}
		 	
			var xhtml = "";
			if($('#secTitle0').val() != undefined){
				$('#sectionAreaEmp div table tbody tr').each(function(i){
					if($(':input:radio[id=useYn'+i+']:checked').val() == 'Y'){
						xhtml += '<input type="hidden" id="secNos" name="secNos" value="'+$("#secNo"+i).val()+'" />'; // 출제 정책 코드 (PK)
						xhtml += '<input type="hidden" id="secTitles" name="secTitles" value="'+$("#secTitle"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="descriptions" name="descriptions" value="'+$("#description"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="allots" name="allots" value="'+Number($("#allot"+i).val())+'" />'; //
						xhtml += '<input type="hidden" id="totalQnums" name="totalQnums" value="'+$("#totalQnum"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="leUseYns" name="leUseYns" value="'+$(':input:radio[id=useYn'+i+']:checked').val()+'" />'; //
					}
				});

				$("form[name=examForm]").append(xhtml);
			}
				
				//문항배점 체크
				/* var checkExAllot = ''; 
				var checkExAllotIdx = ''; 
				var checkGubun = '';
				var returnText = '';
				$('#sectionAreaEmp div table tbody tr').each(function(i){
					if($(':input:radio[id=useYn'+i+']:checked').val() == 'Y'){
						
						var examAllot = $('#allot'+i).val();
						var allot = $('#eval').val();
						var exCnt = $('#exCnt'+i).val();
						
						var checkAllotNum = Number(examAllot * exCnt);

						if(checkAllotNum != Number(allot)){
							checkExAllot = 'N';
							checkExAllotIdx = i;
							checkGubun = 'anum';
							returnText = '문항 배점수가 시험 배점보다 높습니다. \n(ex) 문항배점 x 응시문제수 = 배점점수';
						}
					}
				});
				
				if(checkExAllot=='N'){
					if(checkGubun == 'anum'){
						alert(returnText);
						$('#allot'+checkExAllotIdx).focus();
					}else if(checkGubun == 'qnum'){
						alert(returnText);
						$('#totalQnum'+checkExAllotIdx).focus();
					}
					return;
				} */
				
			var checkExCnt = ''; 
			var checkExCntIdx = ''; 
			$('#sectionAreaEmp div table tbody tr').each(function(i){
				if($(':input:radio[id=useYn'+i+']:checked').val() == 'Y'){
					if( Number($('#totalQnum'+i).val() > Number($('#exCnt'+i).val())) ){
						checkExCnt = 'N';
						checkExCntIdx = i;
						return;
					}
				}
			});
				
			//세트 방식 저장 일 경우...	
			$('#openYn').val(openYnVal);
			$('#qu').val(qu);
			
			var msg = '';
			if(openYnVal == 'Y') msg = '시험을 출제 하시겠습니까?';
			else if (openYnVal == 'N') msg = '임시저장 하시겠습니까?';
			
			if(confirm(msg)){
				$.ajax({
					url : "/classdesk/tutor/exam/edExamSectionCheck.do",
		            data : {SES_COURSENO :'<c:out value="${REQUEST_DATA.SES_COURSENO}"/>'},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == 'SUCCESS'){
		            		$('#examForm').attr('method', 'post').attr('target', '_cm').attr('action', '/classdesk/tutor/exam/exec.do').submit();
		            	}else{
		            		alert('시험출제정책을 등록후에 시험을 출제해주시기 바랍니다.');
		            		return;
		            	}
		            	$("#eduDate_"+cnt).remove();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
				});
			}
		}
		
		
		/**************************************************
		 함수명 : fnList
		 설 명 : 페이징 이동 함수
		***************************************************/ 
		function fnList() {
			$('#examForm').attr('target', '_self').attr('action', '/classdesk/tutor/exam/list.do').submit();
		}
		
		
		
		function fnDetail(examNo){
			$('#examForm > input[name='+examNo+']').val(examNo);
			$('#examForm > input[name=qu]').val('insert');
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '/classdesk/tutor/exam/list.do').submit();
		}
		
		
		function fnSecSave(examNo){
			$('#examForm > input[name=examNo]').val(examNo);
			$('#examForm > input[name=qu]').val('update');
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '/classdesk/tutor/exam/form.do').submit();
		}
		
		/**************************************************
		 함수명 : fnExamSetList
		 설 명 : 세트문제설정
		***************************************************/ 
		function fnExamSetList(){
			$('form[name=examForm]').attr('method', 'post').attr('action', '/classdesk/tutor/quizset/list.do').submit();
		}
		
		// 문제삭제
		function fnDel(seq){
			var answer = confirm ('삭제하시겠습니까?');
			if(answer){
				$('#popFrm > input[name="seq"]').val(seq);  
				$('#popFrm').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizbinder/q_del_exec.do').submit();
			} else {
			    return false;
			}
		}
		
		/**************************************************
		 함수명 : fnExamDel
		 설 명 : 시험정보 전체 삭제
		***************************************************/ 
		function fnExamDel() {
			if(confirm('시험 정보가 전체 삭제됩니다.\n계속 하시겠습니까?')){
				$('#examForm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/del_exec.do').submit();	
			} 
		}
		
		/**************************************************
		 함수명 : fnChangUseYn
		 설 명 : 상시 문제 사용여부 수정 
		***************************************************/
		function fnChangUseYn(qNo, ptype, v){
			 var qno = qNo;
			 var type = ptype;
			 var useYn = v; 

			 $('#openAForm > input[name="openPubeType"]').val(type);  
			 $('#openAForm > input[name="useYn"]').val(useYn);  
			 $('#openAForm > input[name="qno"]').val(qno);   
 			 $('#openAForm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/q_use_exec.do').submit();	
		}
		
		function fnQuizDetail(examNo){
			alert('수정되었습니다.');
			$('#examForm > input[name="examNo"]').val(examNo);   
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/form.do').submit();
		}
		
		function setListChang(s, a){ 
			var sno = s;
			var atype = a;
			SANGS.Util.ajax('/classdesk/tutor/exam/ajaxSetList.do', {setno : sno, addObject : atype}, 'html', eval('fnSucces'));
 		}
		

		function bndListChang(examNo, a){
			var atype = a;
			$('#examForm > input[name="examNo"]').val(examNo);   
			$('#examForm > input[name="addObject"]').val(atype);   
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '/classdesk/tutor/exam/form.do').submit();
		}
		
	
	</script>

