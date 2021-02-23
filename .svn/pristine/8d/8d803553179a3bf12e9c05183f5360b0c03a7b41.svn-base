<%
/****************************************
	system	: ClassDesk > 강사 > 시험
	title	: 시험 제출자 목록
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

	<!-- 시험 제출자 목록 -->
	<div>
		<div class="round-box beige">
			<form id="frm" name="frm">
			<input type="hidden" name="examNo" id="examNo" value="<c:out value="${rowData.EXAMNO}"/>"/>
			<input type="hidden" name="cUserNo" id="cUserNo" value=""/>
			<input type="hidden" name="resultYn" id="resultYn" />
			<input type="hidden" name="pubType" id="pubType" value="<c:out value="${rowData.PUB_TYPE}"/>">
			<input type="hidden" name="mtClCode" id="mtClCode" value="<c:out value="${rowData.MT_CL_CODE}"/>">
			<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${rowData.MT_CTYPE_CODE}"/>">
			<!-- 테이블 -->
			<div class="table-type3">
				<table>
					<caption>시험 제출자 목록</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>시험명</th>
							<td colspan="3"><label for="exam-title">과제명</label><c:out value="${rowData.TITLE}" /></td>
						</tr>
						<tr>
							<%-- <th>문제유형</th>
							<td><label for="exam-title">문제유형</label><c:out value="${rowData.EXAM_TYPE_NM}" /></td> --%>
							<th>배점</th>
							<td colspan="3"><label for="exam-title">배점</label><c:out value="${rowData.EVAL}" /></td>
						</tr>	
						<tr>
							<th>응시기간</th>
							<td colspan="3"><label for="exam-title">응시기한</label>
								<c:out value="${rowData.CSDATE}"/>   ~ <c:out value="${rowData.CEDATE}"/>
								<c:if test="${rowData.ENDYN eq 'Y'}">  (종료)</c:if>
							</td>
						</tr>
						<tr>
							<th>상태</th>
							<td colspan="3">
								<c:choose>
									<c:when test="${rowData.RESULTYN eq 'Y'}">
										<em class="green_b">채점완료</em>
									</c:when>
									
									<c:otherwise>
										<c:choose>
											<c:when test="${rowData.ENDYN eq 'Y'}">
												<em class="red_b">시험종료</em>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${rowData.SAVEYN eq 'Y'}">
														<em class="green_b">진행중</em>
													</c:when>
													<c:otherwise>시험대기</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>								
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //시험출제 테이블 -->
			</form>
		</div>
	</div>
	
	<c:if test="${rowData.RESULTYN ne 'Y'}">
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnUpdate('form'); return false;" class="btn-large-blue"><span>수정</span></a>
			<a href="#none"  onclick="fnDel(); return false;"class="btn-large-orange"><span>삭제</span></a>
			<a href="#none"  onclick="fnList(); return false;"class="btn-large-green"><span>목록</span></a> 
		</div>
	</div>
	</c:if>
	    
	  
	<!-- //시험 평가 -->
	<div class="table-title mg-t18 clearfix">
		<h3 class="ico-table-blue">응시 평가(<c:out value="${rowData.SCNT}" default="0" />/<c:out value="${rowData.TOTCNT}" default="0"/>)</h3>
	</div>
	<!-- 시험 평가 -->
	<div class="table-type1">
		<div class="table-header-left"></div>
		<table id="itemList">
			<caption>시험 평가</caption>
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"  onclick="MsgUserAllCheck();"></th>
					<th>번호</th>
					<th>이름(ID)</th>
					<th>시험지</th>
					<th>응시일자</th>
					<th>점수</th>
					<th>채점일</th>
				</tr>
			</thead>
			<tbody>
			
			<c:choose>
				<c:when test="${not empty userListData}">
					<c:forEach items="${userListData}" var="result" varStatus="stat">
					
					<input type="hidden" name="cUserNo<c:out value="${stat.index}"/>" id="cUserNo<c:out value="${stat.index}"/>" value="<c:out value="${result.CUSERNO}"/>"/>
					
						<tr>
							<td><input type="checkbox" name="cBox" id="cBox" value="Y"></td>
							<td><c:out value="${fn:length(userListData) - stat.index}"/></td>
							<td><c:out value="${result.USERNAME}" />(<c:out value="${result.USERID}" />)<c:if test="${not empty result.GROUP_NO }">(<c:out value="${result.GROUP_NO}"/>조)</c:if></td>
							<td>
								<c:choose>
									<c:when test="${empty result.EXAMNO}"> -</c:when>
									<c:otherwise><a href="#none" onclick="fnEvalForm('<c:out value="${result.CUSERNO}" />'); return false;" class="btn-small-white"><span class="blue">채점하기</span></a></c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${empty result.EXAMNO}"> 미응시</c:when>
									<c:when test="${empty result.EXAM_EDATE || result.SUBMITYN eq 'N' }">제출대기 <a href="#none" onclick="fnEvalExec('<c:out value="${result.CUSERNO}" />'); return false;" class="btn-small-white"><span class="orange">강사제출</span></a> </c:when>
									<c:otherwise>
										<c:out value="${result.EXAM_EDATE}"/> 
									</c:otherwise> 
								</c:choose>
							</td>
							<td><c:out value="${result.VAL}" default="0"/></td>
							<td id="valDate"><c:out value="${result.VAL_DATE}" default="-" /></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>   
				<tr>
					<td colspan="7" align="center">등록된 정보가 없습니다.</td>
				</tr>
				</c:otherwise>
			</c:choose>	
			</tbody>
		</table>
	</div>
	<!-- // -->
	<!--  버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<!-- <a href="#none" onclick="fnUserDel(); return false;" class="btn-large-blue"><span>재응시승인</span></a> -->
			<!-- <a href="#none" onclick="fnEvalUpdate(); return false;" class="btn-large-orange"><span>최종평가반영</span></a> -->
		</div>
	</div>
	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
		    $('#checkAll').click(function() {
		        $('#cBox').prop('checked', $(this).is(':checked'));
		    });
		    
		});
	
		/**************************************************
		 함수명 : fnEvalForm
		 설 명 : 채점하기 폼 
		***************************************************/ 
		function fnEvalForm(cUserNo){
			$('input[name=cUserNo]').val(cUserNo);
			$('#frm').attr('target', '_self').attr('action', '/classdesk/tutor/exam/eval_form.do').submit();
		
		}

		/**************************************************
		 함수명 : fnEvalUpdate
		 설 명 : 최종평가반영  
		***************************************************/ 
		function fnEvalUpdate(){
			<c:if test="${empty userListData}">
				alert('평가 대상이 없습니다.');
				return false;
			</c:if>
			
			var strEmpty =  true;
			$('#itemList tbody tr').children().each(function(i){
				if($(this).attr("id")=='valDate'){
					if($(this).text()=='-'){
						strEmpty = false;
					}
				}
			});
			
			if(!strEmpty){
				if(!confirm('채점되지 않은 응시자가 있습니다.\n그래도 평가반영 하시겠습니까?')) return false;
			}
			
			$('form[name=frm]').attr('method', 'post').attr('target', '_cm').attr('action', '/classdesk/tutor/exam/eval_final_exec.do').submit();
		}
		
		/**************************************************
		 함수명 : fnUpdate
		 설 명 : 시험정보 수정페이지 폼으로 이동  
		***************************************************/ 
		function fnUpdate(subcmd){
			$('#frm').attr('target', '_self').attr('action', '/classdesk/tutor/exam/' + subcmd + '.do').submit();
		}
		
		
		/**************************************************
		 함수명 : fnList
		 설 명 : 리스트  이동 함수  
		***************************************************/ 
		function fnList() {
			$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/list.do').submit();
		}
		
		/**************************************************
		 함수명 : fnDel
		 설 명 : 시험정보 전체 삭제
		***************************************************/ 
		function fnDel() {
			if(confirm('시험 정보가 전체 삭제됩니다.\n계속 하시겠습니까?')){
				$('#cUserNo').val(''); //아이바티스에서 cUserNo로 제어하기 때문에 정확한 값을위해서 null처리한다.
				$('#frm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/del_exec.do').submit();	
			} 
		}
		
		/**************************************************
		 함수명 : fnUserDel
		 설 명 : 재응시 승인 : 수강생이 제출한 시험지정보 삭제
		***************************************************/ 
		function fnUserDel() {
			if(SANGS.Util.checkLen('cBox') == 0 ){
				alert('재응시 대상자를 선택해주세요.');
				return;
			}
			
			var examType = '<c:out value="${rowData.EXAM_TYPE}"/>';
			if(examType == 'F'){
				alert('최종평가가 반영된시험이므로 재응시승인을 할수없습니다.');
				return;
			}else{
				if(confirm('재응시 승인 시 기존 수강생이 제출한\n시험지의 정보는 삭제됩니다.\n계속 하시겠습니까?')){
					var xhtml = "";
				 	$('input[name=cBox]:checkbox').each(function(i){
				 		if($(this).attr('checked')){
				 			xhtml += '<input type="hidden" name="cUserNos" id="cUserNos" value="'+$("#cUserNo"+i).val()+'"/>';
						}
					}); 
					
				 	$('form[name=frm]').append(xhtml);
					$('#frm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/del_user_exec.do').submit();	
				} 
			}
		}
		
		function fnEvalExec(cUserNo){
			if(confirm('해당 시험지를 강사 제출하시겠습니까? \n제출시 해당 시험지는 제출 완료로 변경됩니다.')){
				$("input[name=cUserNo]").val(cUserNo);
				$('#frm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/tutor_submit_exec.do').submit();	
			} 
		}
		
		/**************************************************
		 함수명 : fnDetail
		 설 명 : 저장후 수행하는 스크립트
		***************************************************/ 
		function fnDetail(examNo) { 
		    $('input[name=examNo]').val(examNo);
			$('form[name=frm]').attr('target', '_self').attr('action', '/classdesk/tutor/exam/user_list.do').submit();
		} 
		
		
	</script>

