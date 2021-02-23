<%
/****************************************************
	system	: 기업담당자 검색
	title	: 기업담당자 검색
	summary	: 
	wdate	: 2016-05-16
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">
$(document).ready(function(){

});

function move_page(cPage){
	var frm = document.pform;
	frm.cPage.value = cPage;
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	frm.cPage.value = "1";
	frm.submit();
}

function chkEnter(){
	if (event.keyCode==13) list_page();
}

// 기업담당자 선택 등록
function goExec() {
	var userNo = $(':radio[name="userno"]:checked');
	$(opener.document).find("#userNo").val(userNo.val());
	var userName = userNo.attr("userName");
	var userId = userNo.attr("userId");
	
	if(confirm('등록 하시겠습니까?')){	
		$(opener.document).find("#emp").val(userName+"("+userId+")");
		window.close();
	}	
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">기업담당자 검색<span>소속기업(사업자번호기준)의 회원만 검색됩니다.</span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/user/companySearchList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
<input type="hidden" name="bizno" id="bizno" value="<c:out value="${REQUEST_DATA.bizno}"/>"/>
<input type="hidden" name="comno" id="comno" value="<c:out value="${REQUEST_DATA.comno}"/>"/>
	<table class="table-type1 search_form" width="100%">
	  <tr>	  
		<td style="border-left:0;padding:10px 15px;">
			<select name="searchMode" title="검색옵션" >
				<option <c:if test="${REQUEST_DATA.searchMode eq 'userName'}">selected="selected" </c:if>  value="userName">이름</option>
	  			<option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if> value="userId">아이디</option>
            </select>
           	<input type="text" id="searchWord" name="searchWord" class="line" style="width:150px" value="<c:out value="${REQUEST_DATA.searchWord}"/>" OnKeyPress="chkEnter();"/>
            <span class="button_top"><a href="#" onclick="list_page();" class= "btn search brown"/>검색</a></span>
		</td>
	  </tr>
	</table>
	<!-- 본문 > 상단 > 검색영역 끝 -->
	
	<div class="space5"></div>	
	<table class="table-type1 search_form">
		<colgroup>
			<col style="width:10%"> 
			<col style="width:*"> 
		</colgroup>
		<thead>
			<th></th>
			<th>이름(아이디)</th>
		</thead>
		<tbody> 
			<c:choose>
			<c:when test="${fn:length(resultList) > 0}">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td style="text-align:center">
						<input type="radio" name="userno" id="userno" value="<c:out value='${result.USERNO}'/>" userId="<c:out value='${result.USERID}'/>" userName="<c:out value='${result.USERNAME}'/>"/>
					</td>
					<td><c:out value='${result.USERNAME}'/>&nbsp;(<c:out value='${result.USERID}'/>)</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="2" style="text-align:center;">검색된 자료가 없습니다.</td></tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<c:if test="${fn:length(resultList) > 0}">
		<div class="admin-paging paging_wrap">
             <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
         </div>
	</c:if>
</form>

<!--space--><table class="space"><tr><td></td></tr></table>

<!--버튼 시작-->
<c:if test="${fn:length(resultList) > 0}">
<table width=100% border=0 cellspacing=0 cellpadding=0>
	<tr>
		<td align="center">
		<a href="#" onclick="goExec()" class= "btn big orange">등록</a>
		<a href="#" onclick="window.close();" class= "btn big gray">취소</a>
		</td>
	</tr>
</table>
</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	