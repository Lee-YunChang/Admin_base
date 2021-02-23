<%
/****************************************
	system	: ClassDesk > 강사 > 과제출제 등록폼
	title	: 과제 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="task"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<!-- //개설과목명 -->
	<!-- 과제출제 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">과제출제</h3>
	</div>
	<div class="round-box-small blue">
		<!-- 과제출제 테이블 -->
		<form id="taskForm" name="taskForm" enctype="multipart/form-data">
		<input type="hidden" name="openYn"  id="openYn" value="">
		<input type="hidden" name="nextSubcmd"  id="nextSubcmd" value="<c:out value="${REQUEST_DATA.nextSubcmd}"/>">
		<input type="hidden" name="reportNo"  id="reportNo" value="<c:out value="${rowData.REPORTNO}" />">
		<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<c:out value="${UPLOADREPORT}"/>"/>
		<input type="hidden" name="downType" id="downType" value=""/>
		<input type="hidden" name="downNo" id="downNo" value=""/>
		
		<div class="table-type2">
			<table>
				<caption>과제출제 테이블</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>과제명</th>
						<td><label for="task-title">과제명</label><input type="text" class="w98" name="title" id="task-title" value='<c:out value="${rowData.TITLE}" />' /></td>
					</tr>
					<tr>
						<th>제출기한</th>
						<td>
							 <label for="task-date1">시작날짜선택</label>
							<input type="text" class="w15" name="sdate" id="sdate" value='<fmt:formatDate value="${rowData.SDATE}" pattern="yyyy-MM-dd"/>' readonly="readonly" /> 
							<a href="#none" onclick="$('#sdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="시작날짜선택" /></a> 
							<span class="date-cut">~</span> 
							<label for="task-date2">마지막날짜선택</label>
							<input type="text" class="w15" name="edate" id="edate" value='<fmt:formatDate value="${rowData.EDATE}" pattern="yyyy-MM-dd"/>' readonly="readonly">
							<a href="#none" onclick="$('#edate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="마지막날짜선택" /></a> 
						</td>
					</tr>
					
					<tr>
						<th>과제설명</th>
						<td><textarea title="과제설명" name="summary" id="task-subtitle" class="w98" rows="15"><c:out value="${rowData.SUMMARY}" /></textarea></td>
					</tr>
					<tr>
						<th>배정점수</th>
						<td><label for="task-score">배정점수</label><input type="text" class="w5" name="eval" id="eval" value="<c:out value="${rowData.EVAL}" />"  />
						
						<!-- 가능 배점 : <span id="restArea"> </span> -->
						남은 배정 점수 : <em class="red_b"><span id="restArea"></span></em> / 총 배정점수 : <c:out value="${evalData.EVAL_REPORT}" default="0"/>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="hidden" name="filePath" id="filePath" value="<c:out value="${rowData.FILE_PATH}" />"/>
							<label for="task-file">파일명 </label>
							<input type="file" class="w70" name="file01" id="file01" name=""/>
								<c:if test="${not empty rowData.FILE01_ORG}">
									<span><a href = "#" onclick="fileDown('R', '1'); return false;"><c:out value="${rowData.FILE01_ORG}" /></a></span> 
									<input type="hidden" name="file01Save" id="file01Save" value="<c:out value="${rowData.FILE01_SAVE}" />"/>
									<input type="hidden" name="file01Org" id="file01Org" value="<c:out value="${rowData.FILE01_ORG}" />"/>
									<input type="checkbox" name="delFile01" id="delFile01" value="Y"> 삭제 
									
								</c:if>
							<label for="task-file">파일명 </label>
							<input type="file" class="w70" name="file02" id="file02" name=""/>
								<c:if test="${not empty rowData.FILE02_ORG}">
									<span><a href = "#" onclick="fileDown('R', '2'); return false;"><c:out value="${rowData.FILE02_ORG}" /></a></span> 
									<input type="hidden" name="file02Save" id="file02Save" value="<c:out value="${rowData.FILE02_SAVE}" />"/>
									<input type="hidden" name="file02Org" id="file02Org" value="<c:out value="${rowData.FILE02_ORG}" />"/>
									<input type="checkbox" name="delFile02" id="delFile02" value="Y"> 삭제 
									
								</c:if>
							<label for="task-file">파일명 </label>
							<input type="file" class="w70" name="file03" id="file03" name=""/>
								<c:if test="${not empty rowData.FILE03_ORG}">
									<span><a href = "#" onclick="fileDown('R', '3'); return false;"><c:out value="${rowData.FILE03_ORG}" /></a></span> 
									<input type="hidden" name="file03Save" id="file03Save" value="<c:out value="${rowData.FILE03_SAVE}" />"/>
									<input type="hidden" name="file03Org" id="file03Org" value="<c:out value="${rowData.FILE03_ORG}" />"/>
									<input type="checkbox" name="delFile03" id="delFile03" value="Y"> 삭제 
									
								</c:if>
							<label for="task-file">파일명 </label>
							<input type="file" class="w70" name="file04" id="file04" name=""/>
								<c:if test="${not empty rowData.FILE04_ORG}">
									<span><a href = "#" onclick="fileDown('R', '4'); return false;"><c:out value="${rowData.FILE04_ORG}" /></a></span> 
									<input type="hidden" name="file04Save" id="file04Save" value="<c:out value="${rowData.FILE04_SAVE}" />"/>
									<input type="hidden" name="file04Org" id="file04Org" value="<c:out value="${rowData.FILE04_ORG}" />"/>
									<input type="checkbox" name="delFile04" id="delFile04" value="Y"> 삭제 
									
								</c:if>
							
						</td>
					</tr>
				</tbody>  
			</table>
		</div>
		</form>
		<!-- //과제출제 테이블 -->
		<!-- 라운드박스 구성요소 -->
		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div>
		<!-- //라운드박스 구성요소 -->
	</div>
	<!-- //과제출제 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<c:if test="${rowData.OPENYN eq 'N'}">
			<a href="#none" onclick="fnDel(); return false;" class="btn-large-orange"><span>삭제</span></a>
			</c:if>
			<c:choose>
				<c:when test="${not empty rowData.REPORTNO && rowData.OPENYN eq 'Y'}">
						<a href="#none" class="btn-large-blue" onclick="fnSave('Y'); return false;"><span>수정</span></a>
				</c:when>
				<c:otherwise>
					<a href="#none" class="btn-large-green" onclick="fnSave('N'); return false;"><span>임시저장</span></a>
					<a href="#none" class="btn-large-blue" onclick="fnSave('Y'); return false;"><span>과제출제</span></a>
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="btn-table left">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-orange" ><span>목록</span></a>
		</div>
	</div> 
	<!-- //게시판 버튼영역 -->
	
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
		var evalTotCnt; //과제 총 배점
		var evalRepSum; //현재 등록한 합계 배점
		var evalRestCnt; // 남은 배점 점수
		jQuery(document).ready(function(){
			SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));	
			
			//배점 가능한 점수 구하기
			evalTotCnt = '<c:out value="${evalData.EVAL_REPORT}" />';
			evalRepSum = '<c:out value="${evalSum.SUM_EVAL}" />';
			evalRestCnt = Number(evalTotCnt) - Number(evalRepSum); 
			$('#restArea').html(evalRestCnt);
		});	
		
		// 페이징 이동 
		function fnList() {
			$('#taskForm').attr('target', '_self').attr('method', 'post').attr('action', '/classdesk/tutor/report/list.do').submit();
		}
		
		// 페이징 이동 (수정시 수강생 과제 목록으로 이동)
		function fnUserList() {
			$('#taskForm').attr('target', '_self').attr('action', '/classdesk/tutor/report/user_list.do').submit();
		}
		
		function fnDetail(reportNo){
			$('#reportNo').val(reportNo);
			$('form[name=taskForm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/form.do').submit();
		}
		
		//취소
		function fnCancle(cmd){
			$('#taskForm').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/' + cmd + '.do').attr('method', 'post').submit();
		}
		
		//저장
		function fnSave(sFlag){
			if ($('input[name=title]').valueEmpty()) {
				alert('과제명을 입력해주세요.');
				$('input[name=title]').focus();
				return;
			}			
			if ($('input[name=sdate]').valueEmpty()) {
				alert('제출기한 시작일자를 입력해주세요.');
				$('input[name=sdate]').focus();
				return;
			}		
			if ($('input[name=edate]').valueEmpty()) {
				alert('제출기한 종료일자를 입력해주세요.');
				$('input[name=edate]').focus();
				return;
			}		
			
			if ($('input[name=eval]').valueEmpty()) {
				alert('배점을 입력해주세요.');
				$('input[name=eval]').focus();
				return;
			}
			
			if(!$.isNumeric($('input[name=eval]').val())){
				alert('배점은 숫자만 입력가능합니다.');			
				$('input[name=eval]').focus();
				return;
			}
			 
			if (Number($('input[name=eval]').val()) > Number($('#restArea').html())) {
				/* alert('배점은'+ Number($('#restArea').html())+'점을 초과할수 없습니다.'); */
				alert('배정 점수가 남아있지 않아 출제가 불가합니다.');
				$('#eval').focus();
				return;
			} 
			
			$('#openYn').val(sFlag);
			$('#taskForm')
				.attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/exec.do')
				.attr('method', 'post')
				.attr('target', '_cm')
				.submit();
		}
		
		//삭제
		function fnDel(){
			if(confirm('삭제 하시겠습니까?')){
				$('#taskForm')
					.attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/delExec.do')
					.attr('method', 'post')
					.attr('target', '_cm')
					.submit();
			}
		}
		
		function fileDown(type, no){
			$('#downType').val(type);
			$('#downNo').val(no);
			$('#taskForm')
			.attr('action', '/classdesk/filedown.do')
			.attr('method', 'post')
			.submit();
		}
	</script>


