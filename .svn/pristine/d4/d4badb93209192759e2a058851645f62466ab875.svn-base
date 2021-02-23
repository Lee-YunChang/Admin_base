<%
/****************************************************
    system	: 과정관리 > 과정관리 > 교육과정관리
    title	: 차수관리
    summary	:
 	wdate	: 2016-04-21
 	writer	: 이진영
 *****************************************************/
 %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<c:set var="online" value='<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%>'/>
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
    
    $('#mtCtypeCode').change(function() {
		$('#mtScGnbCode').find('option').each(function() {
		$(this).remove();
		});

		$('#mtScGnbCode').append('<option value="">전체</option>');

		var selectVal = $(this).val();
		if (selectVal != '') {
			var mtCtypeCode = $('#mtCtypeCode').val();

		$.ajax({
			url : '/admin/course/getAjaxCourseGnb.do',
			type : "POST",
			data : {mtCtypeCode:mtCtypeCode},
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.result.length; i++) {
					$('#mtScGnbCode').append("<option value='"+data.result[i].MT_SUB_CODE+ "'" + "</option>"+data.result[i].MT_SUB_NAME);
					}
				}	
			});
		}
	})
});

// 페이징
function move_page(cPage){
	if($('#mtCtypeCode').val()=='all'){
		$('#mtCtypeCode').empty();
	}
    var frm = document.pform;
    frm.target = "";
	$("#pform").attr("action", "/admin/course/seqList.do");
    frm.cPage.value = cPage;
    frm.submit();
}

//검색
function list_page(){
	if($('#mtCtypeCode').val()=='all'){
		$('#mtCtypeCode').empty();
	}
    var frm = document.pform;
    frm.target = "";
    frm.cPage.value = "1";
	$("#pform").attr("action", "/admin/course/seqList.do");
    frm.submit();
}

//상태값 변경
function goStatus(a,b,c){
    var cseqno =a;
    var seq=b;
    var mtCseqStatusCode=c;

    var frm = document.pform;
    frm.target = "";
    $("#pform").attr("action", "/admin/course/seqStatusExec.do");
    frm.chMtCseqStatusCode.value = mtCseqStatusCode;
    frm.cseqno.value = cseqno;
    frm.seq.value = seq;
    var submitWin = window.confirm("차수 개설상태를 변경 하시겠습니까?");
    if (submitWin){
        frm.submit();
    }
}

//차수등록
function goForm(courseno,cno, mtScCode, pageMode, mtCtype){
    var frm = document.pform;
    var cseqno=cno;

    frm.target = "";
    frm.courseno.value = courseno;
    frm.cseqno.value = cseqno;
    frm.mtScCode.value = mtScCode;
    frm.pageMode.value = pageMode;
    frm.mtCtype.value = mtCtype;
	$("#pform").attr("action", "/admin/course/seqForm.do");
    frm.qu.value = "update";
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

function fnCseqDel(no){

    if(confirm("해당 과정을 삭제하시게 되면 \n하위 데이터들도 모두 삭제가 됩니다.\n그래도 삭제를 하시겠습니까?")){
        $.ajax({
            url : "/admin/course/seqDelExec.do",
            data : {cseqno : no},
            dataType : "json",
            type : 'get',
            success : function(result) {
                alert("삭제되었습니다.");
                move_page(1);
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });
    }

}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/course/seqList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
	<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTALCOUNT}"/>"/>  
    <input type="hidden" name="chMtCseqStatusCode"		id="chMtCseqStatusCode"	value=""/>
    <input type="hidden" name="cseqno"					id="cseqno"				value=""/>
    <input type="hidden" name="qu"						id="qu"					value=""/>
    <input type="hidden" name="mtScCode"				id="mtScCode"			value=""/>
    <input type="hidden" name="courseno"				id="courseno"			value=""/>
    <input type="hidden" name="mtCtype"					id="mtCtype"			value=""/>
    <input type="hidden" name="pageMode"				id="pageMode"			value=""/>

    <table class="table-type1 search_form" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
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
				<select name="mtCtypeCode" id="mtCtypeCode" title="과정형태" style="width:100px;">
					<option value="all">전체</option>
					<c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
          </tr>
          <tr>
          <th>사용여부</th>
            <td>
                <input type="radio" id="useYn" name="useYn" value="ALL"  <c:if test="${REQUEST_DATA.useYn eq '' || REQUEST_DATA.useYn eq null}"> checked="checked"</c:if>/> 전체&nbsp;
                <input type="radio" id="useYn" name="useYn" value="Y" <c:if test="${REQUEST_DATA.useYn eq 'Y'}"> checked="checked"</c:if>/> 사용&nbsp;
                <input type="radio" id="useYn" name="useYn" value="N" <c:if test="${REQUEST_DATA.useYn eq 'N'}"> checked="checked"</c:if>/> 미사용&nbsp;
            </td>
            
            <th>기간</th>
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
              	<th>과정상태</th>
	 			<td colspan="3">
					<select name="mtCseqStatusCode" id="mtCseqStatusCode" title="과정형태" style="width:100px;">
						<option value="">전체</option>
						<c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCseqStatusCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
	 				</select>
	 			</td>
			</tr>
          <tr>
          <tr>
              	<th>과정구분</th>
	 			<td colspan="3">
					<select name="mtScGnbCode" id="mtScGnbCode" title="과정구분" style="width:100px;">
						<option value="">전체</option>
						<c:forEach var="emap2" items="${categoryData2}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtScGnbCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
	 				</select>
	 			</td>
			</tr>
          <tr>
            <th>과정명</th>
            <td colspan="3">
                    <input type="text" class="line" id="seqTitle" name="seqTitle" style="width:375px" title="과정명" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" onkeypress="enterChk();"/>
            </td>
          </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>
</form>

<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
    <tbody>
        <tr>
            <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${resultList[0].TOTALCOUNT}" groupingUsed="true" /></span>건</font></td>
            <td align="right">
             </td>
        </tr>
    </tbody>
</table>


<!-- 본문 > 메인 > 서브   영역 끝 -->
<form name="pform2" action="seq.do" method="post">

<table class="tb table-type1">
    <tr class="rndbg">
        <th>NO</th>
        <th>과정상태</th>
		<th>과정형태</th>
		<th>과정구분</th>
        <th>과정명</th>
        <th>교육기간</th>
        <th>수강인원</th>
        <th>신청인원</th>
        <th>사용여부</th>
        <th>상태변경</th>
        <!-- <th>삭제</th> -->
    </tr>
    <colgroup>
        <col align=middle width="4%">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="12%">
        <col align=middle width="*">
        <col align=middle width="17%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="8%">
        <!-- <col align=middle width="8%"> -->
    </colgroup>
	<c:forEach var="result" items="${resultList}" varStatus="status">
    <tr height=40 align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
        <td><c:out value='${result.NUM}'/></td>
        <td><c:out value="${result.MT_CSEQ_STATUS_NAME}"/></td>
        <td><c:out value="${result.MT_CTYPE_NAME}"/></td>
        <td><c:out value="${result.MT_SUM_NAME}"/></td>
		<%-- <td><c:if test="${result.MT_SC_CODE != 'SC0000'}"><c:out value="${result.MT_SC_NAME}"/></c:if></td> --%>
        <td align="left"><font color="blue"></font>&nbsp;
        	<a href="#" onclick="goForm('<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.MT_SC_CODE}"/>', 'mod', '${result.MT_CTYPE_CODE}');">
        	<c:out value="${result.SEQ_TITLE}"/></a></td>
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
        		<c:when test="${result.MT_CTYPE_CODE == online}">${result.ONLINE_STUDY_USER_CNT}</c:when>
        		<c:otherwise>${result.OFFLINE_STUDY_USER_CNT}</c:otherwise>
        	</c:choose>
        </td>
        <td>${result.APPLY_USER_CNT}</td>
         <td>
        	<c:choose>
	        	<c:when test="${result.USEYN eq 'Y'}">사용</c:when>
	        	<c:when test="${result.USEYN eq 'N'}">미사용</c:when>
            </c:choose>
        </td>
        <td>
             <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="개설상태" onchange="javascript:goStatus('<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.SEQ}"/>', this.value);">
                <c:forEach var="emap4" items="${categoryData4}" varStatus="status2">
					<option value="<c:out value="${emap4.MT_SUB_CODE}"/>" <c:if test="${result.MT_CSEQ_STATUS_CODE == emap4.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap4.MT_SUB_NAME}"/></option>
				</c:forEach>
             </select>
        </td>
        <%-- <td> <a href="#" onclick="fnCseqDel('<c:out value="${result.CSEQNO}"/>');" class="btn small red">삭제</a></td> --%>
        <%-- <td><c:out value="${result.USEYN}"/></td> --%>
    </tr>
    </c:forEach>
</table>
</form>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	