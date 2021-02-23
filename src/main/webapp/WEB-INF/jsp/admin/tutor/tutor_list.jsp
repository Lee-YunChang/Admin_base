<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript"> 
function move_page(cPage){
	var frm = document.pform;
    var fieldArr = new Array;
	$('input:checkbox[name=mtFieldCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			fieldArr.push($(this).val());
		}
	});	 
	
	var tutorArr = new Array;
	$('input:checkbox[name=mtTutorCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			tutorArr.push($(this).val());
		}
	});	 
	
	$("#fieldArr").val(fieldArr.join(','));
	$("#tutorArr").val(tutorArr.join(','));
	
	$('#cPage').val(cPage);
	$("#pform").attr("action", "/admin/tutor/tutorList.do").submit();
}

function list_page(){
    var frm = document.pform;
    var fieldArr = new Array;
	$('input:checkbox[name=mtFieldCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			fieldArr.push($(this).val());
		}
	});	 
	var tutorArr = new Array;
	$('input:checkbox[name=mtTutorCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			tutorArr.push($(this).val());
		}
	});	
	$("#fieldArr").val(fieldArr.join(','));
	$("#tutorArr").val(tutorArr.join(','));
	
    frm.target = "";
    frm.cPage.value = "1";
    $("#pform").attr("action", "/admin/tutor/tutorList.do");
    frm.submit();
}

function goView(userno, mtFieldCode){
    $('#userno').val(userno);
    $('#mtFieldCode').val(mtFieldCode);
    $("#pform").attr("action", "/admin/tutor/tutorDetail.do").submit();
}

function enterChk(){
    if (event.keyCode==13) list_page();
}

function excelDownload() {
	var frm = document.pform;
    var fieldArr = new Array;
	$('input:checkbox[name=mtFieldCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			fieldArr.push($(this).val());
		}
	});	 
	var tutorArr = new Array;
	$('input:checkbox[name=mtTutorCode]').each(function() {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
			tutorArr.push($(this).val());
		}
	});	
	$("#fieldArr").val(fieldArr.join(','));
	$("#tutorArr").val(tutorArr.join(','));
	
    frm.target = "";
    frm.cPage.value = "1";
	/* 
	var users = [];
	$('input[name=userno]').each(function(){
		users.push($(this).val());
	})
	var frm = document.pform;
	frm.usernoArr.value = users.join(','); */
	//$("#pform").attr("action", "/admin/tutor/tutorListExcel.do");
	$("#pform").attr("action", "/admin/tutor/excelList.do");
	frm.submit();
}

$(document).ready(function(){
	// 분야별 체크박스
	if($("#fieldArr").val().length > 0){
		$("input[name=mtFieldCode]").eq(0).attr('checked',false);
		var fieldArr = $("#fieldArr").val().split(',');
		for (var nArrCnt in fieldArr) {

	         $("input[name=mtFieldCode][value="+fieldArr[nArrCnt]+"]").prop("checked",true);

		} 
	}
	// 강사분류 체크박스
	if($("#tutorArr").val() == '') {
		$("input[name=mtTutorCode]").eq(0).attr('checked','checked');
		$("input[name=mtTutorCode]").attr('checked','checked');
	}
	else {
		$("input[name=mtTutorCode]").eq(0).attr('checked',false);
		var tutorArr = $("#tutorArr").val().split(',');
		for (var nArrCnt in tutorArr) {

	         $("input[name=mtTutorCode][value="+tutorArr[nArrCnt]+"]").prop("checked",true);

		} 
		 
	}
    $("#isall").click(function() {
        // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
        if($(this).is(':checked')) {
            $("input[name=mtTutorCode]").attr('checked','checked');
        } else {
              $("input[name=mtTutorCode]").prop("checked", false);
        }
    });
    
    $("#mtFieldCodeIsall").click(function() {
        // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
        if($(this).is(':checked')) {
            $("input[name=mtFieldCode]").attr('checked','checked');
        } else {
              $("input[name=mtFieldCode]").prop("checked", false);
        }
    });

    
	 // 체크박스 전체선택 /해제
	 $("#isallchk").click(function(){
	     if($("#isallchk").prop("checked")){
	         $("input[name=msg_user]").prop("checked",true);
	     }else{
	         $("input[name=msg_user]").prop("checked",false);
	     }
	 });
});

//메일발송 - 일괄
//2016.03.28 수정
function mailFormGroup(){
	var form = document.userForm;
	var chk = $("input:checkbox[name=msg_user]:checked");
	
	var usernoArr = new Array;
	$('input:checkbox[name=msg_user]').each(function(index, element) {
		var ischecked = $(this).is(':checked');
		if(ischecked) {
		 	usernoArr.push($(this).siblings("#userid").val());
		}
	});
	 
	$("#usernoArr").val(usernoArr);
	var specs = "left=10,top=10,width=980,height=800";
	specs += ",menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
	
	var mailpop = window.open("","mailform",specs); 
	
	form.method = "post";
	form.action = "/admin/common/mailForm.do";
	form.target = "mailform"; 
	form.submit();
	mailpop.focus();
}

//SMS발송 - 일괄
//2016.03.28 수정
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

</script>
<c:set var="totalCount" value="0" />
<c:if test="${not empty resultList}">
<c:set var="totalCount" value="${resultList[0].TOTAL_CNT}" />
</c:if>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강사정보관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/tutor/tutorList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/> 
<input type="hidden" name="userno" id="userno" value=""/>
<input type="hidden" name="usernoArr" id="usernoArr" value=""/>
<input type="hidden" name="entrstYear" id="entrstYear" value=""/>
<input type="hidden" name="lecno" id="lecno" value=""/>
<input type="hidden" name="tutorAt" id="tutorAt" value=""/>
<input type="hidden" name="fieldArr" id="fieldArr" value="${REQUEST_DATA.fieldArr}"/>
<input type="hidden" name="tutorArr" id="tutorArr" value="${REQUEST_DATA.tutorArr}"/>
<input type="hidden" name="mtFieldCode" id="mtFieldCode" value="${REQUEST_DATA.mtFieldCode}"/>

    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        </colgroup><tbody>
        <%-- <tr>
            <th>분야</th>
			<td>
				<input type="checkbox" id="mtFieldCodeIsall" value=""/> 전체&nbsp;
		        <c:forEach var="emap2" items="${categoryData2}" varStatus="status1">
		        <input type="checkbox" name="mtFieldCode" id="mtFieldCode" value="${emap2.MT_SUB_CODE}"/> <c:out value="${emap2.MT_SUB_NAME}"/>&nbsp;
		        </c:forEach>
 			</td>
        </tr>  --%>
        <tr>
            <th>강사분류</th>
			<td>
				<select name="mtTutorCode" id="mtTutorCode" title="검색">
					<option value="">전체</option>
				<c:forEach var="data" items="${categoryData}" varStatus="status2">
					<option value="<c:out value="${data.MT_SUB_CODE}"/>"  <c:if test="${REQUEST_DATA.mtTutorCode eq data.MT_SUB_CODE }">selected="selected" </c:if>><c:out value="${data.MT_SUB_NAME}"/></option>
		       	
		        </c:forEach>
				</select>
 			</td>
        </tr>
        <tr>
            <th>검색</th>
			<td>
				<select name="searchType" id="searchType" title="검색">
					<option value="">선택</option>
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
 <c:forEach var="result" items="${resultList2}" varStatus="status">
 	<input type="hidden" name="userno" id="userno" value="${result.UNITY_MBERNO}">
 </c:forEach>
 <!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td class="pageinfo">
        	조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건
        	<!-- &nbsp;&nbsp;&nbsp;선택 <span class="red" id="checked_user">0</span> 명 -->
        </td>
        <td align="right">
        	<a href="#" onclick="mailFormGroup(document.userForm);" class="btn sky">메일발송</a>
 			<a href="#" onclick="smsFormGroup(document.userForm);" class="btn sky">SMS발송</a>
            <a href="#" onclick="excelDownload();return false;" class="btn blue">엑셀다운로드</a> 
        </td>
    </tr>
  </tbody>
</table>
  
<!-- 본문 > 메인 > 서브   영역 끝 -->
<form name="userForm" action="user.do" method="post">
<input type="hidden" name="usernoArr" id="usernoArr" value="">
<input type="hidden" name="moblphonArr" id="moblphonArr" value="">
<input type="hidden" name="useridArr" id="useridArr" value="">
<table class="tb table-type1">
    <tr class="rndbg">
    	<th><input type="checkbox" class="input_chbox" style="border:0px" name="isallchk"  id="isallchk"/></th>
        <th>NO</th>
        <th>강사분류</th>
        <th>아이디</th>
        <th>이름</th>
      <!--   <th>이메일</th> -->
        <th>생년월일</th>
        <th>강사등록일</th>
    </tr>
    <colgroup>
    	<col width="4%">
        <col width="5%">
        <col width="10%">
        <col width="10%">
        <col width="10%">
      <!--   <col width="*"> -->
        <col width="15%">
        <col width="15%">
    </colgroup>
    <c:choose>
    <c:when test="${not empty resultList}">
	    <c:forEach var="result" items="${resultList}" varStatus="status">
	    <tr align="center">
	        <td><input type="checkbox" name="msg_user" id="msg_user"  value="${result.EMAIL}"/><input type="hidden" id="userid" value="${result.UNITY_ID}"/><input type="hidden" id="moblphon" value="${result.TELNO}"/><input type="hidden" id="userno" value="${result.UNITY_MBERNO}"/></td>
	        <td><c:out value='${resultList[0].TOTAL_CNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
			<td><c:out value="${result.MT_TUTOR_NAME}"/></td>
			<td><c:out value="${result.UNITY_ID}"/></td>
	        <td><a href="#" onclick="goView('${result.UNITY_MBERNO}', '${result.MT_FIELD_CODE}', '${result.ENTRST_YEAR}','${result.LECNO}')"><b><c:out value="${result.MBERNM}"/></b></a></td>
	       <%--  <td><c:out value="${result.EMAIL}"/></td> --%>
	        <td><c:out value="${fn:substring(result.BRTHDY, 0, 4)}"/>.<c:out value="${fn:substring(result.BRTHDY, 4, 6)}"/>.<c:out value="${fn:substring(result.BRTHDY, 6, 8)}"/></td>
	        <td><c:out value="${result.REGIST_DT}"/></td> 
	    </tr>
	    </c:forEach>
	</c:when>
	<c:otherwise>
		<tr><td colspan="8" align="center">등록된 데이타가 없습니다.</td></tr>
	</c:otherwise>
	</c:choose>
</table>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if> 
</form>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>