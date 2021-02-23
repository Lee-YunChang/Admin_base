<%
/****************************************************
	system	: 사이트관리> 공지사항, 자료실 게시판
	title	: 공지사항, 자료실 게시판 리스트
	summary	:
	wdate	: 2016-04-14
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">
	function move_page(cPage){
		var frm = document.pform;
		frm.cPage.value = cPage;
		$("#pform").attr("action", "/admin/counselor/bbsList.do");
		frm.submit();
	}
	function view_page(bbsNo){
		var frm = document.pform;
		frm.bbsNo.value = bbsNo;
		frm.qu.value = 'update';
		$("#pform").attr("action", "/admin/counselor/bbsForm.do");
		frm.submit();
	}
	function list_page(){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/counselor/bbsList.do");
		frm.submit();
	}
	
	function form_page(){
		var frm = document.pform;
		frm.qu.value = "insert";
		frm.bbsNo.value = 0;
		frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>";
		$("#pform").attr("action", "/admin/counselor/bbsForm.do");
		frm.submit();
	}
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"><c:out value="${cmap.BCATENAME}"/><span> 게시물을 관리합니다.</span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/site/bbsList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="0"/>
	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<input type="hidden" name="qu" id="qu" value=""/>
	<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>  
	
	<table class="table-type1 search_form" >
	  <colgroup>
	  	<col class="cellc" width="8%">
	  	<col class="celll" width="42%">
	  	<col class="cellc" width="8%">
	  	<col class="cellc" width="42%">
	  </colgroup>
	  <tbody> 
	  	<tr>
			<th>검색</th>
			<td>
	  		<select name="searchMode" title="검색옵션" style="width: 100px;">
                <option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if> value="title">제목</option>
                <option <c:if test="${REQUEST_DATA.searchMode eq 'content'}">selected="selected" </c:if> value="content">본문</option>
                <option <c:if test="${REQUEST_DATA.searchMode eq 'writer'}">selected="selected" </c:if> value="writer">작성자</option>
            </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
			</td>
			<th>공개여부</th>
			<td>
				<select name="searchOpenYn" title="공개여부">
					<option <c:if test="${empty REQUEST_DATA.searchOpenYn}">selected="selected" </c:if> value="">전체</option>
				 	<option <c:if test="${REQUEST_DATA.searchOpenYn eq 'Y'}">selected="selected" </c:if> value="Y" >공개</option>
				 	<option <c:if test="${REQUEST_DATA.searchOpenYn eq 'N'}">selected="selected" </c:if> value="N">미공개</option>
				</select>
			</td>
	  	</tr>
		</tbody>
	</table>
	
	<div class="button_top">
		<a href="#" onclick="list_page();" class="btn search brown">검색</a>
	</div>
	
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->

	<!-- 본문 > 메인 > 서브   영역 시작 -->
	<table width="100%" class="btn_Group">
	 <tbody>
	  <tr>
	   <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</td></td>
	   <td align="right">
	  <a href="#" onclick="form_page();" class="btn blue">등록</a>
	   </td>
	  </tr>
	 </tbody>
	</table>
	
<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
	  <colgroup>
	  	<col width="8%">
	  	<col width="8%">
	  	<col width="34%">
	  	<col width="10%">
	  	<col width="10%">
	  	<col width="15%">
	  	<col width="10%">
	  	<col width="8%">
	  </colgroup>
	<tr class="rndbg">
		<th>NO</th>
		<th>분야</th>
		<th>제목</th>
		<th>상태</th>
		<th>작성자</th> 
		<th>등록일시</th>
		<th>공개여부</th>
		<th>조회수</th>
	</tr>
	<c:if test="${not empty resultList}">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		<c:if test="${result.TOPYN eq 'Y' }"><td>[공지]</td></c:if>
		<c:if test="${result.TOPYN eq 'N' }"><td><c:out value="${result.RNUM}"/></td></c:if>
	  	<td><c:out value="${result.MT_CATE_CODE_NAME}"/></td>
	  	<td style="text-align:left;padding-left:15px">
		<a href="#" onclick="view_page('<c:out value="${result.BBSNO}"/>')"> 
			<c:out value="${result.TITLE}" escapeXml="false"/></a>
		  	<c:if test="${result.FILECNT > 0}">
		  		<img src="/admin/images/etc/blt_etc_01.gif" alt="">
		  	</c:if>
	  	</td>
	  	<td><c:out value="${result.MT_CS_STATE_CODE_NAME}"/></td>
	  	<td><c:out value="${result.WRITER}"/></td>
	  	<td><c:out value="${result.WDATE}"/></td>
		<td>
			<c:if test="${result.OPEN_AT eq 'Y'}">공개</c:if>
			<c:if test="${result.OPEN_AT eq 'N'}">미공개</c:if>
		</td>
	  	<td><c:out value="${result.RCNT}"/></td> 
	  </tr> 
	</c:forEach>
	</c:if>
	<c:if test="${empty resultList}">
		 <tr>
		 	<td colspan="8">등록된 글이 없습니다.</td>
		 </tr>
	</c:if>
</table>
<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	
