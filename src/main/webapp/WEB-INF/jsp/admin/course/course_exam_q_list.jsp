<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 최종평가 > (팝업) 출제 문제 목록 
	summary	:	
	wdate	: 2016-05-19
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">
	
	//삭제
	function objDelete(courseno, secno, qno){
		var form = document.pform;
		var delwin = window.confirm("선택한 문제를 삭제하시겠습니까?\n삭제한 문제는 복구가 불가합니다.");
	
		if(delwin){
			form.courseno.value = courseno;
			form.secno.value = secno;
			form.qno.value = qno;
			$("#pform").attr("action", "/admin/course/examQuizdelExec.do");
			form.target = "";
			form.submit();
		}
	}
	
	function searchForm(){
		document.pform.submit();
	}
	opener.parentReload();
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">문제은행 > 문제목록<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/course/examQlist.do" method="post">
	<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
	<input type="hidden" name="secno" id="secno" value="<c:out value="${REQUEST_DATA.secno}"/>"/>
	<input type="hidden" name="qno" id="qno" value=""/>
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
	<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
	<input type="hidden" name="searchMode" id="searchMode" value="qsubject"/>
	<table class="table-type1 search_form" width="100%">
	<colgroup>
			<col class="cellc" width="15%">
			<col class="celll" width="85%">
	</colgroup>
		<tbody>
	  	<tr>
			<th>문제</th>
			<td>
				<input type="text" class="line" id="searchWord" name="searchWord" style="width:500px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
				&nbsp;&nbsp;<a href="#" onclick="searchForm();"class="btn search brown">검색</a>
			</td>
	  	</tr>
		</tbody>
	</table>
	<!-- <div class="button_top"><a href="#" onclick="searchForm();"class="btn search brown">검색</a></div> -->
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->

<div align="right" style="margin-top:15px;"> 
	<a href="examQform.do?courseno=<c:out value="${REQUEST_DATA.courseno}"/>&secno=<c:out value="${REQUEST_DATA.secno}"/>&qno=0&pageMode=reg" class="btn small green" style="padding:7px 20px; margin-right:5px;">추가</a>
	<a href="examQexcelForm.do?courseno=<c:out value="${REQUEST_DATA.courseno}"/>&secno=<c:out value="${REQUEST_DATA.secno}"/>" class="btn sky">액셀등록</a>
</div>
<div class="space5"></div>

			
<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
	<colgroup>
		<col align=middle width="4%">
		<col align=middle width="10%">
		<col align=middle width="40%">
		<col align=middle width="*">
		<col align=middle width="10%">
		<col align=middle width="5%">
		<col align=middle width="6%">
	</colgroup>
	<thead>	
	<tr class="rndbg">
		<th>NO</th>
		<th>문제유형</th>
		<th>문제명</th>
		<th>정답</th>
		<th>등록일자</th>
		<th>사용여부</th>
		<th>삭제</th>
	</tr>
	</thead>
	<c:forEach var="result" items="${resultList}" varStatus="stats">
	<tbody>
	<tr align="middle" onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		<td>
			<c:out value='${totalCount - (REQUEST_DATA.cPage-1)*20 - stats.count+1}'/>
		</td>
		<td>
			<c:choose>
			 	<c:when test="${result.QTYPE == 1}">OX유형</c:when>
			 	<c:when test="${result.QTYPE == 2}">객관식</c:when>
			 	<c:when test="${result.QTYPE == 4}">단답형</c:when>
			 	<c:when test="${result.QTYPE == 5}">서술형</c:when>
			 	<c:otherwise>-</c:otherwise>
			 </c:choose>
		</td>
		
		<td align="left"><a href="examQform.do?courseno=<c:out value="${REQUEST_DATA.courseno}"/>&secno=<c:out value="${REQUEST_DATA.secno}"/>&qno=<c:out value="${result.QNO}"/>&pageMode=mod"><c:out value="${result.QSUBJECT}"/></a></td>
		<td>
			<c:choose>
			 	<c:when test="${result.QTYPE == '1'}">
			 		<c:if test="${result.RCODE == '1'}">O</c:if>
			 		<c:if test="${result.RCODE != '1'}">X</c:if>
			 	</c:when>
			 	<c:when test="${result.QTYPE == '2'}"><c:out value="${result.RCODE}"/> 번</c:when>
			 	<c:otherwise><c:out value="${result.RTEXT}"/></c:otherwise>
			 </c:choose>
		</td>
		<td><c:out value="${result.WDATE}"/></td>
		<td><c:out value="${result.USEYN}"/></td>
		<td>
			<%-- <a href="examQform.do?courseno=<c:out value="${REQUEST_DATA.courseno}"/>&secno=<c:out value="${REQUEST_DATA.secno}"/>&qno=<c:out value="${result.QNO}"/>&pageMode=mod" class="btn small red">삭제</a> --%>
			<a href="#" class="btn small red" onclick="objDelete(${REQUEST_DATA.courseno}, ${REQUEST_DATA.secno}, ${result.QNO})">삭제</a>
		</td> 
	</tr> 
	</tbody>
	</c:forEach>
</table>

<br/>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	