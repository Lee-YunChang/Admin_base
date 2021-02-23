<%
/****************************************************
 system	: 회원관리 > 비회원수정
 title	: 회원 상세보기 및 수정
 summary:  
 wdate	: 2016-03-29
 writer	: 이진영
 *****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_pop_inc.jsp"%>
<c:choose>
<c:when test="${userInfo.UNITY_MBERNO > 0}">
	<c:set var="titleMode" value="수정"/>
</c:when>
<c:otherwise>
	<c:set var="titleMode" value="등록"/>
</c:otherwise>
</c:choose>
<script type="text/javascript">
	
	$(document).ready(function() {

	});
	
	//상태 업뎃 등록
	function fnUpdate(){	
		if($("#mbernm").val() == '') {
			alert('이름을 입력해주세요.');
			$("#mbernm").focus();
			return;
		}
		if($("#moblphon").val() == '') {
			alert('휴대폰번호를 입력해주세요.');
			$("#moblphon").focus();
			return;
		}
		if($("#brthdy").val() == '') {
			alert('생년월일을 입력해주세요.');
			$("#brthdy").focus();
			return;
		}
		if($("#mtGradeCode option:selected").val() == '') {
			alert('회원구분을 선택해주세요.');
			$("#mtGradeCode").focus();
			return;
		}
		
		if(confirm('${titleMode} 하시겠습니까?')){
			$("#pform").attr("target", "");
			$("#pform").attr("action", "/admin/user/nmberExec.do");
			$("#pform").submit();
		}
	}
	
	
	// 수료증 발급
	function fnPassPrint(mtCtypeCode, cuserNo, userNo,sdate,edate){
		
		var w1 =1070;
		var h1 = 900;
		var url = "";
		if(mtCtypeCode == "<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%>"){
			url = "/admin/study/cerOfflinePrint.do";
		}
		else {
			url = "/admin/study/cerOnlinePrint.do";
		}
		
		$("#sdate").val(sdate);
		$("#edate").val(edate);
		$("#pform").attr("target", "");
		$("#pform > input[name='userNo']").val(userNo);  
		$("#pform > input[name='cuserNo']").val(cuserNo);
		
		window.open( url+"?"+$("#pform").serialize()
			,"cert_pop","width="+w1+" height="+h1+", top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no");
	}
	
	
	//지점 검색팝업
	function fnCompanyPop(){
		var form = document.pform;
	    window.open("/admin/user/companySearchList.do","companyPop","width=750,height=600, scrollbars=YES");
	    form.action = "/admin/user/companySearchList.do";
	    form.target = "companyPop" ;
	    form.method = "post";
	    form.submit();
	}
	
	//지점 결과 콜백
	function fnCodePopupCallBack(data){
		$("#mtOfficeName").val(data.comName);
		$("#mtOfficeCode").val(data.comNo);
	}
	
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

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">비회원정보<span></span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/user/nmberExec.do" method="post">
 	<input type="hidden" name="userNo" id="UNITY_MBERNO" value="<c:out value="${userInfo.UNITY_MBERNO}"/>"/>
 	<input type="hidden" name="cuserNo" id="cuserNo" value=""/>
	<input type="hidden" name="sdate" id="sdate" value="" />
	<input type="hidden" name="edate" id="edate" value="" />
	<input type="hidden" name="mtOfficeCode" id="mtOfficeCode" value="<c:out value="${userInfo.MT_OFFICE_CODE}"/>"/>
	<table class="table-type1 search_form" >
	  	<colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
		</colgroup>
		<tbody>
			<tr>
				<th>회원여부</th>
				<td>비회원</td>
				<th>이름</th>
				<td><input type="text" class="line" id="mbernm" name="mbernm" value="<c:out value='${userInfo.MBERNM}'/>" style="width:200px;" /></td> 
			</tr> 
			<tr>
				<th>휴대폰번호</th>
				<td>
					<input type="text" class="line" id="moblphon" name="moblphon" value="<c:out value='${userInfo.MOBLPHON}'/>"/> <FONT class=extext>010-1234-1234</FONT>
				</td>
				<th>생년월일</th>
				<td><input type="text" class="line" id="brthdy" name="brthdy" value="<c:out value='${userInfo.BRTHDY}'/>" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>
				<FONT class="extext">19900101</FONT>
				</td>
				
			</tr>
			<tr>
				<th>회원구분</th>
				<td>
					 <select name="mtGradeCode" id="mtGradeCode" title="회원분류">
				 		<option value="">선택</option>
				 		<c:forEach items="${userGradeList}" var="result" varStatus="stat">
							<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${userInfo.MT_GRADE_CODE eq result.MT_SUB_CODE}">selected="selected" </c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
						</c:forEach>
					</select>
				</td>
				<th>성별</th>
				<td>
					<input type="radio" name="sex" id="sexM" class="line" value="M" <c:if test="${userInfo.SEX eq 'M' }">checked="checked"</c:if>>남 &nbsp;
					<input type="radio" name="sex" id="sexF" class="line" value="F" <c:if test="${userInfo.SEX eq 'F' }">checked="checked"</c:if> >여
				</td>
			</tr>
			<tr>
				<th>지점</th>
				<td colspan="3">
					<input type="text" name="mtOfficeName"  id="mtOfficeName" readonly="readonly" class="line" value="<c:out value="${userInfo.MT_OFFICE_NAME}"/>">
					<a href="#" onclick="fnCompanyPop();return false;" class= "btn gray small"/>변경</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	<c:if test="${userInfo.UNITY_MBERNO != null}">
	<div class="title">수강정보<span></span></div>
	<table class="table-type1 search_form" >
	  	<colgroup>
				<col class="cellc" width="5%">
				<col class="celll" width="7%">
				<col class="cellc" width="20%">
				<col class="celll" width="13%">
				<col class="celll" width="5%">
				<col class="celll" width="5%">
		</colgroup>
		<thead>
			<tr>
				<th>No</th>
				<th>구분</th>
				<th>과정명</th>
				<th>학습기간</th>
				<th>이수여부</th>
				<th>수료증발급</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${studyList}" varStatus="status">
			<tr align="center">
				<td><c:out value="${studyList[0].TOTAL_CNT - status.count+1}"/></td>
				<td><c:out value="${result.MT_CTYPE_NAME}"/></td>
				<td><c:out value="${result.SEQ_TITLE}"/></td>
				<td>
					<c:if test="${result.OPENTYPE == 'D'}">
						<c:out value='${result.STUDY_SDATE}'/>~<c:out value='${result.STUDY_EDATE}'/>
					</c:if>
					<c:if test="${result.OPENTYPE == 'A'}"> 
						<c:out value='${result.STARTDATE}'/>~<c:out value='${result.ENDDATE}'/>
					</c:if>
				</td>
				<td><c:if test="${result.ISPASS eq 'Y'}">이수</c:if><c:if test="${result.ISPASS ne 'Y'}">미이수</c:if></td>
				<td>
					<c:if test="${result.ISPASS eq 'Y'}">
					<a href="#" onclick="fnPassPrint('<c:out value="${result.MT_CTYPE_CODE}"/>', '<c:out value="${result.CUSERNO}"/>', '<c:out value="${result.UNITY_MBERNO}"/>','<c:out value="${result.STARTDATE}"/>','<c:out value="${result.ENDDATE}"/>'); return false;" class="btn brown">발급</a>
					</c:if>
				</td> 
			</tr> 
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	<div class="button">
		<a href="#" onclick="fnUpdate(); return false;"  class= "btn big blue"><c:out value="${titleMode}"/></a>  
		<a href="#" onclick="self.close();" class= "btn big gray">취소</a>
	</div>
	</form>
	
 <%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_pop_inc.jsp"%>
 