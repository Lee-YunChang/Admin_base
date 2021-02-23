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
<!-- 캘린더 스타일 및 스크립트 로딩 끝 -->
<!-- 멀티, 싱글 달력 관련 스크립트 시작 -->
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
		
		// 유튜브가 아닐 경우, 유튜브 URL 경로 적지 못하도록 막는 용도
		if( 'CT0002' == $('#mtContentsCode').val() ) {
			$('#youtubeUrl').attr('disabled', true);
		}
		
	});


    //운영형태
    function openTypeCheck(obj) {

          // A = 상시운영(학습일수 오픈)
        if(obj == 'A'){
        	
        	document.getElementById("eduDay").disabled = false;
            document.getElementById("applySdate").disabled = true;
            document.getElementById("applyEdate").disabled = true;
            document.getElementById("studySdate").disabled = true;
            document.getElementById("studyEdate").disabled = true;

        }else{
        	
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
<c:set var="reg"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="pageMode">${REQUEST_DATA.pageMode}</c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == reg}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">교육과정개설 - 온라인교육 - 기수${titleMode}</span></div>

	<!-- 본문  시작  -->
	<form name="pform" id="pform" action="/admin/course/seqExec.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
        <input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
        <input type="hidden" name="seq" value="<c:out value="${REQUEST_DATA.seq}"/>"/>
        <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
        <input type="hidden" name="classDesk" id="classDesk" value=""/>
        <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${mapInfo.MT_CTYPE_CODE}"/>"/>
		<input type="hidden" id="insClassDesk" value="<c:out value="${mapInfo.CLASS_DESK}"/>"/>
		<input type="hidden" name="openAt" id="openAt" value="Y"/>
		<input type="hidden" name="useyn" id="useyn" value="Y"/>
        <input type="hidden" name="fileId" id="fileId" value="">
        <input type="hidden" name="libTutorCnt" id="libTutorCnt" value="">
        <input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>">
        <input type="hidden" id="mtContentsCode" value="<c:out value='${mapInfo.MT_CONTENTS_CODE }'/>"/>
         
        <div class="tb_title">과정메타정보</div>
        
        <table class="table-type1 search_form">
            <colgroup>
                <col class=cellc  width="8%">
                <col class=celll  width="35%">
                <col class=cellc  width="8%">
                <col class=celll  width="35%">
            </colgroup>
            <tbody>
	            <tr>
		        	<th>* 콘텐츠 구분</th>
		            <td colspan="3">
		            	<c:choose>
		            		<c:when test="${map.MT_CONTENTS_CODE eq 'CT0001'}">유튜브</c:when>
		            		<c:when test="${map.MT_CONTENTS_CODE eq 'CT0002'}">MP4</c:when>
		            	</c:choose>
		            </td>
	       		 </tr>
            
	            <tr>
	            	<th>* 과정구분</th>
	                <td class="line" colspan="3">${mapInfo.MT_SC_NAME}</td>
	            </tr>
	            <tr>
	                 <th>* 과정명</th>
	                 <td colspan="3" class="line" colspan="3">${mapInfo.COURSETITLE}</td>
	            </tr>
	            <tr>
	            	<th>* 기수명</th>
	            	<td colspan="3"><input type="text" class="line" name="seq_title" id="seq_title" value="<c:out value="${pageMode == 'mod' ? mapInfo.SEQ_TITLE : mapInfo.COURSETITLE}"></c:out>" style="width: 285px"/></td>
	            </tr>
	        <!-- 201905 START -->
		        <tr>
		        	<th>유튜브 URL</th>
		            <td colspan="3">
		            	<c:out value="${map.YOUTUBE_URL}"/>
		            </td>
		        </tr>
            
            <!-- 201905 END -->
         </tbody>
    </table>
    
    <div class="space"></div><!-- 공백 default 5px -->
    <div class="tb_title"> 기수정보 설정</div>
     <table class="table-type1 search_form ">
        <colgroup>
            <col class=cellc  width="7%">
            <col class=celll  width="38%">
            <col class=cellc  width="10%">
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
                ~
	                <input type="text" class="line" name="studyEdate" id="studyEdate" value="<c:out value="${mapInfo.STUDY_EDATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#studyEdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="학습기간 종료일">
				 	</a>
            </td>    
        </tr>
        </tbody>
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



//등록
function writeFormCheck() {
	var f1 = document.pform;

    if(f1.seq_title.value==''){
        alert('기수명을 입력해주세요');
        f1.seq_title.focus();
        return;
    }
    
	if( 'CT0001' == '${map.MT_CONTENTS_CODE}') {
		if( '' == $('#youtubeUrl').val() ) {
			alert('유튜브 URL을 입력해주세요.');
			fl.youtubeUrl.focus();
			return false;
		}
	}

	
   if (f1.openType.value == 'A'){
       if(f1.eduDay.value == 0 || f1.eduDay.value == ''){
           alert("학습일수를 등록해주세요.");
           f1.eduDay.focus();
           return;
       }
   } else {
	   
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
	    
    }
    
    if(f1.mtCseqStatusCode.value == ''){
        alert('과정상태를 선택해 주제요.');
        f1.mtCseqStatusCode.focus();
        return;
    }

    var submitWin = window.confirm('${titleMode}하시겠습니까?');
    
    if (submitWin){
    	$('#libTutorCnt').val($('#libBody').children().size());
        f1.submit();
    }

}

function deleteFile(fileId){ 
	var fileId = fileId;
	if(fileId != ''){
		if(confirm("기존파일을 삭제하시겠습니까?")){
	        $.ajax({
	            url : "/admin/common/deleteFile.do",
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

function deleteTxtFile(fileId){ 
	var fileId = fileId;
	if(fileId != ''){
		if(confirm("기존파일을 삭제하시겠습니까?")){
	        $.ajax({
	            url : "/admin/common/deleteTxtFile.do",
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

function filedown(fileId){ 
	$('#fileId').val(fileId);
	$('#pform').attr('action', '/admin/common/classdesk/filedown.do').submit();
}

function filedownTxt(fileId){ 
	$('#fileId').val(fileId);
	$('#pform').attr('action', '/admin/common/classdesk/filedownTxt.do').submit();
}

</script>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	