<%
/****************************************
	system	: ClassDesk > 사용자 > 시험결과
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

	<!-- 시험정보 -->
	<div>
		<div class="round-box beige">
		
		<form name="ansFrm" id="ansFrm" action="/classdesk/user/exam.do" method="post" >

		</form>
		
		
			<!-- 시험정보 테이블 영역 -->
			<div class="table-type3">
				<table summary="상상스토리 교육시스템 클래스데스크의 시험정보입니다.">
					<caption>시험정보</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>시험명</th>
							<td><c:out value="${listData[0].TITLE}"/></td>
							<th>응시자</th>
							<td><c:out value="${listData[0].USERNAME}"/>(<c:out value="${listData[0].USERID}"/>)</td>
						</tr>
						<tr>
							<th>시험유형</th>
							<td><c:out value="${listData[0].EXAM_TYPE_NM}"/> </td>
							<th>점수</th>
							<td><c:out value="${listData[0].SUM_VAL}"/>/<c:out value="${listData[0].EVAL}"/> </td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //시험정보 테이블 영역 -->
		</div>
	</div>
	<!-- //시험정보 -->
	<!-- 시험문제 -->
	<div class="round-box-small blue mg-t18 clearfix">
		<form id="markingForm" name="markingForm">
		<!-- 시험문제 리스트 -->
		<c:choose>
			<c:when test="${not empty listData}">
				<div class="exam-list">
					<!-- 각 문항별로 name은 같아야함. 문항의 정답별로 label과 id값이 달라야함 -->
					<!-- 접근성 인증을 위해 각 문항별 정답별로 아이디는 전부 다르게 설정해줄 것 // 한 html 파일 내에 같은 id값이 존재해서는 안됨 -->
					
					
					<c:forEach items="${listData}" var="result" varStatus="stat">
					
					<dl>
						<dt>
							<c:out value="${stat.count}"/>. <c:out value="${fn:replace(result.QSUBJECT, crlf, '<br />')}" escapeXml="false"/>
						</dt>
						
						<!-- O/X  -->
						<%-- <c:if test="${result.QTYPE == 1 }">
							<dd>
								예 <input type="radio" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" value="Y" <c:if test="${result.ANSWER eq 'Y' }"> checked="checked" </c:if> /> 
								아니오 <input type="radio" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" value="N" <c:if test="${result.ANSWER eq 'N' }"> checked="checked" </c:if> />
								<!-- 모르것다;; -->
							</dd>
						</c:if> --%>
						
						<!-- 주관식 단답형/서술형-->
						<c:if test="${result.QTYPE == 4 || result.QTYPE == 5}">
							<dd <c:if test="${result.ISRIGHT ne 'Y' }">class="red_b" </c:if>>
							<c:out value="${fn:replace(result.ANSWER, crlf, '<br />')}" escapeXml="false"/>
							</dd>
						</c:if>
				
				
						<c:if test="${result.QTYPE == 1 || result.QTYPE == 2}">
							<!-- 답이 길어질 경우 정렬 문제를 고려하여 텍스트 부분에 blockquote 적용 // 시험 볼때만 해당 -->
							
							<c:if test="${not empty result.A01 || not empty result.A01_FILE}">
							<dd><blockquote style="<c:if test="${result.RCODE == 1}">text-decoration: underline;</c:if><c:if test="${result.ISRIGHT ne 'Y' && result.ITEMSEQ == 1}">color: red;</c:if>">1) <c:out value="${result.A01 }" /></blockquote></dd>
							</c:if>
							<c:if test="${not empty result.A02 || not empty result.A02_FILE}">
							<dd><blockquote style="<c:if test="${result.RCODE == 2}">text-decoration: underline;</c:if><c:if test="${result.ISRIGHT ne 'Y' && result.ITEMSEQ == 2}">color: red;</c:if>">2) <c:out value="${result.A02 }" /></blockquote></dd>
							</c:if>
							<c:if test="${not empty result.A03 || not empty result.A03_FILE}">
							<dd> <blockquote style="<c:if test="${result.RCODE == 3}">text-decoration: underline;</c:if><c:if test="${result.ISRIGHT ne 'Y' && result.ITEMSEQ == 3}">color: red;</c:if>">3) <c:out value="${result.A03 }" /></blockquote></dd>
							</c:if>
							<c:if test="${not empty result.A04 || not empty result.A04_FILE}">
							<dd><blockquote style="<c:if test="${result.RCODE == 4}">text-decoration: underline;</c:if><c:if test="${result.ISRIGHT ne 'Y' && result.ITEMSEQ == 4}">color: red;</c:if>">4) <c:out value="${result.A04 }" /></blockquote></dd>
							</c:if>
							<c:if test="${not empty result.A05 || not empty result.A05_FILE}">
							<dd><blockquote style="<c:if test="${result.RCODE == 5}">text-decoration: underline;</c:if><c:if test="${result.ISRIGHT ne 'Y' && result.ITEMSEQ == 5}">color: red;</c:if>">5) <c:out value="${result.A05 }" /></blockquote></dd>
							</c:if>
						</c:if>
					
					</dl>
					 
					</c:forEach>
				</div>
			</c:when>
		</c:choose>
		
		<!-- //시험문제 리스트 -->
		<!-- 답안지 -->
		<div class="table-type4 marking" id="quickmenu">
			<table class="mg-t10" id="ansList" summary="상상스토리 교육시스템 클래스데스크의 답안지입니다.">
				<caption>답안지</caption>
				<colgroup>
					<col width="33%" />
					<col width="33%" />
					<col width="34%" />
				</colgroup>
				<thead>
					<tr>
						<th>문제</th>
						<th>정답여부</th>
						<th>점수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listData}" var="ansVal" varStatus="stat">
					<tr>
						<td><a href="#none" onclick="showScrollTop('<c:out value="${stat.index}"/>'); return false;" ><c:out value="${stat.count}"/></a></td>
						<td id="ans_<c:out value="${stat.index}"/>">
						<c:choose>
								<c:when test="${ansVal.ISRIGHT eq 'Y' }"><span class="blue_b">O</span></c:when>
								<c:otherwise><span class="red_b">X</span></c:otherwise>
							</c:choose>
						</td>
						<td id="val_<c:out value="${stat.index}"/>"><c:out value="${ansVal.VAL }" default="0" /></td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><strong>총점</strong></td>
						<td id="sumArea"  class="red_b"><c:out value="${listData[0].SUM_VAL}" default="0" /></td>
					
					</tr>
				</tfoot>
			</table>
		</div>
		<!-- //답안지 -->
		</form>
	</div>
	<!-- //시험문제 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-green"><span>목록</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	<style>
	 #quickmenu {position:absolute; left:50%; top:10px; width:14%; margin-left:35%; } 
	</style>
	<script type="text/javascript"><!--
	$(document).ready(function(e){
		$(window).scroll(function() {
			var currentTop = -250;
			
			if($(window).scrollTop() < 275 ){
				currentTop =  10;//parseInt($('#quickmenu').css('top'));
			}

			$('#quickmenu').stop().animate({'top': $(window).scrollTop()+currentTop+'px'}, 500);
		});
		 
	});
	
	function fnList() { 
		$('form[name=ansFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/user/exam/list.do').submit();
	} 
	
	function showScrollTop(index){
	    var val =$('.exam-list dl').eq(index).offset();
	    $('body,html').animate({scrollTop:val.top},300);
	    
	}
		//-->
	</script>

