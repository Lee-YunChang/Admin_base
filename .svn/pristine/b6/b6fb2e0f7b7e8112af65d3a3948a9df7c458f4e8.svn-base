<%
/****************************************************
    system	: 결제관리 > 결제관리
    title	: 대상자관리 리스트
    summary	:
    wdate	: 2016-05-12
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<c:set var="apply_margam"><%=SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_CLOSE")%></c:set>
<c:set var="online_course"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%></c:set>

<script type="text/javascript">

    // 날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
    function caldate(day){
    }
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
    	$("#pform").attr("action", "/admin/payment/payList.do");
        frm.cPage.value = cPage;
        frm.submit();
    }
    // 검색
    function list_page(){
        var frm = document.pform;
        frm.target = "";
        frm.cPage.value = "1";
        $("#pform").attr("action", "/admin/payment/payList.do");
        frm.submit();
    }

    // 수동 수강생 등록을 위한 학습자 선택 팝업
    function fnSelectUserForm(userGbn){
    	if ($('input[name=selectCourse]:checked').length < 1) {
    		alert('과정을 선택하세요');
    		return;
    	}
    	
    	var cseqno = $('input[name=selectCourse]:checked').val();
    	seq_title = $('input[name=selectCourse]:checked').closest('tr').find('td:eq(4)').text();
        //window.open("/admin/payment/userList.do?cseqno=" + cseqno, "search_user_form", "width=1000,height=700,scrollbars=yes,resizable=yes");
        
        if(userGbn == 'S'){//회원
        	popup4("/admin/payment/userList.do?cseqno=" + cseqno,1000,700,'yes','yes');
        }else{//비회원
        	popup4("/admin/payment/nmberList.do?cseqno=" + cseqno,1000,700,'yes','yes');	
        }
        
        
    }
    
    // 대상자선정 리스트 팝업
    function fnUserForm(cseqno,fileSubmitYn){
       window.open("/admin/payment/payUserList.do?fileSubmitYn="+fileSubmitYn+"&cseqno=" + cseqno, "search_user_form", "width=1200,height=850,scrollbars=yes,resizable=yes");
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


	// 강의형태가 전체, 전문가 과정이 아닐때만 개설상태 검색 노출
	function fnChStatus(a){
	    var ctype = a;
	}

	//대상자 추첨 선정 리스트 팝업
	function randomForm(cseqno){
	    window.open("/admin/payment/payRandomUserList.do", "search_user_form", "width=800,height=850,scrollbars=yes,resizable=no");
	}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">대상자관리<span> </span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/payment/payList.do" method="post">
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
            <th>과정형태</th>
			<td colspan="3">
				<select name="mtCtypeCode" id="mtCtypeCode" title="과정형태" style="width:100px;">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
 			</td>
          </tr>
          <tr>
            <th>과정상태</th>
 			<td>
				<select name="mtCseqStatusCode" id="mtCseqStatusCode" title="과정형태" style="width:100px;">
					<option value="">전체</option>
					<c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
						<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCseqStatusCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
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
            <th>과정명</th>
            <td colspan="3">
                    <input type="text" class="line" id="seqTitle" name="seqTitle" style="width:375px" title="과정명" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" onkeypress="enterChk();"/>
            </td>
          </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">검색</a></div>

</form>
<%-- <script type="text/javascript">
	openDateSelect('<%=openType%>');
</script> --%>
<!-- 본문 > 상단 > 검색영역 끝 -->
<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCnt}" groupingUsed="true" /></span> 건</td>
        <td align="right">
            <a href="#" onclick="fnSelectUserForm('S');" class="btn red">수강생 등록[회원]</a>
            <a href="#" onclick="fnSelectUserForm('N');" class="btn blue">수강생 등록[비회원]</a>
        </td>
        
        <!--
        <td align="right">
            <a href="#" onclick="randomForm();" class="btn red">대상자추첨</a>
        </td> 
         -->
    </tr>
  </tbody>
  </table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
    <tr class="rndbg">
        <th>선택</th>
        <th>NO</th>
        <th>과정상태</th>
        <th>과정형태</th>
        <!-- <th>과정분류</th>
        <th>차수<br/>(기수)</th> -->
        <th>과정명</th>
        <th>교육기간</th>
        <th>신청인원</th>
        <th>선발인원</th>
        <th>미선발인원</th>
        <!-- <th>취소</th> -->
        <th>대상자선정</th>
    </tr>
    <colgroup>
    	<col align=middle width="4%">
        <col align=middle width="4%">
        <col align=middle width="8%">
        <col align=middle width="8%">
        <col align=middle width="*">
        <col align=middle width="17%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="5%">
        <col align=middle width="8%">
    </colgroup>
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
    	<td><input type="radio" name="selectCourse" value="${result.CSEQNO}"></td>
        <td><c:out value='${totalCnt - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
        <td><c:out value="${result.MT_COUR_STATUS_NAME}"/></td>
        <td><c:out value="${result.MT_CTYPE_NAME}"/></td>
        <td align="left"><font color="blue"><c:out value="${result.SITE_NAME}"/></font><c:out value="${result.SEQ_TITLE}"/></td>
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
        <td><!-- 전체 --><c:out value="${result.USER_TOT}"/></td>
        <td><!-- 선정 --><c:out value="${result.SUKANG_TOT}"/></td>
        <td><!-- 비선정 --><c:out value="${result.NOT_SUKANG_TOT}"/></td>
        <%-- <td><font size="3"><!-- 취소 --><c:out value="${result.CANCEL_USER_TOT}"/></font></td> --%>
        <td>
        	<c:choose>
        		<c:when test="${result.MT_CSEQ_STATUS_CODE == apply_margam}">
        			<a href="#" onclick="fnUserForm('<c:out value="${result.CSEQNO}"/>','<c:out value="${result.FILE_SUBMIT_YN }"/>')"  class="btn gray small">마감</a>
        		</c:when>
        		<c:otherwise>
        			<a href="#" onclick="fnUserForm('<c:out value="${result.CSEQNO}"/>','<c:out value="${result.FILE_SUBMIT_YN }"/>')"  class="btn sky small">선발</a>
        		</c:otherwise>
        	</c:choose>
        </td>
    </tr>
    </c:forEach>
</table>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCnt}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	