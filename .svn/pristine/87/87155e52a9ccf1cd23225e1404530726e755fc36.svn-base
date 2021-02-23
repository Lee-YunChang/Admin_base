<%
/****************************************************
	system	: 팝업 리스트
	title	: 팝업 리스트
	summary	:
	wdate	: 2016-05-18
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	var encoded = $('#title').val();
   	var decoded = encoded.replace(/&amp;/g, '&');
   	$('#title').val(decoded);
   	
   	$(".attendRadio").click(function(){
		//체크했다면 자신을 제외한 다른 체크를 해제
		if($(this).attr('checked')) {
			$(".attendRadio").not(this).prop('checked', false);
		}
	});
});
	function fnListPage(){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/site/popupList.do");
		frm.submit();
	}
	function fnMovePage(cPage){
		var frm = document.pform;
		frm.target = "";
		frm.cPage.value = cPage;
		$("#pform").attr("action", "/admin/site/popupList.do");
		frm.submit();
	}
	function fnViewPage(popNo){
		var frm = document.pform;
		frm.popNo.value = popNo;
		frm.qu.value = 'update';
		$("#pform").attr("action", "/admin/site/popupForm.do");
		frm.submit();
	}
	function fnFormPage(){
		var frm = document.pform;
		frm.qu.value = "insert";
		frm.popNo.value = 0;
		frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>";
		$("#pform").attr("action", "/admin/site/popupForm.do");
		frm.submit();
	}
	
	function fnWritePage(){
		var frm = document.pform;
		frm.subcmd.value = "form";
		frm.qu.value = 'insert';
		$("#pform").attr("action", "/admin/site/popupForm.do");
		frm.submit();
	}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">팝업관리</span></div>

	<!-- 본문 > 상단 > 검색영역 시작 -->
	<form name="pform" id="pform" action="/admin/site/popupList.do" method="post">
		<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
   		<input type="hidden" name="total" id="total" value="<c:out value="${resultList[0].TOTALCOUNT}"/>"/>
		<input type="hidden" name="popNo" id="popNo" value=""/>
		<input type="hidden" name="qu" id="qu" value=""/>
		<input type="hidden" name="pageMode" id="pageMode" value=""/>
		
		<table class="table-type1 search_form" >
 		<colgroup>
		  	<col class="cellc" width="8%">
		  	<col class="celll" width="92%">
		  </colgroup>
		  	
			<tbody>
		  	<tr>
				<th>사용여부</th>
				<td>
					<input type="radio"  class="attendRadio"  checked /> 전체 &nbsp;
	 				<input type="radio"class="attendRadio"  name="useAt" value="Y" <c:if test="${REQUEST_DATA.useAt eq 'Y'}"> checked="checked" </c:if> /> 사용 &nbsp;
					<input type="radio"class="attendRadio" name="useAt" value="N" <c:if test="${REQUEST_DATA.useAt eq 'N'}"> checked="checked" </c:if> /> 사용 안함    
				</td>
			</tr>
			<tr>
				<th>검색</th>
				<td>
			  		<select name="searchMode" title="검색옵션" style="width: 100px;">
			  			<option value="">전체</option>
		                <option <c:if test="${REQUEST_DATA.searchMode eq 'writer'}">selected="selected" </c:if> value="writer">작성자</option>
               			<option <c:if test="${REQUEST_DATA.searchMode eq 'title'}">selected="selected" </c:if> value="title">제목</option>
               			<option <c:if test="${REQUEST_DATA.searchMode eq 'content'}">selected="selected" </c:if> value="content">본문</option>
		            </select>
		            <input type="text" class="line" id="searchWord" name="searchWord" style="width:350px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
				</td>
		  	</tr>
			</tbody>
		</table>
		
		<div class="button_top">
			<a href="#" onclick="fnListPage();" class="btn search brown">검색</a>
		</div>
	</form>
	<!-- 본문 > 상단 > 검색영역 끝 -->

	<!-- 본문 > 메인 > 서브   영역 시작 -->
	<table width="100%" class="btn_Group">
	 <tbody>
	  <tr>
	   <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${resultList[0].TOTALCOUNT}" groupingUsed="true" /></span> 건</td></td>
	   <td align="right">
	  <a href="#" onclick="fnFormPage();" class="btn blue">등록</a>
	   </td>
	  </tr>
	 </tbody>
	</table>
	
	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1">
	<colgroup>
	  	<col class="cellc" width="6%">
	  	<col class="celll" width="*">
	  	<col class="cellc" width="8%">
	  	<col class="celll" width="15%">
	  	<col class="celll" width="15%">
	  	<col class="celll" width="8%">
  	</colgroup>	
	<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>제목</th>	
			<th>작성자</th>	
			<th>노출시작일</th>
			<th>노출종료일</th> 
			<th>사용여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		  	<td><c:out value='${resultList[0].TOTALCOUNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td> 
		  	<td style="text-align:left;padding-left:15px">
				<a href="#" id="title" onclick="fnViewPage('<c:out value="${result.POP_NO}"/>')"><c:out value="${result.POP_TITLE}" escapeXml="false"/></a>
		  	</td>
	  		<td><c:out value='${result.WRITER}'/></td>
		  	<td><c:out value='${result.START_DATE}'/> <c:out value='${result.START_HOUR}'/>시</td>
		  	<td><c:out value='${result.END_DATE}'/> <c:out value='${result.END_HOUR}'/>시</td>
		  	<td><c:if test="${result.USE_AT eq 'Y'}">사용</c:if><c:if test="${result.USE_AT eq 'N'}">미사용</c:if></td>
		</tr> 
		</c:forEach>
	</tbody>
	</table>
	<!-- 본문 > 메인 > 목록 끝 -->
	<br/>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:fnMovePage"/>
	    </div>
	</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	