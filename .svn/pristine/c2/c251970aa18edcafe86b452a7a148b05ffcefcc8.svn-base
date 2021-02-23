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
		<h1 class="popup-title">문제 일괄 등록 (미리보기)</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content"> 
	 <div class="table-type1">
		<div class="table-header-left"></div>
		<form id="qform" name="qform" >
		<input type="hidden" name="subcmd" id="subcmd" value="q_form">
		<input type="hidden" name="setno" id="setno" value="<c:out value="${REQUEST_DATA.setno}"/>"> 
		<table id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 문제일괄등록 미리보기입니다.">
			<caption>문제일괄등록 미리보기</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="5%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr>
 					<th>문제유형</th>
					<th>문제</th>
					<th>지문1</th>
					<th>지문2</th>
					<th>지문3</th>
					<th>지문4</th>
					<th>지문5</th>
					<th>정답</th>
					<th>배점</th>
				</tr>
			</thead>
			<tbody>
				 <c:choose>
					<c:when test="${not empty listData}">
 						<c:forEach items="${listData}" var="result" varStatus="stat">
	 						<tr>
								<td>
									<input type = "hidden" name = "qno" id="qno" value="0">
									<c:out value="${result.QTYPE}"/> <input type="hidden" name="qtype" id="qtype"  value="<c:out value="${result.QTYPE}"/>">
								</td>
								<td><c:out value="${result.QSUBJECT}"/> <input type="hidden" name="qsubject" id="qsubject"  value="<c:out value="${result.QSUBJECT}"/>"></td>
								<td><c:out value="${result.A01}"/> <input type="hidden" name="a01" id="a01"  value="<c:out value="${result.A01}"/>"></td>
								<td><c:out value="${result.A02}"/> <input type="hidden" name="a02" id="a02"  value="<c:out value="${result.A02}"/>"></td>
								<td><c:out value="${result.A03}"/> <input type="hidden" name="a03" id="a03"  value="<c:out value="${result.A03}"/>"></td>
								<td><c:out value="${result.A04}"/> <input type="hidden" name="a04" id="a04"  value="<c:out value="${result.A04}"/>"></td>
								<td><c:out value="${result.A05}"/> <input type="hidden" name="a05" id="a01"  value="<c:out value="${result.A05}"/>"></td>
								<td><c:out value="${result.RCODE}"/> <input type="hidden" name="rcode" id="rcode"  value="<c:out value="${result.RCODE}"/>"></td>
								<td><c:out value="${result.ALLOT}"/> <input type="hidden" name="allot" id="allot"  value="<c:out value="${result.ALLOT}"/>"></td>
							</tr>
						</c:forEach> 
					</c:when>
					<c:otherwise> 
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		</form>
	</div>
 </div>
	 
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup"> 
		<a href="#none" onclick="fnSave();" class="btn-large-blue"><span>등록</span></a>
		
	</div>
</div>


<!-- //팝업 버튼영역 -->

<script type="text/javascript">
<!--

    window.resizeTo(470,600);
     
	// 페이징 이동 
	function fnList(){ 
		$('#qform').attr('target', '_self').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizset/q_form.do').submit();
	} 
	
	//등록후 창 새로고침 
	function fnReload(){
		window.close();
		$( opener.location ).attr( 'href' ,  'javascript:fnList();'); 
	}
	
	// 등록 폼
	function fnSave(){ 
		$('#qform').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_excel_exec.do').submit();
	}
	 
//-->
</script>
	
</body>
</html>
