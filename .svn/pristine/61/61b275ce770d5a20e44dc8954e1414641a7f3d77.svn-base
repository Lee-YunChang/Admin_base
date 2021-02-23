<%
/****************************************************
    system	: 시스템관리 > 공통코드 관리
    title	: 공통 코드 목록 조회
    summary	:
    wdate	: 2016-05-16
    writer	: sangs
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
var dateFormat={
	dayNamesMin:['일','월','화','수','목','금','토'],
	monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	showMonthAfterYear: true, //연월 순서로 보여줌
	changeMonth: true, //월을 셀렉트박스로 표현
	changeYear: true, //년을 셀렉트박스로 표현
	dateFormat: "yy-mm-dd"
};	

$(document).ready(function(){
	// 달력
	$("#sdate").datepicker(dateFormat);
	$("#edate").datepicker(dateFormat);
});

//페이지 이동
function move_page(cPage){
	$("input[name=cPage]").val(cPage);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/sms/smsList.do").submit();
}
//검색
function list_page(cPage){
	$("input[name=cPage]").val(cPage);
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/sms/smsList.do").submit();
}

//파일다운로드
function filedown(fileId){ 
	$('#fileId').val(fileId);
	$('form[name="pform"]').attr('action', '/admin/sms/excelFileDown.do').submit();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">SMS시스템<span></span></div>


<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="/admin/sysman/mtcodeList.do" method="post">
	<input type="hidden" name="fileId" id="fileId" value=""/>
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        
        </colgroup>
        <tbody>
        <tr>	
			<th>검색</th>
			<td colspan="2">
		  		<select name="searchMode" title="검색옵션">
		  			<option value="">선택</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode eq 'fName'}">selected="selected" </c:if> value="fName">파일명</option>
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'regId'}">selected="selected" </c:if> value="regId">작성자</option>
	            </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:200px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
			</td>
			<th>등록일</th>
				<td>
					<span id="dateSelect">
					<input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
					 	<a href="#" onclick="$('#sdate').focus(); return false;" class="">
					 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
					 	</a>
					~
					<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
						<a href="#" onclick="$('#edate').focus(); return false;" class="">
							<img src="/admin/images/btn_calendar.png" alt="가입기간 종료일">
						</a>
					</span> 
				</td>
		  </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>
 <!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCnt}" groupingUsed="true" /></span> 건</td>
        <td align=right>
            <a href="#" onclick="popup3('/admin/sms/smsPlusExcelForm.do',700,300,1,1);" class="btn blue">엑셀 업로드</a>
      </td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
    <tr class="rndbg">
    	<th>번호</th>
        <th>파일명</th>
        <th>작성자</th>
        <th>등록일</th>
        <th></th>
    </tr>
    <colgroup>
    	<col align=middle width="5%">
        <col align=middle width="*">
        <col align=middle width="10%">
        <col align=middle width="15%">
        <col align=middle width="15%">
    </colgroup>

    <c:if test="${fn:length(LIST_DATA) > 0}">
	    <c:forEach var="result" items="${LIST_DATA}" varStatus="status">
	
	    <tr align=middle class="onFocusBgCh">
			<td><c:out value='${totalCnt - (REQUEST_DATA.cPage-1)*20 - status.count +1}'/></td>
	        <td><c:out value="${result.ORGFILE}" /></td>
	        <td><c:out value="${result.REG_ID}" /></td>
	        <td><c:out value="${result.REG_DATE}"/></td>
	        <td><a href="#" onclick="filedown('${result.FILE_ID}'); return false;" class="btn sky small">다운로드</a></td>
	    </tr>
	    </c:forEach>
    </c:if>

</table>
<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<!-- 페이징, 버튼 영역 -->
  <c:if test="${not empty LIST_DATA}">
       <div class="admin-paging paging_wrap">
           <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCnt}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
       </div>
   </c:if>
<!-- // 페이징, 버튼 영역 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	