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

<style>

.table-type1 { margin-top:10px; margin-bottom:10px; }
div#Right_Area h3 { line-height: 20px; }
div.btn-table { text-align: right; }

</style>
<!-- 시험리스트 -->

	<div class="table-title clearfix">
		<h3 class="ico-table-blue">시험</h3>
	</div>
	
	<form name="frm" action="">
		<input type="hidden" name="examNo" id="examNo" value="">
		<input type="hidden" name="qu" id="qu" value="">	 
		<div id="Right_Area" class="table-type1">
		<div class="table-header-left"></div>
			
			<!-- 기간제 운영일 경우 -->
				<table>
					<caption>시험 게시판</caption>
					<colgroup>
						<col width="5%" />
						<col width="*" />
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>시험명</th>
							<th>점수</th>
							<th>응시기간</th>
							<th>응시인원</th> 
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
									<td>
										<c:out value="${result.SDATE}"  />   ~ <c:out value="${result.EDATE}"  />						
									</td>
									<!-- 기간운영일시 노출 -->
								
									<td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
									
									<c:choose>
										<c:when test="${result.OPENYN eq 'N'}">
										<td><em class="blue_b">작성중</em></td>
										<td>
												<a href="#none" class="btn-small-white"  onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" ><span class="blue">등록</span></a>
										</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${result.RESULTYN eq 'Y'}">
												<td><em class="green_b">채점완료</em></td>
												<td>
														<a href="#none"  onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'user_list'); return false;"  class="btn-small-white"><span class="green">결과</span></a>
												</td>
												</c:when>
												
												<c:otherwise>
													<c:choose>
	  													<c:when test="${result.ENDYN eq 'Y'}">
															<td><em class="red_b">시험종료</em></td>
														</c:when>
														<c:otherwise>
															<td>
																	<c:choose>
																		<c:when test="${result.SAVEYN eq 'Y'}"><em class="green_b">진행중</em></c:when>
																		<c:otherwise>시험대기</c:otherwise>
																	</c:choose>
															</td>
															
															
														</c:otherwise>
													</c:choose>
													
													<td>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" class="btn-small-white"><span class="green">수정</span></a>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'user_list'); return false;" class="btn-small-white"><span class="red">채점</span></a>
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
							<td colspan="8" align="center">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>	
					</tbody>
				</table>
		</div>
	</form>
	
	<!-- //시험리스트 -->
	<!-- 게시판 버튼영역 -->
	<div id="Right_Area">
		<div class="btn-table">
			<a href="#none" onclick="fnCreate(); return false;" class="btn-large-blue"><span>시험출제</span></a>
		</div>
	</div>

	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
<script type="text/javascript">

	var examCnt = '${fn:length(listData)}';
	function fnForm(examNo, cmd){  
		$('#examNo').val(examNo);
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/' + cmd + '.do').submit();
	}
	
	function fnCreate() {
		if (examCnt > 4) {
			alert('시험은 최대 5건 까지\n등록할 수 있습니다.');
			return false;
		}
		 
		$('#examNo').val('');
		$('#qu').val('insert');
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/form.do').submit();
	}
	
	$(function($) {
		$('input[name=useCheck]:radio').click(function(e){
			
			$sthis = $(this).parent().find('input[name=useYn]');
			
			$sthis.val('Y');
			
			$('input[name*=useYn]').not($sthis).val('N');
			
			fnUsseExec();
			
		});
	});
	/**************************************************
	 함수명 : fnList
	 설 명 : 페이징 이동 함수
	***************************************************/ 
	function fnList() {
		$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/list.do').submit();
	}
	
	function fnUsseExec() {
		var answer = confirm ('해당 시험을 사용 하시겠습니까?');
		if(answer){ 
			$('form[name=frm]').attr('target', '_cm').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/use_exec.do').submit();
		} 
	}  

</script>

