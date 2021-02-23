<%
/****************************************************
	system	: 회원관리
	title	: 탈퇴회원정보관리
	summary	:
	wdate	: 2016-03-28
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	function move_page(cPage){
		
 		$("input[name='cPage']").val(cPage);
		$("form[name='pform']").attr("method", "post").attr("action", "/admin/user/userCancelList.do").submit();
	}

	function list_page(){
		
		$("input[name='cPage']").val('1');
		$("form[name='pform']").attr("method", "post").attr("action", "userCancelList.do").submit();
		
		frm.submit();
	}
		
	// 교육이력
	function user_study_list(userNo){
		window.open("/admin/user/userStudyList.do?" + "userNo=" + userNo, "user_study_list", "width=700, height=300, scrollbars=yes");
	}
	
	// 회원정보
	function user_form(userNo){
		window.open("/admin/user/userForm.do?" + "userNo=" + userNo, "user_form", "width=800, height=500, scrollbars=yes");
	}
	
</script>


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">탈퇴회원관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="/admin/user/userCancelList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${totalCount}"/>"/>
	
	
	<table class="table-type1 search_form" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
	  <colgroup>
	  	<col class="cellc" width="8%">
	  	<col class="celll" width="92%">
	  </colgroup>	
	<tbody>
	  <tr>
			<th>검색</th>
			<td colspan="2">
		  		<select name="searchMode" title="검색옵션" >
		  			<option value="">선택</option>
	                <option value="userId" <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if>>아이디</option>
	                <option value="userName" <c:if test="${REQUEST_DATA.searchMode eq 'userName'}">selected="selected" </c:if>>이름</option>
	            </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
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
	   <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</td>
	   <td align="right">		
		</td>
	  </tr>
	 </tbody>
	</table>
	
<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
	<tr class="rndbg">
		<th>NO</th>
		<th>회원구분</th>
		<th>아이디</th>
		<th>이름</th>
		<th>탈퇴사유</th>
		<th>탈퇴일</th>
		<th>교육이력</th>
	</tr>
	<colgroup>
		<col align=middle width="4%">
		<col align=middle width="8%">
		<col align=middle width="8%">	
		<col align=middle width="8%">
		<col align=middle width="*">
		<col align=middle width="10%">
		<col align=middle width="8%">
	</colgroup>	

	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		<td><c:out value='${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td> 
		<td><c:out value='${result.MT_GRADE_NAME}'/></td>
		<td><a href="#" onclick="user_form('<c:out value='${result.USERNO}'/>');"><b><c:out value='${result.USERID}'/></b></a></td>
		<td><c:out value='${result.MBERNM}'/></td>
		<td>
			<c:forEach var="listData" items="${LIST_DATA}" varStatus="status">
				<c:if test="${result.MT_SECSN_CODE eq listData.MT_SUB_CODE}">
					<c:out value='${listData.MT_SUB_NAME}'/>
				</c:if>
			</c:forEach>
		</td>
		<td><c:out value='${result.SECSN_DATE}'/></td> 
		<td>
			<a href="#" onclick="user_study_list('<c:out value='${result.USERNO}'/>');" class="btn small sky">교육이력</a>
		</td> 
	</tr> 
	</c:forEach>
</table>
<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<!-- 페이징, 버튼 영역 -->
    <c:if test="${not empty resultList}">
         <div class="admin-paging paging_wrap">
             <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
         </div>
     </c:if>
	<!-- // 페이징, 버튼 영역 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	


