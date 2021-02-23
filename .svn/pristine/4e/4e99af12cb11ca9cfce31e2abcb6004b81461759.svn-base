<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 수료증발급(실버/골드) 
	title	: 이름표 출력 목록
	summary	:	
	wdate	: 2016-05-12
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<%
 	 	
 	String mtCompSilver = ParamUtil.getStrParam(SangsProperties.getProperty("Globals.mtCode_mtCode_MT_COMP_TYPE_SILVER"), "") ;
 	String mtCompGold = ParamUtil.getStrParam(SangsProperties.getProperty("Globals.mtCode_mtCode_MT_COMP_TYPE_GOLD"), "") ;	
 	
%>


<script type="text/javascript">
 
function move_page(cPage){
	
	$("input[name=cPage]").val(cPage);
	$('#listType').val('list');
	$("form[name=pform]").attr("method", "post").attr("action", "/admin/study/certUserList.do").submit();
}


function goPrint(cuserNo, userNo,sdate,edate,userId){
	
	var w1 =1070;
	var h1 = 900;
	var url = "";
	
	var mtcTypeCodeOffline = '<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%>';
	if($("#mtcTypeCode").val() == mtcTypeCodeOffline){
		w1 = 640;
		h1 = 900;
		url = "/admin/study/cerOfflinePrint.do";
		
	}
	else {
		url = "/admin/study/cerOnlinePrint.do";
	}
	$("#sdate").val(sdate);
	$("#edate").val(edate);
	
	$("#pform > input[name='userNo']").val(userNo);  
	$("#pform > input[name='cuserNo']").val(cuserNo);
	$("#pform > input[name='userno']").val(userNo);  
	$("#pform > input[name='cuserno']").val(cuserNo);
	$("#pform > input[name='userId']").val(userId);
	
	window.open( url+"?"+$("#pform").serialize()
			,"cert_pop","width="+w1+" height="+h1+", top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no");
}
	
function goSearch(v){
	var mtCompType = v;
	$("#pform").attr("action", "/admin/study/certUserList.do");
	document.pform.mtCompType.value = mtCompType; 
	$('#listType').val('list');
	document.pform.submit();
}

//수료 가이드 안내
function fnCertGuidePop(){ 
	openPopup('/admin/study/cert_guide.do', "classdesk_pop", 'width=850, height=600, top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
}

function openPopup(url, popupName, options) {
	popupName = (popupName == undefined) ? '' : popupName;
	options = (options == undefined) ? '' : options;
	var openWin = window.open(url, popupName, options);
	openWin.focus();
}

function chkEnter(){
	if (event.keyCode==13) move_page(1);
}

function fnExcelDown(){

	$("#pform").attr("action", "/admin/study/certUserList.do");
	$('#listType').val('EXCEL');
	$('#pform').submit();
	$('#listType').val('');
}
</script>
<form name="pform" id="pform" method="post" action ="/admin/study/certUserList.do">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
<input type="hidden" name="mtCompType" value=""/>
<input type="hidden" name="mtCgrpCode" value="<c:out value="${mapInfo.MT_CGRP_CODE}"/>"/>
<input type="hidden" name="cseqno" value="<c:out value="${mapInfo.CSEQNO}"/>"/>
<input type="hidden" name="seq" value="<c:out value="${mapInfo.SEQ}"/>"/>
<input type="hidden" name="courseno" value="<c:out value="${mapInfo.COURSENO}"/>"/>
<input type="hidden" name="userNo" value=""/>
<input type="hidden" name="cuserNo" id="cuserNo" value=""/>
<input type="hidden" name="userno" value=""/>
<input type="hidden" name="cuserno" id="cuserno" value=""/>
<input type="hidden" name="userId" id="userId" value=""/>
<input type="hidden" name="listType" id="listType" value="list"/>
<input type="hidden" name="sdate" id="sdate" value="" />
<input type="hidden" name="edate" id="edate" value="" />
<input type="hidden" name="mtcTypeCode" id="mtcTypeCode" value="<c:out value="${mapInfo.MT_CTYPE_CODE}"/>"/>
 <!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수료증발급<span> </span></div>
<table style="border-collapse: collapse; border-bottom:1px solid #e9dfd9;" border="0" width="100%">
	<tbody>
	<tr>
  	<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px; background-color:#fefbde; border:1px solid #d6d5c9;">
  		<div style="padding-top: 5px; display: inline-block;"><b>※ 수료증 인쇄 설정 안내</b></div>&nbsp;
  		<div style="padding-top: 7px; display: inline-block;"><a href="#" onclick="fnCertGuidePop(); return false;" class="btn green"> 인쇄 설정 보기 </a></div>
  	</td>
  </tr>
	</tbody>
</table>

 <div class="space"></div>
 	<table class="table-type1 search_form">
	  <colgroup>
		<col class="cellc" width="15%">
		<col class="celll" width="35%">
		<col class="cellc" width="15%">
		<col class="celll" width="35%">
		</colgroup>
		<tbody>
  
	  	<tr>
			<th>과정명</th>
			<td>
				<c:out value="${mapInfo.SEQ_TITLE}"/>  
 			</td>
 			<th>기간</th>
			<td>
				<c:choose>
					<c:when test="${mapInfo.OPENTYPE == 'A'}">상시운영</c:when>
					<c:otherwise><c:out value="${mapInfo.STUDY_SDATE}"/> ~ <c:out value="${mapInfo.STUDY_EDATE}"/> </c:otherwise>
				</c:choose>
  			</td>
		</tr>
		<tr>
			<th>수료여부</th>
			<td colspan="3">
				<input type="radio" name="compYn" value="" <c:if test="${REQUEST_DATA.compYn eq '' || REQUEST_DATA.compYn eq null}"> checked="checked"</c:if>/> 전체&nbsp;
                <input type="radio" name="compYn" value="Y" <c:if test="${REQUEST_DATA.compYn eq 'Y'}"> checked="checked"</c:if>/> 수료&nbsp;
                <input type="radio" name="compYn" value="N" <c:if test="${REQUEST_DATA.openType eq 'N'}"> checked="checked"</c:if>/> 미수료&nbsp;
			</td>
		</tr> 
 		<tr>	
			<th>검색</th>
			<td colspan="3">
		  		<select name="searchMode" title="검색옵션" style="width: 100px;">
		  			<option value="">선택</option>
		  			<option <c:if test="${REQUEST_DATA.searchMode == 'userId'}"> selected="selected"</c:if> value="userId">아이디</option>
	                <option <c:if test="${REQUEST_DATA.searchMode == 'userName'}"> selected="selected"</c:if> value="userName">이름</option>
	            </select>
            	<input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" OnKeyPress="chkEnter();"/>
			</td>
		  </tr>
		</tbody>
	</table>
 	
	<div class="button_top"><a href="#" onclick="move_page(1);" class="btn search brown">검색</a></div>
	<div class="space"></div>
 
	 <table width="100%" class="btn_Group">
	  <tbody>
		<tr>
			<td class="pageinfo">
				조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건
			</td>		
			<td align="right">
				 		
				 <a href="#" onclick="fnExcelDown();return false;" class="btn sky">엑셀다운</a>
				 <a href="/admin/study/certCseqList.do" class="btn orange">목록</a>	
			</td>
		</tr>
	  </tbody>
	  </table>
 

		<table class="tb table-type1">
			<tr class="rndbg">
				<th>No</th>
				<th>아이디</th> 
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>수료코드</th>
				<th>수료일자</th>
				<th>수료증 발급</th> 
			</tr>
			<colgroup>
				<col align=middle width="5%">
				<col align=middle width="10%">
				<col align=middle width="10%">
				<col align=middle width="20%">
				<col align=middle width="14%"> 
				<col align=middle width="10%">
				<col align=middle width="10%">  
		 </colgroup>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
				<tr align=middle>
		 			<td><c:out value='${result.TOTALCOUNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
		 			<td><c:out value="${result.USERID}"/></td> 
		 			<td><c:out value="${result.USERNAME}"/></td>
		  			<td><c:out value="${result.MOBLPHON}"/></td>
		  			<td><c:out value="${result.COMPCODE}"/></td>
		  			<td><c:out value="${result.COMPDATE}"/></td>
		  			<td>
		  				<c:choose>
		  					<c:when test="${result.MT_COMP_TYPE ne null || result.ISPASS == 'Y'}"> 
		  						<a href="#" onclick="goPrint('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${mapInfo.STUDY_SDATE}"/>','<c:out value="${mapInfo.STUDY_EDATE}"/>','<c:out value="${result.USERID}"/>');" class="btn small brown">발급</a>
		  					</c:when>
		  					<c:otherwise>
		  						-
		  					</c:otherwise>
		  				</c:choose>
		  			</td>
		     	</tr> 
		</c:forEach>
		</table>
</form>
<br/>
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if> 
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>
