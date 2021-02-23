<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(function(){
	$("#allCheck").click(function() {
		
		var allCheck = $(this); 
		
		$("input[name=cbox]:checkbox").each(function() {
			if(allCheck.prop('checked')){
				$(this).prop('checked', true);				
			}else{
				$(this).prop('checked', false);	
			}
		});
	});		
});


function changeJdg(val) {
	
	if ($('input[name=cbox]:checked').length > 0) {
		var cusernoArr = [];
		$('input[name=cbox]:checked').each(function(){
			if (val == 'Y' && $(this).closest('tr').find('td.jdgStatus').text().trim() == '선발') {
				
			} else {
				cusernoArr.push($(this).val()); 
			}
		});
		
		if (val == 'Y') {
			if (confirm('선택된 인원을 선발하시겠습니까?')) {
				goSave(cusernoArr, 'Y');	
			}
		} else {
			if (confirm('선택된 인원을 선발취소하시겠습니까?')) {
				goSave(cusernoArr, 'N');
			}
		}
		
	} else {
		alert('선택된 인원이 없습니다.');
	}
}

function goSave(cuserNoArr, status) {
	
	$.ajax({
        url : "/admin/tutor/saveJudgeAjax.do",
        data : {cuserNoArr:cuserNoArr.join(','), status:status},
        dataType : "json",
        type : 'post',
        success : function(data) { 
        	if(data.result == "success"){
        		goList();
        	}else{
        		alert('심사처리에 실패하였습니다.');
        	}
        },
        error : function(e) {
            alert("error :" + e.responseText);
        }
    }); 
	
	/* var xhtml = '';
	
	$("input[name=cbox]:checkbox").each(function() {
		if($(this).prop('checked')){
			xhtml += '<input type="hidden" name="cusernos"  value="'+$(this).attr('value')+'"/>';
			xhtml += '<input type="hidden" name="jdgYns" value="'+$(this).parent().parent().find('select[name=jdgYn]').val()+'"/>';
		}				
	});
	
	$('#pform').append(xhtml);
	
	$.ajax({
        url : "/admin/tutor/saveJudgeAjax.do",
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
    }); */ 
}


function move_page(cPage){
	$('#cPage').val(cPage);
	$("#pform").attr("action", "/admin/tutor/judgeList.do").submit();
}

function goList(){
    var frm = document.pform;
    $("#pform").attr("action", "/admin/tutor/judgeList.do").submit();
}

function list_page(){
    var frm = document.pform;
    frm.target = "";
    frm.cPage.value = "1";
    $("#pform").attr("action", "/admin/tutor/judgeList.do");
    frm.submit();
}

function enterChk(){
    if (event.keyCode==13) list_page();
}
</script>
<c:set var="totalCount" value="0" />
<c:if test="${not empty resultList}">
<c:set var="totalCount" value="${resultList[0].TOTAL_CNT}" />
</c:if>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강사선발관리 > 심사관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/tutor/judgeList.do" method="post">
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
			<td>
				 <select name="courseYear" id="courseYear" title="과정년도" style="width:100px;">
					<option value="">선택</option>
					<c:forEach var="year" items="${years}" varStatus="status">
						 <option value="${year}" <c:if test="${REQUEST_DATA.courseYear eq year}">selected="selected" </c:if>>${year}</option>
					</c:forEach>
 				</select>
 			</td>
 			 <th>심사여부</th>
			<td>
				 <input type="radio" id="jdgYn1" name="jdgYn" value=""  <c:if test="${REQUEST_DATA.jdgYn eq ''}"> checked="checked" </c:if> /> 전체 &nbsp;&nbsp;
				 <input type="radio" id="jdgYn2" name="jdgYn" value="Y" <c:if test="${REQUEST_DATA.jdgYn eq 'Y'}"> checked="checked" </c:if>  /> 선발 &nbsp;&nbsp;
				 <input type="radio" id="jdgYn3" name="jdgYn" value="N"  <c:if test="${REQUEST_DATA.jdgYn eq 'N'}"> checked="checked" </c:if>  /> 미선발 &nbsp;&nbsp;
 			</td>
        </tr>
        
         <tr>
            <th>관할부서</th>
			<td colspan="3">
				<input type="radio" id="mtAreaCode" name="mtAreaCode" value="${result.MT_SUB_CODE}" onclick="entrstClickEvt('${result.MT_SUB_CODE}')"  <c:if test="${REQUEST_DATA.mtAreaCode == ''}"> checked="checked" </c:if>  /> 전체 &nbsp;&nbsp;
				 <c:forEach var="result" items="${areaOptions}" varStatus="status">
						<input type="radio" id="mtAreaCode" name="mtAreaCode" value="${result.MT_SUB_CODE}" onclick="entrstClickEvt('${result.MT_SUB_CODE}')"  <c:if test="${result.MT_SUB_CODE eq REQUEST_DATA.mtAreaCode}"> checked="checked" </c:if>  /> ${result.MT_SUB_NAME} &nbsp;&nbsp;
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
            <a href="#" onclick="changeJdg('Y'); return false;" class="btn big blue" style="padding-left: 23px; padding-right: 23px;">선발</a>
            <a href="#" onclick="changeJdg('N'); return false;" class="btn big red">미선발</a>
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
        <th>과정명</th>
        <th>이름</th>
        <th>심사여부</th>
        <th>위촉상태</th>
    </tr>
    <colgroup>
        <col width="4%">
        <col width="4%">
        <col width="5%">
        <col width="8%">
        <col width="8%">
        <col width="*">
        <col width="8%">
        <col width="10%">
        <col width="10%">
    </colgroup>
    <c:choose>
    <c:when test="${not empty resultList}">
	    <c:forEach var="result" items="${resultList}" varStatus="status">
	    <tr>
	    	<td align="center"><input type="checkbox" id="cbox" name="cbox" value="<c:out value="${result.CUSERNO}"/>"></td>
	        <td align="center"><c:out value="${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}"/></td>
	        <td align="center"><c:out value="${result.COURSE_YEAR}"/></td>
	        <td align="center"><c:out value="${result.MT_AREA_NAME}"/></td>
	        <td align="center"><c:out value="${result.MT_FIELD_NAME}"/></td>
	        <td><c:out value="${result.SEQ_TITLE}"/></td>
	        <td align="center"><c:out value="${result.MBERNM}"/></td>
	        <td align="center" class="jdgStatus">
	        </td>
	        <td align="center">
	        	<c:choose>
	        		<c:when test="${result.JDG_YN eq 'N' }">탈락</c:when>
	        	</c:choose>
	        </td>
	    </tr>
	    </c:forEach>
	</c:when>
	<c:otherwise>
		<tr><td colspan="9" align="center">등록된 데이타가 없습니다.</td></tr>
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