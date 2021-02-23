<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 최종평가 > (팝업) 문제 엑셀일괄 등록 미리보기 
	summary	:	
	wdate	: 2016-06-07
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">

	function writeFormCheck(){
		var form = document.writeform;
		var submitWin = window.confirm("등록하겠습니까?");
		if (submitWin){form.submit();}
	}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">문제관리 &gt; 엑셀 일괄등록 (미리보기)<span>문제를 엑셀로 일괄 등록처리할 수 있습니다.</span></div>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="writeform" action="/admin/course/examQexcelExec.do" method="post" onsubmit="writeFormCheck(); return false;">
<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="secno" id="secno" value="<c:out value="${REQUEST_DATA.secno}"/>"/>
<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">	
	<tr class="rndbg">
		<th>NO</th>
		<th>문제유형</th>
		<th>문제</th>
		<th>지문01</th>
		<th>지문02</th>
		<th>지문03</th>
		<th>지문04</th>
		<th>지문05</th>
		<th>정답번호</th>
		<th>주관식정답</th>
		<th>해설</th>
	</tr>
	<colgroup>
		<col align=middle width="50">
		<col align=middle width="80">
		<col align=middle width="150">
		<col align=middle width="100">
		<col align=middle width="100">
		<col align=middle width="100">
		<col align=middle width="100">
		<col align=middle width="100">
		<col align=middle width="60">
		<col align=middle width="150">
		<col align=middle width="120">
	</colgroup>
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<input type="hidden" name="qtype" value="<c:out value="${result.qtype}"/>"/>
		<tr height=70 align=middle>
			<td><c:out value='${result.num}'/></td> 
			<td>
			<c:choose>
			 	<c:when test="${result.qtype == 1}">OX유형</c:when>
			 	<c:when test="${result.qtype == 2}">객관식</c:when>
			 	<c:when test="${result.qtype == 4}">단답형</c:when>
			 	<c:when test="${result.qtype == 5}">서술형</c:when>
			 	<c:otherwise>-</c:otherwise>
			 </c:choose>
			</td>
			<td><textarea name="qsubject" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.qsubject}"/></textarea></td>
			<td><textarea name="a01" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.a01}"/></textarea></td>
			<td><textarea name="a02" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.a02}"/></textarea></td>
			<td><textarea name="a03" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.a03}"/></textarea></td>
			<td><textarea name="a04" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.a04}"/></textarea></td>
			<td><textarea name="a05" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.a05}"/></textarea></td>
			<td><input type="text" name="rcode" style="width:30px;height:100%;overflow:visible" class="tline" value="<c:out value="${result.rcode}"/>"/></td>
			<td><textarea name="rtext" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.rtext}"/></textarea></td>
			<td><textarea name="summary" style="width:100%;height:100%;overflow:visible" class="tline"><c:out value="${result.summary}"/></textarea></td>
		</tr> 
	</c:forEach>
</table>


<div class="button">
	<a href="#" onclick="writeFormCheck(); return false;" class="btn big blue">등록</a>   
	<a href="#" onclick="self.close();" class="btn big gray">취소</a>
</div>
</form>

<!-- 본문 > 메인 > 목록 끝 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>