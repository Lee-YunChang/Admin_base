<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 노동부수료증발급
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

<script type="text/javascript">
 
	function goPrint(uno){
		var userno=uno;

		document.flow.userno.value = userno;
		window.open('','certInfo','width=700,height=800');
	 	document.flow.target = "certInfo";
		$("#pform").attr("action", "/admin/study/certInsurePrint.do");
		document.flow.submit();
	}
</script>

  
<form name="flow" id ="flow" method="post" action ="/admin/study/certInsureList.do">
	<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${mapInfo.CSEQNO}"/>"/>
	<input type="hidden" name="userno" value=""/>
	<input type="hidden" name="studySdate" value="<c:out value="${mapInfo.STUDY_SDATE}"/>"/>
	<input type="hidden" name="studyEdate" value="<c:out value="${mapInfo.STUDY_EDATE}"/>"/>
	<input type="hidden" name="seqTitle" value="<c:out value="${mapInfo.SEQ_TITLE}"/>"/>
	<input type="hidden" name="mtCgrpCode" value="<c:out value="${mapInfo.MT_CGRP_CODE}"/>"/>
	<input type="hidden" name="courseno" value="<c:out value="${mapInfo.COURSENO}"/>"/>
 
 <!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수료증발급 > 노동부 수료증<span></span></div>
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
				<c:out value="${mapInfo.STUDY_SDATE}"/> ~  <c:out value="${mapInfo.STUDY_EDATE}"/> 
  			</td>
		</tr> 
		</tbody>
	</table>
 
 <div class="space"></div>
 <table width="100%" class="btn_Group">
  <tbody>
	<tr>
		<td class="pageinfo">
			조회건수 <span class="red"><c:out value="${fn:length(resultList)}"/></span> 건
 		</td>		
		<td align="right">
			<a href="#" onclick="smsFormGroup(document.pform);" class="btn sky">SMS발송</a>	
			<a href="#" onclick="mailFormGroup(document.pform);" class="btn sky">메일발송</a>
			<a href="/admin/study/certCseqList.do" class="btn orange">목록</a>	
		</td>
	</tr>
  </tbody>
  </table>
 
 <table class="tb table-type1">
	<tr class="rndbg">
		<th><input type="checkbox" class="input_chbox" style="border:0px" name="isall" id="isall" onclick="MsgUserAllCheck();"/></th>
		<th>소속</th>
		<th>성명</th>
		<th>회원아이디</th>
		<th>주민번호</th>
		<th>출석</th>
		<th>시험</th>
		<th>총점</th>
		<th>발급</th> 
	</tr>
	<colgroup>
		<col align=middle width="10%"> 
		<col align=middle width="15%">
		<col align=middle width="10%">
		<col align=middle width="10%">
		<col align=middle width="15%">
		<col align=middle width="10%">
		<col align=middle width="10%">
		<col align=middle width="10%">
		<col align=middle width="10%">
	</colgroup>	
    <c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle>
			<td>
				<input type="hidden" name="cuserno" id="cuserno" value="<c:out value="${result.CUSERNO}"/>"/>
				<input type="hidden" name="userId" id="userId" value="<c:out value="${result.USERID}"/>"/>
				<input type="hidden" name="mtPmTypeCode" id="mtPmTypeCode" value="<c:out value="${result.MT_PM_TYPE_CODE}"/>"/>
				<input type="checkbox" name="msg_user" id="msg_user" value="<c:out value="${result.USERID}"/>/<c:out value="${result.USERNAME}"/>/<c:out value="${result.EMAIL}"/>/<c:out value="${result.MOBILE}"/>/<c:out value="${result.USERNO}"/>"/>    
			</td>
  			<td><c:out value="${result.COMNAME}"/></td>
 			<td><c:out value="${result.USERNAME}"/></td>
 			<td><c:out value="${result.USERID}"/></td>
  			<td><c:out value="${result.ATTEND_VAL}"/></td>
  			<td><c:out value="${result.EXAM_FINAL_VAL}"/></td>
  			<td><c:out value="${result.FINAL_VAL}"/></td>
  			<td>
  				<c:choose>
  				<c:when test="${result.ISPASS == 'Y'}">
  					<a href="#" onclick="goPrint('<c:out value="${result.USERNO}"/>');" class="btn sky">출력</a>	
  				</c:when>
  				<c:otherwise>
  					-
  				</c:otherwise>
  				</c:choose>
  			</td>
    	</tr> 
  			
 	<tr><td class=rndline colspan=9></td></tr> 
 	</c:forEach>
</table> 
</form> 
<div class="space"></div>
<!-- 공백 default 20px -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>