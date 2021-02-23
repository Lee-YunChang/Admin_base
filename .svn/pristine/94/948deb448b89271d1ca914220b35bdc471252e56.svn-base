<%
/****************************************
    system  : ClassDesk > 학생 > 과제
    title   : 과제 목록
    summary :   
    wdate   : 2015-04-01
    writer  : SANGS  
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="task"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<div class="table-title clearfix">
		<h3 class="ico-table-blue">과제 제출양식</h3>
	</div>
	<div>
		<!-- 과제 제출양식 테이블 -->
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 과제정보입니다.">
				<caption>과제정보</caption>
				<colgroup>
					<col width="13%" />
					<col width="37%" />
					<col width="13%" />
					<col width="37%" />
				</colgroup>
				<tbody>
					<tr>
						<th>과제명</th>
						<td colspan="3"><label for="task-title">과제명</label><c:out value="${reportData.TITLE}" /></td>
					</tr>
					<tr>
						<th>제출기한</th>
						<td><label for="task-title">제출기한</label>
							<fmt:formatDate value="${reportData.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${reportData.EDATE}" pattern="yyyy.MM.dd" />
						</td>
						<th>배점</th>
						<td><label for="task-title">배점</label><c:out value="${reportData.EVAL}" /></td>
					</tr>
					<tr>
						<th>과제내용</th>
						<td colspan="3"><label for="task-title">과제설명</label><c:out value="${reportData.SUMMARY}" /></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><label for="task-title">첨부파일</label>
						<c:if test="${not empty reportData.FILE01_ORG}">
							<a href = "#" onclick="fileDown('R', '1')"><c:out value="${reportData.FILE01_ORG}" /></a>
						</c:if>
						
						<c:if test="${not empty reportData.FILE02_ORG}">
							<br><a href = "#" onclick="fileDown('R', '2')"><c:out value="${reportData.FILE02_ORG}" /></a>
						</c:if>
						
						<c:if test="${not empty reportData.FILE03_ORG}">
							<br><a href = "#" onclick="fileDown('R', '3')"><c:out value="${reportData.FILE03_ORG}" /></a>
						</c:if>
						
						<c:if test="${not empty reportData.FILE04_ORG}">
							<br><a href = "#" onclick="fileDown('R', '4')"><c:out value="${reportData.FILE04_ORG}" /></a>
						</c:if>
						
						<c:if test="${not empty reportData.FILE05_ORG}">
							<br><a href = "#" onclick="fileDown('R', '5')"><c:out value="${reportData.FILE05_ORG}" /></a>
						</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="table-title clearfix" style="padding-top: 10px;">
			<h3 class="ico-table-blue">과제제출</h3>
		</div>
		<form id="frm" name="frm" action="<c:out value="${ctx}"/>/classdesk/user/report/submit_exec.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="reportNo" value="<c:out value="${reportData.REPORTNO}"/>"/>
		<input type="hidden" name="cUserNo"  value="<c:out value="${reportApplyData.CUSERNO}"/>" />
		<input type="hidden" name="openYn"   id="openYn" />
		<input type="hidden" name="downType"   id="downType" value="" />
		<input type="hidden" name="downNo"   id="downNo"  value=""/>
		<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<c:out value="${UPLOAD_REPORT_USER}"/>"/>
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 과제제출입니다.">
				<caption>과제제출</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><label for="task-title">제목</label>
							<input type="text" class="w98" name="title" id="title" value='<c:out value="${reportApplyData.TITLE}" />' /> 
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><label for="task-title">내용</label>
							<textarea title="내용" name="summary" id="summary" class="w98" rows="5"><c:out value="${reportApplyData.SUMMARY}" /></textarea>
						</td>
					</tr>
					
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="hidden" name="file01Org" id="file01Org" value="<c:out value="${reportApplyData.FILE01_ORG}"/>">
							<input type="hidden" name="filePath" id="filePath" value="<c:out value="${reportApplyData.FILE_PATH}"/>">
							<input type="hidden" name="file01Save" id="file01Save" value="<c:out value="${reportApplyData.FILE01_SAVE}"/>">
							<span><a href = "#" onclick="fileDown('A', '1')"><c:out value="${reportApplyData.FILE01_ORG}" /></a></span><br><label for="task-file">파일명</label><input type="file" class="w70" name="file" id="task-file" value=""/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
	</div>
	<!-- //과제출제 -->
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<!-- 왼쪽 정렬 버튼 추가시에 btn-table을 하나 더 생성하고 class="left" 추가 // 20130823 추가 -->
		<div class="btn-table">
			<a href="#none" onclick="fnSave('N'); return false;" class="btn-large-blue"><span>임시저장</span></a> 
			<a href="#none" onclick="fnSave('Y'); return false;" class="btn-large-green"><span>과제제출</span></a>
		</div>
		<div class="btn-table left">
		<a href="#none" class="btn-large-orange" onclick="fnList(); return false;"><span>목록</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript"><!--
		// 페이징 이동 함수
		function fnList() {
			$('#frm').attr('target', '_self').attr('action', '/classdesk/user/report/list.do').submit();
		}
	
		// 페이징 이동 함수
		function fnDetail(reportNo) {
			$('#reportNo').val(reportNo);
			$('#frm').attr('target', '_self').attr('action', '/classdesk/user/report/submit_form.do').submit();
		}
	
		//저장
		function fnSave(openYnVal){
			if ($('input[name=title]').valueEmpty()) {
				alert('제목을 입력해주세요.');
				$('input[name=title]').focus();
				return;
			}	
			
			if(openYnVal == 'Y'){
				if(!confirm('제출한 과제는 수정할 수 없습니다.\n그래도 제출하시겠습니까?')) return false;	
			}
			
			$('#openYn').val(openYnVal);
			$('#frm').attr('action', '/classdesk/user/report/submit_exec.do').attr('method', 'post').attr('target', '_cm').submit();
		}
		
		function fileDown(type, no){
			$('#downType').val(type);
			$('#downNo').val(no);
			$('#frm')
			.attr('action', '/classdesk/filedown.do')
			.attr('method', 'post') 
			.submit();
		}
		//-->
	</script>

