<%
/****************************************
	system	: ClassDesk > 학생 > 과제
	title	: 과제 평가 결과
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
	
	<div>
	<div class="table-title clearfix" style="padding-top: 10px;">
		<h3 class="ico-table-blue">과제 정보</h3>
	</div>
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
					<th>과제설명</th>
					<td colspan="3"><label for="task-title">과제설명</label>
					<c:out value="${fn:replace(reportData.SUMMARY, crlf, '<br />')}" escapeXml="false"/>
					</td>
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
	<h3 class="ico-table-blue">과제 제출양식</h3>
	</div>
		
		<!-- 과제 제출양식 테이블 -->
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 과제정보입니다.">
				<caption>과제정보</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<c:out value="${rowData.TITLE}" /> 
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<c:out value="${fn:replace(rowData.SUMMARY, crlf, '<br />')}" escapeXml="false"/>
						</td>
					</tr>
					
					<tr>
						<th>첨부파일</th> 
						<td>	
							<span><a href = "#" onclick="fileDown('A', '1')"><c:out value="${rowData.FILE01_ORG}" /></a></span> 
						
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="table-title clearfix" style="padding-top: 10px;">
			<h3 class="ico-table-blue">과제 평가 결과</h3>
		</div>
		<form id="frm" name="frm" action="<c:out value="${ctx}"/>/classdesk/user/report.do">
		<input type="hidden" name="downType"   id="downType" value="" />
		<input type="hidden" name="downNo"   id="downNo"  value=""/>
		<input type="hidden" name="reportNo"   id="reportNo"  value="<c:out value="${REQUEST_DATA.reportNo}"/>"/>
		<input type="hidden" name="cUserNo"   id="cUserNo"  value="<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>"/>
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 과제평가결과입니다.">
				<caption>과제평가결과</caption>
				<colgroup>
					<col width="13%" />
					<col width="37%" />
					<col width="13%" />
					<col width="37%" />
				</colgroup>
				<tbody>
					<tr>
						<th>점수</th>
						<td><c:out value="${rowData.VAL}" /></td>
						<th>평가일자</th>
						<td><fmt:formatDate value="${rowData.VAL_DATE}" pattern="yyyy.MM.dd" /> </td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<c:out value="${fn:replace(rowData.VAL_CMT, crlf, '<br />')}" escapeXml="false"/>
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
		<div class="btn-table">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-green"><span>목록</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
    <!--
		// 페이징 이동 함수
		function fnList() {
			$('#frm').attr('action', '<c:out value="${ctx}"/>/classdesk/user/report/list.do').attr('target', '_self').submit();
		}
	
    	function fileDown(type, no){
    		$('#downType').val(type);
    		$('#downNo').val(no); 
    		$('#frm')
    		.attr('action', '<c:out value="${ctx}"/>/classdesk/filedown.do')
    		.attr('method', 'post')
    		.attr('target', '_cm')
    		.submit();
    	}
	//-->
	</script>

