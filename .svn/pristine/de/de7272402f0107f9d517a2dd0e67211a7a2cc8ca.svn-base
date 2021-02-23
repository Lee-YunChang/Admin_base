<%
/****************************************************
	system	: 배너관리 리스트
	title	: 배너관리 리스트
	summary	:
	wdate	: 2016-09-08
	writer	: 황두은
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

	function fnListPage(){
		var frm = document.sform;
		$("#sform").attr("action", "/admin/site/bannerList.do");
		frm.submit();
	}
	function fnViewPage(bannerno){
		var frm = document.sform;
		frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>";
		frm.qu.value = "update";
		frm.bannerno.value = bannerno;
		$("#sform").attr("action", "/admin/site/bannerForm.do");
		frm.submit();
	}
	function fnFormPage(){
		var frm = document.sform;
		
		frm.qu.value = "insert";
		frm.bannerno.value = 0;
		frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>";
		$("#sform").attr("action", "/admin/site/bannerForm.do");
		frm.submit();
	}
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">배너 관리</div>

	<!-- 본문 > 상단 > 검색영역 시작 -->
	<form name="sform" id="sform" action="/admin/site/bannerList.do" method="post">
		<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
   		<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
		<input type="hidden" name="bannerno" id="bannerno" value=""/>
		<input type="hidden" name="qu" id="qu" value=""/>
		<input type="hidden" name="pageMode" id="pageMode" value=""/>
		<input type="hidden" name="cnt" id="cnt" value=""/>
		<input type="hidden" name="useAtCnt" id="useAtCnt" value="${REQUEST_DATA.useAtCnt}"/>

		<table class="table-type1 search_form" >
 		<colgroup>
		  	<col class="cellc" width="8%">
		  	<col class="celll" width="92%">
		  </colgroup>
		  	
			<tbody>
		  	<tr>
				<th>검색</th>
				<td>
			  		<select id="searchMode" name="searchMode" title="검색 설정" style="width: 100px;">
			  			<option value="" <c:if test="${empty REQUEST_DATA.searchMode}"> selected="selected" </c:if>>선택</option>
		                <option <c:if test="${REQUEST_DATA.searchMode eq 'writer'}">selected="selected" </c:if> value="writer">작성자</option>
               			<option <c:if test="${REQUEST_DATA.searchMode eq 'title'}">selected="selected" </c:if> value="title">제목</option>
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
	   <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${fn:length(resultList)}" groupingUsed="true" /></span> 건</td></td>
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
	  	<col class="celll" width="10%">
	  	<col class="celll" width="8%">
	  	<col class="celll" width="5%">
  	</colgroup>	
	<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일시</th>
			<th>공개여부</th>
			<th>조회수</th> 
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		  	<td><c:out value='${result.NUM}'/></td>
		  	<td style="text-align:left;padding-left:15px">
				<a href="#" onclick="fnViewPage('<c:out value="${result.BANNERNO}"/>')"><c:out value="${result.TITLE}"/></a>
		  	</td>
		  	<td><c:out value='${result.MBERNM}'/></td>
		  	<td><c:out value='${result.REGIST_DATE}'/></td>
		  	<td><c:if test="${result.USE_AT eq 'Y'}">사용</c:if><c:if test="${result.USE_AT eq 'N'}">미사용</c:if></td>
		  	<td><c:out value='${result.VIEW_CNT}'/></td>
		</tr> 
		</c:forEach>
	</tbody>
	</table>
	<!-- 본문 > 메인 > 목록 끝 -->
	<br/>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
	    </div>
	</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	