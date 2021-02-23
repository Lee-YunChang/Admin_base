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


$(function(){
	$("#sdate").datepicker(dateFormat);
	$("#edate").datepicker(dateFormat);
	
	
 	$('.btn_Group').on('change', '#sdate', '#edate', function(e){
		e.preventDefault();
		
		/* var parentValue =  $(this).val();
		$("input[name=entrstDate]").each(function() {
			$(this).val(parentValue);
		}); */
	}); 
	
	
	
	$("#allCheck").click(function() {
		
		var allCheck = $(this); 
		
		$("input[name=cbox]:checkbox").each(function() {
			if(allCheck.prop('checked')){
				$(this).prop('checked', true);
				$(this).closest('tr').find('input[name=entrstNo]').prop('disabled', false);
			}else{
				$(this).prop('checked', false);
				$(this).closest('tr').find('input[name=entrstNo]').prop('disabled', true);
			}
		});
	});		
});


function changeJdg(val){
	$("select[name=jdgYn]").each(function() {
		$(this).val(val).attr('selected', true);
	});
}

function goSave(){
	
	// 1. 위촉대상체크
	var cnt = 0;
	try {
		cnt = $("input[name=cbox]:checked").length;
	} catch (err) {
		alert('위촉등록 대상이 없습니다.');
		return;
	}
	
	// 2. 위촉일 체크
	if (!$('#sdate').val()) {
		alert('위촉 시작일을 입력해 주세요');
		$('#sdate').focus();
		return;
	}
	
	if (!$('#edate').val()) {
		alert('위촉 종료일을 입력해 주세요');
		$('#edate').focus();
		return;
	}
	
	// 3. 위촉번호 체크
	var $tmp;
	for (var i=0; i<cnt; i++) {
		$tmp = $( $('.entrstNo').get(i) );
		if (!$tmp.val() || !isNumber($tmp.val())) {
			alert('위촉번호를 입력해 주세요 (숫자만 가능)');
			$tmp.focus();
			return;
		}
	}
	
	var params = {};
	var tmp = [];
	params.sdate = $('#sdate').val();
	params.edate = $('#edate').val();
	params.tutorInfo = "";
	
	$("input[name=cbox]:checked").each(function(index){
		tmp.push($(this).val() + '@' + $($('.entrstNo').get(index)).val());
	});
	
	//console.log(params.tutorInfo.join(','));
	params.tutorInfo = tmp.join(',');
	
	if (confirm('위촉일 등록을 실행하시겠습니까?')) {
		
		$.ajax({
	        url : "/admin/tutor/saveEntrstAjax.do",
	        data : params,
	        dataType : "json",
	        type : 'post',
	        success : function(data) { 
	        	if(data.result == "success"){
	        		goList();
	        	}else{
	        		alert('fail');
	        	}
	        },
	        error : function(e) {
	            alert("error :" + e.responseText);
	        }
	    });
		
	}
	
	
	/* var xhtml = '';
	
	$("input[name=cbox]:checkbox").each(function() {
		if($(this).prop('checked')){
			
			xhtml += '<input type="hidden" name="usernos"  value="'+$(this).attr('userno')+'"/>';
			xhtml += '<input type="hidden" name="cusernos"  value="'+$(this).attr('cuserno')+'"/>';
			xhtml += '<input type="hidden" name="entrstYears"  value="'+$(this).attr('entrstYear')+'"/>';
			xhtml += '<input type="hidden" name="mtAreaCodes"  value="'+$(this).attr('mtAreaCode')+'"/>';
			xhtml += '<input type="hidden" name="mtFieldCodes"  value="'+$(this).attr('mtFieldCode')+'"/>';
			xhtml += '<input type="hidden" name="entrstNos" value="'+$(this).parent().parent().find('input[name=entrstNo]').val()+'"/>';
			xhtml += '<input type="hidden" name="entrstDates" value="'+$(this).parent().parent().find('input[name=entrstDate]').val()+'"/>'; 
		}				
	});
	
	$('#pform').append(xhtml); 
	
	$.ajax({
        url : "/admin/tutor/saveEntrstAjax.do",
        data : $('#pform').serialize(),
        dataType : "json",
        type : 'post',
        success : function(res) { 
        	if(res == "SUCCESS"){
        		goList();
        	}else{
        		alert('fail');
        	}
        },
        error : function(e) {
            alert("error :" + e.responseText);
        }
    });  */
}


function move_page(cPage){
	$('#cPage').val(cPage);
	$("#pform").attr("action", "/admin/tutor/entrstList.do").submit();
}

function goList(){
    var frm = document.pform;
    $("#pform").attr("action", "/admin/tutor/entrstList.do").submit();
}

function list_page(){
    var frm = document.pform;
    frm.target = "";
    frm.cPage.value = "1";
    $("#pform").attr("action", "/admin/tutor/entrstList.do");
    frm.submit();
}

function enterChk(){
    if (event.keyCode==13) list_page();
}

$(document).ready(function(){
	$('input[name=cbox]').on('change', function(){
		//console.log($(this).prop('checked'));
		//console.log($(this).closest('tr').find('input[name=entrstNo]').val());
		if ($(this).prop('checked')) {
			$(this).closest('tr').find('input[name=entrstNo]').prop('disabled', false);
		} else {
			$(this).closest('tr').find('input[name=entrstNo]').prop('disabled', true);
		}
	});
});
</script>
<c:set var="totalCount" value="0" />
<c:if test="${not empty resultList}">
<c:set var="totalCount" value="${resultList[0].TOTAL_CNT}" />
</c:if>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강사선발관리 > 위촉관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/tutor/entrstList.do" method="post">
 <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/> 
<input type="hidden" name="userno" id="userno" value=""/>
<input type="hidden" name="entrstYear" id="entrstYear" value=""/>

    <table class="table-type1 search_form" id="tbl">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="42%">
        <col class="cellc" width="8%">
        <col class="celll" width="42%">
        </colgroup><tbody>
        <tr>
            <th>년도</th>
			<td colspan="3">
				 <select name="courseYear" id="courseYear" title="과정년도" style="width:100px;">
					<option value="">선택</option>
					<c:forEach var="year" items="${years}" varStatus="status">
						 <option value="${year}" <c:if test="${REQUEST_DATA.courseYear eq year}">selected="selected" </c:if>>${year}</option>
					</c:forEach>
 				</select>
 			</td>
 			
        </tr>
        
         <tr>
            <th>관할부서</th>
			<td colspan="3">
				<input type="radio" id="mtAreaCode" name="mtAreaCode" value="${result.MT_SUB_CODE}" <c:if test="${REQUEST_DATA.mtAreaCode == ''}"> checked="checked" </c:if>  /> 전체 &nbsp;&nbsp;
				 <c:forEach var="result" items="${areaOptions}" varStatus="status">
						<input type="radio" id="mtAreaCode" name="mtAreaCode" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq REQUEST_DATA.mtAreaCode}"> checked="checked" </c:if>  /> ${result.MT_SUB_NAME} &nbsp;&nbsp;
				</c:forEach>
 			</td>
        </tr>
        
        <tr>
            <th>검색</th>
			<td colspan="3">
				<select name="searchType" id="searchType" title="검색" style="width:100px;">
					<option value="">선택</option>
					<option value="FIELD" <c:if test="${REQUEST_DATA.searchType eq 'FIELD' }">selected="selected" </c:if>>분야</option>
					<option value="NAME"  <c:if test="${REQUEST_DATA.searchType eq 'NAME' }">selected="selected" </c:if>>이름</option>
				</select>	
                <input type="text" class="line" id="searchWord" name="searchWord" style="width:350px" title="검색명" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();"/>
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
       		 <span id="dateSelect">
				<input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#sdate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
				 	</a>
				~ 	       		 
				<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
				 	<a href="#" onclick="$('#edate').focus(); return false;" class="">
				 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
				 	</a>
			 </span>
            <a href="#" onclick="goSave(); return false;" class="btn big green">위촉일 등록</a>
        </td>
    </tr>
  </tbody>
  </table>
 
<!-- 본문 > 메인 > 서브   영역 끝 -->
<table class="tb table-type1">
    <tr class="rndbg">
    	<th><input type="checkbox" id="allCheck" name="allCheck"></th>
        <th>NO</th>
        <th>년도</th>
        <th>관할부서</th>
        <th>분야</th>
        <th>이름</th>
        <th>연락처</th>
        <th>위촉상태</th>
        <th>위촉번호</th>
        <th>위촉일</th>
    </tr>
    <colgroup>
        <col width="4%">
        <col width="4%">
        <col width="5%">
        <col width="8%">
        <col width="8%">
        <col width="8%">
        <col width="15%">
        <col width="8%">
        <col width="*">
        <col width="10%">
    </colgroup>
    <c:choose>
    <c:when test="${not empty resultList}">
	    <c:forEach var="result" items="${resultList}" varStatus="status">
	    <tr>
	    	<td align="center"><input type="checkbox" id="cbox" name="cbox" value="${result.USERNO}@${result.CUSERNO}"/></td>
	        <td align="center"><c:out value="${fn:length(resultList) - status.index}"/></td>
	        <td align="center"><c:out value="${result.ENTRST_YEAR}"/></td>
	        <td align="center"><c:out value="${result.MT_AREA_NAME}"/></td>
	        <td align="center"><c:out value="${result.MT_FIELD_NAME}"/></td>
	        <td align="center"><c:out value="${result.MBERNM}"/></td>
	        <td align="center"><c:out value="${result.MOBLPHON}"/></td>
	        <td align="center">${result.JDG_STATUS_NAME}</td>
	        <td align="center"><input type="text" name="entrstNo" class="entrstNo" value="${result.ENTRST_NO}" disabled="disabled"></td>
	        <td align="center">${result.ENTRST_DATE}</td>
	    </tr>
	    </c:forEach>
	</c:when>
	<c:otherwise>
		<tr><td colspan="10" align="center">등록된 데이타가 없습니다.</td></tr>
	</c:otherwise>
	</c:choose>
</table>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if> 
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>