<%
/****************************************************
    system	: 과정관리 > 과정진행관리 > 과정별성적
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
    $("#sdate").datepicker(dateFormat);
    $("#edate").datepicker(dateFormat);
});

//페이지 이동
function move_page(cPage){
    var frm = document.pform;
    frm.target = "";
	$("#pform").attr("action", "/admin/study/resultCseqList.do");
    frm.cPage.value = cPage;
    frm.submit();
}

//검색
function list_page(){
    var frm = document.pform;
    frm.target = "";
    frm.cPage.value = "1";
    $("#pform").attr("action", "/admin/study/resultCseqList.do");
    frm.submit();
}

function openDateSelect(value){

	if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>'){
        $("#dateSelect").show();

    } else if(value == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>' || value == '') {
    	$("#dateSelect").hide();
    }
}

function enterChk(){
    if (event.keyCode==13) list_page();
}

//강의실
function goClassdesk(cno, courseNo){

    var w1 = parseInt(document.body.scrollWidth);
    var h1 = parseInt(document.body.scrollHeight);

    $("input[name=paramcSeqNo]").val(cno);
    $("input[name=paramCourseNo]").val(courseNo);


    $("#popFrm").one("submit", function() {
        window.open('','pop_target2','width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
        this.method = 'POST';
        this.target = 'pop_target2';
    }).trigger("submit");
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강의실관리<span></span></div>

<!-- 본문 > 상단 > 안내문구 시작 -->
<!-- <table style="border-collapse: collapse" border="4" bordercolor="#dce1e1" width="100%">
    <tbody>
    <tr>
        <td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
            <div style="padding-top: 5px"><b>  !!! 인쇄하실때에는 다음의 사항에 주의하여 주십시요!!! </b></div>
            <div style="padding-top: 5px">  1) 현재보고계시는 웹브라우저창의 '도구메뉴>인터넷옵션>고급>인쇄' 부분의 '배경색 및 이미지 인쇄'란을 반드시 체크해 주십시요.  </div>
            <div style="padding-top: 5px">  2) 해당과정 옆의 버튼을 클릭하십시요. </div>
            <div style="padding-top: 5px">  3) 새로운창에서 마우스 우측버튼 > 인쇄 미리보기 선택후, 대화창에서 용지의 방향 설정 부분을 '가로'로 체크해 주십시요.   </div>
        </td>
    </tr>
    </tbody>
</table>
<div class="space"></div> -->
<!-- 본문 > 상단 > 안내문구 끝 -->

<!-- 본문 > 상단 > 검색영역 시작 --><%-- <%=SangsProperties.getProperty("Globals.classdeskUrl") %> --%>
<form id="popFrm" name="popFrm" method="post" action="/admin/study/cuserstudy.do">
    <input type="hidden" name="paramCourseNo" id="paramCourseNo" value=""/>
    <input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value=""/>
    <input type="hidden" name="subcmd" value="class_desk" />
</form>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/study/resultCseqList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>

	<table class="table-type1 search_form">
	  <colgroup>
			<col class="cellc" width="8%">
            <col class="celll" width="42%">
            <col class="cellc" width="8%">
            <col class="celll" width="42%">
		</colgroup>
		<tbody>
	  	<tr>
 			<th>과정형태</th>
			<td colspan="3">
				 <select name="mtCtypeCode" id="mtCtypeCode" title="강의형태" style="width:100px;">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData2}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
		</tr> 
		<tr>
			<th>과정상태</th>
			<td>
				 <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="개설상태" style="width:100px;">
                    <option value="" >전체</option>
                    <c:forEach var="emap4" items="${categoryData4}" varStatus="status2">
						<option value="<c:out value="${emap4.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCseqStatusCode == emap4.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap4.MT_SUB_NAME}"/></option>
					</c:forEach>
                 </select>
 			</td>
			<th>기간</th>
			<td colspan="3">
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
			</td>
		</tr> 
		<tr>		 
			<th>과정명</th>
			<td colspan="3">
                  <input type="text" class="line" id="seqTitle" name="seqTitle" style="width:350px" title="과정명" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" onkeypress="enterChk();"/>
            </td>
		</tr>   
		</tbody>
	</table>
 	<div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>

</form>
<!-- 본문 > 상단 > 검색영역 끝 -->
<!-- 본문 > 메인 > 목록 시작  -->
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
<!-- 본문 > 메인 > 서브   영역 끝 -->

<table class="tb table-type1">
    <tr class="rndbg">
        <th>NO</th>
        <th>과정상태</th>
        <th>과정형태</th>
        <th>과정명</th>
        <th>기간</th>
        <th>수강인원</th>
        <th>신청인원</th>
        <th>성적관리</th>
    </tr>
    <colgroup>
    
    	<col align=middle width="4%">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="*">
        <col align=middle width="13%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="10%">
    </colgroup>
    
	<c:set var="onlineMtCtypeCode" value='<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%>'/>
    
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
        <td><c:out value="${result.NUM}"/></td>
		<td><c:out value="${result.MT_CSEQ_STATUS_NAME}"/></td>
        
        <td>${result.MT_CTYPE_NAME}</td>
        
        <td align="left">
	        <a href="#" onclick="goClassdesk('<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.COURSENO}"/>');return false;" class="btn-small-blue" >
	            <b><c:out value="${result.SEQ_TITLE}"/></b>
	        </a>
        </td>
        <td>
			<c:choose>
	        	<c:when test="${result.OPENTYPE eq 'A'}">
	                 	상시운영
	            </c:when>
	            <c:otherwise>
	                 <c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/>
	            </c:otherwise>
            </c:choose>
        </td>
        
        <td>
         	<c:choose>
         		<c:when test="${onlineMtCtypeCode == result.MT_CTYPE_CODE}">${result.ONLINE_STUDY_USER_CNT}</c:when>
         		<c:otherwise>${result.OFFLINE_STUDY_USER_CNT}</c:otherwise>
         	</c:choose>
        </td>
        <td><c:out value="${result.APPLY_USER_CNT}"/></td>
        <td>
            <a href="#" onclick="goClassdesk('<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.COURSENO}"/>');return false;" class="btn small orange" >클래스데스크</a>
        </td>
    </tr>
    </c:forEach>

</table>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if> 
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>