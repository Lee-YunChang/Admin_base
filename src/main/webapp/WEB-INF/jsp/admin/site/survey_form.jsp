<%
/****************************************************
system	: 상시설문 등록/수정 폼
title	: 상시설문  등록/수정 폼
summary	:
wdate	: 2015-08-30
writer	: 황두은
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%> 
<% 
	//달력 호출시 사용 ( 지정일자 없을시 현재일 호출)
	String today = DateUtil.getNowDate();
%> 
<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%> 
<script language="javascript">
	<!--
	            window.name="surveyForm";
	//-->
</script>
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
		yearRange: '2014:2025'
	};	
	
	$(document).ready(function(){
		if($("#msg").val().length > 0 ){
			alert($("#msg").val());
			 fnExcel();
		}
		$("#sdate").datepicker(dateFormat);
		$("#edate").datepicker(dateFormat);
		
		$('select').each(function(index, element) {
		 	if($(this).val() == 'JBBA00') { //객관식
				$(this).siblings("#doubleBox").show(); 
			} else { //주관식
				$(this).siblings("#doubleBox").hide(); 
			}
		});
		
	});
	
	var form = document.form;
	
	//모듈 추가
	$(document).on('click', '#addModule', function(){ 
		$("#table").append("<div style='background:#eaeff2;height:10px;'></div><div class='module' id='module' name='module' style='padding:5px 20px; font-size:16px; color:#33485d;'></br><strong>모듈명&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='cpollTitle' id='cpollTitle' style='width:585px'/> <input type='button' class='btn brown' id='addModule' name='addModule' value='모듈추가'> <input type='button' class='btn gray' id='minusModule' name='minusModule' value='삭제'></br><ol style='background:#fff;'><div id='questions'><div class='question' id='question' name='question' style='padding:10px;margin:10px'></br><strong style='font-size:15px;'>* 형태&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='hidden' id='countItem' name='countItem'><select name='mtCpollCode' id='mtCpollCode' title='문제유형'><option value='JBBA00'>${mtSubCode[1]. MT_SUB_NAME}</option><option value='JBAA00'>${mtSubCode[0]. MT_SUB_NAME}</option></select> <span id='doubleBox'><input type='checkbox' id='doubleAt' name='doubleAt'>복수응답 허용</span></br></br><input type='hidden' id='doubleAtyn' name='doubleAtyn'><li style='-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'><strong style='font-size:15px;'>질문&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='subject' id='subject' style='width:575px'/></li><input type='hidden' id='' name=''><input type='hidden' id='cpollTitleValue' name='cpollTitleValue'></br><div id='itemsMenu' style='display: block;'><ol id='items' style='-webkit-margin-start:1em'><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li></ol></div></br><input type='button' id='addQuestion' class='btn green' name='addQuestion' value='질문추가'> <input type='button' id='minusQuestion'  class='btn gray'  value='질문삭제'></div></div></ol></div>");									
		return false;
	});
	
	//모듈 삭제
	$(document).on('click', '#minusModule', function(){ 
		var count = $(this).parents("#table").children("#module").length;
		if(count < 2) {
			alert('모듈은 하나 이상이어야 합니다.');
		} else if(count >= 2) {
			$(this).parent("#module").remove();
		}
		return false;
	});
	
	//질문 추가
	$(document).on('click', '#addQuestion', function(){ 
 	$(this).parents("#question").after("<div style='background:#B5D2DA;height:10px;'></div><div style='padding:10px;margin-bottom:10px' class='question' id='question' name='question'></br><strong style='font-size:15px;'>* 형태&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='hidden' id='countItem' name='countItem'><select name='mtCpollCode' id='mtCpollCode' title='문제유형'><option value='JBBA00'>${mtSubCode[1]. MT_SUB_NAME}</option><option value='JBAA00'>${mtSubCode[0]. MT_SUB_NAME}</option></select> <span id='doubleBox'><input type='checkbox' id='doubleAt' name='doubleAt'>복수응답 허용</span></br></br><input type='hidden' id='doubleAtyn' name='doubleAtyn'><li style='-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'><strong style='font-size:15px;'>질문&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='subject' id='subject' style='width:575px'/></li><input type='hidden' id='' name=''><input type='hidden' id='cpollTitleValue' name='cpollTitleValue'></br><div id='itemsMenu' style='display: block;'><ol id='items' style='-webkit-margin-start:1em'><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li><li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li></ol></div></br><input type='button' id='addQuestion' class='btn green' name='addQuestion' value='질문추가'> <input type='button' id='minusQuestion'  class='btn gray'  value='질문삭제'></div>");	
	return false;
	});
	
	//질문 삭제
	$(document).on('click', '#minusQuestion', function(){ 
		$(this).parent("#question").remove();
		return false;
	});
	
	//객관식 보기 추가
	$(document).on('click', '#plus', function(){ 
		var count = $(this).parents("#items").children().length
		if(count > 9) {
			alert('보기는 열 개 이하여야 합니다.');
		} else if (count <= 10) {
			$(this).parents("#item").after("<li id='item' style='padding-top:5px; list-style:decimal;'><div id=itemQno name='itemQno'></div><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='btn brown' id='plus' value='+'> <input type='button' class='btn gray' id='minus' value='x'></br></li>")
		}
		return false;
	});
	
	//객관식 보기 삭제
	$(document).on('click', '#minus', function(){ 
		
		var count = $(this).parents("#items").children().length
		
		if(count < 3) {
			alert('보기는 두 개 이상이어야 합니다.')
		} else if (count >= 3) {
			$(this).parent("#item").remove()
		}
		return false;
	});
	
	//객관식 주관식에 따라 문항변화
	$(document).on('change', '#mtCpollCode', function(){
		if($(this).val() == 'JBBA00') { //객관식
			$(this).siblings("#itemsMenu").append("<ol id='items' style='-webkit-margin-start:1em'><li id='item'><div id=itemQno name='itemQno'></div> <input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='plus' id='plus' value='+'> <input type='button' class='delete' id='minus' value='x'></br></li><li id='item'><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='plus' id='plus' value='+'> <input type='button' class='delete' id='minus' value='x'></br></li><li id='item'><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='plus' id='plus' value='+'> <input type='button' class='delete' id='minus' value='x'></br></li><li id='item'><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='plus' id='plus' value='+'> <input type='button' class='delete' id='minus' value='x'></br></li><li id='item'><input type='hidden' id='itemOrdr' name='itemOrdr'><div name='itemVal' id='itemVal' value='1'> </div><div name='itemNo' id='itemNo' value='1'> </div><input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/> <input type='button' class='plus' id='plus' value='+'> <input type='button' class='delete' id='minus' value='x'></br></li></ol>")
			$(this).siblings("#doubleBox").show(); 
		} else { //주관식
			$(this).siblings("#itemsMenu").children("#items").remove(); 
			$(this).siblings("#doubleBox").hide(); 
		}
	});
</script>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">상시설문 ${titleMode}</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="form" action="/admin/site/surveyExec.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" id="pollcseqno" name="pollcseqno" value="<c:out value="${surveyInfo.POLLCSEQNO}"/>"/>
    <input type="hidden" id="qu" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
	<input type="hidden" id="pollcseqno2" name="pollcseqno2" value="<c:out value="${REQUEST_DATA.pollcseqno2}"/>"/>
	<input type="hidden" id="pageMode" name="pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
	<input type="hidden" id="cnt" name="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>"/>
	<input type="hidden" id="excelyn" name="excelyn" value="${REQUEST_DATA.excelyn}"/>
	<input type="hidden" id="msg" name="msg" value="${msg}"/>
	
	<table class="table-type1 search_form">
 		<colgroup>
		  	<col class="cellc" width="10%">
		  	<col class="celll" width="90%">
		  </colgroup>
		<tbody>
			<tr>
				<th><em>*</em>설문명</th>
				<td> 
					<input type="text" class="line" name="title" id="title"style="width:500px"  value="<c:out value="${surveyInfo.TITLE}"/>"/>
				</td>
			</tr>
			<tr>
				<th><em>*</em>설문기간</th>
				
				<td>
				<span id="dateSelect">
				<input type="text" class="line dateText" name="sdate" id="sdate"  value="<c:out value="${surveyInfo.SDATE}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#sdate').focus(); return false;">
				 		<img src="/admin/images/btn_calendar.png" alt="설문기간 시작일">
				 	</a>
				~
				<input type="text" class="line dateText" name="edate" id="edate" value="<c:out value="${surveyInfo.EDATE}"/>" readonly="readonly" style="width: 75px;"/>
					<a href="#" onclick="$('#edate').focus(); return false;">
						<img src="/admin/images/btn_calendar.png" alt="설문기간 종료일">
					</a>
				</span> 
			</td>
			</tr>
			<tr>
				<th>설문설명</th>
				<td>
					<textarea class="line" name="summary" id="summary" style="overflow-y: scroll;width:500px;height:80px"  value="<c:out value="${surveyInfo.SUMMARY}"/>"></textarea>
				</td>
			</tr>
			<tr>
				<th><em>*</em>사용여부</th>
				<td>
					<input type="radio" name="useyn" value="Y" <c:if test="${surveyInfo.USEYN eq 'Y'}"> checked="checked" </c:if> checked/> 사용 &nbsp;
					<input type="radio" name="useyn" value="N" <c:if test="${surveyInfo.USEYN eq 'N'}"> checked="checked" </c:if> /> 사용안함
				</td>
			</tr>
		</tbody> 
	</table>
<c:choose>
<c:when test="${REQUEST_DATA.excelyn eq 'Y'}">
	<!-- 등록이고 엑셀을 등록했을 때 -->
	<c:forEach var="real" items="${real}" varStatus="status"> 
		<c:if test="${real.col6 eq '1'}"><input type='hidden' name='itemOrdr'value="<c:out value='${real.col4}'/>"></c:if>
		<c:if test="${real.col6 eq '1'}"><input type='hidden' name='itemSubject'value="<c:out value='${real.col5}'/>"></c:if>
	</c:forEach>
	
	</br>
	<div id='table'style='background:#b5d1d9;padding:0 20px 10px 20px;'>
		<c:forEach var="real" items="${real}" varStatus="status"> 
			<div class='module' id='module' name='module' style='font-size:16px;'>
			
				<c:if test="${real.moduleyn eq 'N'}">
					</br><strong>모듈명&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<c:out value='${real.col1}'/></strong>
				</c:if>
			
				<ol style='background:#fff;'>
				
					<c:if test="${real.questionyn eq 'N'}">
						<div style='background:#B5D2DA;height:10px;'></div>
						<div class='question' id='question' name='question' style='padding:20px 20px 0 20px'> 
							<input type='hidden' id='mtCpollCode'name='mtCpollCode' <c:if test="${real.col6 eq '1'}">value='JBBA00'</c:if><c:if test="${real.col6 eq '2'}">value='JBAA00'</c:if>>
							<input type='hidden' id='qno'  value="<c:out value='${real.col2}'/>"/>
							<strong style="font-size:15px;">* 형태&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
								<c:if test="${real.col6 eq '1'}">${mtSubCode[1]. MT_SUB_NAME}</c:if>
								<c:if test="${real.col6 eq '2'}">${mtSubCode[0]. MT_SUB_NAME}</c:if>
							</strong>
							</br></br>
							
							<li style='list-style:none;-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'>
								<c:out value='${real.col2}'/>.&nbsp;
								<strong style="font-size:15px;">질문&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
									<input type='hidden' class='line'id='subject' name='subject'style='width:600px' value="<c:out value='${real.col3}'/>"/>
									<c:out value='${real.col3}'/><c:if test="${real.col7 eq 'Y'}">(복수응답 허용)</c:if>
								</strong>
								</br></br>
								<input type='hidden' id='ExceldoubleAt' name='ExceldoubleAt'<c:if test="${real.col7 eq 'Y'}"> value='Y' </c:if><c:if test="${real.col7 eq 'N'}"> value='N' </c:if>>
								<input type='hidden' class='line'  id='ExcelcpollTitleValue'  name='ExcelcpollTitleValue'style='width:600px' value="<c:out value='${real.col1}'/>"/>
								<input type='hidden' id='ExcelcountItem' name='ExcelcountItem'>
							</li>
							<input type='hidden' id='cpollTitleValue' ></br>
						</div>
					</c:if>
					
				<div id='itemsMenu' style='display: block;display: block;padding:0 20px 10px 20px'>
					<ol id='items' style='-webkit-margin-start:2em;list-style:none'>
						<c:if test="${real.col6  == 1}">
							<li id='item'style='list-style:none;'>
								<div id=itemQno ></div>
								<input type='hidden' id='itemOrdr' class='itemOrdr'value="<c:out value='${real.col4}'/>">
								<div id='itemVal' value='1'> </div>
								<div  id='itemNo' value='1'> </div>
								<input type='hidden' class='line' id='itemSubject' style='width:600px' value="<c:out value='${real.col5}'/>"/>
								<c:out value='${real.col4}'/> . <c:out value='${real.col5}'/>
							</li>
						</c:if>
					</ol>
				</div>
				</ol>
			</div>
		</c:forEach>
	</div> 	
	<!-- // 등록이고 엑셀을 등록했을 때 -->
	</c:when>
	<c:when test="${surveyInfo.POLLCSEQNO == null && REQUEST_DATA.qu == 'insert'}">
	<!-- 등록이고 설문지 가져오기를 안했을 때 -->
	</br>
	<div id='table' style='background:#b5d1d9';>
	<div class='module' id='module' name='module' style='padding:5px 20px; font-size:16px; color:#33485d;'></br>
	<strong>모듈명&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='cpollTitle' id='cpollTitle' style='width:585px'/>
	<input type="button" class="btn brown" id="addModule" name="addModule" value="모듈추가">
	<input type="button" class="btn gray" id="minusModule" name="minusModule" value="삭제"></br>
	<ol style='background:#fff;'>
		<div id='questions'>
			<div class='question' id='question' name='question' style='padding:10px;margin:10px'> </br>
			<strong style="font-size:15px;">* 형태&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='hidden' id='countItem' name='countItem'>
			<select name='mtCpollCode' id='mtCpollCode' title='문제유형'>
				<option value='JBBA00'>${mtSubCode[1]. MT_SUB_NAME}</option>
				<option value='JBAA00'>${mtSubCode[0]. MT_SUB_NAME}</option>
			</select>
			<span id='doubleBox'><input type='checkbox' id='doubleAt' name='doubleAt' <c:if test="${result.DOUBLE_AT eq 'Y'}"> checked="checked" </c:if>>복수응답 허용</span></br></br>
			<input type='hidden' id='doubleAtyn' name='doubleAtyn'> 
			<li style='-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'><strong style="font-size:15px;">질문&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='subject' id='subject' style='width:575px'/></li>
			<input type='hidden' id='' name=''><input type='hidden' id='cpollTitleValue' name='cpollTitleValue'></br>
				<div id='itemsMenu' style='display: block;'>
					<ol id='items' style='-webkit-margin-start:1em'>
						<li id='item' style='padding-top:5px; list-style:decimal;'>
							<div id=itemQno name='itemQno'></div>
							<input type='hidden' id='itemOrdr' name='itemOrdr'>
							<div name='itemVal' id='itemVal' value='1'> </div>
							<div name='itemNo' id='itemNo' value='1'> </div>
							<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/>
							<input type="button" class="btn brown" id="plus" value="+">
							<input type="button" class="btn gray" id="minus" value="x">
							</br>
						</li>
						
						<li id='item' style='padding-top:5px; list-style:decimal;'>
							<div id=itemQno name='itemQno'></div>
							 
							<input type='hidden' id='itemOrdr' name='itemOrdr'>
							<div name='itemVal' id='itemVal' value='1'> </div>
							<div name='itemNo' id='itemNo' value='1'> </div>
							<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/>
							<input type="button" class="btn brown" id="plus" value="+">
							<input type="button" class="btn gray" id="minus" value="x"></br>
						</li>
						
						<li id='item' style='padding-top:5px; list-style:decimal;'>
							<div id=itemQno name='itemQno'></div>
							 
							<input type='hidden' id='itemOrdr' name='itemOrdr'>
							<div name='itemVal' id='itemVal' value='1'> </div>
							<div name='itemNo' id='itemNo' value='1'> </div>
							<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/>
							<input type="button" class="btn brown" id="plus" value="+">
							<input type="button" class="btn gray" id="minus" value="x"></br>
						</li>
						
						<li id='item' style='padding-top:5px; list-style:decimal;'>
							<div id=itemQno name='itemQno'></div>
							 
							<input type='hidden' id='itemOrdr' name='itemOrdr'>
							<div name='itemVal' id='itemVal' value='1'> </div>
							<div name='itemNo' id='itemNo' value='1'> </div>
							<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/>
							<input type="button" class="btn brown" id="plus" value="+">
							<input type="button" class="btn gray" id="minus" value="x"></br>
						</li>
						
						<li id='item' style='padding-top:5px; list-style:decimal;'>
							<div id=itemQno name='itemQno'></div>
							 
							<input type='hidden' id='itemOrdr' name='itemOrdr'>
							<div name='itemVal' id='itemVal' value='1'> </div>
							<div name='itemNo' id='itemNo' value='1'> </div>
							<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px'/>
							<input type="button" class="btn brown" id="plus" value="+">
							<input type="button" class="btn gray" id="minus" value="x"></br>
						</li>
					</ol>
				</div></br>
			<input type="button" id="addQuestion" class="btn green" name="addQuestion" value="질문추가">
			<input type="button" id="minusQuestion"  class="btn gray"  value="질문삭제">
			</div>
		</div>
		</ol>
	</div>
	</div>
	 <!-- //등록이고 설문지 가져오기를 안했을 때 -->
	</c:when>
	
	<c:when test="${surveyInfo.POLLCSEQNO !=null && REQUEST_DATA.qu == 'insert'}">
	<!-- 등록이고 설문지 가져오기를 했을 때 -->
		</br>
		<div id='table' style='background:#b5d1d9';>
		<c:forEach var="moduleList" items="${moduleList}" varStatus="status">
		<div style='background:#eaeff2;height:10px;'></div>
		<div class='module' id='module' name='module' style='padding:5px 20px; font-size:16px; color:#33485d;'></br>
	
		<strong>모듈명&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='cpollTitle' id='cpollTitle' style='width:600px' value="<c:out value='${moduleList.CPOLL_TITLE}'/>"/>
		<input type="button" class="btn brown" id="addModule" name="addModule" value="모듈추가">
		<input type="button" class="btn gray" id="minusModule" name="minusModule" value="삭제"></br>
		
		<ol style='background:#fff;'>
			<c:forEach var="questionList" items="${questionList}" varStatus="status">
			<c:if test="${moduleList.CPOLL_TITLE == questionList.CPOLL_TITLE}">
			
			<div id='questions'>
				<div style='background:#B5D2DA;height:10px;'></div>
				<div class='question' id='question' name='question' style='padding:10px;margin:10px'>
				
				<strong style="font-size:15px;">* 형태&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='hidden' id='countItem' name='countItem'>
				
				<select name='mtCpollCode' id='mtCpollCode' title='문제유형'>
					<option value='JBBA00' <c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}">SELECTED</c:if>>${mtSubCode[1]. MT_SUB_NAME}</option>
					<option value='JBAA00' <c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">SELECTED</c:if>>${mtSubCode[0]. MT_SUB_NAME}</option>
				</select>
				
				<span id='doubleBox'><input type='checkbox' id='doubleAt' name='doubleAt' <c:if test="${questionList.DOUBLE_AT eq 'Y'}"> checked="checked" </c:if>>복수응답 허용</span></br></br>
				<input type='hidden' id='doubleAtyn' name='doubleAtyn'>
				<input type='hidden' id='qno' name='qno' value="<c:out value='${questionList.QNO}'/>"/>
				<li style='-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'><strong style="font-size:15px;">질문&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='subject' id='subject' style='width:600px' value="<c:out value='${questionList.SUBJECT}'/>"/></li>
				<input type='hidden' id='' name=''><input type='hidden' id='cpollTitleValue' name='cpollTitleValue'></br>
					<div id='itemsMenu' style='display: block;'>
						<ol id='items' style='-webkit-margin-start:1em'>
							<c:forEach var="resultList" items="${resultList}" varStatus="status">
							<c:if test="${questionList.QNO == resultList.QNO}">
							<c:if test="${resultList.ITEM_SUBJECT != null && resultList.ITEM_SUBJECT != ''}">
								<li id='item' style='padding-top:5px; list-style:decimal;'>
									<div id=itemQno name='itemQno'></div>
									 
									<input type='hidden' id='itemOrdr' name='itemOrdr'>
									<div name='itemVal' id='itemVal' value='1'> </div>
									<div name='itemNo' id='itemNo' value='1'> </div>
									<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px' value="<c:out value='${resultList.ITEM_SUBJECT}'/>"/>
									<input type="button" class="btn brown" id="plus" value="+">
									<input type="button" class="btn gray" id="minus" value="x"></br>
								</li>
							</c:if>
							</c:if>
							</c:forEach>
							
						</ol>
					</div></br>
				<input type="button" id="addQuestion" class="btn green" name="addQuestion" value="질문추가">
				<input type="button" id="minusQuestion"  class="btn gray"  value="질문삭제">
				</div>
			</div>
			
			</c:if>
			</c:forEach>
			</ol>
		</div>
		</c:forEach>
	</div>
	
	<!-- //등록이고 설문지 가져오기를 했을 때 -->
	
	</c:when>
 
	<c:otherwise>
	<!-- 수정일 때 -->
	</br>
	<div id='table' style='background:#b5d1d9';>
		<c:forEach var="moduleList" items="${moduleList}" varStatus="status">
		<div style='background:#eaeff2;height:10px;'></div>
		<div class='module' id='module' name='module' style='padding:5px 20px; font-size:16px; color:#33485d;'>
		</br>
		<strong>모듈명&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='cpollTitle' id='cpollTitle' style='width:600px' value="<c:out value='${moduleList.CPOLL_TITLE}'/>"/>
		<input type="button" class="btn brown" id="addModule" name="addModule" value="모듈추가">
		<input type="button" class="btn gray" id="minusModule" name="minusModule" value="삭제"></br>
			<ol style='background:#fff;'>
			<c:forEach var="questionList" items="${questionList}" varStatus="status">
			<c:if test="${moduleList.CPOLL_TITLE == questionList.CPOLL_TITLE}">
			
			<div id='questions'>
				<div style='background:#B5D2DA;height:10px;'></div>
				<div class='question' id='question' name='question' style='padding:10px;margin:10px'> 
				<strong style="font-size:15px;">* 형태&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='hidden' id='countItem' name='countItem'>
				<select name='mtCpollCode' id='mtCpollCode' title='문제유형'>
					<option value='JBBA00' <c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}">SELECTED</c:if>>${mtSubCode[1]. MT_SUB_NAME}</option>
					<option value='JBAA00' <c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">SELECTED</c:if>>${mtSubCode[0]. MT_SUB_NAME}</option>
				</select>
				<span id='doubleBox'><input type='checkbox' id='doubleAt' name='doubleAt' <c:if test="${questionList.DOUBLE_AT eq 'Y'}"> checked="checked" </c:if>>복수응답 허용</span></br></br>
				<input type='hidden' id='doubleAtyn' name='doubleAtyn'>
				<input type='hidden' id='qno' name='qno' value="<c:out value='${questionList.QNO}'/>"/>
				<li style='-webkit-margin-start:1em; border-top:1px solid #ddd; padding-top:20px;'><strong style="font-size:15px;">질문&nbsp;&nbsp;:</strong>&nbsp;&nbsp;&nbsp;<input type='text' class='line' name='subject' id='subject' style='width:600px' value="<c:out value='${questionList.SUBJECT}'/>"/></li>
				<input type='hidden' id='' name=''><input type='hidden' id='cpollTitleValue' name='cpollTitleValue'></br>
					<div id='itemsMenu' style='display: block;'>
						<ol id='items' style='-webkit-margin-start:1em'>
							<c:forEach var="resultList" items="${resultList}" varStatus="status">
							<c:if test="${questionList.QNO == resultList.QNO}">
							<c:if test="${resultList.ITEM_SUBJECT != null && resultList.ITEM_SUBJECT != ''}">
								<li id='item' style='padding-top:5px; list-style:decimal;'>
									<div id=itemQno name='itemQno'></div>
									<input type='hidden' id='itemOrdr' name='itemOrdr'>
									<div name='itemVal' id='itemVal' value='1'> </div>
									<div name='itemNo' id='itemNo' value='1'> </div>
									<input type='text' class='line' name='itemSubject' id='itemSubject' style='width:600px' value="<c:out value='${resultList.ITEM_SUBJECT}'/>"/>
									<!-- <input type='button' class='plus' id='plus' value='+'>
									<input type='button' class='delete' id='minus' value='x'></br> -->
									<input type="button" class="btn brown" id="plus" value="+">
									<input type="button" class="btn gray" id="minus" value="x"></br>
								</li>
							</c:if>
							</c:if>
							</c:forEach>
						</ol>
					</div></br>
				<input type="button" id="addQuestion" class="btn green" name="addQuestion" value="질문추가">
				<input type="button" id="minusQuestion"  class="btn gray"  value="질문삭제">
				</br>
				</div>
			</div>
			</c:if>
			</c:forEach>
			</ol>
		</div>
		</c:forEach>
	</div>
	<!-- //수정일 때 -->
	</c:otherwise>
</c:choose> 
    <div class="button">
	    <a href="#" onclick="history.back();return false;" class="btn gray big">목록</a>
    	<a href="#" onclick="fnList(); return false;" class= "btn big blue">설문지 가져오기</a>
 		
 		<c:choose>
        	<c:when test="${pageMode eq REQUEST_DATA.pageMode}">
			 	<a href="#" onclick="fnExcel(); return false;" class= "btn big blue">엑셀등록</a>
        		<a href="#" onclick="fnExec(); return false;" class= "btn big green">등록</a>
        	</c:when>
        	<c:otherwise>
			    <a href="#" onclick="fnPreview('<c:out value="${surveyInfo.POLLCSEQNO}"/>'); return false;" class= "btn big blue">미리보기</a>
        		<a href="#" onclick="fnExec(); return false;" class= "btn big green">수정</a>
        	</c:otherwise>
        </c:choose>
    </div>
    </form>
    
<script type="text/javascript">
	// 등록 || 수정
	function fnExec(){
		var form= document.form;
	    //유효성 체크 시작
	    //제목
	    if('' ==$("#title").val()){
	        alert("제목을 입력해주세요.");
	        $("#title").focus();
	        return;
	    }
	    //사용여부
	    if(!$(':input:radio[name=useyn]:checked').val()) {
	    	alert("사용여부를 선택해주세요.");
	        return;
	    }
	    
	    //설문기간
	    if('' == $(':input:text[name=sdate]').val() || '' == $(':input:text[name=edate]').val()) {
	    	alert("설문기간을 선택해주세요.");
	        return;
	    }  
	    
	    var sdate = new Date($(':input:text[name=sdate]').val());
	    var edate = new Date($(':input:text[name=edate]').val());
	    
	    //기간설정
	    if(sdate > edate) {
	    	alert("시간 설정을 다시 해주세요. (설문 기간의 시작 날짜는 종료 날짜보다 이전이어야 합니다.)");
	        return;
	    } 
	    
	    //설문지 모든 문항 필수 입력
	    var emptyText = 0;
	    $("#table :input[type='text']").each(function() {
	    	if($(this).val()=='') {
	    		emptyText = emptyText + 1;
	    	}
	    });
	    if(emptyText > 0) {
	    	alert('모든 문항을 입력해주세요');
	    	emptyText = 0;
	    	return;
	    }
	    
	  	//복수응답허용
	  	$(':input:checkbox[name=doubleAt]').each(function(){
	  		if(!$(this).is(':checked')) {
	  			$(this).parent("#doubleBox").siblings("#doubleAtyn").val('N')
	  		} else {
	  			$(this).parent("#doubleBox").siblings("#doubleAtyn").val('Y')
	  		}
	  	});
	
	  	/* 엑셀등록일때  */
	  	if($('#excelyn').val()=='Y'){//엑셀등록이면
	  		
	  		var countItem = 0;
	  		var countItemArr = new Array;
	  		$('.itemOrdr').each(function(){
	  			if(Number($(this).val()) > Number(countItem)) {
		  			countItem = $(this).val();
	  			} else {
		  			countItemArr.push(countItem);
	  				countItem = 0;
	  			}
	  		});
	  		countItemArr.push($('.itemOrdr').last().val());
	  		
	  		$("#ExcelcountItem").val(countItemArr);
	  		
	  	} else {//엑셀등록이아니면
			//모듈 정렬 
			$(':input:text[name=cpollTitle]').each(function(){
				var cpollTitleValue=$(this).val();
				//질문 정렬 
				$(this).siblings("ol").find(".question").each(function(){
					$(this).children("#cpollTitleValue").val(cpollTitleValue);
					//현재 문제의 객관식 보기 문항 갯수
					var a = $(this).find("#items").children("#item").length;
					$(this).children("#countItem").val(a);
					
					//객관식 보기정렬
					var e=0;
					$(this).find("#items").children("#item").each(function(){
						e=e+1;
						$(this).children("#itemOrdr").val(e);	
					});
				});
			});
	  	}
	  	
	  	 var emptyText = 0;
	  	 var dateChk = 0;
		    $(".dateText").each(function() {
		    	if($(this).val()=='') {
		    		emptyText = emptyText + 1;
		    	}
		    });
		    if(emptyText == 0) {
		    	jQuery.ajax({
			           type:"GET",
			           data : { reUpdate : 'N',pollcseqno2:$("#pollcseqno2").val(), qu : $("#qu").val(), sdate : $("#sdate").val(), edate : $("#edate").val(), pollcseqno:$("#pollcseqno").val()},
			           url:"/admin/site/surveyExec2.do",
			           dataType:"json", 
			           success : function(data) {
			        	   
			        	   if(data == "Y") {
				        	   alert('설문 기간은 다른 설문의 기간과 중복되지 않아야 합니다.');
			        		   $(".dateText").val('');
			        	   } else {
			        		   var msg = '${titleMode}';
			        		   if(msg == "수정") {
				       				//설문지 가져오기 후 수정할 경우 기존 게시글의 일련번호 그대로 쓰기 
				       			 	var fnList = $("#pollcseqno2").val();
				       				if(fnList.length > 0){
				       					$("#pollcseqno").val(fnList);
				       				} 
				       		    }
				       		    
			       		     if(confirm( msg+ ' 하시겠습니까?')){
			       		    	 //수정 시 응답자가 이미 있다면
			       		    	 if($("#cnt").val()>0){
			       		       		 if(confirm('응답자가 이미 존재하여 수정이 불가합니다. 새로 등록 하시겠습니까?')){
			       		       			/* form.qu.value='insert';
			       		       			$("#form").attr("action", "/admin/site/surveyExec.do");
			       		 		        form.target = '_self';
			       		 		        form.submit(); */
			       		 		        reUpdate();
			       		       		 }
			       		       	} else {
			       			        $("#form").attr("action", "/admin/site/surveyExec.do");
			       			        form.target = '_self';
			       			       form.submit();
			       		       	}
			       		    } 
			        	   }
			           },
			           error : function(xhr, status, error) {
			                 alert("에러발생");
			           }
			     });
		    }
	}
	function reUpdate(){
		var form= document.form;
		jQuery.ajax({
	           type:"GET",
	           data : { reUpdate : 'Y', pollcseqno2:$("#pollcseqno2").val(), qu : $("#qu").val(), sdate : $("#sdate").val(), edate : $("#edate").val(), pollcseqno:$("#pollcseqno").val()},
	           url:"/admin/site/surveyExec2.do",
	           dataType:"json", 
	           success : function(data) {
	        	   if(data == "Y") {
		        	   alert('설문 기간은 다른 설문의 기간과 중복되지 않아야 합니다.');
	        		   $(".dateText").val('');
	        		   
	        	   } else {
		       			form.qu.value='insert';
		       			$("#form").attr("action", "/admin/site/surveyExec.do");
		 		        form.target = '_self';
		 		        form.submit();
	        	   }
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
	}
	//팝업 미리보기
	function fnPreview(pollsceqno){
		var frm= document.form;
	   frm.target = 'hiddenSaveFrame';  // hidden frame 에 submit
	
	    var form = $("#form").serialize();
	
	    $("#form").attr("action", "/admin/site/surveyPreview.do");
	    $("#pollcseqno").val(pollsceqno);
	
	     window.open("", "surveyPreview",  "width="+1000+" height="+600); 
	    $("#form").attr("target", "surveyPreview");
	    $("#form").submit();
	}
	
	//설문지 가져오기
	function fnList(){
		var frm= document.form;
		   frm.target = 'hiddenSaveFrame';  // hidden frame 에 submit
		    var form = $("#form").serialize();
		    $("#form").attr("action", "/admin/site/surveyListPopup.do");
		    window.open("", "surveyListPopup",  "width="+1000+" height="+600); 
		    $("#form").attr("target", "surveyListPopup");
		    $("#form").submit();
	} 
	//엑셀등록
	function fnExcel(){
		var frm= document.form;
		   frm.target = 'hiddenSaveFrame';  // hidden frame 에 submit
		    var form = $("#form").serialize();
		    $("#form").attr("action", "/admin/site/surveyExcelPopup.do");
		    window.open("", "surveyExcelPopup",  "width="+1000+" height="+600); 
		    $("#form").attr("target", "surveyExcelPopup");
		    $("#form").submit();
	} 
</script>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>