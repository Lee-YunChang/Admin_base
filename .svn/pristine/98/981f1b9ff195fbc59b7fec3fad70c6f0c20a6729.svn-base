<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 강의평가 > (팝업) 등록/수정 양식 
	summary	:	
 	wdate	: 2016-05-25
 	writer	: 이진영
 *****************************************************/
 %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<c:set var="mtCpollCode"></c:set>
<c:choose>
	<c:when test="${map.MT_CPOLL_CODE ne null}"><c:set var="mtCpollCode" value="${map.MT_CPOLL_CODE}"/></c:when>
	<c:otherwise><c:set var="mtCpollCode"><%=SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_CHO")%></c:set></c:otherwise>
</c:choose>

<script type="text/javascript">
//페이지 이동
function move_page(cPage){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = cPage;
	<%-- frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>"; --%>
	$("#pform").attr("action", "/admin/course/loanGoods.do");
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = "1";
	$("#pform").attr("action", "/admin/course/loanGoods.do");
	frm.submit(); 
}

function selectLoan(){
	var list = [];
	$('input[name=cbox]:checkbox').each(function(i){
		if($(this).prop('checked')){
			var values = $(this).val().split('/');
			var data = {};
			data.ukey = values[0]+""+values[1]+""+values[3];
			data.pcode = values[0];
			data.code = values[1];
			data.name = values[2];
			data.knd = values[3];
			data.kndnm = values[4];
			list.push(data);
		}
	});
	
	opener.addSelectLoan(list);
}




</SCRIPT>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">대출상품리스트</div>

<!-- 본문 > 메인 > 목록 시작  -->
<form  name="pform" id="pform" action="/admin/course/loanGoods.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>


	
<table class="table-type1 search_form">	
	<colgroup>
	<col class=cellc width="20%">
	<col class=celll width="*">
	<tbody>
		<tr>
			<th>대출종류</th>
			<td>
				<select name="fnd_usecd" id="fnd_usecd" title="자금용도">
					<option value="">전체</option>
					<c:forEach var="result" items="${goods}" varStatus="status">
						<option <c:if test="${REQUEST_DATA.fnd_usecd == result.FND_USECD}"> selected="selected"</c:if> value="<c:out value="${result.FND_USECD}"/>"><c:out value="${result.FND_USECD_NM}"/></option>
					</c:forEach>
 				</select>
			</td>
		</tr>
		<%-- <tr>
			<th>상품명</th>
			<td colspan="3"> 	
				<input type="text" class="line" id="gdnm" name="gdnm" style="width:350px" title="과정명" value="${REQUEST_DATA.gdnm}"/>
			</td>		
		</tr>  --%>
	</tbody>
</table>
	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>

	<br>
	
	
	<table width="100%" class="btn_Group">
		<tbody>
			<tr>
				<%-- <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</font></td> --%>
				<td align="right">
					<a href="#" onclick="selectLoan();return false;" class="btn blue">선택적용</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1">
		<tr class="rndbg">
			<th>선택</th>
			<th>대출종류</th>
			<th>대출상품</th>
			<th>자금용도</th>
		</tr>
		<colgroup>
			<col align=middle width="4%">
			<col align=middle width="10%">
			<col align=middle width="20%">
			<col align=middle width="20%">  	
		</colgroup>	
		<c:forEach var="result" items="${list}" varStatus="status">
			<tr>
				<td align="center">
					<c:if test="${empty result.LOAN_PRD_CODE }">
						<input type="checkbox" name="cbox" value="${result.FND_USECD}/${result.GDCD}/${result.GDNM}/${result.FND_KND_CD}/${result.FND_KND_NM}"></td>
					</c:if>
				<td align="center">${result.FND_USECD_NM}</td>
				<td align="center">${result.GDNM}</td>
				<td align="center">${result.FND_KND_NM}</td>
			</tr> 
		</c:forEach>
	</table>


</form>
<!-- 본문 > 메인 > 목록 끝 -->


<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>