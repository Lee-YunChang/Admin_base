<%
/****************************************
	system	: ClassDesk > 강사 > 시험 > 문제은행 
	title	: 문제목록
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
	<!-- 시험출제 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">출제정책별 문제관리</h3>
	</div>
	
	<form id="popFrm" name="popFrm" method="post" action="/classdesk/tutor/quizbank/list.do">
 	<input type="hidden" name="secNo" id="secNo" value="<c:out value='${REQUEST_DATA.secNo}'/>"/>
 	<input type="hidden" name="examNo" id="examNo" value="<c:out value='${REQUEST_DATA.examNo}'/>"/>
 	
 	<input type="hidden" name="lecNum" id="lecNum" value="${REQUEST_DATA.lecNum}">
 	<input type="hidden" name="title" id="title" value="${REQUEST_DATA.title}">
	<input type="hidden" name="eval" id="eval" value="${REQUEST_DATA.eval}">
	<input type="hidden" name="examTime" value="${REQUEST_DATA.examTime}"> 
	<input type="hidden" name="sdate" value="${REQUEST_DATA.sdate}"> 
	<input type="hidden" name="shour" value="${REQUEST_DATA.shour}"> 
	<input type="hidden" name="smin" value="${REQUEST_DATA.smin}"> 
	<input type="hidden" name="edate" value="${REQUEST_DATA.edate}"> 
	<input type="hidden" name="ehour" value="${REQUEST_DATA.ehour}"> 
	<input type="hidden" name="emin" value="${REQUEST_DATA.emin}">
	
 	
	<div class="table-type1">
		<div class="table-header-left"></div>   
		
		<input type="hidden" name="qNo" id="qNo"/>
		<input type="hidden" name="qu" id="qu" value="<c:out value="${REQUEST_DATA.qu}"/>">
		<table  id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 출제시험입니다.">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%">
				<col width="5%">
				<col width="*">
				<col width="17%">
				<col width="10%">
				<col width="5%">
				<c:if test="${REQUEST_DATA.examType ne 'A'}"><col width="10%"></c:if>
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>문제유형</th>
					<th>문제</th>
					<th>정답</th>
					<th>등록일자</th>
					<th>사용여부</th>
					<c:if test="${REQUEST_DATA.examType ne 'A'}">
					<th>
					<a href="#none" onclick="fnSavePop('0','<c:out value="${REQUEST_DATA.qu}"/>')" class="btn-small-white"><span class="blue">추가</span></a>
					</th>  
					</c:if>
				</tr>
			</thead>
			<tbody>
				
				<c:choose>
					<c:when test="${not empty listData}">
 						<c:forEach items="${listData}" var="result" varStatus="stat">
	 						<tr>
								<td><c:out value="${result.RNUM}"/></td>
								<td>
									<c:choose>
									 	<c:when test="${result.QTYPE == 1}"> OX </c:when>
									 	<c:when test="${result.QTYPE == 2}"> 객관식 </c:when> 
									 	<c:when test="${result.QTYPE == 4}"> 단답형</c:when>
									 	<c:when test="${result.QTYPE == 5}"> 서술형</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose> 
								</td>
								<td class="left">
									<pre><c:out value="${result.QSUBJECT}"/></pre>
									<c:if test= "${not empty result.QSUBJECT_FILE}">
									<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=R&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 99%" /> 
 								</c:if>
								</td>
								<td>
										<c:choose>
											<c:when test="${result.QTYPE == 1}">
												<c:if test="${result.RCODE ==  1}">O</c:if>
												<c:if test="${result.RCODE ==  2}">X</c:if>
											</c:when>
											
											<c:when test="${result.QTYPE == 2}">
												<c:out value="${result.RCODE}"/>
												<c:if test="${empty result.RCODE}"><c:out value="${result.RTEXT}"/></c:if>
											</c:when> 
											<c:when test="${ result.QTYPE == 4  || result.QTYPE == 5 }">
												<c:out value="${result.RTEXT}"/>
											</c:when>
											<c:otherwise>
												<c:out value="${result.RTEXT}"/>
											</c:otherwise>
										</c:choose>
								</td>
								<td><fmt:formatDate value="${result.WDATE}" pattern="yyyy-MM-dd" /></td>
								<td>
									<c:choose>
										<c:when test="${result.USEYN eq 'Y'}">
											<span class="blue_b">Y</span>
										</c:when>
										<c:otherwise>
											<span class="red_b">N</span>
										</c:otherwise>
									</c:choose>
								</td>
								<c:if test="${REQUEST_DATA.examType ne 'A'}">
								<td>
									<a href="#none" onclick="fnSavePop('<c:out value="${result.QNO}"/>','<c:out value="${REQUEST_DATA.qu}"/>'); return false;" class="btn-small-white"><span class="orange">수정</span></a>
									<a href="#none" onclick="fnDel('<c:out value="${result.QNO}"/>','<c:out value="${REQUEST_DATA.qu}"/>'); return false;" class="btn-small-white"><span class="red">삭제</span></a>
								</td>
								</c:if>
							</tr>
						</c:forEach> 
					</c:when>
					<c:otherwise>
						<tr> <td colspan="7">등록된 정보가 없습니다.</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>
	</form>
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnExemList(); return false;" class="btn-large-orange"><span class="orange">이전</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript"> 
    	/**************************************************
    	 함수명 : fnExemList
    	 설 명 : 시험 폼 페이지 이동 
    	***************************************************/ 
    	function fnExemList() { 
    		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/exam/form.do').submit();
    	}
    	  
    	/**************************************************
    	 함수명 : fnQuizList
    	 설 명 : 현재 페이지 이동 
    	***************************************************/
    	function fnQuizList() { 
    		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizbank/q_list.do').submit();
    	}
    	
    	
    	/**************************************************
    	 함수명 : fnSavePop
    	 설 명 : 문제 등록/수정 팝업폼
    	***************************************************/
    	function fnSavePop(qNo,qu){
    		 var cnt = 0;
    		 $.ajax({
				url : "/classdesk/tutor/exam/leExamBeAfterCheck.do",
				data : { cseqno :'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>'},
	            dataType : "json",
	            type : 'post',
	            success : function(data) {
	            	cnt = data.afCheckCnt ;
	            	if(cnt > 0){
	         			alert('이미 사후시험이 등록되어 문항 추가/수정/삭제는 불가합니다.'); 
	         			return;
	         		}
	            	else {
		        		$('#qNo').val(qNo);
		        		$('#qu').val(qu);
		        		$('#popFrm').attr('action', '/classdesk/tutor/quizbank/q_form.do');
		        		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop3', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
	            	}
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
			});
         	
    	}

    	/**************************************************
    	 함수명 : fnDel
    	 설 명 : 문제 삭제 함수 
    	***************************************************/
    	function fnDel(qNo,qu){
    		 $.ajax({
 				url : "/classdesk/tutor/exam/leExamBeAfterCheck.do",
 				data : { cseqno :'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>'},
 	            dataType : "json",
 	            type : 'post',
 	            success : function(data) { 
 	            	if(data.afCheckCnt > 0){
             			alert('이미 사후시험이 등록되어 문항 추가/수정/삭제는 불가합니다.'); 
             			return;
             		}
 	            	else {
 	            		var answer = confirm ('삭제하시겠습니까?');
	 	         		if(answer){
	 	         			$('#qNo').val(qNo);
	 	         			$('#qu').val(qu);
	 	         			$('#popFrm').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizbank/q_del_exec.do').submit();
	 	         		} 
 	            	}
 	            },
 	            error : function(e) {
 	                alert("error :" + e.responseText);
 	            }
 			});
    		 
    		  
    	}
    	
    	/**************************************************
    	 함수명 : fnPopForm
    	 설 명 : EXCEL 문제 일괄등록 팝업 
    	***************************************************/
    	function fnPopForm(subcmd){
            $('#popFrm').attr('action', '/classdesk/tutor/quizbank/' + subcmd + '.do')
    		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop2', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
    	}
    	
    	/**************************************************
    	 함수명 : fnChSetList
    	 설 명 : 출제정책 검색
    	***************************************************/
    	function fnChSetList(sno){
    		$('#secNo').val(sno);
    		fnQuizList();
    	}
    	
	</script>