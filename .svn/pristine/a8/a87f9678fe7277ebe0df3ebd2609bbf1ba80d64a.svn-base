<%
/****************************************
	system	: ClassDesk > 강사 > 과제
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
	<!-- 개설과목명 -->
	<div id="Right_Area" >
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">과제리스트</h3>
	</div>
	<!-- //개설과목명 -->
	<!-- 과제리스트 -->
	
	<div id="Right_Area" style="display:block;" class="table-type1">	
	<form name="frm" action="">
		<input type="hidden" name="reportNo" id="reportNo" value="">
		<div class="table-type1">
			<div class="table-header-left"></div>
			<table>
				<caption>과제 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="5%" />
					<col width="15%" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>과제명</th>
						<th>배점</th>
						<th>제출기간</th>
						<th>제출인원</th>
						<th>상태</th>
						<th>-</th>
					</tr>
				</thead>
				<tbody>
				
				<c:choose>
					<c:when test="${not empty listData}">
						<c:forEach items="${listData}" var="result" varStatus="stat">
							<tr>
								<td><c:out value="${result.RNUM}"/></td>
								<td class="left"><c:out value="${result.TITLE}"/></td>
								<td><c:out value="${result.EVAL}"/></td>
								<td><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></td>
								<td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
								
								<c:choose>
									<c:when test="${result.OPENYN eq 'N'}">
									<td><em class="blue_b">작성중</em></td>
									<td>
										<a href="#none" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', 'form'); return false;" class="btn-small-white"><span class="blue">등록</span></a>
									</td>
									</c:when>
									<c:otherwise>
									<c:choose>
										<c:when test="${result.RESULTYN eq 'Y'}">
										<td><em class="green_b">채점완료</em></td>
										<td>
											<a href="#none" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', 'user_list'); return false;"class="btn-small-white"><span class="green">결과</span></a>
										</td>
										</c:when>
										
										<c:otherwise>
											<c:choose>
												<c:when test="${result.ENDYN eq 'Y'}">
													<td><em class="red_b">과제마감</em></td>
												</c:when>
												<c:otherwise>
													<td><em class="blue_b">진행중</em></td>
												</c:otherwise>
											</c:choose>
											<td>
												<c:if test="${result.SCNT < 1}">
													<a href="#none" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', 'form'); return false;"class="btn-small-white"><span class="green">수정</span></a>
												</c:if>
												<a href="#none" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', 'user_list'); return false;"class="btn-small-white"><span class="red">채점</span></a>
											</td>
										</c:otherwise>
									</c:choose>
									</c:otherwise>
								</c:choose>
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
		</form>
		<!-- //과제리스트 -->
	
	
		<!-- 게시판 버튼영역 -->
		<div class="table-btn-group">
			<div class="btn-table">
				<a href="#none" class="btn-large-blue" onclick="fnCreate(); return false;"><span>과제등록</span></a>
			</div>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">

		$(function($) {
		});	
		
		// 페이징 이동 함수
		function fnList() {
			$('#taskForm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/list.do').submit();
		}
		
		function fnCreate(){
			/* <c:if test="${fn:length(listData) > 4}">
				alert('과제는 최대 5건 까지\n등록할 수 있습니다.');
				return false;
			</c:if> */
			
			
			$('#reportNo').val('');
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/form.do').attr('target', '_self').submit();
		}
		
		
		function fnForm(reportNo, cmd){
			$('#reportNo').val(reportNo);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/' + cmd + '.do').attr('target', '_self').submit();
		} 
		
		/**************************************************
		함수명 : fnPopView
		설 명 : 과제 미리보기
		***************************************************/
		function fnPopView(reportNo){ 
			$('#reportNo').val(reportNo);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/report/view.do');
			SANGS.Util.openPopupSubmit($('form[name=frm]'), 'qFormPop', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}

	</script>

