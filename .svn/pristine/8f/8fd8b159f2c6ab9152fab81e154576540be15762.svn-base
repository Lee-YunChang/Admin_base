
<%
/****************************************************
	system	: 과정관리 > 방문교육관리
	title	: 특강 상세
	summary	:	
	wdate	: 2016-08-30
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>
<script type="text/javascript">

var dateFormat={
     dayNamesMin:['일','월','화','수','목','금','토'],
     monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     showMonthAfterYear: true, //연월 순서로 보여줌
     changeMonth: true, //월을 셀렉트박스로 표현
     changeYear: true, //년을 셀렉트박스로 표현
     dateFormat: "yy-mm-dd"
};

$(document).ready(function() {
	
	var str = $('#eduFacCode').val();
	var res = str.split(',');
	for(var i = 1 ; i < 8 ; i++) {
		for(var j = 0 ; j < res.length ; j++) {
			if($('#eduFacCodeArr'+i).val() == res[j]) {
				$('#eduFacCodeArr'+i).attr("checked","checked");
			}
		}
	}
	
    $("#eduDate").datepicker(dateFormat);
	
	var checked = $('input:radio[name=mtTutorCode]:checked').val();
	var prev =  '<c:out value="${map.MT_TUTOR_CODE}"/>';
	if(prev != 'JGAC00') {//내부강사
		$('#mtFieldName').append("<input type='text'name='mtFieldCode' id='mtFieldCode' class='line' value='<c:out value='${map.MT_FIELD_CODE}'/>' style='width:150px;'/>");
	} else {//강사단
		$('#mtFieldName').append("<select id='mtFieldCode' name='mtFieldCode' title='분야'><option value=''>선택</option><c:forEach var='code' items='${categoryData3}'><option value='${code.MT_SUB_CODE}' <c:if test='${code.MT_SUB_CODE eq map.MT_FIELD_CODE}'>selected='selected'</c:if>>${code.MT_SUB_NAME}</option></c:forEach></select>");
	}
	
	$("input[name=mtTutorCode]").change(function() { 
		if($(this).val() != 'JGAC00') {//내부강사
			$('#mtFieldName').children().remove();
			$('#mtFieldName').append("<input type='text'name='mtFieldCode' id='mtFieldCode' class='line' value='' style='width:150px;'/>");
		} else {//강사단
			$('#mtFieldName').children().remove();
			$('#mtFieldName').append("<select id='mtFieldCode' name='mtFieldCode' title='분야'><option value=''>선택</option><c:forEach var='code' items='${categoryData3}'><option value='${code.MT_SUB_CODE}'>${code.MT_SUB_NAME}</option></c:forEach></select>");
		}
		
	});
	
	
});
 
function fnSave() {
	var form = document.pform;
	
	var lecUserno = form.lecUserno.value;
	var lecUsernm = form.lecUsernm.value;
	var lecPhone =  form.lecPhone.value;
	
	var chLecUserNo = form.checkLecUserNo.value;
	var chLecUserNm = form.checkLecUserNm.value;
	var chLecPhone = form.checkLecPhone.value;
	var mtScCode="<c:out value='${REQUEST_DATA.mtScCode.trim()}'/>";
	console.log(mtScCode);
	if(mtScCode!='SC0004'){
		var lecpay = form.lecPayTxt.value;
		lecpay=lecpay.replace(/[^0-9]/g,'');
		$("#lecPay").val(lecpay);
	}
	var checked = $('input:radio[name=mtTutorCode]:checked').val();
	
	var checkLength = $("input:checkbox[name=eduFacCodeArr]:checked").length; 
	form.checkLength.value = checkLength;
	
	if(checked==$("#JGAC00").val()){//강사단이라면
		if(form.lecUsernm.value != form.checkLecUserNm.value || form.lecUserno.value != form.checkLecUserNo.value){
			alert('강사명을 확인해주세요');
			return;
		}else if(form.lecPhone.value != form.checkLecPhone.value){
			alert('강사 연락처를 확인해주세요');
			return;
		}else{
			if(confirm('저장 하시겠습니까?')){	
				 var mtTutorFileCodeArr = new Array;
				if($("#uploadFile1").val().length > 0) {
					mtTutorFileCodeArr.push($("#mtTutorFileCode1").val());
				}
				if($("#uploadFile2").val().length > 0) {
					mtTutorFileCodeArr.push($("#mtTutorFileCode2").val());
				}
				if($("#uploadFile3").val().length > 0) {
					mtTutorFileCodeArr.push($("#mtTutorFileCode3").val());
				}
		
				$("#mtTutorFileCode").val(mtTutorFileCodeArr);
				$("#pform").attr("action", "/admin/lecture/lectureTutorExec.do"); 
				$("#pform").attr("target", ""); 
				form.submit();
			}
		}
	} else {//강사단이아니라면
		if(confirm('저장 하시겠습니까?')){	
			 var mtTutorFileCodeArr = new Array;
			if($("#uploadFile1").val().length > 0) {
				mtTutorFileCodeArr.push($("#mtTutorFileCode1").val());
			}
			if($("#uploadFile2").val().length > 0) {
				mtTutorFileCodeArr.push($("#mtTutorFileCode2").val());
			}
			if($("#uploadFile3").val().length > 0) {
				mtTutorFileCodeArr.push($("#mtTutorFileCode3").val());
			}
			
			$("#mtTutorFileCode").val(mtTutorFileCodeArr);
			$("#pform").attr("action", "/admin/lecture/lectureTutorExec.do"); 
			$("#pform").attr("target", ""); 
			form.submit();
		}
	}
} 

//삭제
function fnDelete(){
	var form = document.pform;
	if(confirm('삭제 하시겠습니까?')){	
		$("#deleteYn").val('Y');
		$("#pform").attr("action", "/admin/lecture/lectureTutorExec.do"); 
		$("#pform").attr("target", ""); 
		form.submit();
	}
}
function PrintElem()
{   var form = document.pform;
	
	var smspop = window.open("","smsform"); 

	form.method = "post";
	form.action = "/admin/lecture/lectureViewPrint.do";
	form.target = "smsform"; 
	form.submit();
	smspop.focus();
	
/*  	smspop.document.close(); // necessary for IE >= 10
	smspop.focus(); // necessary for IE >= 10

	smspop.print();
	smspop.close();  */
} 


function smsFormGroup(){
	var form = document.userForm;
	var chk = $("input:checkbox[name=msg_user]:checked");
	
	var usernoArr = new Array;
	var moblphonArr = new Array;
	var useridArr = new Array;
	$('input:checkbox[name=msg_user]').each(function(index, element) {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
		 	usernoArr.push($(this).siblings("#userno").val());
		 	var tmpmob = $(this).siblings("#moblphon").val();
		 	var newtmpmob = tmpmob.replace(/-/g, "");
		 	moblphonArr.push(newtmpmob);
		 	useridArr.push($(this).siblings("#userid").val());
		}
	});
	 
	$("#usernoArr").val(usernoArr);
	$("#moblphonArr").val(moblphonArr);
	$("#useridArr").val(useridArr);
	
	var smspop = window.open("","smsform","width=520,height=650"); 

	form.method = "post";
	form.action = "/admin/common/smsForm.do";
	form.target = "smsform"; 
	form.submit();
	smspop.focus();
}

// 강사검색
function fnLecTutorSearch() {
	//window.open("/admin/lecture/lectureTutorSearch.do?searchWord="+$("#lecUsernm").val(), "tutorSearch", "width=1020, height=780, scrollbars=yes");

	var myForm = document.pform;
	
	var lecUsernm =  myForm.lecUsernm.value;
	
	if(lecUsernm.length > 0){
		myForm.searchWord.value = lecUsernm; 
	}
	
	window.open("" ,"pform", "toolbar=no, width=1020,height=850, directories=no, status=no, scrollbars=yes, resizable=no"); 
// 	$("#searchWord").val($("#lecUsernm").val());
	myForm.action = '/admin/lecture/lectureTutorSearch.do'; 
	myForm.method = "post";
	myForm.target = "pform";
	myForm.submit();
}

function PopupCallBack(data){
	var prev = data.mtTutorCode ;
	var code = data.mtFieldCode.trim();
	if(prev != 'JGAC00') {//내부강사,전문강사단
		$('#mtFieldName').children().remove();
		$('#mtFieldName').append("<input type='text'name='mtFieldCode' id='mtFieldCode' class='line' value='<c:out value='${map.MT_FIELD_CODE}'/>' style='width:150px;'/>");
	} else {//강사단
		$('#mtFieldName').children().remove();
		$('#mtFieldName').append("<select id='mtFieldCode' name='mtFieldCode' title='분야'><option value=''>선택</option><c:forEach var='code' items='${categoryData3}'><option value='${code.MT_SUB_CODE}' <c:if test='${code.MT_SUB_CODE eq map.MT_FIELD_CODE}'>selected='selected'</c:if>>${code.MT_SUB_NAME}</option></c:forEach></select>");
		$('#mtFieldName').find("option[value='"+code+"']").attr('selected', 'selected');
	}
}

//파일 삭제
function delBtn(slno,sltno,fileno,savfile,cnt,savpath) {
	if(fileno != ''){
		if(confirm("기존파일을 삭제하시겠습니까?")){
	        $.ajax({
	            url : "/admin/lecture/deleteFileAjax.do",
	            data : {fileno : fileno, slno : slno, sltno : sltno,  savePath : savpath , saveFile : savfile},
	            dataType : "json",
	            type : 'post',
	            success : function(res) { 
	            	if(res == "SUCCESS"){
	            		alert("삭제되었습니다.");	
	            	}else{
	            		alert('fail');
	            	}
	            	$("#fileBox"+cnt).remove();
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
	        }); 
		}
	} else{
		$("#fileBox"+cnt).remove();
	}
}

/* 3자리마다 , 찍기 */
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
	
     var num01;
     var num02;
     num01 = obj.value;
     num02 = num01.replace(rgx1,"");
     num01 = setComma(num02);
     obj.value =  num01;

}

function setComma(inNum){
     
     var outNum;
     outNum = inNum; 
     while (rgx2.test(outNum)) {
          outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
      }
     return outNum;

}



</script>
<div class="title title_top">방문교육관리 -
<c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0004' }">방문프로그램</c:if> 
<c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0005' }">찾아가는학교특강</c:if>
<c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0006' }"> 특강(강사요청)</c:if> 
<c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0007' }">정신보건방문프로그램</c:if>
</div>

<div class="tb_title">신청정보</div>
<form name="pform" id="pform" action="/admin/lecture/lectureTutorExec.do" method="post" enctype="multipart/form-data">
<input type="hidden" id="eduFacCode" value="${map.EDU_FAC_CODE }"/>
<input type="hidden" id="checkLength" name="checkLength" value=""/>
<input type="hidden" id="deleteYn" name="deleteYn" value=""/>
<input type="hidden" id="lecPay" name="lecPay" value="" />
<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
    </colgroup>
    <tbody>
        <tr>
            <th>신청번호</th>
            <td colspan="3"><c:out value="${map.SLNO}"/></td>
        </tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0006' }">
        <tr>
            <th>제목</th>
            <td colspan="3"><input type="text" name="title" id="title" class="line" style="width:100%" value="<c:out value="${map.TITLE}"/>"/></td>
        </tr>
        </c:if>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
	        <tr>
	            <th>교육장소</th>
	            <td colspan="3"><input type="text" name="eduArea" id="eduArea" class="line" style="width:100%" value="<c:out value="${map.EDU_AREA}"/>"/></td>
	        </tr>
        </c:if>
			<tr>
	        <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0004' }">
	            <th>방문요청일시</th>
            </c:if>
            <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
	            <th>교육일시</th>
            </c:if>
            
	            <td colspan="3">
                    <input type="text" class="line" name="eduDate" id="eduDate" value="<c:out value="${map.EDU_DATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#eduDate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="교육일">
				 	</a>
				 	<select name="multiEduSdateHour" id="multiEduSdateHour1"  title="교육시작 시간">
						<c:forEach var="sh" begin="0" end="24" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						
						<option value="<c:out value='${sh}' />" <c:if test="${map.EDU_SDATE_HOUR == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
						</c:forEach>
					</select>시
				 	<select name="multiEduSdateMinute" id="multiEduSdateMinute1" title="교육시작 분">
						<c:forEach var="sh" begin="0" end="59" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<option value="<c:out value='${sh}' />"<c:if test="${map.EDU_SDATE_MINUTE == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
						</c:forEach>
					</select>분

                ~
                	<select name="multiEduEdateHour" id="multiEduEdateHour1">
						<c:forEach var="sh" begin="0" end="24" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<option value="<c:out value='${sh}' />" <c:if test="${map.EDU_EDATE_HOUR == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
						</c:forEach>
					</select>시
				 	<select name="multiEduEdateMinute" id="multiEduEdateMinute1">
						<c:forEach var="sh" begin="0" end="59" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<option value="<c:out value='${sh}' />"<c:if test="${map.EDU_EDATE_MINUTE == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
						</c:forEach>
					</select>분
            </td>
	            
        	</tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0007' }">
        <tr>
        	 <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0004' }">
	            <th>방문시간</th>
            </c:if>
            <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
            	<th>교육시간</th>
            </c:if>
            <td colspan="3"><input type="text" name="eduTime" id="eduTime" class="line" value="<c:out value="${map.EDU_TIME}"/>"/> 시간</td>
        </tr>
        </c:if>
        <tr>
        	<th>교육대상</th>
            <td>
            	<input type="text" name="eduTarget" id="eduTarget" class="line" style="width:100%;" value="<c:out value="${map.EDU_TARGET}"/>"/>
            </td>
            <th>인원</th>
            <td>
	            <input type="text" name="personCnt" id="personCnt" class="line" value="<c:out value="${map.PERSON_CNT}"/>"/> 명
            </td>
        </tr>
        <tr>
            <th>신청기관명</th>
            <td><input type="text" name="applyOrganNm" id="applyOrganNm" class="line" style="width:100%;" value="<c:out value="${map.APPLY_ORGAN_NM}"/>"/></td>
            <th>신청기관 주소</th>
            <td><input type="text" name="applyOrganAddr" id="applyOrganAddr" class="line" style="width:100%;" value="<c:out value="${map.APPLY_ORGAN_ADDR}"/>"/></td>
        </tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
        <tr>
            <th>교육시설정보</th>
            <td>
				<c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
					<div class="input-add">
						<span class="chk-wrap">
							<span class="checks">
								<input type="checkbox" id="eduFacCodeArr${status.count}" name="eduFacCodeArr" value="${data.MT_SUB_CODE}"/>
								<label for="eduFacCodeArr${status.count}">  ${data.MT_SUB_NAME}&nbsp; </label>
								<c:if test="${data.MT_SUB_CODE eq 'FA07'}">
									</br><input type="text" name="eduFacContent" id="eduFacContent" class="line" style="width:80%;" value="<c:out value="${map.EDU_FAC_CONTENT}"/>"/>
								</c:if>
							</span>
						</span>
					 </div>
				</c:forEach>
			</td>
            <th>강사료</th>
            <!-- <td><input type="text" name="lecPay" id="lecPay" class="line" value="<c:out value="${map.LEC_PAY}"/>"/> 원</td>-->
            <td><input type="text" name="lecPayTxt" id="lecPayTxt"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'  class="line" onchange="getNumber(this);" 
            onkeyup="getNumber(this);"  style="text-align:right;" value="<fmt:formatNumber value="${map.LEC_PAY}" pattern="#,###" />" />원</td>
        </tr>
        </c:if>
        <tr>
            <th>신청자</th>
            <td><input type="text" name="applyNm" id="applyNm" class="line" style="width:90%;" value="<c:out value="${map.APPLY_NM}"/>"/></td>
            <th>신청자 연락처</th>
            <td><input type="text" name="applyPhone" id="applyPhone" class="line" value="<c:out value="${map.APPLY_PHONE}"/>"/></td>
        </tr>
        <tr>
            <th>신청자 이메일</th>
            <td><input type="text" name="applyEmail" id="applyEmail" class="line" style="width:90%;" value="<c:out value="${map.APPLY_EMAIL}"/>"/></td>
			<th>신청일시</th>
			<td><c:out value="${map.REGDATE}"/></td>
        </tr>
        <tr>
            <th>기타내용</th>
            <td colspan="3"><textarea rows="5" name="etc"  id="etc"  style="width:100%;" maxlength="80"><c:out value="${map.ETC}"/></textarea></td>
        </tr>
    </tbody>
</table>

<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title">강사 및 관리 정보</div>

<!-- 본문 > 메인 > 목록 시작  -->

<input type="hidden" name="slno" value="<c:out value="${REQUEST_DATA.slno}"/>"/>
<input type="hidden" name="sltno" value="<c:out value="${REQUEST_DATA.sltno}"/>"/>
<input type="hidden" name="lecUserno" id="lecUserno" value="<c:out value="${map.LEC_USERNO}"/>"/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.lectureFilePath")%>"/>
<input type="hidden" name="delCheckFile" value=""/>
<input type="hidden" name="searchType" value="NAME"/>
<input type="hidden" name="searchWord" id="searchWord" value=""/>
<input type="hidden" name="checkLecUserNo" id="checkLecUserNo" value="<c:out value="${map.LEC_USERNO}"/>"/>
<input type="hidden" name="checkLecUserNm" id="checkLecUserNm" value="<c:out value="${map.LEC_USERNM}"/>"/>
<input type="hidden" name="checkLecPhone" id="checkLecPhone" value="<c:out value="${map.LEC_PHONE}"/>"/>
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>"/>
<input type="hidden" name="mtTutorFileCode" id="mtTutorFileCode" value=""/>
<table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
    </colgroup>
    <tbody>
        <tr>
            <th>교육일시</th>
            <td><c:out value="${map.EDU_DATE}"/> <c:out value="${map.EDU_SDATE_HOUR}"/>:<c:out value="${map.EDU_SDATE_MINUTE}"/>~<c:out value="${map.EDU_EDATE_HOUR}"/>:<c:out value="${map.EDU_EDATE_MINUTE}"/></td>
            <th>진행현황</th>
            <td>
            	<select name="mtLecStatusCode" id="mtLecStatusCode">
					<option value="1" <c:if test="${map.MT_LEC_STATUS_CODE eq '1'}">selected="selected"</c:if>>승인요청</option>
					<option value="2" <c:if test="${map.MT_LEC_STATUS_CODE eq '2'}">selected="selected"</c:if>>승인취소</option>
					<option value="3" <c:if test="${map.MT_LEC_STATUS_CODE eq '3'}">selected="selected"</c:if>>승인완료</option>
				</select>
            </td>
        </tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne '4' }">
        <tr>
            <th>강사명</th>
            <td><input type="text" name="lecUsernm" id="lecUsernm" class="line" value="<c:out value="${map.LEC_USERNM}"/>"/>
            	<a href="#" onclick="fnLecTutorSearch();" class="btn search brown">검색</a>
            </td>
            <th>강사 연락처</th>
            <td><input type="text" name="lecPhone" id="lecPhone" class="line" value="<c:out value="${map.LEC_PHONE}"/>" style="width:150px;"/>
            </td>
        </tr>
        
        <tr>
            <th>강사구분</th>
            <td id="mtTutorName">
		        <c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
		        <input type="radio" name="mtTutorCode" id="mtTutorCode" value="${emap2.MT_SUB_CODE}" <c:if test="${map.MT_TUTOR_CODE eq emap2.MT_SUB_CODE}"> checked="checked"</c:if>/> <c:out value="${emap2.MT_SUB_NAME}"/>&nbsp;
		        </c:forEach>
            </td>
            <th>소속</th>
            <td id="mtFieldName">
            </td>
        </tr>
        </c:if> 
        <tr>
            <th>기타정보</th>
            <td colspan="3">
            	<textarea rows="5" name="lecEtc"  id="lecEtc"  style="width:100%;" maxlength="80"><c:out value="${map.LEC_ETC}"/></textarea>
            </td>
        </tr>
    </tbody>
 </table>
<!--  버튼  -->
<div class="button">
	<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}">
        <a href="#" onclick="fnSave(); return false;" class= "btn big blue">등록</a>
    </c:when>
    <c:otherwise>
        <a href="#" onclick="fnSave(); return false;" class= "btn big blue">수정</a>
    </c:otherwise>
    </c:choose>
    <a href="#" onclick="history.back()" class="btn big gray">목록</a>
<!--     <a href="javascript:window.print();" class="btn big orange">인쇄</a> -->
	<a href="#" onclick="PrintElem();" class="btn big orange">인쇄</a>
    <a href="#" onclick="fnDelete(); return false;" class="btn big red">삭제</a>
<%--     <a href="#"  onclick="goPrint('<c:out value="${map.SLTNO}"/>', '<c:out value="${map.SLNO}"/>', '<c:out value="${map.MT_SC_CODE}"/>');" class="btn big orange">인쇄</a> --%>
</div>
</form>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	