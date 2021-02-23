<%
/****************************************
	system	: ClassDesk > 강사 > 설문
	title	: 설문 통계
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS  
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %>

	<!-- 설문통계 -->
	<!-- 설문명 -->
	<form name="frm" id="frm" action="/classdesk/tutor/poll.do">
	<input type="hidden" name="qNo" id="qNo" />
	<input type="hidden" name="pollcSeqNo" id="pollcSeqNo" />
	<div>
		<div class="round-box beige">
			<div class="table-type3">
				<table>
					<caption>시험정보</caption>
					<colgroup>
						<col width="10%" />
						<col width="30%" />
						<col width="10%" />
						<col width="20%" />
						<col width="10%" />
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th>설문명</th>
							<td><c:out value="${listData[0].TITLE }"/></td>
							<th>참여자수</th>
							<td><c:out value="${listData[0].TOTCNT }"/> 명</td>
							<th>설문결과 다운로드</th>
							<td><a href="#none" class="btn-small-brown" onclick="fnExcel()"><span>엑셀다운로드</span></a>  </td>
						</tr>
					</tbody>
				</table>
			</div>
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
	</div>
	</form>
	<!-- //설문명 -->
	<!-- 설문결과 -->
	
	
	<c:choose>
		<c:when test="${not empty listData}">
	
	<div class="mg-t18 clearfix">
		<!-- 설문 리스트 -->
		<div class="survey-list">
			<!-- 각 문항별로 name은 같아야함. 문항의 label과 id값이 달라야함 -->
			<!-- 접근성 인증을 위해 각 문항별 아이디는 전부 다르게 설정해줄 것 // 한 html 파일 내에 같은 id값이 존재해서는 안됨 -->
			
			
			<c:forEach items="${listData}" var="result" varStatus="stat">
			
			<dl>
				<dt><c:out value="${stat.count}"/>. <c:out value="${result.SUBJECT}"/></dt> 
				<!-- 주관식 -->
				<c:if test="${result.MT_CPOLL_CODE eq 'JBAA00' }">
				<c:set var="DESINDEX" value="0"/>
					<dd>
 						<%-- <a href="#none" onclick="fnPop('<c:out value="${result.POLLCSEQNO}"/>','<c:out value="${result.QNO}"/>'); return false;" class="btn-small-green"><span>답변</span></a> --%>
						<c:forEach items="${desListData}" var="desResult" varStatus="stat"> 
								<c:if test="${result.QNO eq desResult.QNO}">
										<c:set var="DESINDEX" value="${DESINDEX +1}"/>
										<p style="line-heigh:100%;"><c:out value="${DESINDEX}"/>. (<c:out value="${desResult.USERID}"/>) <c:out value="${desResult.ANSWER}"/></p>
								</c:if>
						</c:forEach>
					</dd>
				</c:if>
				
				
				<!-- 객관식 -->
				<c:if test="${result.MT_CPOLL_CODE eq 'JBBA00' }">
			
					<c:if test="${not empty result.ITEM01}">
					<dd>
						<ul class="survey-result clearfix">
							<li class="survey-txt">1) <c:out value="${result.ITEM01}"/></li>
							<!-- survey-people의 퍼센티지 숫자만큼 progress-bar의 style="width:%"값을 조절 -->
							<li class="survey-progress">
								<div class="progress-wrap">
									<div class="progress-bar" style="width:<c:out value="${result.PERCENT1}"/>%;"></div>
								</div>
							</li>
							<li class="survey-people"><c:out value="${result.PERCENT1}"/>%(<c:out value="${result.CNT1}"/>명)</li>
						</ul>
					</dd>
					</c:if>
			
					
					<c:if test="${not empty result.ITEM02}">
					<dd>
						<ul class="survey-result clearfix">
							<li class="survey-txt">2) <c:out value="${result.ITEM02}"/></li>
							<!-- survey-people의 퍼센티지 숫자만큼 progress-bar의 style="width:%"값을 조절 -->
							<li class="survey-progress">
								<div class="progress-wrap">
									<div class="progress-bar" style="width:<c:out value="${result.PERCENT2}"/>%;"></div>
								</div>
							</li>
							<li class="survey-people"><c:out value="${result.PERCENT2}"/>%(<c:out value="${result.CNT2}"/>명)</li>
						</ul>
					</dd>
					</c:if>
					
						<c:if test="${not empty result.ITEM03}">
					<dd>
						<ul class="survey-result clearfix">
							<li class="survey-txt">3) <c:out value="${result.ITEM03}"/></li>
							<!-- survey-people의 퍼센티지 숫자만큼 progress-bar의 style="width:%"값을 조절 -->
							<li class="survey-progress">
								<div class="progress-wrap">
									<div class="progress-bar" style="width:<c:out value="${result.PERCENT3}"/>%;"></div>
								</div>
							</li>
							<li class="survey-people"><c:out value="${result.PERCENT3}"/>%(<c:out value="${result.CNT3}"/>명)</li>
						</ul>
					</dd>
					</c:if>
					
						<c:if test="${not empty result.ITEM04}">
					<dd>
						<ul class="survey-result clearfix">
							<li class="survey-txt">4) <c:out value="${result.ITEM04}"/></li>
							<!-- survey-people의 퍼센티지 숫자만큼 progress-bar의 style="width:%"값을 조절 -->
							<li class="survey-progress">
								<div class="progress-wrap">
									<div class="progress-bar" style="width:<c:out value="${result.PERCENT4}"/>%;"></div>
								</div>
							</li>
							<li class="survey-people"><c:out value="${result.PERCENT4}"/>%(<c:out value="${result.CNT4}"/>명)</li>
						</ul>
					</dd>
					</c:if>
			
					<c:if test="${not empty result.ITEM05}">
					<dd>
						<ul class="survey-result clearfix">
							<li class="survey-txt">5) <c:out value="${result.ITEM05}"/></li>
							<!-- survey-people의 퍼센티지 숫자만큼 progress-bar의 style="width:%"값을 조절 -->
							<li class="survey-progress">
								<div class="progress-wrap">
									<div class="progress-bar" style="width:<c:out value="${result.PERCENT5}"/>%;"></div>
								</div>
							</li>
							<li class="survey-people"><c:out value="${result.PERCENT5}"/>%(<c:out value="${result.CNT5}"/>명)</li>
						</ul>
					</dd>
					</c:if>
				</c:if>
			 </dl>
			</c:forEach>
			
			
		</div>
		<!-- //설문 리스트 -->
	</div>
	
		</c:when>
	</c:choose>
	
	<!-- //설문결과 -->
    
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	<script type="text/javascript">

	    function fnPop(pollcSeqNo, qNo){
			$('#pollcSeqNo').val(pollcSeqNo);
			$('#qNo').val(qNo);
			$('#frm').attr('action', '/classdesk/tutor/poll/stats_etc.do')
			SANGS.Util.openPopupSubmit($('#frm'), 'pollStatsEtcPop', 'width=600, height=300, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
		// 엑셀다운로드
		function fnExcel() {
			$('#frm')
				.attr('target', '_self')
				.attr('action', '/classdesk/tutor/poll/poll_excel.do').submit();
		}
		
	</script>