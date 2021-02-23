<%
/****************************************************
    system	: 과정관리 > 과정정보관리
    title	: 교육과정 등록/수정 양식
    summary	:
   	wdate	: 2016-05-21
   	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<%
	String today = DateUtil.getNowDate();
%>
<link rel="stylesheet" type="text/css" href="/admin/common/multiCalPicker/css/datepicker.css" />
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/admin/common/multiCalPicker/js/jquery.js"></script>
<script type="text/javascript" src="/admin/common/multiCalPicker/js/datepicker.js"></script>
<script type="text/javascript" src="/admin/common/multiCalPicker/js/eye.js"></script>
<script type="text/javascript" src="/admin/common/multiCalPicker/js/utils.js"></script>
<!-- 캘린더 스타일 및 스크립트 로딩 끝 -->
<!-- 멀티, 싱글 달력 관련 스크립트 시작 -->
<script type="text/javascript">

    // 공통 멀티캘린더 포맷
    
    function getCalendarMultiFormat(objId){
        var objVal = '#'+objId;
        var selectobjVal = $(objVal).val().split(",");
        var dateFormatSingle = {
                 date: selectobjVal, //선택된날짜
                current: $(objVal).val(), //현재일
                format: 'Y-m-d',
                calendars: 2,
                mode: 'multiple',
                locale: {
                    days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
                    daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    weekMin: "주 "
                },
                onChange: function(formated, dates) {
                     $(objVal).val(formated);
                },
                starts: 0 //요일시작 일요일부터 1은 월요일부터
        }
        return dateFormatSingle;
    }

    // 공통 싱글캘린더 포맷
    function getCalendarFormat(objId){

        var objVal = '#'+objId;
        var dateFormatSingle = {
                 date: $(objVal).val(), //선택된날짜
                current: $(objVal).val(), //현재일
                format: 'Y-m-d',
                calendars: 1,
                mode: 'single',
                locale: {
                    days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
                    daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    weekMin: "주 "
                },
                onChange: function(formated, dates) {
                     $(objVal).val(formated);
                     $('#'+objId).DatePickerHide();
                },
                starts: 0 //요일시작 일요일부터 1은 월요일부터
        }

        return dateFormatSingle;

    }


     // 멀티 달력 호출 onclick이벤트
    function calShowMulti(objId) {
        $('#calendarArea').DatePicker(getCalendarMultiFormat(objId));
        $('#calendarArea').DatePickerShow();
    }

    // 싱글 달력 호출 onclick이벤트
    function calShow(objId) {
        $('#'+objId).DatePicker(getCalendarFormat(objId));
         $('#'+objId).DatePickerShow();
    }

    //운영형태
    function openTypeCheck(obj){

          // A = 상시운영(학습일수 오픈)
        if(obj == 'A'){
            document.getElementById("eduDay").disabled = false;
            //document.getElementById("examProgPercent").disabled = false;

            /* $("#eduDay").attr("disabled", false);
            $("#studytime").attr("disabled", "disabled"); */
             document.getElementById("applySdate").disabled = true;
            document.getElementById("applyEdate").disabled = true;
            document.getElementById("studySdate").disabled = true;
            document.getElementById("studyEdate").disabled = true;


        }else{
            //document.getElementById("examProgPercent").disabled = true;
            document.getElementById("eduDay").disabled = true;
            document.getElementById("applySdate").disabled = false;
            document.getElementById("applyEdate").disabled = false;
            document.getElementById("studySdate").disabled = false;
            document.getElementById("studyEdate").disabled = false;
        }
    }

</script>
<!-- 멀티, 싱글 달력 관련 스크립트 끝 -->
<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">과정차수${titleMode}<span>차수 기본정보를 신규등록 및 수정할 수 있습니다.</span></div>

	<!-- 본문  시작  -->
	<form name="pform" id="pform" action="/admin/course/seqExec.do" method="post" onsubmit="writeFormCheck(); return false;" >
        <input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
        <input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
        <input type="hidden" name="seq" value="<c:out value="${REQUEST_DATA.seq}"/>"/>
        <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
        <input type="hidden" name="classDesk" id="classDesk" value=""/>
        <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${mapInfo.MT_CTYPE_CODE}"/>"/>
		<input type="hidden" id="insClassDesk" value="<c:out value="${mapInfo.CLASS_DESK}"/>"/>
        
        <table class="table-type1 search_form ">
            <colgroup>
                <col class=cellc  width="8%">
                <col class=celll  width="85%">
            </colgroup>
            <tbody>
            <tr>
                 <th>과정선택</th>
                 <td class="line" colspan="3">
                  <select name="changeCourseNo" id="changeCourseNo" title="과정선택">
                   <option value="">선택</option>
                   <c:forEach var="emap" items="${courseList}" varStatus="status1">
					<option value="<c:out value="${emap.COURSENO}"/>" <c:if test="${REQUEST_DATA.courseno == emap.COURSENO}"> selected="selected"</c:if>>[<c:out value="${emap.MT_CTYPE_NAME}"/>] <c:out value="${emap.COURSETITLE}"/></option>
				</c:forEach>
                  </select>
                 </td>
            </tr>
            <tr>
                 <th>* 차수명</th>
                 <td colspan="3">
	                 <c:choose>
	                 	<c:when test="${REQUEST_DATA.qu == 'insert'}">
	                    	<input type="text"  class="line" name="title"  id="title"  value="<c:out value="${mapInfo.COURSETITLE}"/>" style="width:500px"/>
	                	</c:when>
	                	<c:otherwise>
	                     	<input type="text"  class="line" name="title"  id="title"  value="<c:out value="${mapInfo.TITLE}"/>" style="width:500px"/>
	                 	</c:otherwise>
	                 </c:choose>
                 </td>
            </tr>
            <tr>
                <th>* 수강료</th>
                <td><input type="text"  class="rlinenumber" name="price"  id="price"  value="<fmt:formatNumber value="${mapInfo.PRICE}" pattern="#,###" />"  style="width:180px"/> 원</td>
            </tr>
            <tr>
                <th>과정설명<br/>(간단한설명)</th>
                <td>
                     <textarea rows="5" name="shortDescription"  id="shortDescription"  style="width:100%;" ><c:out value="${mapInfo.SHORT_DESCRIPTION}"/></textarea>
                </td>
            </tr>
            <tr>
                <th>과정개요</th>
                <td>
                     <textarea rows="5" name="description"  id="description"  style="width:100%;" maxlength="80"><c:out value="${mapInfo.DESCRIPTION}"/></textarea>
                     <br/><font class=extext>※ 1600 bytes(한글 80자 제한)</font>
                </td>
            </tr>
            <tr>
                <th>학습목표</th>
                <td>
                     <textarea rows="5" name="subject"  id="subject"  style="width:100%;" ><c:out value="${mapInfo.SUBJECT}"/></textarea>
                </td>
            </tr>
            <tr>
                <th>학습목차</th>
                <td>
                     <textarea rows="5" name="progress"  id="progress"  style="width:100%;"><c:out value="${mapInfo.PROGRESS}"/></textarea>
                </td>
            </tr>
            <tr>
                <th>교육대상</th>
                <td>
                    <textarea rows="5" name="target"  id="target"  style="width:100%;" ><c:out value="${mapInfo.TARGET}"/></textarea>
                </td>
            </tr>
            <tr>
                <th>수료기준</th>
                <td>
                    <textarea rows="5" name="completion"  id="completion"  style="width:100%;" ><c:out value="${mapInfo.COMPLETION}"/></textarea>
                </td>
            </tr>
            <tr>
                <th>과정준비사항</th>
                <td>
                    <textarea rows="5" name="exDescription"  id="exDescription"  style="width:100%;" ><c:out value="${mapInfo.EX_DESCRIPTION}"/></textarea>
                </td>
            </tr>
            <tr>
                <th>* 수료점수</th>
                <td>
                    <input type="text"  class="rlinenumber" name="compVal" id="compVal" value="<c:out value="${mapInfo.COMP_VAL}"/>" style="width: 160px"> 점
                </td>
            </tr>
         </tbody>
    </table>

    <div class="space"></div><!-- 공백 default 5px -->
    <div class="tb_title">클래스데스크<span><font class="extext">(항목 중 반드시 하나 이상 선택해야 하며 총 점수의 합이 100이 되어야 합니다.)</font></span></div>
     <table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
              <tr class="rndbg">
                <th align="center"> <input type="checkbox" name="desk01" id="desk01" onclick="openText('evalProgress', this.checked);" style="ime-mode:disabled;" />  &nbsp; 온라인수강</th>
                <th align="center"> <input type="checkbox" name="desk04" id="desk04" onclick="openText('evalAttend', this.checked);" style="ime-mode:disabled;"/> &nbsp; 출석</th>
                <th align="center"> <input type="checkbox" name="desk02" id="desk02" onclick="openText('evalReport', this.checked);" style="ime-mode:disabled;"/> &nbsp; 과제</th>
                <th align="center"> <input type="checkbox" name="desk03" id="desk03" onclick="openText('evalExamFinal', this.checked); openText('evalExamMt', this.checked);" style="ime-mode:disabled;"/> &nbsp; 시험</th>
                <th align="center"> <input type="checkbox" name="desk09" id="desk09" onclick="openText('evalDiscuss', this.checked);" style="ime-mode:disabled;" /> &nbsp; 토론</th>
                <th align="center"> <input type="checkbox" name="desk05" id="desk05" onclick="return false;"/> &nbsp; 설문</th>
                <th align="center"> <input type="checkbox" name="desk06" id="desk06" onclick="return false;"/> &nbsp; 공지사항</th>
                <th align="center"> <input type="checkbox" name="desk07" id="desk07" onclick="return false;"/> &nbsp; 자료실</th>
            </tr>
        <colgroup>
            <col align=middle width="14%">
            <col align=middle width="12%">
            <col align=middle width="12%">
            <col align=middle width="12%">
            <col align=middle width="14%">
            <col align=middle width="12%">
            <col align=middle width="12%">
            <col align=middle width="*">
        </colgroup>
        <tr>
            <td align="center"><input type="text" style="width:70px;"  maxlength="3" class="rlinenumber" name="evalProgress"  id="evalProgress"  disabled="disabled"  value="<c:out value="${mapInfo.EVAL_PROGRESS}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="evalAttend"  id="evalAttend"  disabled="disabled"  value="<c:out value="${mapInfo.EVAL_ATTEND}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="evalReport" id="evalReport"   disabled="disabled"  value="<c:out value="${mapInfo.EVAL_REPORT}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber"  name="evalExamFinal" id="evalExamFinal"  disabled="disabled"  value="<c:out value="${mapInfo.EVAL_EXAM_FINAL}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="evalDiscuss" id="evalDiscuss"   disabled="disabled"  value="<c:out value="${mapInfo.EVAL_DISCUSS}"/>"/> 점</td>
            <td align="center">-</td>
            <td align="center">-</td>
            <td align="center">-</td>
        </tr>
    </table>

    <div class="space"></div><!-- 공백 default 5px -->
        <div class="tb_title"> 차수정보 설정</div>
     <table class="table-type1 search_form ">
        <colgroup>
            <col class=cellc  width="8%">
            <col class=celll  width="35%">
            <col class=cellc  width="8%">
            <col class=celll  width="35%">
        </colgroup>
        <tbody>
        <tr>
            <th>* 운영형태</th>
            <td colspan="3">
                <input type="radio" class="line" name="openType"  id="openType" value="D" <c:if test="${mapInfo.OPENTYPE == 'D' || mapInfo.OPENTYPE == ''}"> checked="checked"</c:if> checked/> 기간운영 &nbsp;&nbsp;
                <input type="radio" class="line" name="openType"  id="openType" value="A" <c:if test="${mapInfo.OPENTYPE == 'A'}"> checked="checked"</c:if>/> 상시운영 &nbsp;
            </td>
            <%-- <th>* 시험응시가능진도율</th>
            <td><input type="text"  class="rlinenumber" name="examProgPercent" id="examProgPercent" value="<c:out value="${mapInfo.EXAM_PROG_PERCENT}"/>" disabled="disabled"/> % </td> --%>

        </tr>
        <tr>
            <th>* 학습일수</th>
            <td><input type="text"  class="rlinenumber" name="eduDay" id="eduDay" value="<c:out value="${mapInfo.EDUDAY}"/>" disabled="disabled"/> 일 </td>
            <th>* 과정상태</th>
            <td>
                <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="과정상태">
                    <option  value="">과정상태 설정</option>
			        <c:forEach var="emap" items="${categoryData4}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${emap.MT_SUB_CODE == mapInfo.MT_CSEQ_STATUS_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>* 신청기간</th>
            <td>
                    <input type="text" class="line" name="applySdate" id="applySdate" value="<c:out value="${mapInfo.APPLY_SDATE}"/>" style="width: 70px" class="admin_datepicker"/>
                    <a href="#" onclick="calShow('applySdate'); return false;"><img src="/admin/images/btn_calendar.png" alt="신청기간 시작일"></a>
                    <select name="applySdateHour" id="applySdateHour">
                        <option value="00" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="01" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '01'}"> selected="selected"</c:if>>01</option>
                        <option value="02" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '02'}"> selected="selected"</c:if>>02</option>
                        <option value="03" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '03'}"> selected="selected"</c:if>>03</option>
                        <option value="04" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '04'}"> selected="selected"</c:if>>04</option>
                        <option value="05" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '05'}"> selected="selected"</c:if>>05</option>
                        <option value="06" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '06'}"> selected="selected"</c:if>>06</option>
                        <option value="07" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '07'}"> selected="selected"</c:if>>07</option>
                        <option value="08" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '08'}"> selected="selected"</c:if>>08</option>
                        <option value="09" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '09'}"> selected="selected"</c:if>>09</option>
                        <option value="10" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="11" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '11'}"> selected="selected"</c:if>>11</option>
                        <option value="12" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '12'}"> selected="selected"</c:if>>12</option>
                        <option value="13" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '13'}"> selected="selected"</c:if>>13</option>
                        <option value="14" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '14'}"> selected="selected"</c:if>>14</option>
                        <option value="15" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '15'}"> selected="selected"</c:if>>15</option>
                        <option value="16" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '16'}"> selected="selected"</c:if>>16</option>
                        <option value="17" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '17'}"> selected="selected"</c:if>>17</option>
                        <option value="18" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '18'}"> selected="selected"</c:if>>18</option>
                        <option value="19" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '19'}"> selected="selected"</c:if>>19</option>
                        <option value="20" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="21" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '21'}"> selected="selected"</c:if>>21</option>
                        <option value="22" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '22'}"> selected="selected"</c:if>>22</option>
                        <option value="23" <c:if test="${mapInfo.APPLY_SDATE_HOUR == '23'}"> selected="selected"</c:if>>23</option>
                    </select> 시
                    <select name="applySdateMin" id="applySdateMin">
                        <option value="00" <c:if test="${mapInfo.APPLY_SDATE_MIN == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="10" <c:if test="${mapInfo.APPLY_SDATE_MIN == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="20" <c:if test="${mapInfo.APPLY_SDATE_MIN == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="30" <c:if test="${mapInfo.APPLY_SDATE_MIN == '30'}"> selected="selected"</c:if>>30</option>
                        <option value="40" <c:if test="${mapInfo.APPLY_SDATE_MIN == '40'}"> selected="selected"</c:if>>40</option>
                        <option value="50" <c:if test="${mapInfo.APPLY_SDATE_MIN == '50'}"> selected="selected"</c:if>>50</option>
                    </select> 분

                ~
                     <input type="text" class="line" name="applyEdate" id="applyEdate" value="<c:out value="${mapInfo.APPLY_EDATE}"/>" style="width: 70px" class="admin_datepicker"/>
                    <a href="#" onclick="calShow('applyEdate'); return false;"><img src="/admin/images/btn_calendar.png" alt="신청기간 종료일"></a>
                    <select name="applyEdateHour" id="applyEdateHour">
                        <option value="00" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="01" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '01'}"> selected="selected"</c:if>>01</option>
                        <option value="02" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '02'}"> selected="selected"</c:if>>02</option>
                        <option value="03" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '03'}"> selected="selected"</c:if>>03</option>
                        <option value="04" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '04'}"> selected="selected"</c:if>>04</option>
                        <option value="05" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '05'}"> selected="selected"</c:if>>05</option>
                        <option value="06" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '06'}"> selected="selected"</c:if>>06</option>
                        <option value="07" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '07'}"> selected="selected"</c:if>>07</option>
                        <option value="08" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '08'}"> selected="selected"</c:if>>08</option>
                        <option value="09" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '09'}"> selected="selected"</c:if>>09</option>
                        <option value="10" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="11" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '11'}"> selected="selected"</c:if>>11</option>
                        <option value="12" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '12'}"> selected="selected"</c:if>>12</option>
                        <option value="13" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '13'}"> selected="selected"</c:if>>13</option>
                        <option value="14" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '14'}"> selected="selected"</c:if>>14</option>
                        <option value="15" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '15'}"> selected="selected"</c:if>>15</option>
                        <option value="16" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '16'}"> selected="selected"</c:if>>16</option>
                        <option value="17" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '17'}"> selected="selected"</c:if>>17</option>
                        <option value="18" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '18'}"> selected="selected"</c:if>>18</option>
                        <option value="19" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '19'}"> selected="selected"</c:if>>19</option>
                        <option value="20" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="21" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '21'}"> selected="selected"</c:if>>21</option>
                        <option value="22" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '22'}"> selected="selected"</c:if>>22</option>
                        <option value="23" <c:if test="${mapInfo.APPLY_EDATE_HOUR == '23'}"> selected="selected"</c:if>>23</option>
                    </select> 시

                    <select name="applyEdateMin" id="applyEdateMin">
                        <option value="00" <c:if test="${mapInfo.APPLY_EDATE_MIN == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="10" <c:if test="${mapInfo.APPLY_EDATE_MIN == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="20" <c:if test="${mapInfo.APPLY_EDATE_MIN == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="30" <c:if test="${mapInfo.APPLY_EDATE_MIN == '30'}"> selected="selected"</c:if>>30</option>
                        <option value="40" <c:if test="${mapInfo.APPLY_EDATE_MIN == '40'}"> selected="selected"</c:if>>40</option>
                        <option value="50" <c:if test="${mapInfo.APPLY_EDATE_MIN == '50'}"> selected="selected"</c:if>>50</option>
                    </select> 분
            </td>
            <th>* 학습기간</th>
            <td>
                <input type="text" class="line" name="studySdate" id="studySdate" value="<c:out value="${mapInfo.STUDY_SDATE}"/>" style="width: 100px" class="admin_datepicker"/>
                <a href="#" onclick="calShow('studySdate'); return false;"><img src="/admin/images/btn_calendar.png" alt="학습기간 시작일"></a>
              ~
                <input type="text" class="line" name="studyEdate" id="studyEdate" value="<c:out value="${mapInfo.STUDY_EDATE}"/>" style="width: 100px" class="admin_datepicker"/>
                <a href="#" onclick="calShow('studyEdate'); return false;"><img src="/admin/images/btn_calendar.png" alt="학습기간 종료일"></a>
            </td>
        </tr>
        <tr>
            <th>* 출석부출력</th>
            <td colspan="3">
            	<c:set var="defaultToday" value="<%=today%>"/>
            	<c:set var="attendDesDay" value="${mapInfo.ATTEND_DES_DAY}"/>
            	<c:if test="${attendDesDay == '' || attendDesDay eq null}"><c:set var="attendDesDay" value="${defaultToday}"/></c:if>
                <input type ="radio" class="line" name="attendDesYn"  id="attendDesYn" value="N" <c:if test="${mapInfo.ATTEND_DES_YN == 'N' || mapInfo.ATTEND_DES_YN == ''}"> checked="checked"</c:if> checked onclick="javascript:attendShow('N');"/> 학습기간 전체<font class="extext"> (※ 토요일, 일요일 제외)</font> <br/>
                <input type ="radio" class="line" name="attendDesYn"  id="attendDesYn" value="Y" <c:if test="${mapInfo.ATTEND_DES_YN == 'Y'}"> checked="checked"</c:if> onclick="javascript:attendShow('Y');"/> 일자 지정 &nbsp;
				<c:set var="attendShow" value="none"/>
				<c:if test="${mapInfo.ATTEND_DES_YN == 'Y'}"><c:set var="attendShow" value="inline-block"/></c:if>
                <div id="attendShow" style="display:${attendShow}">
                     <input type="text" name="attendDesDay" id="attendDesDay" class="line" style="width:100px" value="${attendDesDay}"/>
                     <a href="#" onclick="calShowMulti('attendDesDay'); return false;"><img src="/admin/images/btn_calendar.png" alt=""></a>
                     <p id="calendarArea"></p>
                </div>
            	<script type="text/javascript">
		            function attendShow(v){
		                var attendYn=v;
		                if(attendYn=='Y'){
		                    document.getElementById('attendShow').style.display="inline-block";
		                }else{
		                    document.getElementById('attendShow').style.display="none";
		                }
		
		            }
            	</script>
            </td>
        </tr>
        <tr>
            <th>* 1일학습시간</th>
            <td><input type="text"  class="rlinenumber" name="studytime" id="studytime" value="<c:out value="${mapInfo.STUDYTIME}"/> "  style="width: 140px"/> 시간</td>
            <th>* 총학습시간</th>
            <td><input type="text"  class="rlinenumber" name="studytime" id="studytime" value="<c:out value="${mapInfo.STUDYTIME}"/>" style="width: 140px"/> 시간</td>
        </tr>
        <tr>
            <th>수강정원</th>
            <td><input type="text"  class="rlinenumber" name="fixCnt"  id="fixCnt"   value="<c:out value="${mapInfo.FIX_CNT}"/>" style="width: 140px"/> 명</td>
            <th>신청최대인원</th>
            <td><input type="text"  class="rlinenumber" name="maxCnt"  id="maxCnt"   value="<c:out value="${mapInfo.MAX_CNT}"/>" style="width: 140px"/> 명</td>
        </tr>
        <tr>
            <th>순차학습여부</th>
            <td colspan="3">
                <input type ="radio" class="line" name="eduseqYn"  id="eduseqYn" value="N" <c:if test="${mapInfo.EDUSEQ_YN == 'N' || mapInfo.EDUSEQ_YN == ''}"> checked="checked"</c:if> checked/> 자유학습 &nbsp;&nbsp;
                <input type ="radio" class="line" name="eduseqYn"  id="eduseqYn" value="Y" <c:if test="${mapInfo.EDUSEQ_YN == 'Y'}"> checked="checked"</c:if>/> 순차학습 &nbsp;
            </td>
        </tr>
        </tbody>
    </table>

	    <div class="button">
	    	<c:choose>
	    	<c:when test="${mapInfo.CSEQNO ne null}">
	            <a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
	        </c:when>
	        <c:otherwise>
	            <a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
	        </c:otherwise>
	        </c:choose>
	        <a href="#" onclick="history.back();return false;" class="btn big gray">취소</a>
	    </div>
</form>

<script type="text/javascript">

$(document).ready(function(){
	eduPlace('${mapInfo.MT_CTYPE_CODE}');
	
    openTypeCheck('${mapInfo.OPENTYPE}');

    var cseqno =  $("#cseqno").val();
    $('input[name=openType]').click(function(e){
        openTypeCheck($(this).val());
    });

});
 
function eduPlace(obj){
    if(obj == 'DAAA00') {
    	 $('#eduPlace').hide();
    } else if(obj == 'DAAA01') {
    	$('#eduPlace').show();
    }
} 

//클래스 데스크 설정
var f1 = document.pform;
var ls_tmp = $("#insClassDesk").val();
var desk01 = ls_tmp.substring(0, 1);			//	온라인교재 선택 여부
var desk01Value = f1.evalProgress ;	//	온라인교재 점수

var desk02 = ls_tmp.substring(1, 2);			//	과제 선택 여부
var desk02Value = f1.evalReport ;	//	과제 점수


var desk03 = ls_tmp.substring(2, 3);			//	시험 선택 여부
var desk03Value = f1.evalExamFinal ;	//	최종시험 점수
var desk08Value = f1.evalExamMt ;	//	중간시험 점수


var desk04 = ls_tmp.substring(3, 4);			//	출석 선택 여부
var desk04Value = f1.evalAttend ;	//	출석 점수

var desk05 = ls_tmp.substring(4, 5);			//	설문 선택 여부
var desk06 = ls_tmp.substring(5, 6);			//	공지 선택 여부
var desk07 = ls_tmp.substring(6, 7);			//	자료실 선택 여부

var desk09 = ls_tmp.substring(7, 8);//	토론 선택 여부
var desk09Value = f1.evalDiscuss ;	//	토론 점수

if(desk01 == 1){				// 온라인교재 선택시 체크박스 checked 출력 및 점수 활성화
    f1.desk01.checked = true;
    desk01Value.disabled=false;
}

if(desk02 == 1){				//출석 선택시 체크박스 checked 출력 및 점수 활성화
    f1.desk02.checked = true;
    desk02Value.disabled=false;
}

if(desk03 == 1){				//시험 선택시 체크박스 checked 출력 및 점수 활성화
    f1.desk03.checked = true;
    desk03Value.disabled=false;
    desk08Value.disabled=false;
}

if(desk04 == 1){				//과제 선택시 체크박스 checked 출력
    f1.desk04.checked = true;
    desk04Value.disabled=false;
}

if(desk05 == 1){				//설문 선택시 체크박스 checked
    f1.desk05.checked = true;
}

if(desk06 == 1){				//공지사항 선택시 체크박스 checked
    f1.desk06.checked = true;
}

if(desk07 == 1){				//자료실 선택시 체크박스 checked
    f1.desk07.checked = true;
}

if(desk09 == 1){					//토론 선택시 체크박스 checked
    f1.desk09.checked = true;
    desk09Value.disabled=false;
}


//클래스데스크 체크박스 제어
function openText(v, c){
    var checkId=v;
    var ckChecked=c;
    if(ckChecked==false){
        document.getElementById(checkId).disabled=true;
    }else if(ckChecked==true){
        document.getElementById(checkId).disabled=false;
    }
}


//등록
function writeFormCheck(){
	var f1 = document.pform;
    var calssTotal = 0;			// 교재, 출석, 시험, 과제 중 체크한 점수의 합이 100 이어야함.
    var classDeskIn="";			// 최종 classDask 값 지정을 위한 변수 선언

    if(f1.title.value==''){
        alert('차수명을 입력해주세요');
        f1.title.focus();
        return;
    }

     if(f1.price.value == ''){
        alert('수강료를 0원 이상으로 입력해주세요.');
        f1.title.focus();
        return;
    }

    if(f1.compVal.value <= 0){
        alert('수료점수를 1점 이상으로 입력해주세요.');
        f1.compVal.focus();
        return;
    }

    // 클래스 데스크 > 온라인교재 체크
    if (f1.desk01.checked == true) {
        desk01 = "1";
        if(desk01Value.value<=0){
            alert('온라인교재 점수를 1점 이상으로 입력해주세요.');
            return;
        }else{
            calssTotal = calssTotal + parseInt(desk01Value.value) ;
        }
    } else {
        desk01 = "0";
        desk01Value.value=0;				// 미 체크시 점수 초기화
    }

    // 클래스 데스크 > 출석 체크
    if (f1.desk02.checked == true) {
        desk02 = "1";
        if(desk02Value.value<=0){
            alert('과제 점수를 1점 이상으로 입력해주세요.');
            return;
        }else{
            calssTotal = calssTotal + parseInt(desk02Value.value) ;
        }
    } else {
        desk02 = "0";
        desk02Value.value=0;				// 미 체크시 점수 초기화
    }
    var examVal = parseInt(desk03Value.value) + parseInt(desk08Value.value);
     // 클래스 데스크 > 시험 체크
    if (f1.desk03.checked == true) {
        desk03 = "1";

        if(examVal <= 0){
            alert('시험 점수를 1점 이상으로 입력해주세요.');
            return;
        }else{
            calssTotal = calssTotal + examVal ;
        }
    } else {
        desk03 = "0";
        desk03Value.value=0;				// 미 체크시 점수 초기화
        desk08Value.value=0;				// 미 체크시 점수 초기화

    }

 // 클래스 데스크 > 토론 체크
    if (f1.desk09.checked == true) {
    	desk09 = "1";
        if(desk09Value.value==0){
            alert('토론 점수를 1점 이상으로 입력해주세요.');
            return;
        }else{
            calssTotal = calssTotal + parseInt(desk09Value.value) ;
        }
    } else {
        desk09 = "0";
        desk09Value.value=0;				// 미 체크시 점수 초기화
    }
     
    // 클래스 데스크 > 과제 체크
    if (f1.desk04.checked == true) {
        desk04 = "1";
        if(desk04Value.value==0){
            alert('출석 점수를 1점 이상으로 입력해주세요.');
            return;
        }else{
            calssTotal = calssTotal + parseInt(desk04Value.value) ;
        }
    } else {
        desk04 = "0";
        desk04Value.value=0;				// 미 체크시 점수 초기화
    }

    // 클래스 데스크 > 설문 체크
    if (f1.desk05.checked == true) {
        desk05 = "1";
    } else {
        desk05 = "0";
    }

    // 클래스 데스크 > 공지사항 체크
    if (f1.desk06.checked == true) {
        desk06 = "1";
    } else {
        desk06 = "0";
    }

    // 클래스 데스크 > 자료실 체크
    if (f1.desk07.checked == true) {
        desk07 = "1";
    } else {
        desk07 = "0";
    }

    classDeskIn = desk01 + desk02 + desk03 + desk04 + desk05 + desk06 + desk07 + desk09;
     f1.classDesk.value = classDeskIn;
     document.getElementById('classDesk').value = classDeskIn;

     if(calssTotal != 100){
        alert('클래스 데스크의 총점이 100점이어야 합니다.');
         return;
    }

    if (f1.openType.value == 'A'){
         if(f1.eduDay.value == 0 || f1.eduDay.value == ''){
            alert("학습일수를 등록해주세요.");
            f1.eduDay.focus();
            return;
        }
    }
     if(f1.mtCseqStatusCode.value == 0){
        alert('과정상태를 선택해주세요.');
        f1.mtCseqStatusCode.focus();
        return;
    }

     if(f1.applySdate.value == 0){
        alert('신청 시작일을 선택해주세요.');
        f1.applySdate.focus();
        return;
    }


     if(f1.applyEdate.value == 0){
        alert('신청 종료일을 선택해주세요.');
        f1.applyEdate.focus();
        return;
    }

      if(f1.studySdate.value == 0){
        alert('학습 시작일을 선택해주세요.');
        f1.studySdate.focus();
        return;
    }

      if(f1.studyEdate.value == 0){
        alert('학습 종료일을 선택해주세요.');
        f1.studyEdate.focus();
        return;
    }

       if(f1.studytime.value <= 0){
        alert('1일학습시간을 1시간 이상으로 입력해주세요.');
        f1.studytime.focus();
        return;
    }

     if(f1.studytime.value <= 0){
        alert('총학습시간을 1시간 이상으로 입력해주세요.');
        f1.studytime.focus();
        return;
    }
    /* if (f1.openType.value == 'A'){
         if(f1.examProgPercent.value <= 0){
            alert('시험응시가능진도율을 1% 이상으로 입력해주세요.');
            f1.examProgPercent.focus();
            return;
        }
    } */
    var submitWin = window.confirm('${titleMode}하시겠습니까?');
    if (submitWin){
        f1.submit();
    }

}
</script>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	