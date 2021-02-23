<%
/****************************************
	system	: ClassDesk > 학생 > 과제
	title	: 과제 목록
	summary	:	
	wdate	: 2015-04-01
	writer	: SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="task"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<!-- //개설과목명 -->
	<!-- 과제리스트 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">과제리스트</h3>
	</div>
	
	<form name="frm" action="/classdesk/user/report/list.do">
		<input type="hidden" name="reportNo" id="reportNo" value="">
		<input type="hidden" name="cUserNo" id="cUserNo" value="">
		
		
		<div class="table-type1">
			<div class="table-header-left"></div>
			<table summary="상상스토리 교육시스템 클래스데스크의 과제 게시판입니다.">
				<caption>과제 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="10%" />
					<col width="15%" />
					<col width="8%" />
					<col width="8%" />
					<col width="5%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>과제명</th>
						<th>배점(취득점수)</th>
						<th>제출기간</th>
						<th>제출일</th>
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
								<td><c:out value="${result.EVAL}"/>
								<c:if test="${result.USER_OPENYN eq 'Y'}">(<c:out value="${result.VAL}"/>) </c:if>
								 
								
								</td>
								<td><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></td>
								<td>
								<c:choose>
								<c:when test="${result.USER_OPENYN eq 'Y'}">
									<fmt:formatDate value="${result.WDATE}" pattern="yyyy.MM.dd" />
								</c:when>
								<c:otherwise>-</c:otherwise>
								</c:choose>
								</td>
								
							<c:choose>
								<c:when test="${result.RESULTYN eq 'Y'}">
								<!-- 평가완료 상태 -->
								<td><em class="green_b">평가완료</em></td>
								<td>
									<a href="#none"  onclick="fnResult('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.CUSERNO}"/>', 'result'); return false;"  class="btn-small-white"><span class="green">결과</span></a>
									
								</td>
								</c:when>
								
							
								
								<c:otherwise>
									
									<c:choose>
										<c:when test="${empty result.CUSERNO}">
										
										<!-- 
									*****************		미 작성인 경우  ********************************************************************
										-->
										
										
											<c:if test="${result.ENDYN eq 'N'}">
											<!-- 작성중 -->
												<td><em class="blue_b">진행중</em></td>
												
												
												
												<td>
													<a href="#none" class="btn-small-white" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.SAVEYN}"/>','submit_form'); return false;" >
														<span class="green">작성</span>
													</a>
												</td>
											</c:if>
											
											<c:if test="${result.ENDYN eq 'Y'}">
											<!-- 과제마감 -->
												<td><em class="red_b">과제마감</em></td>
												<td> 
													평가중
												</td>
											</c:if>
										
										</c:when>
										
										<c:otherwise>
										
										<!-- 
										***************** 작성한 경우  ********************************************************************
										 -->
											<c:if test="${result.USER_OPENYN eq 'N' && result.ENDYN eq 'N'}">
											<!-- 작성중 -->
												<td><em class="blue_b">작성중</em></td>
												
												<td>
													<a href="#none" class="btn-small-white" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.SAVEYN}"/>', 'submit_form'); return false;" >
														<span class="green">작성</span>
													</a>
												</td>
											</c:if>
											
											
											<c:if test="${result.USER_OPENYN eq 'Y'}">
											<!-- 제출완료 -->
												<td><em class="blue_b">제출완료</em></td>
												<td>
													평가중
												</td>
												
											</c:if>
											
											<c:if test="${result.USER_OPENYN eq 'N' && result.ENDYN eq 'Y'}">
											<!-- 과제마감 -->
												<td><em class="red_b">과제마감</em></td>
												<td>
													<a href="#none" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', 'user_list'); return false;" >
														평가중
													</a>
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
						<td colspan="7" align="center">등록된 정보가 없습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>	
				</tbody>
			</table>
		</div>
	</form>
	<!-- //과제리스트 -->
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
    <script type="text/javascript">
    <!--
        // 페이징 이동 함수
        function fnList() {
            $('form[name=frm]').attr('action', '/classdesk/user/report/list.do').submit();
        }
        
        function fnResult(reportNo, cUserNo, cmd){
            $('#reportNo').val(reportNo);
            
            if(cUserNo == ''){
                cUserNo = 0;
            }
            
            $('#cUserNo').val(cUserNo);
            $('form[name=frm]').attr('action', '/classdesk/user/report/' + cmd + '.do').submit();
        }
        
        function fnForm(reportNo, saveYn, cmd){
            if(saveYn == 'N'){
                alert('과제 제출기간이 아닙니다.');
                return false;
            }
            
            $('#reportNo').val(reportNo);
            $('form[name=frm]').attr('action', '/classdesk/user/report/' + cmd + '.do').submit();
        }
    //-->
    </script>
