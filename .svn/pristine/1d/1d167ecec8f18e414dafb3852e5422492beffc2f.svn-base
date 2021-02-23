<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
// 대출과목 등록
 function goForm(edu_loan_seq){
	$('#edu_loan_seq').val(edu_loan_seq);
 	$("#pform").attr("action", "/admin/course/eduLoanForm.do").submit();
 }


</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">대출과목등록</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/course/courseList.do" method="post">
	<input type="hidden" name="edu_loan_seq" id="edu_loan_seq" value=""/>
</form> 

	
	<table width="100%" class="btn_Group">
		<tbody>
			<tr>
				<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${fn:length(resultList)}" groupingUsed="true" /></span> 건</font></td>
				<td align="right">
					<a href="#" onclick="goForm();return false;" class="btn blue">대출과목 등록</a>
				</td>
			</tr>
		</tbody>
	</table>

	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1">
		<tr class="rndbg">
			<th>NO</th>
			<th>과목명</th>
			<th>의무구분</th>
			<th>수료과정</th>
			<th>대출상품</th>
			<th>사용여부</th>
			<th>등록일</th>
		</tr>
		<colgroup>
			<col align=middle width="4%">
			<col align=middle width="*">
			<col align=middle width="15%">
			<col align=middle width="10%">
			<col align=middle width="25%">
			<col align=middle width="8%">
			<col align=middle width="12%">  	
		</colgroup>	
	
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr class="onFocusBgCh">
				<td align="center">${status.count }</td>
				<td align="center"><a href="#" onclick="goForm('${result.EDU_LOAN_SEQ}'); return false;"><c:out value="${result.EDU_LOAN_NAME}"/></a></td>
				<td align="center"><c:out value="${result.DUTY_GBN_TXT}"/></td>
				<td align="center"><c:out value="${result.DUTY_HOUR}"/></td>
				<td align="center">
				<c:import url="/admin/course/getEduLoanMappByLoanSeq.do" charEncoding="utf-8" >
					<c:param name="edu_loan_seq" value="${result.EDU_LOAN_SEQ }"/>
				</c:import>
				
					<%-- <c:forEach var="lon" items="${loanList}" varStatus="status">
					
					</c:forEach> --%>
				</td>
				<td align="center"><c:out value="${result.USE_YN}"/></td>
				<td align="center">${result.WDATE }</td>
			</tr> 
		</c:forEach>
		<c:if test="${empty resultList}">
	   		 <tr>
	   		 	<td colspan="7">등록된 데이터가 없습니다.</td>
	   		 </tr>
		</c:if>
	</table>
	
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	