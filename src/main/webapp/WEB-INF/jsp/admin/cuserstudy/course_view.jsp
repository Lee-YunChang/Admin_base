<%
/****************************************************
	system	: 과정진행관리 > 수강생정보관리 > 수강정보
	title	: 수강생정보  
	summary	:	
	wdate	: 2016-05-12
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<%
	//달력 호출시 사용 ( 지정일자 없을시 현재일 호출)
	String today = DateUtil.getNowDate();
%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>
<script type="text/javascript"> 
//<![CDATA[
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
	
	$("#startdate").datepicker(dateFormat);
	$("#enddate").datepicker(dateFormat);
	


	$(".header-tab").each(function() {
		$(this).removeClass("on");
	});
	$("."+$("#subcmd").val()).each(function() {
		$(this).addClass("on");
		$(this).show("fast");
	});
		

});

//수정 폼
function goForm() {
	$("#dateSelect").show();
	$("#studyDate").hide();
	$("#studyBtn").hide();
}

function goSave() {
	$("#paramStartdate").val($("#startdate").val());
	$("#paramEnddate").val($("#enddate").val());
	
	if(confirm("학습기간을 변경하시겠습니까?")){	
		$.ajax({
			url : "/admin/study/cuserCourseExec.do",
			data : $("#pform").serialize(),
			dataType : "json",
			type : 'get',
			async: "false",
			success : function(result) {
				// result
				if(result == true) {
					alert("수정되었습니다.");	
					$("#studyDate").text($("#paramStartdate").val() + " ~ " + $("#paramEnddate").val());
					$("#startdate").val($("#paramStartdate").val());
					$("#enddate").val($("#paramEnddate").val());
					
					$("#dateSelect").hide();
					$("#studyDate").show();
					$("#studyBtn").show();
				}
				else
					alert("수정에 실패하였습니다. 다시 시도해주세요.");
			},
			error : function(e) {
				alert("error :" + e.responseText);
			}
		});	
	}
}
//-->
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수강생정보관리<span>수강정보</span></div>

<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_user_tab_inc.jsp"></jsp:include>
</c:if>
<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/study/courseView.do" method="POST">
<input type="hidden" name="subcmd" id="subcmd" value="<c:out value="${REQUEST_DATA.subcmd}"/>"/>
<input type="hidden" name="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="userNo" id="userNo" value="<c:out value="${REQUEST_DATA.userNo}"/>"/>
<input type="hidden" name="cuserno" id="cuserno" value="<c:out value="${REQUEST_DATA.cuserno}"/>"/>
<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
<input type="hidden" name="paramStartdate" id="paramStartdate" value=""/>
<input type="hidden" name="paramEnddate" id="paramEnddate" value=""/>

<div class="tb_title">수강정보 </div>
<table class="table-type1 search_form">
	<colgroup>
		<col class="cellc" width="15%">
		<col class="celll" width="85%">
	</colgroup>
	<tbody>
		<tr> 
			<th>과정차수명</th>
			<td><c:out value='${result.SEQ_TITLE}'/></td>
		</tr>
		<tr> 
			<th>과정형태</th>
			<td><c:out value='${result.MT_CTYPE_NAME}'/></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><c:out value='${result.USERNAME}'/></td>
		</tr>
		<tr>
			<th>수강신청일자</th>
			<td><c:out value='${result.WDATE}'/></td>
		</tr>
		<tr>
			<th>학습기간</th>
			<td>
				<span id="studyDate"><c:out value='${result.STARTDATE}'/> ~ <c:out value='${result.ENDDATE}'/></span>
				<span id="studyBtn"><a href="#" onclick="goForm();" class="btn small green" >학습기간수정</a></span>
				<span id="dateSelect" style="display:none">
					<input type="text" class="line" name="startdate" id="startdate" value="<c:out value='${result.STARTDATE}'/>" readonly="readonly" style="width: 75px;"/>
					 	<a href="#" onclick="$('#startdate').focus(); return false;" class="">
					 		<img src="/admin/images/btn_calendar.png" alt="학습기간 시작일">
					 	</a>
					~
					<input type="text" class="line" name="enddate" id="enddate" value="<c:out value='${result.ENDDATE}'/>" readonly="readonly" style="width: 75px;"/>
					<a href="#" onclick="$('#enddate').focus(); return false;" class="">
						<img src="/admin/images/btn_calendar.png" alt="학습기간 종료일">
					</a>
				<a href="#" onclick="goSave();" class="btn small green" >저장</a>
				</span> 
			</td>
		</tr>
		<tr>
			<th>수강상태</th>
			<td>
				<c:choose>
					<c:when test="${result.COURSE_STATUS == '1'}">수강중</c:when>
					<c:when test="${result.COURSE_STATUS == '2'}">수강대기</c:when>
					<c:when test="${result.COURSE_STATUS == '3'}">미수강</c:when>
					<c:when test="${result.COURSE_STATUS == '4'}">폐강</c:when>
					<c:when test="${result.COURSE_STATUS == '5'}">수료</c:when>
					<c:when test="${result.COURSE_STATUS == '6'}">취소대기</c:when>
					<c:when test="${result.COURSE_STATUS == '7'}">취소완료</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>성적</th>
			<td>
				온라인학습:  <c:out value="${result.PROGRESS_VAL}" default="0"/><br/>
				과제: <c:out value="${result.REPORT_VAL}" default="0"/><br/>  
				시험:  <c:out value="${result.EXAM_FINAL_VAL}" default="0"/><br/>  
				출석:<c:out value="${result.ATTEND_VAL}" default="0"/><br/>  
				<strong>총: <c:out value="${result.FINAL_VAL}" default="0"/></strong>  
			</td>
		</tr>
		<tr>
			<th>수료여부</th>
			<td>
				<c:choose>
					<c:when test="${result.ISPASS ne null && result.ISPASS == 'Y'}">수료(<c:out value='${result.COMPCODE}'/>)</c:when>
					<c:otherwise>미수료</c:otherwise>
				</c:choose>	
			</td>
		</tr>
	</tbody>
</table>

<div class="button">
	<a href="#" onclick="window.close();" class="btn big gray">닫기</a>
	<!-- <a href="#" onclick="writeFormCheck();" class="btn big orange">저장</a>  --> 
</div>
</form>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>