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
		$("#applySdate").datepicker(dateFormat);
		$("#applyEdate").datepicker(dateFormat);
		$("#studySdate").datepicker(dateFormat);
		$("#studyEdate").datepicker(dateFormat);
		
		
		
	});

	// 교과목관리 추가
	function addLibRow(tobj, period) {
    	var parentsTr = $(tobj).parent().parent();
		$('#libTbl').find('.nonedata').remove();
		var cnt = 1;
		$('.period').each(function() {
			cnt = Number(cnt)+1;
		});
	
		if(cnt > 15) {
			alert('교과목은 15개까지 등록 가능합니다.');
			return;
		}
		
		var index = Number(period)+1;
		var xhtml = '';
		xhtml += '<tr align="center">';
	    xhtml += '    <td><span id="period" class="period">'+index+'</span>교시';
	    xhtml += '    <input type="hidden" name="period" value="'+index+'"/></td>';
	    xhtml += '    <td>';
	    xhtml += '    	<select name="libno" id="libno" title="교과목선택" style="width: 180px">';
	    xhtml += '            <option value="">선택</option>';
	    xhtml += '            <c:forEach var="emap" items="${courseLibList}" varStatus="status1">';
		xhtml += '				<option value="<c:out value="${emap.LIBNO}"/>"><c:out value="${emap.SUBJECT}"/></option>';
		xhtml += '			</c:forEach>';
	    xhtml += '        </select>';
	    xhtml += '    </td>';
	    xhtml += '    <td>';
	    xhtml += '    	<div class="tutorUserNmDiv" style="padding-bottom: 3px;">';
	    xhtml += '          <input type="text" name="tutorUserNm" id="tutorUserNm" class="line" value="" />'; 
	    xhtml += '			<input type="hidden" name="tutorUserno" id="tutorUserno" value="">';
	    xhtml += '          <a href="#" onclick="fnLecTutorSearch(this,'+index+');  return false;" class="btn search brown">검색</a>';
	    xhtml += '        </div>';
	    xhtml += '    </td>';
	    xhtml += '    <td>';
	    xhtml += '      <a href="#" onclick="addLibRow(this,'+index+'); return false;" class="btn small blue">추가</a>';
	    xhtml += '    	<a href="#" onclick="fnLecTutorDel(this,'+index+'); return false;" val="" class="btn small red">삭제</a>';
	    xhtml += '    </td>';
	    xhtml += '</tr>';
	 		
	    parentsTr.after(xhtml); 
	    
	    $('.period').each(function(idx) {
	    	$(this).text(Number(idx)+1);
			$('input[name=period]').eq(idx).val(Number(idx)+1);
		});
	}
    
    // 교과목 - 강사 삭제
    function fnLecTutorDel(tobj, period) {
    	var parentsTr = $(tobj).parent().parent();
		
		var pval = $.trim($(tobj).attr('val'));
		if(confirm("삭제 하시겠습니까?")){
			if( pval != '' ){					 
		        $.ajax({
		            url : "/admin/course/saveCourseLibAjax.do",
		            data : {cseqno : $('#cseqno').val(), period:period, type : 'D'},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == "SUCCESS"){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	
		            	parentsTr.remove();
		            	$('.period').each(function(idx) {
		        			$(this).text(Number(idx)+1);
		        			$('input[name=period]').eq(idx).val(Number(idx)+1);
		        		});
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			
			}else{
				parentsTr.remove();
				alert("삭제되었습니다.");	
			}
		}
		

    	var pcnt = 0;
		$('.period').each(function() {
			pcnt = Number(pcnt)+1;
		});
		
		if(pcnt <= 1) {
			$('#libBody').children().remove();
			var index = 1;
			var xhtml = '';
			xhtml += '<tr align="center">';
		    xhtml += '    <td><span id="period" class="period">'+index+'</span>교시';
		    xhtml += '    <input type="hidden" name="period" value="'+index+'"/></td>';
		    xhtml += '    <td>';
		    xhtml += '    	<select name="libno" id="libno" title="교과목선택" style="width: 180px">';
		    xhtml += '            <option value="">선택</option>';
		    xhtml += '            <c:forEach var="emap" items="${courseLibList}" varStatus="status1">';
			xhtml += '				<option value="<c:out value="${emap.LIBNO}"/>"><c:out value="${emap.SUBJECT}"/></option>';
			xhtml += '			</c:forEach>';
		    xhtml += '        </select>';
		    xhtml += '    </td>';
		    xhtml += '    <td>';
		    xhtml += '    	<div class="tutorUserNmDiv" style="padding-bottom: 3px;">';
		    xhtml += '          <input type="text" name="tutorUserNm" id="tutorUserNm" class="line" value="" />'; 
		    xhtml += '			<input type="hidden" name="tutorUserno" id="tutorUserno" value="">';
		    xhtml += '          <a href="#" onclick="fnLecTutorSearch(this,'+index+');  return false;" class="btn search brown">검색</a>';
		    xhtml += '        </div>';
		    xhtml += '    </td>';
		    xhtml += '    <td>';
		    xhtml += '      <a href="#" onclick="addLibRow(this,'+index+'); return false;" class="btn small blue">추가</a>';
		    xhtml += '    	<a href="#" onclick="fnLecTutorDel(this,'+index+'); return false;" val="" class="btn small red">삭제</a>';
		    xhtml += '    </td>';
		    xhtml += '</tr>';
			$('#libBody').append(xhtml);
		}
		$('.period').each(function(idx) {
			$(this).text(Number(idx)+1);
			$('input[name=period]').eq(idx).val(Number(idx)+1);
		});
    }
	
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

 	// 강사검색
    function fnLecTutorSearch(tobj, index) {
        var myForm = document.pform;
        var tutorUserNm =  $(tobj).parent().find('#tutorUserNm').val();
        if(tutorUserNm.length > 0){
    		myForm.searchType.value = 'NAME';
            myForm.searchWord.value = tutorUserNm; 
        }
        
        $('#index').val(Number(index)-1);
       // var index = $('#libBody tr').index();
        window.open("" ,"pform", "toolbar=no, width=1020,height=850, directories=no, status=no, scrollbars=yes, resizable=no"); 
		//$("#searchWord").val($("#tutorUserNm").val());
        myForm.action = '/admin/lecture/lectureTutorSearch.do'; 
        myForm.method = "post";
        myForm.target = "pform";
        myForm.submit();
    }
 	
 	// 강사선택 POPUP CALLBACK
    function PopupCallBack(data){
        var userNo = data.lecUserno;
        var tutorUserNm = data.lecUsernm;
        var index = data.index;
        var xhtml = '';
        
        if('<c:out value='${mapInfo.CSEQNO }'/>' == ''){
        	cseqno = undefined;
        }else{
        	cseqno = '<c:out value='${mapInfo.CSEQNO }'/>';
        }

        //$('.tutorUserNmDiv').eq(index).children().remove();
        $('.tutorUserNmDiv').eq(index).find('#tutorUserNm').val(tutorUserNm);
        $('.tutorUserNmDiv').eq(index).find('#tutorUserno').val(userNo);
        //xhtml = "<span userno='"+userNo+"'>"+tutorUserNm+"</span>";
        //xhtml+= "<input type='hidden' name='tutorUserno' value='"+userNo+"'/>";
        
//        $('.tutorUserNmDiv').eq(index).append(xhtml);
    }
</script>

<!-- 본문 > 상단 > 타이틀 -->
<%-- <c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set> --%>
<c:set var="reg"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="pageMode">${REQUEST_DATA.pageMode}</c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == reg}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">교육과정개설 - 집합교육 - 기수${titleMode}</span></div>

${REQUEST_DATA }
	<!-- 본문  시작  -->
	<form name="pform" id="pform" action="/admin/course/seqExec.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
        <input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
        <input type="hidden" name="seq" value="<c:out value="${REQUEST_DATA.seq}"/>"/>
        <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
        <input type="hidden" name="classDesk" id="classDesk" value=""/>
        <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${mapInfo.MT_CTYPE_CODE}"/>"/>
		<input type="hidden" id="insClassDesk" value="<c:out value="${mapInfo.CLASS_DESK}"/>"/>
        <input type="hidden" name="openType" id="openType" value="D"/>
        <input type="hidden" name="openAt" id="openAt" value="Y"/>
        <input type="hidden" name="useyn" id="useyn" value="Y"/>
        <input type="hidden" name="fileId" id="fileId" value="">
		<input type="hidden" name="searchType" id="searchType" value="<c:out value="${REQUEST_DATA.searchType }"/>"/>
		<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord }"/>"/>
        <input type="hidden" name="libTutorCnt" id="libTutorCnt" value="">
		<input type="hidden" name="index" id="index" value=""/><!-- 강사선택팝업 -->
        
        <div class="tb_title">과정메타정보</div>
        
        <table class="table-type1 search_form ">
            <colgroup>
                <col class=cellc  width="8%">
	            <col class=celll  width="92%">
            </colgroup>
            <tbody>
            <tr>
	            <th>* 과정구분</th>
                <td class="line">${mapInfo.MT_SC_NAME}</td>
            </tr>
            <tr>
                 <th>* 과정명</th>
                 <td class="line">${mapInfo.COURSETITLE}</td>
            </tr>
            <tr>
            	<th>* 기수명</th>
            	<td><input type="text" class="line" name="seq_title" id="seq_title" value="<c:out value="${pageMode == 'mod' ? mapInfo.SEQ_TITLE : mapInfo.COURSETITLE}"></c:out>" style="width: 285px"/></td>
            </tr>
            <tr>
                <th>* 수료기준점수</th>
                <td>
                    <input type="text"  class="rlinenumber" name="compVal" id="compVal" value="<c:out value="${mapInfo.COMP_VAL}"/>" style="width: 160px"> 점
                </td>
            </tr>
           <tr>
	           <th>교육대상</th>
	           <td>
	           	<input type="text"  class="line" name="target" id="target" value="${map.TARGET }" style="width: 100%"/>
	           </td>
	       </tr>
	       <tr>
	           <th>* 과정설명</th>
	           <td>
	               <textarea rows="4" name="description"  id="description"  style="width:100%;">${map.DESCRIPTION }</textarea>
	           </td>
	       </tr>
	       <tr>
	           <th>문의</th>
	           <td>
	               <textarea rows="4" name="exDescription"  id="exDescription"  style="width:100%;" maxlength="80">${map.EX_DESCRIPTION}</textarea>
	               <br/><font class=extext>※ 1600 bytes(한글 80자 제한)</font>
	           </td>
	       </tr>
            <tr>
                <th>파일첨부 여부</th>
                <td>
					<input type="radio" name="fileSubmitYn" id="fileSubmitYn"  <c:if test="${mapInfo.FILE_SUBMIT_YN eq 'Y'}"> checked="checked"</c:if> value="Y"/>사용 &nbsp;
					<input type="radio" name="fileSubmitYn" id="fileSubmitYn"  <c:if test="${mapInfo.FILE_SUBMIT_YN eq 'N'}"> checked="checked"</c:if> <c:if test="${REQUEST_DATA.qu == 'insert'||mapInfo.FILE_SUBMIT_YN eq null||mapInfo.FILE_SUBMIT_YN eq ''}"> checked="checked"</c:if> value="N"/>미사용
	 			</td>
            </tr>
            <tr>
	            <th>파일업로드</th>
	            <td style="padding-top: 10px;padding-bottom: 10px;">
	            	<input type="file" name="uploadFile1" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/><br/>
	                <input type="file" name="uploadFile2" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7; margin-top:10px;"/><br/>
				
	                <c:if test="${!empty fileMap}">
	                <br/>
	                <table style="border:0 none;">
		                <c:forEach var="file" items="${fileMap}" varStatus="status">
							<tr>
								<td style="border:0 none;">
									<a style="cursor:pointer;" onclick="filedown('<c:out value="${file.FILE_ID}"/>')">
										<span><c:out value="${file.FILE_NAME}"/>(<c:out value="${file.FILE_SIZE}"/>KB)</span>
									</a>
								</td>
								<td style="cursor:pointer;border:0 none;">
									<a style="margin-left:10px;" class="btn-small-orange" onclick="deleteFile('<c:out value="${file.FILE_ID}"/>');return false;">
										<span>삭제</span>
									</a>
								</td>
							</tr>	
						</c:forEach>
	                </table>
	                </c:if>
	                
	            </td>
	        </tr>
	        <%-- <tr>
        	<th>사용여부</th>
	            <td colspan="3">
	            	<input type="radio" name="useyn" value="Y" <c:if test="${pageMode eq reg}">checked="checked"</c:if><c:if test="${mapInfo.USEYN == 'Y'}">checked="checked"</c:if>>사용&nbsp;&nbsp;&nbsp;
	            	<input type="radio" name="useyn" value="N" <c:if test="${mapInfo.USEYN == 'N'}">checked="checked"</c:if>>사용안함
	            </td>
	        </tr> --%>
         </tbody>
    </table>
    
    <div class="space"></div><!-- 공백 default 5px -->
    <div class="tb_title"> 기수정보 설정</div>
     <table class="table-type1 search_form ">
        <colgroup>
            <col class=cellc  width="7%">
            <col class=celll  width="38%">
            <col class=cellc  width="7%">
            <col class=celll  width="35%">
        </colgroup>
        <tbody>
        <tr>
            <th>* 신청기간</th>
            <td colspan="3">
                    <input type="text" class="line" name="applySdate" id="applySdate" value="<c:out value="${mapInfo.APPLY_SDATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#applySdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="신청기간 시작일">
				 	</a>
                ~
                    <input type="text" class="line" name="applyEdate" id="applyEdate" value="<c:out value="${mapInfo.APPLY_EDATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#applyEdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="신청기간 종료일">
				 	</a>
            </td>
        </tr>
        <tr>
			<th>* 교육기간</th>
            <td colspan="3">
	                <input type="text" class="line" name="studySdate" id="studySdate" value="<c:out value="${mapInfo.STUDY_SDATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#studySdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="학습기간 시작일">
				 	</a>
                    <select name="studySdateHour" id="studySdateHour">
                        <option value="00" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="01" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '01'}"> selected="selected"</c:if>>01</option>
                        <option value="02" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '02'}"> selected="selected"</c:if>>02</option>
                        <option value="03" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '03'}"> selected="selected"</c:if>>03</option>
                        <option value="04" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '04'}"> selected="selected"</c:if>>04</option>
                        <option value="05" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '05'}"> selected="selected"</c:if>>05</option>
                        <option value="06" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '06'}"> selected="selected"</c:if>>06</option>
                        <option value="07" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '07'}"> selected="selected"</c:if>>07</option>
                        <option value="08" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '08'}"> selected="selected"</c:if>>08</option>
                        <option value="09" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '09'}"> selected="selected"</c:if>>09</option>
                        <option value="10" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="11" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '11'}"> selected="selected"</c:if>>11</option>
                        <option value="12" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '12'}"> selected="selected"</c:if>>12</option>
                        <option value="13" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '13'}"> selected="selected"</c:if>>13</option>
                        <option value="14" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '14'}"> selected="selected"</c:if>>14</option>
                        <option value="15" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '15'}"> selected="selected"</c:if>>15</option>
                        <option value="16" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '16'}"> selected="selected"</c:if>>16</option>
                        <option value="17" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '17'}"> selected="selected"</c:if>>17</option>
                        <option value="18" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '18'}"> selected="selected"</c:if>>18</option>
                        <option value="19" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '19'}"> selected="selected"</c:if>>19</option>
                        <option value="20" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="21" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '21'}"> selected="selected"</c:if>>21</option>
                        <option value="22" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '22'}"> selected="selected"</c:if>>22</option>
                        <option value="23" <c:if test="${mapInfo.STUDY_SDATE_HOUR == '23'}"> selected="selected"</c:if>>23</option>
                    </select> 시
                    <select name="studySdateMin" id="studySdateMin">
                        <option value="00" <c:if test="${mapInfo.STUDY_SDATE_MIN == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="10" <c:if test="${mapInfo.STUDY_SDATE_MIN == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="20" <c:if test="${mapInfo.STUDY_SDATE_MIN == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="30" <c:if test="${mapInfo.STUDY_SDATE_MIN == '30'}"> selected="selected"</c:if>>30</option>
                        <option value="40" <c:if test="${mapInfo.STUDY_SDATE_MIN == '40'}"> selected="selected"</c:if>>40</option>
                        <option value="50" <c:if test="${mapInfo.STUDY_SDATE_MIN == '50'}"> selected="selected"</c:if>>50</option>
                    </select> 분

                ~
                
	                <input type="text" class="line" name="studyEdate" id="studyEdate" value="<c:out value="${mapInfo.STUDY_EDATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#studyEdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="학습기간 종료일">
				 	</a>
                    <select name="studyEdateHour" id="studyEdateHour">
                        <option value="00" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="01" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '01'}"> selected="selected"</c:if>>01</option>
                        <option value="02" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '02'}"> selected="selected"</c:if>>02</option>
                        <option value="03" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '03'}"> selected="selected"</c:if>>03</option>
                        <option value="04" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '04'}"> selected="selected"</c:if>>04</option>
                        <option value="05" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '05'}"> selected="selected"</c:if>>05</option>
                        <option value="06" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '06'}"> selected="selected"</c:if>>06</option>
                        <option value="07" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '07'}"> selected="selected"</c:if>>07</option>
                        <option value="08" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '08'}"> selected="selected"</c:if>>08</option>
                        <option value="09" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '09'}"> selected="selected"</c:if>>09</option>
                        <option value="10" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="11" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '11'}"> selected="selected"</c:if>>11</option>
                        <option value="12" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '12'}"> selected="selected"</c:if>>12</option>
                        <option value="13" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '13'}"> selected="selected"</c:if>>13</option>
                        <option value="14" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '14'}"> selected="selected"</c:if>>14</option>
                        <option value="15" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '15'}"> selected="selected"</c:if>>15</option>
                        <option value="16" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '16'}"> selected="selected"</c:if>>16</option>
                        <option value="17" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '17'}"> selected="selected"</c:if>>17</option>
                        <option value="18" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '18'}"> selected="selected"</c:if>>18</option>
                        <option value="19" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '19'}"> selected="selected"</c:if>>19</option>
                        <option value="20" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="21" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '21'}"> selected="selected"</c:if>>21</option>
                        <option value="22" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '22'}"> selected="selected"</c:if>>22</option>
                        <option value="23" <c:if test="${mapInfo.STUDY_EDATE_HOUR == '23'}"> selected="selected"</c:if>>23</option>
                    </select> 시

                    <select name="studyEdateMin" id="studyEdateMin">
                        <option value="00" <c:if test="${mapInfo.STUDY_EDATE_MIN == '00'}"> selected="selected"</c:if>>00</option>
                        <option value="10" <c:if test="${mapInfo.STUDY_EDATE_MIN == '10'}"> selected="selected"</c:if>>10</option>
                        <option value="20" <c:if test="${mapInfo.STUDY_EDATE_MIN == '20'}"> selected="selected"</c:if>>20</option>
                        <option value="30" <c:if test="${mapInfo.STUDY_EDATE_MIN == '30'}"> selected="selected"</c:if>>30</option>
                        <option value="40" <c:if test="${mapInfo.STUDY_EDATE_MIN == '40'}"> selected="selected"</c:if>>40</option>
                        <option value="50" <c:if test="${mapInfo.STUDY_EDATE_MIN == '50'}"> selected="selected"</c:if>>50</option>
                    </select> 분
            </td>
        </tr>
        <tr>
            <th>* 교육장소</th>
            <td><input type="text"  class="line" name="edu_place" id="edu_place" value="<c:out value="${mapInfo.EDU_PLACE}"/> "  style="width: 285px"/></td>
            <th>* 합숙여부</th>
            <td>
                <input type="radio" class="line" name="ldgtgt_at"  id="ldgtgt_at" value="Y" <c:if test="${mapInfo.LDGTGT_AT == 'Y'}"> checked="checked"</c:if>/> 합숙 &nbsp;&nbsp;
                <input type="radio" class="line" name="ldgtgt_at"  id="ldgtgt_at" value="N" <c:if test="${mapInfo.LDGTGT_AT == 'N'}"> checked="checked"</c:if> <c:if test="${pageMode == 'reg'}">checked="checked"</c:if>/> 비합숙 &nbsp;
                
            </td>
        </tr>
        <tr>
        	<th>* 교육시간</th>
            <td colspan="3"><input type="text"  class="rlinenumber" name="studytimeTot" id="studytimeTot" value="<c:out value="${empty mapInfo.STUDYTIME_TOT ? '0' : mapInfo.STUDYTIME_TOT}"/>" style="width: 140px"/> 분</td>
        </tr>
        <tr>
            <th>수강정원</th>
            <td><input type="text"  class="rlinenumber" name="fixCnt"  id="fixCnt"   value="<c:out value="${mapInfo.FIX_CNT}"/>" style="width: 140px"/> 명</td>
            <th>* 신청최대인원</th>
            <td><input type="text"  class="rlinenumber" name="maxCnt"  id="maxCnt"   value="<c:out value="${mapInfo.MAX_CNT}"/>" style="width: 140px"/> 명</td>
        </tr>
        <tr>
            <th>* 과정상태</th>
            <td colspan="3">
                <select name="mtCseqStatusCode" id="mtCseqStatusCode" title="과정상태">
                    <option  value="">과정상태 설정</option>
			        <c:forEach var="emap" items="${categoryData4}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${emap.MT_SUB_CODE == mapInfo.MT_CSEQ_STATUS_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
                </select>
            </td>
        </tr>
        
        </tbody>
    </table>    
    <c:if test="${pageMode != reg}">
    <div class="space"></div><!-- 공백 default 5px -->
    <div class="tb_title">교과목관리<span><font class="extext"> (과목별 담당 강사를 선택해 주세요.)</font></span>
		<!-- <span style="float:right;padding-bottom:5px;"><a href="#" onclick="addLibRow(); return false;" class="btn small blue">추가</a></span> -->
	</div>
    <table class="tb table-type1" id="libTbl">
	    <tr class="rndbg">
	        <th>NO</th>
	        <th>교과목명</th>
	        <th>강사명</th>
	        <th></th>
	    </tr>
	    <colgroup>
	        <col width="8%">
	        <col width="25%">
	        <col width="20%">
	        <col width="5%">
	    </colgroup>
		<tbody id="libBody">
	    <c:if test="${fn:length(tutorList) > 0}">
	    <c:forEach var="result" items="${tutorList}" varStatus="status">
		    <tr align="center">
		      <td>
		        <span id="period" class="period"><c:out value="${result.PERIOD}"/></span>교시
		        <input type="hidden" name="period" value="<c:out value="${result.PERIOD}"/>"/>
		      </td>
		      <td>
		        	<select name="libno" id="libno" title="교과목선택" style="width: 180px">
	                    <option value="">선택</option>
	                    <c:forEach var="emap" items="${courseLibList}" varStatus="status1">
							<option value="<c:out value="${emap.LIBNO}"/>" <c:if test="${result.LIBNO == emap.LIBNO}"> selected="selected"</c:if>><c:out value="${emap.SUBJECT}"/></option>
						</c:forEach>
	                </select>
		        </td>
		        <td>
		        	<div class="tutorUserNmDiv" style="padding-bottom: 3px;">
	                    <input type="text" name="tutorUserNm" id="tutorUserNm" class="line" value="<c:out value="${result.TUTOR_USERNM}"/>" /> 
	        			<input type="hidden" name="tutorUserno" id="tutorUserno" value="<c:out value="${result.TUTOR_USERNO}"/>">
	                    <a href="#" onclick="fnLecTutorSearch(this, '${result.PERIOD}');  return false;" class="btn search brown">검색</a>
	                </div>
		        </td>
		        <td>
		        	<a href="#" onclick="addLibRow(this, '${result.PERIOD}'); return false;" class="btn small blue">추가</a>
		        	<a href="#" onclick="fnLecTutorDel(this, '${result.PERIOD}'); return false;" val="<c:out value="${result.PERIOD}"/>" class="btn small red">삭제</a>
		        </td>
		    </tr>
	    </c:forEach>
	    </c:if>
	    
	    <c:if test="${fn:length(tutorList) == 0}">
	    	<tr align="center">
		      <td>
		        <span id="period" class="period">1</span>교시
		        <input type="hidden" name="period" value="1"/>
		      </td>
		      <td>
		        	<select name="libno" id="libno" title="교과목선택" style="width: 180px">
	                    <option value="">선택</option>
	                    <c:forEach var="emap" items="${courseLibList}" varStatus="status1">
							<option value="<c:out value="${emap.LIBNO}"/>" <c:if test="${result.LIBNO == emap.LIBNO}"> selected="selected"</c:if>><c:out value="${emap.SUBJECT}"/></option>
						</c:forEach>
	                </select>
		        </td>
		        <td>
		        	<div class="tutorUserNmDiv" style="padding-bottom: 3px;">
	                    <input type="text" name="tutorUserNm" id="tutorUserNm" class="line" value="<c:out value="${result.TUTOR_USERNM}"/>" /> 
	        			<input type="hidden" name="tutorUserno" id="tutorUserno" value="<c:out value="${result.TUTOR_USERNO}"/>">
	                    <a href="#" onclick="fnLecTutorSearch(this, 1);  return false;" class="btn search brown">검색</a>
	                </div>
		        </td>
		        <td>
		        	<a href="#" onclick="addLibRow(this, 1); return false;" class="btn small blue">추가</a>
		        	<a href="#" onclick="fnLecTutorDel(this, 1); return false;" val="<c:out value="${result.PERIOD}"/>" class="btn small red">삭제</a>
		        </td>
		    </tr>
	    </c:if>
	    </tbody>
	</table>
    </c:if>

    <div class="space"></div><!-- 공백 default 5px -->
    <div class="tb_title">클래스데스크<span><font class="extext"> (항목 중 반드시 하나 이상 선택해야 하며 총 점수의 합이 100이 되어야 합니다.)</font></span></div>
     <table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
              <tr class="rndbg">
                <th align="center"> <input type="checkbox" name="desk01" id="desk01" onclick="openText('evalProgress', this.checked);" style="ime-mode:disabled;" />  &nbsp; 온라인학습</th>
                <th align="center"> <input type="checkbox" name="desk02" id="desk02" onclick="openText('evalAttend', this.checked);" style="ime-mode:disabled;"/> &nbsp; 출석</th>
                <th align="center"> <input type="checkbox" name="desk03" id="desk03" onclick="openText('evalExamFinal', this.checked); openText('evalExamMt', this.checked);" style="ime-mode:disabled;"/> &nbsp; 시험</th>
                <th align="center"> <input type="checkbox" name="desk04" id="desk04" onclick="" <c:if test="${fn:substring(mapInfo.CLASS_DESK,3,4) == 1}"> checked </c:if>/> &nbsp; 설문</th>
                <th align="center"> <input type="checkbox" name="desk05" id="desk05" onclick="" <c:if test="${fn:substring(mapInfo.CLASS_DESK,4,5) == 1 || mapInfo.CLASS_DESK == null}"> checked </c:if> /> &nbsp; 공지사항</th>
                <th align="center"> <input type="checkbox" name="desk06" id="desk06" onclick="" <c:if test="${fn:substring(mapInfo.CLASS_DESK,4,5) == 1 || mapInfo.CLASS_DESK == null}"> checked </c:if> /> &nbsp; 자료실</th>
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
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="evalProgress"  id="evalProgress"  disabled="disabled"  value="<c:out value="${mapInfo.EVAL_PROGRESS}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="evalAttend"  id="evalAttend"  disabled="disabled"  value="<c:out value="${mapInfo.EVAL_ATTEND}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="evalExamFinal" id="evalExamFinal"  disabled="disabled"  value="<c:out value="${mapInfo.EVAL_EXAM_FINAL}"/>"/> 점</td>
            <td align="center">-</td>
            <td align="center">-</td>
            <td align="center">-</td>
        </tr>
    </table>
	
    <div class="space"></div><!-- 공백 default 5px -->
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
    var cseqno =  $("#cseqno").val();

});
 

//클래스 데스크 설정
var f1 = document.pform;
var ls_tmp = $("#insClassDesk").val();
var desk01 = ls_tmp.substring(0, 1);	//	온라인학습 선택 여부
var desk01Value = f1.evalProgress ;		//	온라인학습 점수

var desk02 = ls_tmp.substring(1, 2);	//	출석 선택 여부
var desk02Value = f1.evalAttend ;		//	출석 점수

var desk03 = ls_tmp.substring(2, 3);	//	시험 선택 여부
var desk03Value = f1.evalExamFinal ;	//	최종시험 점수


var desk04 = ls_tmp.substring(3, 4);	//	설문 선택 여부
var desk05 = ls_tmp.substring(4, 5);	//	공지 선택 여부		
var desk06 = ls_tmp.substring(5, 6);	//	자료실 선택 여부

if(desk01 == 1){				// 온라인학습 선택시 체크박스 checked 출력 및 점수 활성화
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
}

if(desk04 == 1){				//설문 선택시 체크박스 checked 출력
    f1.desk04.checked = true;
}

if(desk05 == 1){				//공지 선택시 체크박스 checked
    f1.desk05.checked = true;
}

if(desk06 == 1){				//자료실 선택시 체크박스 checked
    f1.desk06.checked = true;
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
function writeFormCheck() {
	var f1 = document.pform;
    var calssTotal = 0;			// 교재, 출석, 시험, 과제 중 체크한 점수의 합이 100 이어야함.
    var classDeskIn="";			// 최종 classDask 값 지정을 위한 변수 선언
    if(f1.seq_title.value==''){
        alert('기수명을 입력해주세요');
        f1.seq_title.focus();
        return;
    }

 /*    if(f1.mt_cl_code.value==''){
        alert('과정분류를 선택해주세요');
        f1.mt_cl_code.focus();
        return;
    } */
    
    if(f1.compVal.value == '' || f1.compVal.value == 0){
        alert('수료 기준점수를 0점 이상으로 입력해주세요.');
        f1.title.focus();
        return;
    }
    if(f1.applySdate.value == ''){
        alert('신청 시작일을 선택해주세요.');
        f1.applySdate.focus();
        return;
    }
    
    if(f1.applyEdate.value == ''){
        alert('신청 종료일을 선택해주세요.');
        f1.applyEdate.focus();
        return;
    }

      if(f1.studySdate.value == ''){
        alert('교육기간 시작일을 선택해주세요.');
        f1.studySdate.focus();
        return;
    }

    if(f1.studyEdate.value == ''){
        alert('교육기간 종료일을 선택해주세요.');
        f1.studyEdate.focus();
        return;
    }

    if(f1.studytimeTot.value <= 0){
       alert('교육시간을 1시간 이상으로 입력해주세요.');
       f1.studytimeTot.focus();
       return;
    }
    
    if(f1.maxCnt.value == ''){
        alert('신청최대인원을 입력해주세요.');
        f1.maxCnt.focus();
        return;
    }
    
    if(f1.mtCseqStatusCode.value == ''){
        alert('과정상태를 선택해 주세요.');
        f1.mtCseqStatusCode.focus();
        return;
     }

    // 클래스 데스크 > 온라인학습 체크
    if (f1.desk01.checked == true) {
        desk01 = "1";
        if(desk01Value.value<=0){
            alert('온라인학습 점수를 1점 이상으로 입력해주세요.');
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
            alert('출석 점수를 1점 이상으로 입력해주세요.');
            return;
        }else{
            calssTotal = calssTotal + parseInt(desk02Value.value) ;
        }
    } else {
        desk02 = "0";
        desk02Value.value=0;				// 미 체크시 점수 초기화
    }
    
    var examVal = parseInt(desk03Value.value);
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

    }

    // 클래스 데스크 > 설문 체크
    if (f1.desk04.checked == true) {
        desk04 = "1";
    } else {
        desk04 = "0";
    }

    // 클래스 데스크 > 공지사항 체크
    if (f1.desk05.checked == true) {
        desk05 = "1";
    } else {
        desk05 = "0";
    }

    // 클래스 데스크 > 자료실 체크
    if (f1.desk06.checked == true) {
        desk06 = "1";
    } else {
        desk06 = "0";
    }

    classDeskIn = desk01 + desk02 + desk03 + desk04 + desk05 + desk06;
    f1.classDesk.value = classDeskIn;
    document.getElementById('classDesk').value = classDeskIn;

    if(calssTotal != 100){
        alert('클래스 데스크의 총점이 100점이어야 합니다.');
         return;
    }
	
    var submitWin = window.confirm('${titleMode}하시겠습니까?');
    if (submitWin){

    	f1.target = "";
    	$('#libTutorCnt').val($('#libBody').children().size());
        $('#pform').attr('action', '/admin/course/seqExec.do').submit();
    }

}
function filedown(fileId){ 
	$('#fileId').val(fileId);
	$('#pform').attr('action', '/classdesk/tutor/result/filedown.do').submit();
}

function deleteFile(fileId){ 
	var fileId = fileId;
	if(fileId != ''){
		if(confirm("기존파일을 삭제하시겠습니까?")){
	        $.ajax({
	            url : "/classdesk/tutor/result/deleteFile.do",
	            data : {fileId : fileId},
	            dataType : "json",
	            type : 'post',
	            success : function(res) { 
	            	if(res == "SUCCESS"){
	            		alert("삭제되었습니다.");	
	            	}else{
	            		alert('fail');
	            	}
	            	location.reload();
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
	        }); 
		}
	} 
}

</script>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	