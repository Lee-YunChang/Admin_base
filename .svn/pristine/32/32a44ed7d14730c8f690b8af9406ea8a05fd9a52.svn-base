<%
/****************************************
	system	: ClassDesk > 강사 > 시험 
	title	: 세트방식 시험 문제 수정 / 등록 양식  팝업
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"  %>

<!-- header -->
<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">문제등록(문제은행)</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content"> 

		
	<form id="qform" name="qform">
		<div class="table-title clearfix">
			<div class="table-search left">
				<input type="hidden" name="setno" id="setno" value="<c:out value="${REQUEST_DATA.setno}"/>"> 
				<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.SES_COURSENO}"/>"> 
			
			 	<select name="searchSecno" id="searchSecno">
			 		<option value="">- 출제정책 -</option>
			 		<c:choose>
						<c:when test="${not empty cateData}">
								<c:forEach items="${cateData}" var="cateResult" varStatus="stat">
									<option value="<c:out value="${cateResult.SECNO}"/>"  <c:if test="${REQUEST_DATA.searchSecno == cateResult.SECNO}"> selected="selected" </c:if>><c:out value="${cateResult.SECTITLE}"/></option> 
							</c:forEach> 
						</c:when> 
					</c:choose>
			 	</select>
	  			
	  			<input type="text" name="qsubject" id="qsubject" value="<c:out value="${REQUEST_DATA.qsubject}"/>" />  
	 			<a href="#none"  onclick="fnList()" class="btn-small-orange"><span>검색</span></a>
			</div>
 		</div>
 	<div class="table-type4">
		<div class="table-header-left"></div>
		
		
		<table id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 출제시험입니다.">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" class="input_chbox" style="border:0px" name="isall" id="isall" onclick="MsgUserAllCheck();"></th>
					<th>문제유형</th>
					<th>문제</th> 
				</tr>
			</thead>
			<tbody>
				
				
					<c:choose>
						<c:when test="${not empty listData}">
								<c:forEach items="${listData}" var="result" varStatus="stat">
									<tr>
										<td><input type="checkbox" name="qno" id="qno" value="<c:out value="${result.QNO}"/>"></td>
										<td>
											<c:choose>
											 	<c:when test="${result.QTYPE == 1}"> OX </c:when>
											 	<c:when test="${result.QTYPE == 2}"> 객관식 </c:when>  
											 	<c:when test="${result.QTYPE == 4}"> 단답형</c:when>
											 	<c:when test="${result.QTYPE == 5}"> 서술형</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose> 
										</td>
										<td class="left"><pre><c:out value="${fn:replace(result.QSUBJECT, crlf, '<br />')}" escapeXml="false"/></pre></td> 
									</tr>
							</c:forEach> 
						</c:when> 
					</c:choose>
			</tbody>
		</table>

	</div>
 	
 		</form>

</div>
	 
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup">
 		<a href="#none" onclick="fnSave();"  class="btn-large-blue"><span>등록</span></a>
	</div>
</div>


<!-- //팝업 버튼영역 -->

<script type="text/javascript">
<!--
          
	// 페이징 이동 
	function fnList(){ 
		$('#qform').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/quizbank_search.do').submit();
	} 
	
	//등록후 창 새로고침 
	function fnReload(){
		window.close();
		$( opener.location ).attr( 'href' ,  'javascript:fnList();'); 
	} 
	
	// 등록 폼
	function fnSave(){
		$('#qform').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/quizbank_exec.do').submit();
	}
	 
//-->
</script>
	
</body>
</html>
