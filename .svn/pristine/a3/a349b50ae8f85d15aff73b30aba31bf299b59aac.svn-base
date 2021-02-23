<%
/****************************************************
    system	: 시스템관리 > 커뮤니티코드관리 > 리스트
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2013-08-23
    writer	: 구동림
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
	
	//페이징
	function move_page(cPage){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/tutor/tutorCmmntySubList.do");
		frm.cPage.value = cPage;
		frm.submit();
	}
	
	//등록
	function inserSubTutorCmmnty(bbsNo , bbsAnswerAt){
		location.href="/admin/tutor/tutorCmmntyInsertSubForm.do?qu=insert&mode=mt&pageMode=reg&bbsNo="+bbsNo+"&bbsAnswerAt="+bbsAnswerAt ; 
	}
	
	//상세보기
	function viewInfo(nttNo , bbsNo, registId, useAt ){
		var pform = document.pform;
		pform.nttNo.value = nttNo;
		pform.bbsNo.value = bbsNo;
		pform.registId.value = registId;
		pform.useAt.value = useAt;
		$("form[name=pform]").attr("action" , "/admin/tutor/tutorCmmntyViewSubForm.do").submit();
	}
	
	//검색
	function list_page(){
		var form = document.pform;
		form.cPage.value = '1';
		$("form[name=pform]").attr("action" , "/admin/tutor/tutorCmmntySubList.do").submit();
	}
	
	//엔터키 이벤트
	function checkKeyPress(){
	  if(event.keyCode == 13){
		  list_page();
	  }
	}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">커뮤니티코드관리 > 게시판 이동<span></span></div>

<form name="pform" id="pform" action="" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="total" id="total" value="<c:out value="${totalCnt}"/>"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
	<input type="hidden" name="registId" id="registId" value="">
	<input type="hidden" name="useAt" id="useAt" value="">
	<input type="hidden" name="nttNo" id="nttNo" value="">
	<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}">
	
	<table class="table-type1 search_form">
		<colgroup>
	        <col class="cellc" width="8%">
	        <col class="celll" width="92%">
        </colgroup>
		<tbody>
			<tr>
				<th>등록기간</th>
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
			<tr>
				<th>검색</th>
				<td>
					<select name="searchMode" id="searchMode" title="검색옵션">
						<option value="">선택</option>
						<option value="bName" <c:if test="${REQUEST_DATA.searchMode eq 'bName' }">selected="selected"</c:if> >작성자</option>
						<option value="title" <c:if test="${REQUEST_DATA.searchMode eq 'title' }">selected="selected"</c:if>>제목</option>
					</select>
					<input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="checkKeyPress()">
				</td>
			</tr>
		</tbody>
	</table>
	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>


<table width="100%" class="btn_Group">  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><c:out value="${totalCnt}"/></span> 건</td>
		<td align="right">
			<a href="#" onclick="inserSubTutorCmmnty('<c:out value="${REQUEST_DATA.bbsNo}" />' , '<c:out value="${REQUEST_DATA.bbsAnswerAt}" />');" class="btn blue" >등록</a>
			<a href="/admin/tutor/tutorCmmntyList.do"  class="btn orange" >목록</a>
		</td>
    </tr>
  </tbody>
</table>

<table class="tb table-type1">
	<tr class="rndbg">
		<th>No</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일시</th>
		<th>삭제여부</th>
		<th>조회수</th>
	</tr>
	<colgroup>
		<col align=middle width="6%">
        <col align=middle width="*">
        <col align=middle width="8%">
        <col align=middle width="15%">
        <col align=middle width="8%">
        <col align=middle width="5%">
	</colgroup>

		<c:choose>
			<c:when test="${fn:length(SUBLIST_DATA)>0}">
				<c:forEach var="result" items="${SUBLIST_DATA}" varStatus="status">
				<c:set value="${status.count}" var="topCount" />
					<tr align="center">
						<td>
							<c:choose>
								<c:when test="${result.NOTICE_AT eq 'Y' && result.PBBSNO eq null}">
									<c:out value="[TOP]"/>
								</c:when>
								<c:otherwise>
									<c:out value='${totalCnt - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/>
								</c:otherwise>
							</c:choose>
						
						</td>
						<td align="left">
							<c:choose>
								<c:when test="${result.USE_AT eq 'Y' }">
									<c:if test="${result.NTT_DEPTH ne 1 }">
										<img style="padding-left:${result.NTT_DEPTH * 10}px" src="/admin/images/bbs_answer_arrow.png" alt="">
									</c:if>
									<a href="#" class="ellipsis" onclick="viewInfo('<c:out value="${result.NTTNO}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.REGIST_ID}" />' , '<c:out value="${result.USE_AT}" />');"><c:out value="${result.TITLE}"/> </a>
								</c:when>
								<c:when test="${result.USE_AT eq 'N' }">
									<c:if test="${result.NTT_DEPTH ne 1 }">
										<img style="padding-left:${result.NTT_DEPTH * 10}px" src="/admin/images/bbs_answer_arrow.png" alt="">
									</c:if>
									<a href="#" class="ellipsis" onclick="viewInfo('<c:out value="${result.NTTNO}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.REGIST_ID}" />', '<c:out value="${result.USE_AT}" />');"><c:out value="${result.TITLE}"/> 게시물은 삭제되었습니다. </a>
								</c:when>
							</c:choose>
						</td>
						<td><c:out value="${result.REGIST_NM}"/></td>
						<td class="btn-td"><c:out value="${result.REGIST_DATE}"/></td>
						<td>
							<c:choose>
								<c:when test="${result.USE_AT eq 'Y'}">
									<c:out value="삭제안함"/>
								</c:when>
								<c:otherwise>
									<c:out value="삭제"/>
								</c:otherwise>
							</c:choose>
						</td>
						<td><c:out value="${result.RCNT}"/></td>
					</tr>
				</c:forEach>
				</c:when>
			<c:otherwise>
				<tr><td colspan="6" align="center">등록된 글이 없습니다.</td></tr>
			</c:otherwise>
		</c:choose> 
	</tbody>
</table>

<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<c:if test="${not empty LIST_DATA}">
     <div class="admin-paging paging_wrap">
         <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCnt}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
     </div>
 </c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	
