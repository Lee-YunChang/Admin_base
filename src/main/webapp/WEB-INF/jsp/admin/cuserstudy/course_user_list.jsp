<%
/****************************************************
	system	: 과정진행관리 > 수강생정보관리
	title	: 
	summary	:	
	wdate	: 2016-05-11
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<% 
	//달력 호출시 사용 ( 지정일자 없을시 현재일 호출)
	String today = DateUtil.getNowDate();
%>
<c:set var="apply_margam"><%=SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_CLOSE")%></c:set>
<c:set var="online_course"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%></c:set>

<script type="text/javascript"> 
           
	//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd",
		changeMonth: true,   
		changeYear: true,	
		yearRange: '2010:2025'
	};	
	
	$(document).ready(function(){
		$("#sdate").datepicker(dateFormat);
		$("#edate").datepicker(dateFormat);
		
		$('input[name=openType]').click(function(){
			if ($(this).val() == 'A') {
				$('#dateSelect').hide();
			} else {
				$('#dateSelect').show();
			}
		});

	});
	
	//페이지 이동
	function move_page(cPage){
		var frm = document.pform;
		frm.target = "";
		frm.cPage.value = cPage;
		$("#pform").attr("action", "/admin/study/cuserList.do");
		frm.submit();
	}
	
	//검색
	function list_page(){
		var frm = document.pform;
		frm.target = "";
		frm.cPage.value = "1";
		$("#pform").attr("action", "/admin/study/cuserList.do");
		frm.submit(); 
	}
	
	// 수강 상세정보
	function goView(mtCtypeCode, cseqno, courseNo, userNo, cuserno, subcmd){
		var frm = document.cform;
		frm.cseqno.value = cseqno;
		frm.courseno.value = courseNo;
		frm.userNo.value = userNo;
		frm.cuserno.value = cuserno;
		frm.subcmd.value = subcmd;
		frm.mtCtypeCode.value = mtCtypeCode;
		
		//삭제
		if(subcmd=="user_del") {
			var confrm = confirm("수강생 정보를 삭제하겠습니까?");
			if(!confrm) {
				return false;
			}else {

				$("#cform").attr("action", "/admin/study/cuserDel.do");
				$("#cform").attr('target', '_self');
			}
		}else {
			$("#cform").attr('target', 'pop_target2');
		}
		
		$("#cform").one("submit", function() {
			if(subcmd=="user_view") {
				$("#cform").attr("action", "/admin/study/cuserView.do");
		    	window.open('','pop_target2','width=950, height=600, top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
			}
		    this.method = 'POST';
		}).trigger("submit");
	}
	
	function enterChk(){
		if (event.keyCode==13) list_page();
	}

	function openDateSelect(value){

        if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>'){
            $("#dateSelect").show();

        } else if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>' || value == '') {
        	$("#dateSelect").hide();
        }
    }

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수강생정보관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" action="/admin/study/cuserList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>  
	
	<table class="table-type1 search_form">
	  <colgroup>
			<col class="cellc" width="8%">
            <col class="celll" width="42%">
            <col class="cellc" width="8%">
            <col class="celll" width="42%">
		</colgroup>
		
		<tbody>
		<tr>
			<th>회원여부</th>
			<td>
				<select name="mberGbn" id="mberGbn" title="회원여부" style="width: 100px;">
					<option value="">전체</option>
					<option value="USER" <c:if test="${REQUEST_DATA.mberGbn == 'USER'}"> selected="selected"</c:if>>회원</option>
					<option value="NON" <c:if test="${REQUEST_DATA.mberGbn == 'NON'}"> selected="selected"</c:if>>비회원</option>
 				</select>
 			</td>
 			<th>수료여부</th>
			<td>
				 <select name="courseStatus" id="courseStatus" style="width: 100px;">
				 	<option value="">전체</option>
				 	<option value="8" <c:if test="${REQUEST_DATA.courseStatus == 8}"> selected="selected"</c:if>>수료</option>
				 	<option value="9" <c:if test="${REQUEST_DATA.courseStatus == 9}"> selected="selected"</c:if>>미수료</option>				 	
				 </select>
 			</td>
		</tr>
	  	<tr>
			<th>과정형태</th>
			<td>
				 <select name="mtCtypeCode" id="mtCtypeCode" title="강의형태" style="width: 100px;">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 				<font color="#ff0000">※ 검색 결과 없을 경우 분류(온라인/집합) 바꿔 재검색</font>
 			</td>
			<th>학습기간</th>
			<td>
				<input type="radio" id="openType" name="openType" value=""  onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq '' || REQUEST_DATA.openType eq null}"> checked="checked"</c:if>/> 전체&nbsp;
                <input type="radio" id="openType" name="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>" onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq 'A'}"> checked="checked"</c:if>/> 상시운영&nbsp;
                <input type="radio" id="openType" name="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>" onclick="openDateSelect(this.value);" <c:if test="${REQUEST_DATA.openType eq 'D'}"> checked="checked"</c:if>/> 기간운영&nbsp;
                <span id="dateSelect" <c:if test="${REQUEST_DATA.openType ne 'D'}">style="display: none;"</c:if>>
                	<input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
                     <a href="#" onclick="$('#sdate').focus(); return false;" class="">
                         <img src="/admin/images/btn_calendar.png" alt="시작일">
                     </a>
                	~
                	<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
                    <a href="#" onclick="$('#edate').focus(); return false;" class="">
                        <img src="/admin/images/btn_calendar.png" alt="종료일">
                    </a>
                </span>
			</td>
		</tr>
		<tr>		 
			<th>검색</th>
			<td colspan="3"> 	
				<select name="searchMode" title="검색옵션" style="width: 100px;">
					<option value="">전체</option>
					<option <c:if test="${REQUEST_DATA.searchMode eq 'userName'}">selected="selected" </c:if> value="userName">이름</option>
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'seqTitle'}">selected="selected" </c:if> value="seqTitle">과정명</option>
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if> value="userId">아이디</option>
	            </select>
	            <input type="text" class="line" id="searchWord" name="searchWord" style="width:200px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();"/>
			 </td>
		</tr>   
		</tbody>
	</table>
	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form> 
<!-- 본문 > 상단 > 검색영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  --> 
<table width="100%" class="btn_Group">
	<tbody>
		<tr>
			<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${resultList[0].TOTALCOUNT}" groupingUsed="true" /></span> 건</td>
			<td align="right">
 			</td>
		</tr>
	</tbody>
</table>

<!-- 본문 > 메인 > 서브   영역 끝 -->

<form name="cform" id="cform" action="/admin/study/cuserList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
	<input type="hidden" name="cseqno" id="cseqno" value=""/>
	<input type="hidden" name="courseno" id="courseno" value=""/>
	<input type="hidden" name="userNo" id="userNo" value=""/>
	<input type="hidden" name="cuserno" id="cuserno" value=""/>
	<input type="hidden" name="subcmd" id="subcmd" value=""/>
 	<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value=""/>
 	
	<table class="tb table-type1" >
		<colgroup>
			<col class="cellc" width="4%">
			<col class="cellc" width="6%">
			<col class="cellc" width="*">
			<col class="cellc" width="8%">
			<col class="cellc" width="8%">
			<col class="cellc" width="10%">
			<col class="cellc" width="15%">
			<col class="cellc" width="6%">
			<col class="cellc" width="12%">
		</colgroup>	
		<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>과정형태</th>
			<th>과정명</th>
			<c:if test="${REQUEST_DATA.mberGbn == 'USER'}"><th>아이디</th></c:if>
			<th>이름</th>
			<c:if test="${REQUEST_DATA.mberGbn == 'NON'}"><th>생년월일</th></c:if>
			<th>신청일자</th>
			<th>학습기간</th>
			<th>수료여부</th>
			<th>수강정보</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				 <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
					<td><c:out value="${result.TOTALCOUNT-result.RNUM+1}"/></td>
					<td><c:out value='${result.MT_CTYPE_NAME}'/></td>
					<td style="text-align: left; padding-left: 3px;"><c:out value='${result.SEQ_TITLE}'/></td>
					<c:if test="${REQUEST_DATA.mberGbn == 'USER'}"><td><c:out value='${result.USERID}'/></td></c:if>
					<td><c:out value='${result.USERNAME}'/></td>
					<c:if test="${REQUEST_DATA.mberGbn == 'NON'}"><td><c:out value='${result.BRTHDY}'/></td></c:if>
					<td><c:out value='${result.WDATE}'/></td>
					<td>
						<c:if test="${result.OPENTYPE == 'D' && result.COURSE_STATUS == '8'}">
							<c:out value='${result.STUDY_SDATE}'/>~<c:out value='${result.STUDY_EDATE}'/>
						</c:if>
						<c:if test="${result.OPENTYPE == 'A' && result.COURSE_STATUS == '8'}"> 
							<c:out value='${result.WDATE}'/>~<c:out value='${result.COMPDATE}'/>
						</c:if>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.COURSE_STATUS == '8'}">수료</c:when>
							<c:when test="${result.COURSE_STATUS == '9'}">미수료</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="#" onclick="goView('<c:out value="${result.MT_CTYPE_CODE}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CUSERNO}"/>' , 'user_view');" class="btn small sky">상세보기</a>
						<a href="#" onclick="goView('<c:out value="${result.MT_CTYPE_CODE}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CUSERNO}"/>' , 'user_del');" class="btn small red">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!-- 본문 > 메인 > 목록 끝 -->
</form>	
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	