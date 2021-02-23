<%
/****************************************************
	system	: 시스템관리 > SMS관리 > SMS 발송목록관리
	title		: 메일 템플릿 목록
	summary	:	
	wdate		: 2016-06-09
	writer	: 조남훈
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>


<script type="text/javascript">	
 
	// 날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	function caldate(day){
	}
	var dateFormat={
		 dayNamesMin:['일','월','화','수','목','금','토'],
		 monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		 showMonthAfterYear: true, //연월 순서로 보여줌
		 changeMonth: true, //월을 셀렉트박스로 표현
		 changeYear: true, //년을 셀렉트박스로 표현
		 dateFormat: "yy-mm-dd"
	};	

	$(document).ready(function(){
		$("#sdate").datepicker(dateFormat);
		$("#edate").datepicker(dateFormat);
	});

	//페이지 이동
	function move_page(cPage){
		var frm = document.pform;
		frm.target = "";
		frm.cPage.value = cPage;
		frm.action="smsmanLogList.do";
		frm.submit();
	}
	
	// 검색
	function list_page(){
		var frm = document.pform;
		frm.target = "_self";
		frm.cPage.value = "1";
		frm.action="smsmanLogList.do";
		frm.submit(); 
	}
	//상세보기 이동 
	function goView(seq){
		window.open('','smslogInfo','width=500,height=600');
	 	document.pform.target = "smslogInfo";
	 	document.pform.seq.value = seq;
	 	document.pform.action = "smsmanLogView.do";
		document.pform.submit();
	}

	function enterChk(){
		if (event.keyCode==13) list_page();
	}

</SCRIPT>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">SMS발송목록 관리<span> </span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="#" method="post">
	<input type="hidden" name="cPage"			id="cPage"				value="<c:out value="${REQUEST_DATA.cPage}" />"/>
	<input type="hidden" name="tranPr"			id="tranPr"				value=""/>	  
	<input type="hidden" name="tranPhone"		id="tranPhone"			value=""/>
	<input type="hidden" name="tranDate"		id="tranDate"			value=""/>
	<input type="hidden" name="tranRslt"		id="tranRslt"			value=""/>
	<input type="hidden" name="seq"		id="seq"			value=""/>
	
	<table class="table-type1 search_form">
	  <colgroup>
		<col class="cellc" width="8%">
		<col class="celll" width="92%">
		</colgroup><tbody>
		<tr>
			<th>기간</th>
			<td colspan="3"> 
				 <input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}" />" readonly="readonly"/>
				 	<a href="#" onclick="$('#sdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="시작일">
				 	</a>
				~
				<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}" />" readonly="readonly"/>
					<a href="#" onclick="$('#edate').focus(); return false;" class="">
						<img src="/admin/images/btn_calendar.png" alt="종료일">
					</a> 
			</td>
		</tr> 
	  	<tr>
			<th>검색</th>
			<td colspan="3">
				 <select name="searchMode" id="searchMode" title="검색옵션">
				 		<option value="" <c:if test="${empty REQUEST_DATA.searchMode}"> selected="selected" </c:if>>전체</option>
						<option value="TRAN_PHONE" 	<c:if test="${REQUEST_DATA.searchMode == 'TRAN_PHONE'}">selected</c:if>>받는사람(연락처)</option>
 						<option value="TRAN_CALLBACK" <c:if test="${REQUEST_DATA.searchMode == 'TRAN_CALLBACK'}">selected</c:if>>보내는사람(연락처)</option>
  				</select>
				<input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}" />" onkeypress="enterChk();"> 
			</td>
		</tr> 
		</tbody>
	</table>
	 
		<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
 
</form> 
 <!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->

 
 <!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
	<tr>
		<td class="pageinfo">조회건수 <span class="red"><c:out value="${totalCount}" /></span> 건</td>
		<td align="right">
			
		</td>
	</tr>
  </tbody>
  </table>
<!-- 본문 > 메인 > 서브   영역 끝 -->
<table class="tb table-type1">
	<tr class="rndbg">
		<th>NO</th>
		<th>SMS UID</th>
		<th>보내는사람 연락처</th>
		<th>받는사람 연락처</th>
		<th>내용</th>
		<th>발송일시</th>
		<th>발송여부</th>
		<th>-</th>
	</tr>
	<colgroup>
		<col align=middle width="4%">
		<col align=middle width="10%">
		<col align=middle width="10%">
		<col align=middle width="10%">
		<col align=middle width="*">
		<col align=middle width="10%">
		<col align=middle width="8%">
		<col align=middle width="8%">
	</colgroup>
	<c:if test="${not empty LIST_DATA}">
 		<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
			<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
				<td><c:out value="${totalCount+1 - result.RNUM}"/></td>
				<td><c:out value="${result.TPL_UID}">-</c:out></td>
				<td><c:out value="${result.CALLBACK}">-</c:out></td>
				<td><c:out value="${result.REC_HP}">-</c:out></td>
				<td><p style="width:400px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><c:out value="${result.SUMMARY}">-</c:out></p>
				<%-- <p style="text-overflow: ellipsis;overflow: hidden;"><c:out value="${result.SUMMARY}">-</c:out></p> --%></td>
				<td><c:out value="${result.SEND_DATE}" /></td>
				<td>
					 <c:if test="${result.STATUS == 1}">Y</c:if>
					 <c:if test="${result.STATUS == 0}">N</c:if>
				</td>
		   		<td><a href="#" onclick="goView('<c:out value="${result.SEQ}" />');" class="btn sky small">상세보기</a> </td>
			</tr> 
	
 		</c:forEach>
    </c:if>
    
    
</table>

<c:if test="${not empty LIST_DATA}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>

<!-- 본문 > 메인 > 목록 끝 -->
