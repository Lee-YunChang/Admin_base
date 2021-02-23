<%
/****************************************************
	system	: 지점 검색
	title	: 지점 검색
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
//검색
function list_page(){
	var frm = document.pform;
	frm.target = '';
	frm.cPage.value = '1';
	$("#pform").attr("action", "/admin/user/companySearchList.do");
	frm.submit();
}

function move_page(cPage){
	$('#cPage').val(cPage);
	$("#pform").attr("action", "/admin/user/companySearchList.do");
	$('form[name=pform]').submit();
}

function reTrunData(){
	var comNo = $('input[name="comNo"]:radio:checked');
	var comName = comNo.attr("comName");

	var data = {
		'comNo' : comNo.val(),
		'comName' : comName
	};
	if(opener){
		opener.fnCodePopupCallBack(data);
		self.close();
	}
}

//엔터키 이벤트
function chkEnter(){
	 if(event.keyCode == 13)
     {
		 list_page();
     }
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">지점 검색</div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/user/companySearchList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${resultCount}"/>"/>
<input type="hidden" name="orgName" id=""orgName"" value="<c:out value=""/>"/>
<input type="hidden" name="currentPage" value="1"/><!-- 현재 페이지. -->
<input type="hidden" name="countPerPage" value="20"/> <!-- 페이지당 출력 목록 수. 기본값은 10 -->
			
	<table class="table-type1 search_form" width="100%">
	  <tr>	  
		<td style="border-left:0;padding:10px 15px;">
			지점명 :
           	<input type="text" id="searchWord" name="searchWord" class="line" style="width:150px" value="<c:out value="${REQUEST_DATA.searchWord}"/>" OnKeyPress="chkEnter();"/>
            <span class="button_top"><a href="#" onclick="list_page();" class= "btn search brown"/>검색</a></span>
		</td>
	  </tr>
	</table>
	<!-- 본문 > 상단 > 검색영역 끝 -->
	
	<div class="space5"></div>	
	<table class="table-type1 search_form" summary="기관/단체명 찾기 리스트 입니다.">
		<colgroup>
			<col style="width:5%">
			<col style="width:5%"> 
			<col style="width:40%">
		</colgroup>
		<thead>
			<th>선택</th>
			<th>No</th>
			<th>지점명</th>
		</thead>
		<tbody> 
			<c:choose>
			<c:when test="${fn:length(resultList) > 0}">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr align="center">
					<td>
						<span class="checks mr0">
							<input type="radio" name="comNo" id="comNo<c:out value="${result.COMNO}"/>" comName="<c:out value="${result.COMNAME}"/>" value="<c:out value="${result.COMNO}"/>" title="선택">
							<label for="comNo<c:out value="${result.COMNO}" />"></label>
						</span>
					</td>
					<td><c:out value='${resultCount - (REQUEST_DATA.cPage-1)*10 - status.count+1}'/></td>
					<td style="text-align:left;"><span class=""><c:out value='${result.COMNAME}'/></span></td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="4" style="text-align:center;">해당 내용이 없습니다.</td></tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<c:if test="${fn:length(resultList) > 0}">
		<div class="admin-paging paging_wrap">
             <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
         </div>
	</c:if>
</form>
<br/>
<!--버튼 시작-->
<c:if test="${fn:length(resultList) > 0}">
<table width=100% border=0 cellspacing=0 cellpadding=0>
	<tr>
		<td align="center">
		<a href="#" onclick="reTrunData(); return false"; class= "btn big blue">선택</a>
		<a href="#" onclick="window.close();" class= "btn big gray">닫기</a>
		</td>
	</tr>
</table>
</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	