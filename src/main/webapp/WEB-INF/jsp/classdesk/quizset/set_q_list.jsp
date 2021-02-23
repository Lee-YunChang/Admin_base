<%
/****************************************
	system	: ClassDesk > 강사 > 시험 > 세트문제 출제
	title	: 세트 목록
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
	<div class="table-title mg-t18 clearfix">
		<h3 class="ico-table-blue">세트문제관리</h3>
	</div>
	
 	<form id="popFrm" name="popFrm" method="post" action="<c:out value="${ctx}"/>/classdesk/tutor/quizset.do">
	<input type="hidden" name="subcmd" id="subcmd" value="q_form"/>
	<input type="hidden" name="setno" id="setno" value="<c:out value="${REQUEST_DATA.setno}"/>"/>
	<input type="hidden" name="qno" id="qno"/> 
	<input type="hidden" name="examNo" id="examNo"/> 
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
					<th>세트명</th>
					<td class="left">
						<span id="setArea" >
									<select name="selectSetList" id="selectSetList" onchange="fnChSetList(this.value);">
										<c:choose>
											<c:when test="${not empty cateListData}">
 												<c:forEach items="${cateListData}" var="result" varStatus="stat">
							 						<option value="<c:out value="${result.SETNO}"/>"  <c:if test="${result.SETNO == REQUEST_DATA.setno}"> selected</c:if> ><c:out value="${result.TITLE}"/></option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option value="0">등록된 세트가 없습니다</option>
											</c:otherwise>
										</c:choose>
									</select>
 						</span>
					</td>
					<th>문제검색</th>
					<td class="left">
							<select id="qtype" name="qtype">
								<option value="">전체</option>
								<option value="1" <c:if test="${REQUEST_DATA.qtype == 1}"> selected="selected" </c:if>>OX</option>
						 		<option value="2" <c:if test="${REQUEST_DATA.qtype == 2}"> selected="selected" </c:if>>객관식 </option>
						 		<option value="4" <c:if test="${REQUEST_DATA.qtype == 4}"> selected="selected" </c:if>>단답형 </option>
								<option value="5" <c:if test="${REQUEST_DATA.qtype == 5}"> selected="selected" </c:if>>서술형</option>
							</select>
						&nbsp; <input type="text" name="qsubject" id="qsubject" value="<c:out value="${REQUEST_DATA.qsubject}"/>" onKeyPress="if(event.keyCode==13){fnList();} " /> 
					 			<a href="#none" onclick="fnList();" class="btn-small-orange"><span>검색</span></a>
  					</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
			
		</table>
	</div>
		
 	<br/>
 
	
	<div class="table-btn-group">
		<div class="btn-table">
		
			<a href="#none" onclick="fnPopForm('q_excel_form')" class="btn-small-blue"><span>문제일괄등록</span></a>
				<a href="#none"onclick="fnPopForm('quizbank_search');" class="btn-small-blue"><span>문제은행</span></a>
		</div>
		<div class="btn-table left">
				<a href="#none" onclick="fnBack();" class="btn-small-blue"><span>세트 목록</span></a>
		</div>
	</div>
	<div class="table-type4">
		<div class="table-header-left"></div>
	
		<table  id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 출제시험입니다.">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%">
				<col width="8%">
				<col width="*">
				<col width="5%">
				<col width="5%">
				<col width="10%">
				<col width="8%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>문제유형</th>
					<th>문제</th>
					<th>정답</th>
					<th>배점</th>
					<th>등록일자</th>
					<th>사용여부</th>
					<th><a href="#none"  onclick="fnPopFrm('0')" class="btn-small-white"><span class="blue">+추가</span></a></th>
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
									<pre><c:out value="${fn:replace(result.QSUBJECT, crlf, '<br />')}" escapeXml="false"/></pre>
									<c:if test= "${not empty result.QSUBJECT_FILE}">
										<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 600px" />
 									</c:if>
								</td>
								<td>
										<c:choose>
											<c:when test="${result.QTYPE == 1}">
												<c:if test="${result.RCODE eq '1'}">O</c:if>
												<c:if test="${result.RCODE eq '2'}">X</c:if>
											</c:when>
											
											<c:when test="${result.QTYPE == 2}">
												<c:out value="${result.RCODE}"/>
											</c:when>
											
											<c:when test="${empty result.RCODE}">
												<c:out value="${result.RTEXT}"/>
											</c:when>
											
											<%-- <c:otherwise>
												<c:out value="${result.RTEXT}"/>
											</c:otherwise> --%>
										</c:choose>
								</td>
								<td><c:out value="${result.ALLOT}"/></td>
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
									<a href="#none"  onclick="fnPopFrm('<c:out value="${result.QNO}"/>')" class="btn-small-white"><span class="orange">수정</span></a>
									<a href="#none" onclick="fnDel('<c:out value="${result.QNO}"/>')" class="btn-small-white"><span class="red">삭제</span></a> 
								</td>
							</tr>
						</c:forEach> 
					</c:when>
					<c:otherwise>
						<tr> <td colspan="8">등록된 문제가 없습니다. 문제를 등록해주세요!</td></tr>
					</c:otherwise>
				</c:choose>
			 
			</tbody>
		</table>

	</div>
	</form>
 


	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	<!--

    	// 페이징 이동 
    	function fnList() { 
    		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_list.do').submit();
    	}
    	
    	// 수정/ 등록 폼
    	function fnPopFrm(qNo){
    		$('#qno').val(qNo);
    		$('#popFrm').attr('action', '/classdesk/tutor/quizset/q_form.do');
    		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
    	}
    	
    	function fnBack() {
    		$('#examNo').val("${REQUEST_DATA.examNo}");
    		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/list.do').submit();
    	}
    	
    	// 문제삭제
    	function fnDel(qNo){
    		  var answer = confirm ('삭제하시겠습니까?');
    		  if(answer){
    			  $('#qno').val(qNo);
    			  $('#popFrm').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_del_exec.do').submit();
    		  }else{
    		   return false;
    		  }
    	}
    	
    	// 문제은행 조회
    	function fnPopForm(subcmd){
            $('#popFrm').attr('action', '/classdesk/tutor/quizset/' + subcmd + '.do');
    		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
    	}
    	
    	function fnChSetList(sno){
    		$('#setno').val(sno);
    		fnList();
    	}

	//-->
	</script>

