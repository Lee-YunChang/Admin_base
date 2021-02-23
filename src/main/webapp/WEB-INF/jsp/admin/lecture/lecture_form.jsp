<%
/****************************************************
	system	: 과정관리 > 방문교육관리
	title	: 특강 등록/ 수정 폼
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
/* 3자리마다 , 찍기 */
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 


$(document).ready(function(){
	
	$('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
	
	 $(document).on('click', '.add_btn_minus', function(e){
			e.preventDefault();
			var cnt = $("#count").val();
			
			cnt -= 1;
			
			$("#count").val(cnt);
			
			$(this).parents('.mainClass').remove();
			
		}); 
	
	sangs.areaCombo.init('sidoCode','guCode','dongCode');
	sangs.areaCombo.selected('${map.SIDO_CODE}','${map.GU_CODE}','${map.DONG_CODE}');
});

//우편번호찾기
function zipSearch(){
    window.open("/admin/common/postEtc.do","post_pop", "width=600,height=450, scrollbars=YES");
}
//우편번호 콜백 스크립트
function fnZipCodePopupCallBack(data){
     $('#lnmZip').val(data.zip_code);
     $('#lnmAdres1').val(data.adres);
     $('#lnmAdres2').focus();
}


//파일다운로드
function filedown(fileName,saveFile){
	$("#filename").val(fileName);
	$("#saveFile").val(saveFile);
	
	$("#pform").attr("action", "/admin/lecture/lectureFiledown.do").submit(); 
}


function tutorSave(flag){
	
	if($('#tutorNm').valueEmpty('강사를 선택해주세요.')){
		popTutor();
		return false;
	}
	
	if(confirm(flag === 'Y' ?'선택한 강사를 배정하시겠습니까?' : '배정된 강사정보를 삭제하시겠습니까?')){
		$.ajax({
			url : '/admin/lecture/lectureTutorExec.do',
			data : {finalAt:flag, tutorUserno:$('#tutorUserno').val(), slno : $('#slno').val()},
			dataType : 'json',
			type : 'post',
			async: 'false',
			success : function(res) { 
				if(res === 'SUCCESS'){
					//$('#mtLecStatusCode').val('LE0004').prop('selected',true);
					$('#finalAt').val(flag);
					if(flag === 'Y'){
						alert('강사 배정이 완료되었습니다.');
						$('#emptyTutor').hide();
						$('#compTutor').show();
						$('#tutorText').text('강사배정이 확정되었습니다.');
					
					}else{
						alert('배정된 강사정보를 삭제하였습니다.');
						$('#emptyTutor').show();
						$('#compTutor').hide();
						$('#tutorUserno').val('');
						$('#tutorNm').val('');
						$('#tutorText').text('등록된 강사가 없습니다.');
					}
					
				}else{
					alert('오류발생');
				}
			},
			error : function(e) {
				alert("error :" + e.responseText);
			}
		});	
	}
	
}

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


$.datepicker.setDefaults({
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	changeMonth: true,
		changeYear: true,
		showMonthAfterYear: true,
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	dateFormat: 'yy-mm-dd'
}); 

$(function() {
	
	if('${REQUEST_DATA.msg}' != ""){
		alert('${REQUEST_DATA.msg}');
	}
	
	//$("div[id^='multiEduSdateHour']").numeric();
	/* $('#eduSdate').datepicker({dateFormat: 'yy-mm-dd'});
	$('#eduDay2').datepicker({dateFormat: 'yy-mm-dd'});
	$('#eduDay3').datepicker({dateFormat: 'yy-mm-dd'}); */
	
	
	//$("div[id^='multiDsSdateHour']").numeric();
	$('#dsDay').datepicker({dateFormat: 'yy-mm-dd'});
	
});


function fnSave() {
	
/* 	if($('#applyNm').valueEmpty("신청자 성명을 입력하세요.")) return;
	if($('#applyOrganNm').valueEmpty("소속을 입력하세요.")) return;
	if($('#sidoCode').valueEmpty("지역(시/도)을 선택하세요.")) return;
	if($('#guCode').valueEmpty("지역(구)을 선택하세요.")) return;
	if($('#dongCode').valueEmpty("지역(동)을 선택하세요.")) return; */
	
	if(confirm(!$('#slno').valueEmpty() ? "해당 특강을 수정하시겠습니까?" : "해당 특강을 등록하시겠습니까?")) {
		
		$("#pform").attr("action", "/admin/lecture/insertLectureExec.do"); 
		
		var ckbs = $("input[name='mtLctreCodeArr']:checked");
		ckbs = ckbs.map(function(){
			var value = $(this).val();
			return value;
		}).get().join(",");
		
		$("#mtLctreCode").val(ckbs);
		
		
		var ckbs2 = $("input[name='mtFcltsCodeArr']:checked");
		ckbs2 = ckbs2.map(function(){
			var value = $(this).val();
			return value;
		}).get().join(",");
		
		$("#mtFcltsCode").val(ckbs2);
		
		
		// 교육희망 일시 JSON 형식으로 넘기기
		var list = [];
		
		$('.mainClass').each(function(i){
			
			var data = {};  
			
			data.eduSdate = $(this).find('input[name=eduSdate]').val().replace(/-/g,"").toString()
							+ $(this).find('select[name=eduSdate_hh]').val().toString()
							+ $(this).find('select[name=eduSdate_mm]').val().toString();
			
			data.eduEdate = $(this).find('input[name=eduSdate]').val().replace(/-/g,"").toString()
			+ $(this).find('select[name=eduEdate_hh]').val().toString()
			+ $(this).find('select[name=eduEdate_mm]').val().toString();
			
			
			
			list.push(data);
			
		});
		
		
		console.log(JSON.stringify(list));
		
		$('#listParam').val(JSON.stringify(list));
		
		
		/* 
		//교육신청시간 데이터 합치기
		$('#eduSdate').val($.trim($('#eduDay').val().replace(/-/g,"")).toString()+$.trim($('#eduSdate_hh').val()).toString()+$.trim($('#eduSdate_mm').val()).toString());	
		$('#eduEdate').val($.trim($('#eduDay').val().replace(/-/g,"")).toString()+$.trim($('#eduEdate_hh').val()).toString()+$.trim($('#eduEdate_mm').val()).toString());
		 */
		//협의일시 데이터 합치기
		
		if(!$('#slno').valueEmpty()){
			$('#dsSdate').val($.trim($('#dsDay').val().replace(/-/g,"")).toString()+$.trim($('#dsSdate_hh').val()).toString()+$.trim($('#dsSdate_mm').val()).toString());
			$('#dsEdate').val($.trim($('#dsDay').val().replace(/-/g,"")).toString()+$.trim($('#dsEdate_hh').val()).toString()+$.trim($('#dsEdate_mm').val()).toString());
			
			var lecpay = $("#pay").val();
			lecpay=lecpay.replace(/[^0-9]/g,'');
			$("#pay").val(lecpay);
			
			var ptrps = $("#ptrps").val();
			ptrps=ptrps.replace(/[^0-9]/g,'');
			$("#ptrps").val(ptrps);
			
			$("#pform").attr("action", "/admin/lecture/updateLectureExec.do"); 
		}
		if($('#slno').val()!=""){
			if(document.pform.dsDay.value==""){
				$('#dsSdate').val("");
				$('#dsEdate').val("");
			}
		}
		 
		$("#pform").submit();
				/*
				
					 var fileNum = $("#filesCount").val() * 1 + 1;
			if(confirm("저장하시겠습니까?")) {
				$(".td-input-wrap").children("#eduDate_").each(function(){
					$(this).attr("id","eduDate_"+fileNum);
					$(this).children().find(".inputtxt").attr("id","fileName"+fileNum);
					$(this).children().find(".file_input_hidden").attr("id","uploadFile"+fileNum);
					$(this).children().find(".file_input_hidden").attr("name","uploadFile"+fileNum);
					$(this).children().find(".file_input_hidden").attr("onchange",fileNum+", this.value, 0");
					$(this).children().find(".scale-down").attr("onclick","fnDel("+fileNum +");return false");
					fileNum = fileNum + 1;
				});
			}	
		  */
			
	}
}


function popTutor(){
	window.open("/admin/lecture/lectureTutorSearch.do","tutorPop","width=900,height=650,scrollbars=yes");	
}

function popPay(){
	if($('#tutorUserno').val() == "" || $('#tutorUserno').val() == null){
		alert("강사를 선정한뒤 확인후 시도해 주세요");
		return false;
	}
	
	/* var stAddr = $('#lnmAdres1').val().substring(0,$('#lnmAdres1').val().indexOf(' ')); */
	var stAddr = $('#lnmAdres1').val().substring(0,$('#lnmAdres1').val().indexOf(' ', 6));
	stAddr = encodeURI(encodeURIComponent(stAddr));
	var ttNo = $('#tutorUserno').val();
	var dsDay = $('#dsDay').val();
	var dsSdate = $('#dsSdate_hh').val()+":"+$('#dsSdate_mm').val();
	var dsEdate = $('#dsEdate_hh').val()+":"+$('#dsEdate_mm').val();
	var slno = $('#slno').val();
	window.open("/admin/lecture/lectureTutorPay.do?stAddr="+stAddr+"&ttNo="+ttNo+"&dsDay="+dsDay+"&dsSdate="+dsSdate+"&dsEdate="+dsEdate+"&slno="+slno,"tutorPop","width=570,height=550,scrollbars=yes");	
}

 
function PopupCallBack(data){
	$('#tutorUserno').val(data.lecUserno);
	$('#tutorNm').val(data.lecUsernm);
} 

function PayPopupCallBack(data){
	$('#ptrps').val(data.lectotalPay);
	$('#pay').val(data.lectutorPay);
} 
 
 


/* function fnMtScCode(pval) {
	if(pval == 'SC0005') {
		$(".target1").each(function() {
			$(this).hide();
		});
		$(".target2").each(function() {
			$(this).show();
		});
	}
	else {
		$(".target1").each(function() {
			$(this).show();
		});
		$(".target2").each(function() {
			$(this).hide();
		});
	}
}
 */


/* function radio_gubun(gubun){
	var val = gubun.value;
	if(val == '1'){
		document.getElementById("eduTargetCnt1").disabled = false;
 		document.getElementById("eduTargetCnt2").disabled = true;
 		document.getElementById("eduTargetCnt3").disabled = true;
	}else if(val == '2'){
		document.getElementById("eduTargetCnt1").disabled = true;
 		document.getElementById("eduTargetCnt2").disabled = false;
 		document.getElementById("eduTargetCnt3").disabled = true;
	}else if(val == '3'){
		document.getElementById("eduTargetCnt1").disabled = true;
 		document.getElementById("eduTargetCnt2").disabled = true;
 		document.getElementById("eduTargetCnt3").disabled = false;
	}
}
 */

//우편번호찾기
/* function zipSearch(){
	window.open("/admin/common/postEtc.do","post_pop", "width=600,height=450, scrollbars=YES");
}

//우편번호 콜백 스크립트
function fnZipCodePopupCallBack(data){
 	var zipCodes = data.zip_code.split('-');
 	
 	$('#applyOrganZipno').val(data.zip_code);
 	$('#applyOrganAddr').val(data.adres);
 	$('#applyOrganAddr2').val('');
 	$('#applyOrganAddr2').focus();
} */



 	var delcnt = 1;
	var cnt = 1;
	
	function fnAdd() {
		cnt = $("#count").val();
		if (cnt > 8) {
			alert('9개까지 등록 가능합니다.');
			return;
		}
		cnt++;
		$("#count").val(cnt);
		delcnt ++;
		var str = '';
			str = str + "<div class='mainClass'>";
		    str = str + "<input type='text' class='datepicker' name='eduSdate' id='eduSdate"+cnt+"' readonly='readonly' style='width: 75px; height: 17px'/>&nbsp;";
		    str = str + "<label for='eduSdate"+cnt+"'><img src='/admin/images/btn_calendar.png' alt='교육일'></label>&nbsp;";
		    str = str + "<select name='eduSdate_hh' id='eduSdate_hh'  title='교육시작 시간'>";
			str = str + "<option value='08'>08</option>";
			str = str + "<option value='09'>09</option>";
			str = str + "<option value='10'>10</option>";
			str = str + "<option value='11'>11</option>";
			str = str + "<option value='12'>12</option>";
			str = str + "<option value='13'>13</option>";
			str = str + "<option value='14'>14</option>";
			str = str + "<option value='15'>15</option>";
			str = str + "<option value='16'>16</option>";
			str = str + "<option value='17'>17</option>";
			str = str + "<option value='18'>18</option>";
			str = str + "<option value='19'>19</option>";
			str = str + "<option value='20'>20</option>";
			str = str + "<option value='21'>21</option>";
			str = str + "<option value='22'>22</option>";
			str = str + "</select>시&nbsp;";
			str = str + "<select name='eduSdate_mm' id='eduSdate_mm' title='교육시작 분'>";
	       	str = str + "<option value='00'>00</option>";
	       	str = str + "<option value='05'>05</option>";
	       	str = str + "<option value='10'>10</option>";
	       	str = str + "<option value='15'>15</option>";
	       	str = str + "<option value='20'>20</option>";
	       	str = str + "<option value='25'>25</option>";
	       	str = str + "<option value='30'>30</option>";
	       	str = str + "<option value='35'>35</option>";
	       	str = str + "<option value='40'>40</option>";
	       	str = str + "<option value='45'>45</option>";
	       	str = str + "<option value='50'>50</option>";
	       	str = str + "<option value='55'>55</option></select>분 ~ ";
	       	
	      	str = str + "<select name='eduEdate_hh' id='eduEdate_hh'  title='교육종료 시간'>";
	     	str = str + "<option value='08'>08</option>";
			str = str + "<option value='09'>09</option>";
			str = str + "<option value='10'>10</option>";
			str = str + "<option value='11'>11</option>";
			str = str + "<option value='12'>12</option>";
			str = str + "<option value='13'>13</option>";
			str = str + "<option value='14'>14</option>";
			str = str + "<option value='15'>15</option>";
			str = str + "<option value='16'>16</option>";
			str = str + "<option value='17'>17</option>";
			str = str + "<option value='18'>18</option>";
			str = str + "<option value='19'>19</option>";
			str = str + "<option value='20'>20</option>";
			str = str + "<option value='21'>21</option>";
			str = str + "<option value='22'>22</option>";
			str = str + "</select>시&nbsp;";
			
			str = str + "<select name='eduEdate_mm' id='eduEdate_mm' title='교육종료 분'>";
			str = str + "<option value='00'>00</option>";
	       	str = str + "<option value='05'>05</option>";
	       	str = str + "<option value='10'>10</option>";
	       	str = str + "<option value='15'>15</option>";
	       	str = str + "<option value='20'>20</option>";
	       	str = str + "<option value='25'>25</option>";
	       	str = str + "<option value='30'>30</option>";
	       	str = str + "<option value='35'>35</option>";
	       	str = str + "<option value='40'>40</option>";
	       	str = str + "<option value='45'>45</option>";
	       	str = str + "<option value='50'>50</option>";
	       	str = str + "<option value='55'>55</option></select>분 &nbsp;&nbsp;";
	       
	       	
	       	str = str + "<a href='#' onclick='fnAdd();return false' title='추가' class='btn small blue'>추가</a>&nbsp;";
			
	       	str = str + "<a href='#' class='btn small red add_btn_minus'>삭제</a><br/></div>";         
		    
		 $('.addFileWrap').append(str);   
	     
		 $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
	} 


</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">방문교육관리</div>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/lecture/lectureExec.do" method="POST" enctype="multipart/form-data">
<input type="hidden" name="slno" id="slno" value="<c:out value="${REQUEST_DATA.slno}"/>"/>
<input type="hidden" name="applyNo" id="applyNo" value="<c:out value="${REQUEST_DATA.userno}"/>"/>
<input type="hidden" name="mtLctreCode" id="mtLctreCode" value=""/>
<input type="hidden" name="mtFcltsCode" id="mtFcltsCode" value=""/>
<input type="hidden" name="tutorUserno" id="tutorUserno" value="${map.TUTOR_USERNO}"/>
<input type="hidden" name="finalAt" id="finalAt" value="${map.FINAL_AT }">
<input type="hidden" name="filename" id="filename" value=""/>
<input type="hidden" name="saveFile" id="saveFile" value=""/>
<input type="hidden" name="listParam" id="listParam" value=""/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
<input type="hidden" name="count" id="count" value="${fn:length(dateResult)}"/>
<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />

<input type="hidden" name="dsSdate" id="dsSdate" value="${map.DS_SDATE}"/>
<input type="hidden" name="dsEdate" id="dsEdate" value="${map.DS_EDATE}"/>
<input type="hidden" name="sdate" id="sdate" value="${REQUEST_DATA.sdate}"/>
<input type="hidden" name="edate" id="edate" value="${REQUEST_DATA.edate}"/>
<input type="hidden" name="sMtLecStatusCode" id="sMtLecStatusCode" value="${REQUEST_DATA.sMtLecStatusCode}"/>
<input type="hidden" name="searchMode" id="searchMode" value="${REQUEST_DATA.searchMode}"/>
<input type="hidden" name="searchWord" id="searchWord" value="${REQUEST_DATA.searchWord}"/>

<div class="tb_title">신청정보</div>
<div id="lectureForm">
	<table class="table-type1 search_form">
	    <colgroup>
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
	    </colgroup>
	    <tbody>
	    	<c:if test="${empty REQUEST_DATA.slno}">
	    	<tr>
	            <th> 신청구분</th>
	            <td colspan="3">
	            	<select name="mtLecStatusCode" id="mtLecStatusCode" title="신청구분">  <!-- onchange="fnMtScCode(this.value);" -->
	                    <c:forEach var="emap2" items="${cmStatus}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${map.MT_LEC_STATUS_CODE ne null && emap2.MT_SUB_CODE eq map.MT_LEC_STATUS_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select>
	            </td>
	        </tr>
	        </c:if>
	    
	         <tr>
	            <th>신청자 성명</th>
	            <td>
	                <input type="text" name="applyNm"  id="applyNm"  value="<c:out value="${empty map.SLNO ? REQUEST_DATA.userNm : map.APPLY_NM}"/>"  style="width:200px" class="line"  class="line"/>
	            </td>
	            <th>기관명</th>
	            <td>
	               <input type="text" name="applyOrganNm"  id="applyOrganNm"  value="<c:out value="${map.APPLY_ORGAN_NM}"/>"  style="width:200px"  class="line"/>
	            </td>
	        </tr>
	         <tr>
	           <th rowspan="2">주소</th>
	            <td colspan="3">
	            	<%-- <select name="sidoCode" id="sidoCode" title="시도" style="height: 22px;">
	                    <c:forEach var="emap2" items="${sidoData}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${map.MT_LEC_STATUS_CODE ne null && emap2.MT_SUB_CODE eq map.MT_LEC_STATUS_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select>
	                <select name="guCode" id="guCode" title="구이름" style="height: 22px;">
	                   <option value="">선택</option>
	                </select>
	                <select name="dongCode" id="dongCode" title="동이름" style="height: 22px;">
	                    <option value="">선택</option>
	                </select>
	                <input type="text" name="applyOrganAddr"  id="applyOrganAddr"  value="<c:out value="${map.APPLY_ORGAN_ADDR}"/>"  style="width:200px"  class="line"/> --%>
	           <!-- ${map.SIDO_CODE}','${map.GU_CODE}','${map.DONG_CODE} -->
                    <input type="text" class="line" readonly="readonly" id="lnmZip" name="lelnmZip" value="<c:out value="${map.LE_LNM_ZIP}"/>" style="width:70px;"/>&nbsp;
                    <a href="#" onclick="zipSearch();" class= "btn gray small">우편번호검색</a>
             	</td>
            </tr>	
	        <tr>
                <td colspan="3">
                    <input type="text" class="line" readonly="readonly" id="lnmAdres1" name="lelnmAdres1" value="<c:out value="${map.LE_LNM_ADRES1}"/>" style="width:45%"/>&nbsp;&nbsp;
                    <input type="text" class="line" id="lnmAdres2" name="lelnmAdres2" value="<c:out value="${map.LE_LNM_ADRES2}"/>" style="width:45%"/>
                </td>
            </tr>	
	        
	        
	        <tr>
	            <th>교육 장소</th>
	            <td colspan="3"><input type="text" name="eduArea"  id="eduArea"  value="<c:out value="${map.EDU_AREA}"/>"  style="width:80%" class="line"></td>
	        </tr>
	        <tr>
	            <th>유선전화</th>
	            <td><input type="text" name="applyTel"  id="applyTel"  value="<c:out value="${empty map.SLNO ? REQUEST_DATA.userPhone : map.APPLY_TEL}"/>"  style="width:200px"  class="line"/></td>
	            <th> 휴대전화</th>
	            <td><input type="text" name="applyPhone"  id="applyPhone"  value="<c:out value="${empty map.SLNO ? REQUEST_DATA.userPhone : map.APPLY_PHONE}"/>"  style="width:200px"  class="line"/></td>
	        </tr>
	        <tr>
	            <th>이메일</th>
	            <td colspan="3">
	                <input type="text" name="applyEmail"  id="applyEmail"  value="<c:out value="${empty map.SLNO ? REQUEST_DATA.userEmail : map.APPLY_EMAIL}"/>"  style="width:200px"   class="line"/>
	            </td>
	        </tr>
	        <tr>
	            <th> 교육 희망일시</th>
	            <td colspan="3">
	            <div class="addFileWrap">
						 	<c:if test="${empty REQUEST_DATA.slno}">
		            <div class="mainClass">
							<input type="text" class="datepicker" name="eduSdate" id="eduSdate" value="" readonly="readonly" style="width: 75px; height: 17px"/>
					 		<label for="eduSdate"><img src="/admin/images/btn_calendar.png" alt="교육일"></label>
					 	
						 	<select name="eduSdate_hh" id="eduSdate_hh"  title="교육시작 시간">
								<c:forEach var="sh" begin="8" end="22" step="1">
								<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
								
								<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
								</c:forEach>
							</select>시
							<select name="eduSdate_mm" id="eduSdate_mm" title="교육시작 분">
								<c:forEach var="sh" begin="0" end="55" step="5">
								<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
								<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
								</c:forEach>
							</select>분
							~ 
							<select name="eduEdate_hh" id="eduEdate_hh"  title="교육시작 시간">
								<c:forEach var="sh" begin="8" end="22" step="1">
								<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
								
								<option value="<c:out value='${sh}' />" ><c:out value="${sh}" /></option>
								</c:forEach>
							</select>시
							<select name="eduEdate_mm" id="eduEdate_mm" title="교육시작 분">
								<c:forEach var="sh" begin="0" end="55" step="5">
								<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
								<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
								</c:forEach>
							</select>분 &nbsp;
							<a href="#"  onclick="fnAdd();return false" title="추가" class= "btn small blue">추가</a>
							<br />
						</div>	
							</c:if>
							
							<c:forEach var="result"  items="${dateResult}" varStatus="status">
								<%-- <c:if test="${status.index >= 1}"> --%>
									<div class="mainClass">
									<input type="text" class="datepicker" name="eduSdate" id="eduSdate"+${status.index} value="${result.EDU_DAY }" readonly="readonly" style="width: 75px; height: 17px"/>
							 		<label for="eduSdate"+${status.index}><img src="/admin/images/btn_calendar.png" alt="교육일"></label>
							 	
								 	<select name="eduSdate_hh" id="eduSdate_hh"  title="교육시작 시간">
										<c:forEach var="sh" begin="8" end="22" step="1">
										<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
										
										<option value="<c:out value='${sh}' />" <c:if test="${result.EDU_SDATE_HH == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
										</c:forEach>
									</select>시
									<select name="eduSdate_mm" id="eduSdate_mm" title="교육시작 분">
										<c:forEach var="sh" begin="0" end="55" step="5">
										<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
										<option value="<c:out value='${sh}' />"<c:if test="${result.EDU_SDATE_MM == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
										</c:forEach>
									</select>분
									~ 
									<select name="eduEdate_hh" id="eduEdate_hh"  title="교육시작 시간">
										<c:forEach var="sh" begin="8" end="22" step="1">
										<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
										
										<option value="<c:out value='${sh}' />" <c:if test="${result.EDU_EDATE_HH == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
										</c:forEach>
									</select>시
									<select name="eduEdate_mm" id="eduEdate_mm" title="교육시작 분">
										<c:forEach var="sh" begin="0" end="55" step="5">
										<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
										<option value="<c:out value='${sh}' />"<c:if test="${result.EDU_EDATE_MM == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
										</c:forEach>
									</select>분 &nbsp;
									<a href="#"  onclick="fnAdd();return false" title="추가" class= "btn small blue">추가</a>
									<c:if test="${status.index ne 0}">
									<a href='#' class='btn small red add_btn_minus'>삭제</a>
									</c:if>
									<br />
									</div>
								<%-- </c:if> --%>
							</c:forEach>
							
							
					
				</div><!-- .addFileWrap -->	
						<font color="#ff0000">※ 시간까지 명시하여 주세요.</font>
	            </td>
	        </tr>
	        <tr>
	            <th>신청경로</th>
	            <td colspan="3">
	            	<c:forEach var="result"  items="${lrStatus}" varStatus="status">
	            		<input type="radio" name="mtLecRouteCode" id="mtLecRouteCode_${status}" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq map.MT_LEC_ROUTE_CODE }" >checked="checked" </c:if>>${result.MT_SUB_NAME} &nbsp;&nbsp;
	            	</c:forEach>
	            </td>
	        </tr>
	        <tr>
	            <th>교육대상</th>
	            <td colspan="3">
	            	<c:forEach var="result"  items="${cmTargets}" varStatus="status">
	            		<input type="radio" name="mtLecTargetCode" id="mtLecTargetCode_${status}" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq map.MT_LEC_TARGET_CODE }" >checked="checked" </c:if>>${result.MT_SUB_NAME} &nbsp;&nbsp;
	            	</c:forEach>
	            	
					<span><input type="text" name="targetEtc"  id="targetEtc" value="<c:out value="${map.TARGET_ETC}"/>"   style="width:150px"  class="line"/></span>
	            </td>
	        </tr>
	        <tr>
	            <th>참석인원</th>
	            <td colspan="3">
	            	<input type="text" name="personCnt"  id="personCnt"  value="<c:out value="${map.PERSON_CNT}"/>"  style="width:150px"  class="line"/> 명
	            </td>
	        </tr>
	         <tr>
	            <th>교육 희망주제</th>
	            <td colspan="3">
	            	<c:set var="eduFacArr" value="${fn:split(map.MT_LCTRE_CODE,',')}"/>
	            	<c:forEach var="result"  items="${cmHopes}" varStatus="status">
	            		<c:set var="checkedYn" value="N"/>
		                	<c:forEach var="i" begin="0" end="${fn:length(eduFacArr)}">
								<c:if test="${result.MT_SUB_CODE eq eduFacArr[i]}">
									<c:set var="checkedYn" value="Y"/>
								</c:if>
							</c:forEach>
	            		<input type="checkbox" name="mtLctreCodeArr" id="mtLctreCode_${status}" value="${result.MT_SUB_CODE}" <c:if test="${checkedYn eq 'Y'}">checked="checked"</c:if> >${result.MT_SUB_NAME} &nbsp;&nbsp;
	            	</c:forEach>
	            </td>
	        </tr>
	        <tr>
               <th scope="row">교육 시설정보</th>
               <td colspan="3">
               	 <c:set var="eduFacArr" value="${fn:split(map.MT_FCLTS_CODE,',')}"/>
               	 <c:forEach var="result"  items="${cmFclts}" varStatus="status">
               	 	<c:set var="checkedYn" value="N"/>
               	 	<c:forEach var="i" begin="0" end="${fn:length(eduFacArr)}">
								<c:if test="${result.MT_SUB_CODE eq eduFacArr[i]}">
									<c:set var="checkedYn" value="Y"/>
								</c:if>
					</c:forEach>
                 	<input type="checkbox" name="mtFcltsCodeArr" id="mtFcltsCodeArr_${status}" value="${result.MT_SUB_CODE}" <c:if test="${checkedYn eq 'Y'}">checked="checked"</c:if> >${result.MT_SUB_NAME} &nbsp;&nbsp;
					<c:if test="${result.MT_SUB_CODE=='FA07'}"><input type="text" name="fcltsEtc"  id="fcltsEtc" <c:if test="${checkedYn eq 'Y'}">value="${map.FCLTS_ETC}"</c:if> class="form-control-static mrg_l5 w160"/></c:if>
					
				</c:forEach>
               </td>
           	</tr>
	        <tr>
	            <th>기타 요청사항</th>
	            <td colspan="3">
	            	<textarea rows="5" name="eduContents"  id="eduContents"  style="width:100%;" maxlength="80"><c:out value="${map.EDU_CONTENTS}"/></textarea>
	            </td>
	        </tr>
	    </tbody>
	</table>
	
	<c:if test="${not empty REQUEST_DATA.slno}">
	<div class="tb_title" style="margin-top: 20px;">강사 및 관리정보</div>
	
	<table class="table-type1 search_form">
	    <colgroup>
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
	    </colgroup>
	    <tbody>
	    	<tr>
	            <th> 신청구분</th>
	            <td colspan="3">
	            	<select name="mtLecStatusCode" id="mtLecStatusCode" title="신청구분"  onchange="fnMtScCode(this.value);">
	                    <c:forEach var="emap2" items="${cmStatus}" varStatus="status2">
							<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${map.MT_LEC_STATUS_CODE ne null && emap2.MT_SUB_CODE eq map.MT_LEC_STATUS_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <th>협의일시</th>
	            <td colspan="3">
	                <span id="dsDate_1">
						<input type="text" class="line" name="dsDay" id="dsDay" value="${empty map.DS_DAY ? '' : map.DS_DAY}" readonly="readonly" style="width: 75px;"/>
				 		<a href="#" onclick="$('#dsDay').focus(); return false;" class=""><img src="/admin/images/btn_calendar.png" alt="교육일"></a>
				 	
					 	<select name="dsSdate_hh" id="dsSdate_hh"  title="교육시작 시간">
							<c:forEach var="sh" begin="0" end="23" step="1">
							<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
							
							<option value="<c:out value='${sh}' />" <c:if test="${(empty map.DS_SDATE_HH ? map.EDU_SDATE_HH : map.DS_SDATE_HH)  == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
							</c:forEach>
						</select>시
						<select name="dsSdate_mm" id="dsSdate_mm" title="교육시작 분">
							<c:forEach var="sh" begin="0" end="59" step="1">
							<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
							<option value="<c:out value='${sh}' />"<c:if test="${(empty map.DS_SDATE_MM ? map.EDU_SDATE_MM : map.DS_SDATE_MM) == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
							</c:forEach>
						</select>분
						~ 
						<select name="dsEdate_hh" id="dsEdate_hh"  title="교육시작 시간">
							<c:forEach var="sh" begin="0" end="23" step="1">
							<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
							
							<option value="<c:out value='${sh}' />" <c:if test="${(empty map.DS_EDATE_HH ? map.EDU_EDATE_HH : map.DS_EDATE_HH) == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
							</c:forEach>
						</select>시
						<select name="dsEdate_mm" id="dsEdate_mm" title="교육시작 분">
							<c:forEach var="sh" begin="0" end="59" step="1">
							<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
							<option value="<c:out value='${sh}' />"<c:if test="${(empty map.DS_EDATE_MM ? map.EDU_EDATE_MM : map.DS_EDATE_MM) == sh}"> selected="selected"</c:if>><c:out value="${sh}" /></option>
							</c:forEach>
						</select>분
						<br />
					</span>
					<font color="#ff0000">※ 시간까지 명시하여 주세요.</font>
	            </td>
	        </tr>
			<tr>
	            <th>강사명</th>
	            <td colspan="3">
	                <input type="text" name="tutorNm"  id="tutorNm" readonly="readonly" value="${map.MBERNM}"  style="width:200px"   class="line"/>
             			<span id="compTutor" <c:if test="${empty map.TUTOR_USERNO || map.FINAL_AT ne 'Y'}">style="display: none;"</c:if>>
						<a href="#" onclick="tutorSave('N'); return false;" class= "btn small red">삭제</a>
		            </span>
            			<span id="emptyTutor" <c:if test="${not empty map.TUTOR_USERNO && map.FINAL_AT eq 'Y'}">style="display: none;"</c:if>>
		                <a href="#" onclick="popTutor(); return false;" class= "btn small gray">검색</a>
		                <a href="#" onclick="tutorSave('Y'); return false;" class= "btn small blue">확정</a>
		            </span>
	                
	                <span id="tutorText" style="padding-left: 10px;font-weight: bold;color: blue;" >
	                <c:choose>
	                	<c:when test="${not empty map.TUTOR_USERNO && map.FINAL_AT eq 'Y'}">강사배정이 확정되었습니다.</c:when>
	                	<c:when test="${not empty map.TUTOR_USERNO && map.FINAL_AT eq 'N'}">강사 신청중입니다. 확정해주세요.</c:when>
	                	<c:otherwise>등록된 강사가 없습니다.</c:otherwise>
	                </c:choose>
	                </span> 
	            </td>
	        </tr>
	        <tr>
	            <th>강사료</th>
	            <td>
	            	<input type="text" name="pay" id="pay"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'  class="line" onchange="getNumber(this);" 
            	onkeyup="getNumber(this);"  style="text-align:right;width:150px" value="<fmt:formatNumber value="${map.PAY}" pattern="#,###" />" /> 원
            	<a href="#" onclick="popPay(); return false;" class= "btn small blue">자동계산</a>
            	</td>
            	
            	<th>출장비</th>
	            <td>
	            		<input type="text" name="ptrps" id="ptrps"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'  class="line" onchange="getNumber(this);" 
            	onkeyup="getNumber(this);"  style="text-align:right;width:150px" value="<fmt:formatNumber value="${map.PTRPS}" pattern="#,###" />" /> 원</td>
	        </tr>
	         <tr>
	            <th>기타정보</th>
	            <td colspan="3">
	            	<textarea rows="5" name="comContent"  id="comContent"  style="width:100%;" maxlength="80"><c:out value="${map.COM_CONTENT}"/></textarea>
	            </td>
	        </tr>
	        
	    </tbody>
	</table>
	
	
	<div class="tb_title" style="margin-top: 20px;">강사 결과보고</div>
		
	<table class="table-type1 search_form">
	    <colgroup>
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
	        <col class="cellc" width="8%">
	        <col class="celll" width="35%">
	    </colgroup>
	    <tbody>
	    	<tr>
	            <th>참석결과인원</th>
	            <td colspan="3"><input type="text" name="com_cnt" id="com_cnt"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'  class="line" 
            	onkeyup="getNumber(this);"  style="text-align:right;width:150px" value="<c:out value="${map.COM_CNT }" default="0"/>" />명 </td>
	        </tr>
	        <tr>
	            <th>만족도(수강생)</th>
	            <td>
	            	<input type="text" name="applyScore" id="applyScore"  class="line" 
            		  style="text-align:right;width:150px" value="<c:out value="${map.APPLY_SCORE }" />"/>
	            	<%-- <c:out value="${map.APPLY_SCORE }" /> --%>
	            </td>
	            <th>만족도(수요처)</th>
	            <td>
	            	<input type="text" name="organScore" id="organScore"  class="line" 
            		  style="text-align:right;width:150px" value="<c:out value="${map.ORGAN_SCORE }"/>" />
	            	<%-- <c:out value="${map.ORGAN_SCORE }"/> --%>
            	</td>
	        </tr>
	        <tr>
	            <th>교육확인서</th>
	            <td colspan="3" class="td-input-wrap">
						<c:forEach var="result"  items="${fileInfo}" varStatus="status">
						<div class="file-wrap">
							<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0001' }">
								<c:set value="${status.count}" var="file1"/>
								<span class="a_file"><a class="a_file" href="#none"  title="첨부파일 다운로드"onclick="filedown('<c:out value="${result.ORGFILE}" />','<c:out value="${result.SAVFILE}"/>');return false" ><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</a></span>
								<a href="#" onclick="deleteReportFile('<c:out value="${result.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${result.SLNO}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.SAVPATH}"/>');return false" class= "btn small red">삭제</a>
							</c:if>
						</div>
						</c:forEach>
						<c:if test="${empty file1}">
		            		<input type="file" name="uploadReportFile" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/>
	            		</c:if>
						<%-- <c:if test="${file1 == null}">
							<div  id="eduDate_" class="input-wrap mb15">
								<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
			            		<div class="file_input_div">
			            			<input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
								</div>
	                        </div>
						</c:if> --%>
	            </td>
	        </tr>
	        <tr>
	            <th>기타자료</th>
	            <td colspan="3" class="td-input-wrap">
						<c:forEach var="result"  items="${fileInfo}" varStatus="status">
						<div class="file-wrap">
							<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0002' }">
								<c:set value="${status.count}" var="file2"/>
								<span class="a_file"><a class="a_file" href="#none"  title="첨부파일 다운로드"onclick="filedown('<c:out value="${result.ORGFILE}" />','<c:out value="${result.SAVFILE}"/>');return false" ><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</a></span>
								<a href="#" onclick="deleteReportFile('<c:out value="${result.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${result.SLNO}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.SAVPATH}"/>');return false" class= "btn small red">삭제</a>
							</c:if>
						</div>
						</c:forEach>
						<c:if test="${empty file2}">
		            		<input type="file" name="uploadReportFile2" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/>
	            		</c:if>
						<%-- <c:if test="${file1 == null}">
							<div  id="eduDate_" class="input-wrap mb15">
								<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
			            		<div class="file_input_div">
			            			<input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
								</div>
	                        </div>
						</c:if> --%>
	            </td>
	        </tr>
	    </tbody>
	</table>
	</c:if>
</div>

<script type="text/javascript">
$(document).ready(function() {
/* 	
	// 교육확인서 업로드체크
	$( "#uploadFile1" ).click(function() {
		if($("#imgCheck1").length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$("#qu").val("update");
				$("#myTutorFileCode").val("update");
				
			}
		}
	}); */
});


//삭제
function deleteReportFile(mtTutorFileCode , slno , saveFile , saveFilePath){
	if(confirm("파일을 삭제하시겠습니까?")){
		$('#qu').val('delete');
		$('#mtTutorFileCode').val(mtTutorFileCode);
		$('#slno').val(slno);
		$('#saveFile').val(saveFile);
		$('#saveFilePath').val(saveFilePath);
		
		 $.ajax({
	            url : "/admin/lecture/lectureDeleteFile.do",
	            data : {slno : slno, mtTutorFileCode : mtTutorFileCode},
	            dataType : "json",
	            type : 'post',
	            success : function(res) { 
	            	if(res == "SUCCESS"){
	            		alert("삭제되었습니다.");	
	            		location.reload();
	            	}else{
	            		alert('일시적인 오류가 발생했습니다');
	            	}
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
	        }); 
		
		
		
		/* $('#frm').attr('action', '/admin/lecture/lectureDeleteFile.do').submit(); */
	}else{
		return false;
	}
}

</script>

<!--  버튼  -->
<div class="button">
	<c:choose>
	<c:when test="${empty REQUEST_DATA.slno}">
        <a href="#" onclick="fnSave(); return false;" class= "btn big blue">등록</a>
    </c:when>
    <c:otherwise>
        <a href="#" onclick="fnSave(); return false;" class= "btn big green">수정</a>
    </c:otherwise>
    </c:choose>
    <a href="#" onclick="history.back()" class="btn big gray">취소</a>
</div>
</form>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	