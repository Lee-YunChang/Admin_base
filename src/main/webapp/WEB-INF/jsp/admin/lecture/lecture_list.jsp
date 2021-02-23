<%
/****************************************************
	system	: 과정관리 > 방문교육관리
	title	: 
	summary	:	
	wdate	: 2016-08-30
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	
	//일괄 선택 , 해제
	$('#isall').on('click' , function(){
		if($(this).is(':checked')){
			$('#contentsTb input:checkbox[name="chkSltno"]').attr('checked' , 'checked');
		}else if($(this).not(':checked')){
			$('#contentsTb input:checkbox[name="chkSltno"]').removeAttr('checked');
		}
	})
})

//페이지 이동
function fnPageList(cPage){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = cPage;
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	
	var mtScCodeArr = new Array;
	$('input:checkbox[name=schMtScCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			mtScCodeArr.push($(this).val());
		}
	});	 
	
	$("#mtScCodeArr").val(mtScCodeArr.join(','));
	$("#pform").attr("action", "/admin/lecture/lectureList.do");
	frm.submit();
}

//검색
function fnList(){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = "1";
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	var mtScCodeArr = new Array;
	$('input:checkbox[name=schMtScCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			mtScCodeArr.push($(this).val());
		}
	});	 
	
	$("#mtScCodeArr").val(mtScCodeArr.join(','));
	$("#pform").attr("action", "/admin/lecture/lectureList.do");
	frm.submit(); 
}

//등록
function fnForm(){
	var frm = document.pform;
	frm.target = "";
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>";
	$("#pform").attr("action", "/admin/lecture/lectureForm.do");
	frm.submit(); 
}

//엑셀다운
function excelDownload() {
	var frm = document.pform;
	$("#pform").attr("action", "/admin/lecture/lectureListExcel.do");
	frm.submit();
}

//상세
function fnView(slno){
	var frm = document.pform;
	frm.target = "";
	frm.slno.value = slno;
	$("#pform").attr("action", "/admin/lecture/lectureForm.do");
	frm.submit(); 
}

//일괄 승인 , 취소
function fnApproval(qu) {
	var form =document.pform;
	var chkedList = [];
	
	if(!$("input:checkbox[name='chkSltno']").is(":checked")){
		alert('체크박스를 선택해주세요.');
		return false;
	}
	
	if(!confirm('선택한 교육의 상태값을 변경 하시겠습니까?')) return false;
	
	var idx = 0;
	$("input[name=chkSltno]:checkbox").each(function(i){  
		if($(this).prop("checked")) {
			var slno = $(this).val()
			var data = {}
			data.slno    = slno;
			data.mtLecStatusCode = $('#multiMtLecStatusCode').val();
			chkedList[idx] = data;
			idx++;
		} 
	});
	
//	alert(JSON3.stringify(chkedList))
	
	$.ajax({
        url : '/admin/lecture/lectureApproval.do',   
        type : "POST",  
        data : {chkedListStr : JSON3.stringify(chkedList)},
        dataType: "json",
        async : false,
        success : function(data, status) {
        	if(data.RESULT === 'Y'){
        		alert('정상적으로 처리되었습니다.');
        		fnPageList(1);
        		
        	}else{
        		alert('알수없는 오류가 발생했습니다.');
        	}
        }
    });
}

function sort(st) {
	var frm = document.pform;
	frm.target = "";
	frm.sort.value = st;
	$("#pform").attr("action", "/admin/lecture/lectureList.do");
	frm.submit(); 
}

function distanseForm(){
	window.open("/admin/lecture/lectureDistanseSearch.do","tutorPop","width=520,height=650,scrollbars=yes");
}
</script>
<style>
	.tb.table-type1 tr.color_row td{ background-color:#eee;}
</style>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">방문교육관리</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/lecture/lectureList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
    <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTALCOUNT}"/>"/>
 	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<input type="hidden" name="slno" id="slno" value=""/>
	<input type="hidden" name="sltno" id="sltno" value=""/>
	<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
	<input type="hidden" name="mtScCodeArr" id="mtScCodeArr" value="${REQUEST_DATA.mtScCodeArr}"/>
	<input type="hidden" name="sort" id="sort" value="${REQUEST_DATA.sort}"/>
	
	<table class="table-type1 search_form">
		<colgroup>
			<col class="cellc" width="8%">
			<col class="celll" width="92%">
		</colgroup>
		<tbody>
		<tr>
			<th>기간검색</th>
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
			<th>승인상태</th> 
			<td>
				<input type="radio" name="sMtLecStatusCode" value=""  <c:if test="${empty REQUEST_DATA.sMtLecStatusCode}"> checked="checked"</c:if>/> 전체&nbsp;
		        <c:forEach var="data" items="${cmStatus}" varStatus="status2">
					<input type="radio" name="sMtLecStatusCode" value="${data.MT_SUB_CODE }"  <c:if test="${REQUEST_DATA.sMtLecStatusCode eq data.MT_SUB_CODE}"> checked="checked"</c:if>/> ${data.MT_SUB_NAME }&nbsp;
				</c:forEach>
		        
			</td>
		</tr>
		<tr>
			<th>검색</th>
			<td>
		  		<select name="searchMode" title="검색옵션">
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'applyNm'}">selected="selected" </c:if> value="applyNm">신청자</option>
	                <option <c:if test="${REQUEST_DATA.searchMode eq 'teachNm'}">selected="selected" </c:if> value="teachNm">강사명</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode eq 'applyOrganNm'}">selected="selected" </c:if> value="applyOrganNm">신청기관</option>
	            </select>
	            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>"  onkeypress="if(event.keyCode ==13)fnList();"/>
			</td>		
		</tr> 
		</tbody>
	</table>
	<div class="button_top"><a href="#" onclick="fnList();" class="btn search brown">검색</a></div>

	<!-- 본문 > 상단 > 검색영역 끝 -->
	<table class="btn_Group" style="width:100%">
		<tbody>
			<tr>
				<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${resultList[0].TOTALCOUNT}" groupingUsed="true"/></span> 건 
					/ 신청 인원 <span class="red"><fmt:formatNumber value="${TOTAL_PER_CNT}" groupingUsed="true"/></span>명
					/ 결과 인원 <span class="red"><fmt:formatNumber value="${TOTAL_COM_CNT}" groupingUsed="true"/></span>명
				</td>
				<td align="right">
					<!-- <a href="javascript:fnApproval('approval');" class="btn orange">선택승인</a>
					<a href="javascript:fnApproval('cancel');" class="btn red">선택취소</a>
					<a href="javascript:fnApproval('save');" class="btn blue">선택변경</a> -->
					<a href="javascript:distanseForm();" class="btn green">급지관리</a>
					<a href="javascript:fnForm();" class="btn green">신규등록</a>
					
					<a href="#" onclick="excelDownload();return false;" class="btn orange">엑셀다운로드</a>
					<!-- <a href="javascript:fnApproval('cancel');" class="btn red">엑셀업로드</a> -->
					<a href="#" onclick="popup3('/admin/lecture/specialLectureExcelForm.do',700,300,1,1);" class="btn blue">엑셀 업로드</a>
					<span style="padding-left: 20px;">
					<select name="multiMtLecStatusCode" id="multiMtLecStatusCode" style="height: 28px;">
						<c:forEach var="data" items="${cmStatus}" varStatus="status2">
							<option value="<c:out value="${data.MT_SUB_CODE}"/>"><c:out value="${data.MT_SUB_NAME}"/></option>
						</c:forEach>
					</select>
			         <a href="javascript:fnApproval('save');" class="btn blue">선택변경</a>
			         </span>
				</td>
			</tr>
		</tbody>
	</table>

	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1">
		<colgroup>
			<col class="cellc" width="2%">
			<col class="cellc" width="4%">
			<col class="celll" width="9%">
			<col class="cellc" width="12%">
			<col class="celll" width="12%">
			<col class="cellc" width="10%">
			<col class="cellc" width="4%">
			<col class="cellc" width="4%">
			<col class="celll" width="10%">
			<col class="cellc" width="10%">
			<col class="cellc" width="10%">
			<col class="celll" width="4%">
			<col class="celll" width="4%">
			<col class="celll" width="6%">
			<col class="celll" width="6%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox"  title="전체 선택" name="isall" id="isall"/></th>
				<th scope="col">No</th>
				<th scope="col">신청기관</th>
				<th scope="col"><a href='#' onclick="sort('sDate');return false;" style="color:white;">신청교육일시</a></th>
				<th scope="col"><a href='#' onclick="sort('dsDate');return false;" style="color:white;">확정교육일시</a></th>
				<th scope="col">교육대상</th> 
				<th scope="col"><a href='#' onclick="sort('perCnt');return false;" style="color:white;">신청<br/>인원</a></th>
				<th scope="col"><a href='#' onclick="sort('comCnt');return false;" style="color:white;">결과<br/>인원</a></th>
				<th scope="col">신청자<br />(연락처)</th> 
				<th scope="col">강사<br />(연락처)</th>
				<th scope="col">신청일</th> 
				<th scope="col">교육<br/>확인서</th> 
				<th scope="col">강의<br/>교안</th> 
				<th scope="col">상태</th> 
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody id="contentsTb">
			<c:choose>
			<c:when test="${fn:length(resultList) > 0}">
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
						<td scope="row"><input type="checkbox" name="chkSltno" id="chkSltno" value="<c:out value='${result.SLNO}'/>"/></td>
						<td><c:out value='${resultList[0].TOTALCOUNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
						<td>${result.APPLY_ORGAN_NM }</td>
						<td>${result.EDU_SDATE } ~ ${fn:substring(result.EDU_EDATE,11,16)}</td>
						<td>
							<c:choose>
								<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0001' || result.MT_LEC_STATUS_CODE eq 'LE0005'}">
								</c:when>
								<c:otherwise>
									${result.DS_SDATE } ~ ${fn:substring(result.DS_EDATE,11,16) }
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${result.MT_LEC_TARGET_NAME == '기타'}">
									<c:out value="${result.MT_LEC_TARGET_NAME}"/>(<c:out value="${result.TARGET_ETC}"/>)
								</c:when>
								<c:otherwise>
									<c:out value="${result.MT_LEC_TARGET_NAME}"/>
								</c:otherwise>
							</c:choose>
						</td> 
						<td><c:out value="${result.PERSON_CNT}"/></td> 
						<td><c:out value="${result.COM_CNT}"/></td> 
						<td>${result.APPLY_NM }<br />(<c:out value="${result.APPLY_PHONE}"/>)</td> 
						<td>${result.MBERNM }<br />(<c:out value="${result.MOBLPHON}"/>)</td>
						<td><c:out value="${result.REGIST_DT}"/></td>
						<td>
							<c:if test="${result.FILE_YN == 'Y'}">O</c:if>
							<c:if test="${result.FILE_YN == 'N'}">X</c:if>
						</td>
						<td>
							<c:if test="${result.FILE_YN2 == 'Y'}">O</c:if>
							<c:if test="${result.FILE_YN2 == 'N'}">X</c:if>
						</td>
						<td>${result.MT_LEC_STATUS_NAME }</td> 
						<td>
							<a href="#" onclick="fnView('<c:out value="${result.SLNO}"/>'); return false;" class="btn gray">상세조회</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="14" align="center">
						등록된 방문교육이 존재 하지 않습니다.
					</td>
				</tr>
			</c:otherwise>
		</c:choose>  
			</tbody>
	</table>
	</form> 
	<br/>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:fnPageList"/>
	    </div>
	</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	