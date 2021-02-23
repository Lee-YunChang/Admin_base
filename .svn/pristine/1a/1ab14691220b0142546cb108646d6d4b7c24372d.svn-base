<%
/****************************************
	system	: ClassDesk > 수강생 > 설문
	title	: 설문 참여
	summary	:	
	wdate	: 2015-04-01
    writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %>

<c:choose>
	<c:when test="${not empty listData}">

	<div style="padding-top: 10px; padding-bottom: 10px;" align="center"><h2> <c:out value="${listData[0].TITLE}"/>  </h2></div>
	
	<div class="blue mg-t18 clearfix">
		<form id="markingForm" name="markingForm" action="/classdesk/user/poll/exec.do">
		<input type="hidden" name="pollcSeqNo" id="pollcSeqNo" value="<c:out value="${listData[0].POLLCSEQNO}"/>">
		<input type="hidden" name="qNo" id="qNo"/>
		<input type="hidden" name="answer" id="answer"/>
		<input type="hidden" name="itemSeq" id="itemSeq"/>
		<input type="hidden" name="openYn" id="openYn"/>
		
		
		
		<div class="survey-list">
			<!-- 각 문항별로 name은 같아야함. 문항의 정답별로 label과 id값이 달라야함 -->
			<!-- 접근성 인증을 위해 각 문항별 정답별로 아이디는 전부 다르게 설정해줄 것 // 한 html 파일 내에 같은 id값이 존재해서는 안됨 -->
			
			<c:forEach items="${listData}" var="result" varStatus="stat">
			
			
			<!-- 답이 길어질 경우 정렬 문제를 고려하여 텍스트 부분에 blockquote 적용 // 시험 볼때만 해당 -->
			<dl>
				<dt><c:out value="${stat.count}"/>. <c:out value="${result.SUBJECT }" /></dt>
				
				<input type="hidden" name="qNo<c:out value="${stat.index}"/>" id="qNo<c:out value="${stat.index}"/>" value="<c:out value="${result.QNO}" />" />
				<input type="hidden" name="mtCpollCode<c:out value="${stat.index}"/>" id="mtCpollCode<c:out value="${stat.index}"/>" value="<c:out value="${result.MT_CPOLL_CODE}" />" />
				
				<!-- 주관식 -->
				<c:if test="${result.MT_CPOLL_CODE eq 'JBAA00' }">
					<dd><textarea title="서술형정답" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" rows="5" style="width:99%;"><c:out value="${result.ANSWER}" /></textarea></dd>
				</c:if>
				
				
				<!-- 객관식 -->
				<c:if test="${result.MT_CPOLL_CODE eq 'JBBA00' }">
					<c:if test="${not empty result.ITEM01}">
					<dd><label for="question1-1">문제1</label><input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="1" <c:if test="${result.ITEMSEQ == 1 }"> checked="checked" </c:if>/> <blockquote>1) <c:out value="${result.ITEM01 }" /></blockquote></dd>
					</c:if>
					<c:if test="${not empty result.ITEM02}">
					<dd><label for="question1-1">문제2</label><input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="2" <c:if test="${result.ITEMSEQ == 2 }"> checked="checked" </c:if>/> <blockquote>2) <c:out value="${result.ITEM02 }" /></blockquote></dd>
					</c:if>
					<c:if test="${not empty result.ITEM03}">
					<dd><label for="question1-1">문제3</label><input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="3" <c:if test="${result.ITEMSEQ == 3 }"> checked="checked" </c:if>/> <blockquote>3) <c:out value="${result.ITEM03 }" /></blockquote></dd>
					</c:if>
					<c:if test="${not empty result.ITEM04}">
					<dd><label for="question1-1">문제4</label><input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="4" <c:if test="${result.ITEMSEQ == 4 }"> checked="checked" </c:if>/> <blockquote>4) <c:out value="${result.ITEM04 }" /></blockquote></dd>
					</c:if>
					<c:if test="${not empty result.ITEM05}">
					<dd><label for="question1-1">문제5</label><input type="radio" name="itemSeq<c:out value="${stat.index}"/>" id="itemSeq<c:out value="${stat.index}"/>" value="5" <c:if test="${result.ITEMSEQ == 5 }"> checked="checked" </c:if>/> <blockquote>5) <c:out value="${result.ITEM05 }" /></blockquote></dd>
					</c:if>
				</c:if>
			</dl>
			</c:forEach>
		</div>
		</form>
	</div>
	<!-- //시험문제 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnSave(); return false;" class="btn-large-blue"><span>설문등록</span></a>
		</div>
	</div>

	</c:when>
	<c:otherwise>
		<div align="center">등록된 설문이 없습니다.</div>
	</c:otherwise>
</c:choose>

	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">

    	$(document).ready(function(e){
    	
    		/**************************************************
    		 이벤트명 : $('input:radio').bind('click', function(e){
    		 설 명 : 정답 오답 라디오 바인딩
    		***************************************************/ 
    		$('input:radio').bind('click', function(e){
    			var index = $(this).attr('id').replace('itemSeq',''); // 클릭한 인덱스
    			fnSubmit(index);
    		});
    		 
    		 
    		/**************************************************
    		 이벤트명 : $('input:text, textarea').bind('focusout', function(e){
    		 설 명 : 주관식 답 바인딩
    		***************************************************/ 
    		$('input:text, textarea').bind('focusout', function(e){
    			var index = $(this).attr('id').replace('answer','');
    			fnSubmit(index);
    		});
    	
    	});
	
	
		/**************************************************
		 함수명 : fnSubmit
		 설 명 : 실시간 정답 UPDATE 
		***************************************************/ 
		function fnSubmit(index){
			
			$('#qNo').val($('#qNo'+index).val()); //문제번호
			$('#answer').val($('#answer'+index).val()); //주관식응시답안
			$('#itemSeq').val($('#itemSeq'+index +':checked').val()); //선택답안
			$('#openYn').val('N'); //제출여부(Y,N)
			SANGS.Util.ajax('<c:out value="${ctx}"/>/classdesk/user/poll/ajaxSaveRealTmAns.do', $('#markingForm').serialize(), 'json', eval('fnSucces'));
		}
		
		function fnSucces(result){
			//alert(result);
		}
		
		
		function fnSave(){
			<c:forEach items="${listData}" var='result' varStatus='stat'>
			    <c:if test="${result.MT_CPOLL_CODE eq 'JBAA00' }">
			    if($('textarea[name=answer'+<c:out value="${stat.index}"/>+']').valueEmpty()) {
			        alert('주관식 문항을 입력해주세요.');
			        return false;
			    }
			    </c:if>
			    
			    <c:if test="${result.MT_CPOLL_CODE eq 'JBBA00' }">
			    if($(':radio[name=itemSeq'+<c:out value="${stat.index}"/>+']:checked').length == 0){
			        alert('객관식 문항을 입력해주세요.');
			        return false;
			    }
			    </c:if>
			</c:forEach>
		
	        $('#openYn').val('Y'); //제출여부(Y,N)
			
			$('form[name=markingForm]').attr('method', 'post').attr('target', '_cm').submit();
		}
	
	</script>

