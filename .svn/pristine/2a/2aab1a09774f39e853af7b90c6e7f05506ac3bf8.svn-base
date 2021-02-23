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

	<!-- //개설과목명 -->
	<!-- 시험리스트 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">시험리스트</h3>
	</div>
	
	<form name="frm" action="">
		<input type="hidden" name="subcmd" id="subcmd" value="">
		<input type="hidden" name="examNo" id="examNo" value="">	  
		<div class="table-type1">
			<div class="table-header-left"></div>
			
			<c:choose>
				<c:when test="${rowData.OPENTYPE ne 'A' }">
			<table summary="상상스토리 교육시스템 클래스데스크의 시험 게시판입니다.">
				<caption>시험 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="*" />
					<col width="5%" />
					<col width="20%" />
					<col width="8%" />
					<!-- <col width="8%" /> -->
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>구분</th>
						<th>시험</th>
						<th>배점</th>
						<th>응시기간</th>
						<th>응시일자</th>
						<!-- <th>상태</th> -->
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				
				<c:choose>
					<c:when test="${not empty listData}">
						<c:forEach items="${listData}" var="result" varStatus="stat">
							<tr>
								<td><c:out value="${result.RNUM}"/></td>
								<td class="left"><c:out value="${result.EXAM_TYPE_NM}"/></td>
								<td class="left"><c:out value="${result.TITLE}"/></td>
								<td><c:out value="${result.EVAL}"/></td>
								<td><c:out value="${result.SDATE}"/>   ~ <c:out value="${result.EDATE}"/></td>
								<td>
								
								<c:choose>
									<c:when test="${result.USER_SUBMITYN eq 'Y'}">
										<fmt:formatDate value="${result.EXAM_SDATE}" pattern="yyyy.MM.dd" />
									</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>

								
								<c:choose>
								<c:when test="${result.RESULTYN eq 'Y'}">
								<!-- 채점완료 상태 -->
								<td>
									<a href="#none" class="btn-small-white" onclick="location.href='/classdesk/user/result/view.do?'; return false;" ><span class="green">성적확인</span></a>
								</td>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${empty result.CUSERNO}">
										
										<!-- 
									*****************		미 응시인 경우  ********************************************************************
										-->
										
										
											<c:if test="${result.ENDYN eq 'N'}">
											<!-- 작성중 -->
												<!-- <td><em class="blue_b">진행중</em></td> -->
												<td>
													<c:choose>
														<c:when test="${result.SAVEYN eq 'Y'}">
															<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','submit_form'); return false;"  class="btn-small-white">
															<span class="blue">시험시작</span>
															</a>
														</c:when>
														<c:otherwise>
																시험대기
														</c:otherwise>
													</c:choose>
												</td>
											</c:if>
											
											<c:if test="${result.ENDYN eq 'Y'}">
											<!-- 시험마감 -->
												<td> 
													채점중
												</td>
											</c:if>
										</c:when>
										<c:otherwise>
										<!-- 
										***************** 응시한 경우  ********************************************************************
										 -->
											<c:if test="${(empty result.USER_SUBMITYN  || result.USER_SUBMITYN eq 'N') && result.ENDYN eq 'N'}">
												<td>
													<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'submit_form'); return false;" class="btn-small-white">
														<span class="blue">시험시작</span>
													</a>
												</td>
											</c:if>
											
											
											<c:if test="${result.USER_SUBMITYN eq 'Y'}">
											<!-- 제출완료 -->
												<td>
													평가중
												</td>
												
											</c:if>
											
											<c:if test="${(empty result.USER_SUBMITYN  || result.USER_SUBMITYN eq 'N') && result.ENDYN eq 'Y'}">
											<!-- 과제마감 -->
												<td>
													<a href="#none" class="btn-small-white" onclick="location.href='/classdesk/user/result/view.do'; return false;" ><span class="green">성적확인</span></a>
												</td>
											</c:if>
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
			</c:when>
			<c:otherwise>
			<table summary="상상스토리 교육시스템 클래스데스크의 시험 게시판입니다.">
				<caption>시험 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="*" />
					<col width="5%" />
					<col width="20%" />
					<col width="8%" />
					<!-- <col width="8%" /> -->
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>구분</th>
						<th>시험</th>
						<th>배점</th>
						<th>응시일자</th>
						<!-- <th>상태</th> -->
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				
				<c:choose>
					<c:when test="${not empty listData}">
						<c:forEach items="${listData}" var="result" varStatus="stat">
							<c:if test="${result.USEYN eq 'Y'}">
							<tr>
								<td><c:out value="${result.RNUM}"/></td>
								<td class="left"><c:out value="${result.EXAM_TYPE_NM}"/></td>
								<td class="left"><c:out value="${result.TITLE}"/></td>
								<td><c:out value="${result.EVAL}"/></td>
								<td>
								
								<c:choose>
									<c:when test="${result.USER_SUBMITYN eq 'Y'}">
										<fmt:formatDate value="${result.EXAM_SDATE}" pattern="yyyy.MM.dd" />
									</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>

								
								<c:choose>
								<c:when test="${result.RESULTYN eq 'Y'}">
								<!-- 채점완료 상태 -->
								<td>
									<a href="#none" class="btn-small-white" onclick="location.href='/classdesk/user/result/view.do'; return false;" ><span class="green">성적확인</span></a>
								</td>
								</c:when>
								
								<c:otherwise>
									<c:choose>
										<c:when test="${empty result.CUSERNO}">
										
										<!-- 
									*****************		미 응시인 경우  ********************************************************************
										-->
										
										
											<c:if test="${result.OPEN_A_ENDYN eq 'N'}">
											<!-- 작성중 -->
												<td>
													<c:choose>
														<c:when test="${result.OPEN_A_SAVEYN eq 'Y'}">
															<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','submit_form'); return false;"  class="btn-small-white">
															<span class="blue">시험시작</span>
															</a>
														</c:when>
														<c:otherwise>
																시험대기
														</c:otherwise>
													</c:choose>
												</td>
											</c:if>
											
											<c:if test="${result.OPEN_A_ENDYN eq 'Y'}">
											<!-- 시험마감 -->
												<td> 
													채점중
												</td>
											</c:if>
										</c:when>
										<c:otherwise>
										<!-- 
										***************** 응시한 경우  ********************************************************************
										 -->
											<c:if test="${(empty result.USER_SUBMITYN  || result.USER_SUBMITYN eq 'N') && result.ENDYN eq 'N'}">
												<td>
													<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'submit_form'); return false;" class="btn-small-white">
														<span class="blue">시험시작</span>
													</a>
												</td>
											</c:if>
											
											
											<c:if test="${result.USER_SUBMITYN eq 'Y'}">
											<!-- 제출완료 -->
												<td>
													평가중
												</td>
											</c:if>
											
											<c:if test="${(empty result.USER_SUBMITYN  || result.USER_SUBMITYN eq 'N') && result.ENDYN eq 'Y'}">
											<!-- 과제마감 -->
												<td>
													<a href="#none" class="btn-small-white" onclick="location.href='/classdesk/user/result/view.do'; return false;" ><span class="green">성적확인</span></a>
												</td>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>   
					<tr>
						<td colspan="6" align="center">등록된 정보가 없습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>	
				</tbody>
			</table>
			</c:otherwise>
			</c:choose>
		</div>
	</form>
	<!-- //시험리스트 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	<!--
		function fnForm(examNo, cmd){
    		var opentype = '<c:out value="${rowData.OPENTYPE}"/>';
    		var progPercent  = parseInt('<c:out value="${rowData.EXAM_PROG_PERCENT}"/>');
    		var userPercent = parseInt('<c:out value="${progData.PROG_PER}"/>');
    		if(opentype == 'A'){
    			if( progPercent <= userPercent){
    				if(confirm('시험은 제한 기간 내에 제출해야 하며\n한번만 응시 할 수 있습니다.\n\n시작 하시겠습니까?')){
    					$('#examNo').val(examNo);
    					$('form[name=frm]').attr('action', '/classdesk/user/exam/' + cmd + '.do').submit();	
    					
    				}
    			}else{
    				alert('학습 진도율이 ' +progPercent+ '% 이상이어야 합니다.');
    				return false;
    			}
    			
    		}else{
    
    			if(confirm('시험은 제한 기간 내에 제출해야 하며\n한번만 응시 할 수 있습니다.\n\n시작 하시겠습니까?')){
    				$('#examNo').val(examNo);
    				$('form[name=frm]').attr('action', '/classdesk/user/exam/' + cmd + '.do').submit();	
    				
    			}
    		}
    	}
	//-->
	</script>

