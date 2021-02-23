<%
/****************************************
	system	: ClassDesk > 강사 > 시험 > 문제은행 
	title	: 문제목록
	summary	:	
	wdate	: 2013-08-21
	writer	: kim min gyu
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("topMenuCode", "test");
%>
<%-- <%@ include file="/classdesk/common/include/header.jsp"  %> --%>
	<!-- 시험출제 -->
	<div class="table-title mg-t18 clearfix">
		<h3 class="ico-table-blue">출제정책별 문제관리</h3>
	</div>
	 
	<form id="popFrm" name="popFrm" method="post" action="<c:out value="${ctx}"/>/classdesk/tutor/quizbank.do">
 	<input type="hidden" name="subcmd" id="subcmd" value="q_list"> 
 	<input type="hidden" name="secNo" id="secNo" value="<c:out value="${REQUEST_DATA.secNo}"/>"/>
 	<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}"/>"/> 
 	<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value='<c:out value="${UPLOADQUIZ}"/>'/>
 	<div class="table-type2">
		<div class="table-header-left"></div>
	
		<table  id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 검색영역입니다.">
			<caption>검색영역</caption>
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="40%"> 
			</colgroup>
			<thead>
				<tr>
					<th>출제정책</th>
					<td class="left">
						<span id="setArea" >
									<select name="selectSetList" id="selectSetList" onchange="fnChSetList(this.value);">
										<c:choose>
											<c:when test="${not empty subListData}">
 												<c:forEach items="${subListData}" var="result" varStatus="stat">
							 						<option value="<c:out value="${result.SECNO}"/>"  <c:if test="${result.SECNO == REQUEST_DATA.secNo}"> selected</c:if> ><c:out value="${result.SECTITLE}"/></option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option value="0">등록된 세트가 없습니다</option>
											</c:otherwise>
										</c:choose>
									</select>
 						</span>
					</td>
					<th>세트명</th>
					<td>
						<select name="searchQtype">
								<option value="">전체</option>
						 		<option value="1" <c:if test="${REQUEST_DATA.searchQtype == 1}"> selected </c:if>>OX</option>
						 		<option value="2" <c:if test="${REQUEST_DATA.searchQtype == 2}"> selected </c:if>>객관식</option>
						 		<option value="4" <c:if test="${REQUEST_DATA.searchQtype == 4}"> selected </c:if>>서술형</option>
					 			<option value="5" <c:if test="${REQUEST_DATA.searchQtype == 5}"> selected </c:if>>단답형</option>
						</select>
						&nbsp; <input type="text" name="qsubject" value="<c:out value="${REQUEST_DATA.qsubject}"></c:out>" onKeyPress="if(event.keyCode==13){fnQuizList();} " />   
						<a href="#" onclick="fnQuizList();"  class="btn-small-orange"><span>검색</span></a> 
					</td>
				</tr>
			</thead>
		
		</table>
	</div>
	<br/>			
 	<div class="table-title clearfix">
		
	<div class="btn-group">
			<div class="btn-group"> 
				<a href="#none" onclick="fnPopForm('q_excel_form'); return false;" class="btn-small-blue"><span>문제일괄등록</span></a>
			</div>
		</div>
	</div>
 
	<div class="table-type1">
		<div class="table-header-left"></div>   
		
		<input type="hidden" name="qNo" id="qNo"/>
		<table  id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 출제시험입니다.">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>문제유형</th>
					<th>문제</th>
					<th>정답</th>
					<th>등록일자</th>
					<th>사용여부</th>
					<th><a href="#none" onclick="fnSavePop('0')" class="btn-small-white"><span class="blue">추가</span></a>  </th>
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
								<td class="left"><pre><c:out value="${result.QSUBJECT}"/></pre></td>
								<td><c:out value="${result.RCODE}"/></td>
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
								<td>
									<a href="#none" onclick="fnSavePop('<c:out value="${result.QNO}"/>'); return false;" class="btn-small-white"><span class="orange">수정</span></a>
									<a href="#none" onclick="fnDel('<c:out value="${result.QNO}"/>'); return false;" class="btn-small-white"><span class="red">삭제</span></a>
								</td>
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
			<a href="#none" onclick="fnExemList(); return false;" class="btn-large-blue"><span class="blue">이전</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%-- <%@ include file="/classdesk/common/include/footer.jsp" %> --%>
	
	<script type="text/javascript"><!--
          
	/**************************************************
	 함수명 : fnExemList
	 설 명 : 시험 폼 페이지 이동 
	***************************************************/ 
	function fnExemList() { 
		$('#subcmd').val('form');
		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam.do').submit();
	}
	  
	/**************************************************
	 함수명 : fnQuizList
	 설 명 : 현재 페이지 이동 
	***************************************************/
	function fnQuizList() { 
		$('#subcmd').val('q_list');
		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizbank.do').submit();
	}
	
	
	/**************************************************
	 함수명 : fnSavePop
	 설 명 : 문제 등록/수정 팝업폼
	***************************************************/
	function fnSavePop(qNo){
		$('#qNo').val(qNo);
		$('#subcmd').val('q_form');
		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop3', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
	}
	
	/**************************************************
	 함수명 : fnDel
	 설 명 : 문제 삭제 함수 
	***************************************************/
	function fnDel(qNo){
		  var answer = confirm ('삭제하시겠습니까?');
		  if(answer){
			  $('#qNo').val(qNo);
			  $('#subcmd').val('q_del_exec');
			  $('#popFrm').attr('target', '_cm').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizbank.do').submit();
		  }
	}
	
	/**************************************************
	 함수명 : fnPopForm
	 설 명 : EXCEL 문제 일괄등록 팝업 
	***************************************************/
	function fnPopForm(subcmd){
		$('#subcmd').val(subcmd);
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

		//-->
	</script>

