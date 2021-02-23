<%
/****************************************************
	system	: 특강강사 검색
	title	: 특강강사 검색
	summary	: 
	wdate	: 2016-09-01
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">

function move_page(cPage){
	var frm = document.pform;
	frm.cPage.value = cPage;
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	
	frm.target = '';
	frm.cPage.value = '1';
	frm.submit();
}

function chkEnter(){
	if (event.keyCode==13) list_page();
}

function execForm(flag,seq){
	window.open("/admin/lecture/lectureDistanseForm.do?flag="+flag+"&seq="+seq,"distancePop","width=500,height=300,scrollbars=yes");
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">급지풀</div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/lecture/lectureDistanseSearch.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTAL_CNT}"/>"/>
<input type="hidden" name="fieldArr" id="fieldArr" value="${REQUEST_DATA.fieldArr}"/>
<input type="hidden" name="tutorArr" id="tutorArr" value="${REQUEST_DATA.tutorArr}"/>
<input type="hidden" name="index" id="index" value="${REQUEST_DATA.index}"/>
<input type="hidden" name="atciveYn" id="atciveYn" value="popup"/>

	<!-- 본문 > 상단 > 검색영역 끝 -->
	
	<div class="space5"></div>	
	<table class="tb table-type1">
	    <tr class="rndbg">
	        <th>NO</th>
	        <th>출발지</th>
	        <th>도착지</th>
	        <th>등급</th>
	        <th>수정일</th>
	    </tr>
	    <colgroup>
	        <col width="5%">
	        <col width="10%">
	        <col width="10%">
	        <col width="5%">
	        <col width="15%">
	    </colgroup>
	    <c:choose>
	    <c:when test="${not empty resultList}">
		    <c:forEach var="result" items="${resultList}" varStatus="status">
		    <tr align="center">
		        <td><c:out value='${resultList[0].TOTAL_CNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
		        <td><a onclick="execForm('modi',<c:out value="${result.DS_GRADE_SEQ}"/>)"><c:out value="${result.DS_START_ADDR}"/></a></td>
		        <td><a onclick="execForm('modi',<c:out value="${result.DS_GRADE_SEQ}"/>)"><c:out value="${result.DS_END_ADDR}"/></a></td>
		        <td style="font-weight: bold;"><a onclick="execForm('modi',<c:out value="${result.DS_GRADE_SEQ}"/>)"><c:out value="${result.DS_GRADE}"/></a></td>
		        <td><c:out value="${result.UP_DT}"/></td>
		    </tr>
		    </c:forEach>
		</c:when>
		<c:otherwise>
			<tr><td colspan="8" align="center">등록된 정보가 없습니다.</td></tr>
		</c:otherwise>
		</c:choose>
	</table>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTAL_CNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
	    </div>
	</c:if>
	
	<hr/>
	
	<table style="width:100%;text-align:center">
		<tr>
			<td align="center">
			<a href="#" onclick="execForm('reg')" class= "btn big orange">등록</a>
			<a href="#" onclick="window.close();" class= "btn big gray">취소</a>
			</td>
		</tr>
	</table>
</form>
<br/>
<div class="space"></div>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	