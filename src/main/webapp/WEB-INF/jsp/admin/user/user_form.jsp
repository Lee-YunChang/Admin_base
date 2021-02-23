<%
/****************************************************
 system	: 회원관리 > 회원수정
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
<script type="text/javascript">
	
	$(document).ready(function() {
		var tutorAt = $(':radio[name=tutorAt]:checked').val();
		if(tutorAt == 'Y') {
			$("#tutorCode").show();
		}
		else $("#tutorCode").hide();
	});
	
	//상태 업뎃 등록
	function fnUpdate(){	
		if($("#mtGradeCode option:selected").val() == '') {
			alert('회원구분을 선택해주세요.');
			$("#mtGradeCode").focus();
			return;
		}
		
		if($(':radio[name=tutorAt]:checked').val() == 'Y' && $(':radio[name=mtTutorCode]:checked').val() == null) {
			alert('강사구분을 선택해 주세요.');
			return;
		}

		if(confirm('수정 하시겠습니까?')){
			$("#pform").attr("target", "");
			$("#pform").attr("action", "/admin/user/userExec.do");
			$("#pform").submit();
		}
	}

	// 비밀번호 초기화
	function fnPwdClear(userNo) {
		if(confirm('비밀번호를 초기화 하시겠습니까?')){	
			$("#pform").attr("target", "");
			// 취약점 때문에 인코딩 해서 패스워드 보내지 않음 20190503 주석
// 			var pwd = fn_encrypt(encodeURIComponent($('#securedPassword').val()));
		
			$.ajax({
				url : "/admin/user/userPwdClear.do",
// 				data : { userNo : userNo, securedPassword : pwd },
				data : { userNo : userNo},
				dataType : "json",
				type : 'post',
				success : function(result) {
					alert('비밀번호가 초기화되었습니다.');
				},
				error : function(e) {
					alert("error :" + e.responseText);
				}
			});	
		}
	}
	
	//비밀번호 변경
	function fn_encrypt(str){
		return fn_encode(escape(str));
	}

	function fn_encode(input){
		var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
		var output = "";
		var chr1,chr2,chr3;
		var enc1, enc2, enc3, enc4;
		var i =0;
		do{
			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);
			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) <<  4 | (chr2 >> 4));
			enc3 = ((chr2 & 15) <<  2 | (chr3 >> 6));
			enc4 = chr3 & 63;
			if(isNaN(chr2)){
				enc3 = enc4 =64;
			}else if(isNaN(chr3)){
				enc4 =64;
			}
			output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4);
			
		}while(i<input.length);
		return output;
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
	
	function fnTutorAtChk(pval) {
		var tutorAt = $(':radio[name=tutorAt]:checked').val();
		if(tutorAt == 'Y') {
			$("#tutorCode").show();
		}
		else {
			$("#tutorCode").hide();
		}
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
<div class="title title_top">회원정보<span></span></div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/user/userExec.do" method="post">
 	<input type="hidden" name="userNo" id="userNo" value="<c:out value="${userInfo.USERNO}"/>"/>
 	<input type="hidden" name="cuserNo" id="cuserNo" value=""/>
 	<input type="hidden" name="comNo" id="comNo" value="<c:out value="${userInfo.COMNO}"/>" />
	<input type="hidden" name="orgCode" id="orgCode" value="" />
	<input type="hidden" name="sdate" id="sdate" value="" />
	<input type="hidden" name="edate" id="edate" value="" />
	<input type="hidden" id="tutorGubun" value="${userInfo.TUTOR_CODE}" />
	<input type="hidden" name="securedPassword" id="securedPassword" value="<c:out value="${REQUEST_DATA.newPwd}"/>" />
	<input type="hidden" id="userId" name="userId" value="<c:out value='${userInfo.USERID}'/>" />
	<table class="table-type1 search_form" >
	  	<colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
				<col class="cellc" width="15%">
				<col class="celll" width="35%">
		</colgroup>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><c:out value='${userInfo.USERID}'/></td>
				<th>성명</th>
				<td><input type="text" class="line" id="mbernm" name="mbernm" value="<c:out value='${userInfo.USERNAME}'/>" style="width:200px;" /></td> 
			</tr> 
			<tr>
				<th>성별</th>
				<td>
					 <select name="sex" id="sex" title="성별">
				 		<option value="">선택</option>
						<option value="M" <c:if test="${userInfo.SEX eq 'M'}">selected="selected" </c:if>>남자</option>
						<option value="F" <c:if test="${userInfo.SEX eq 'F'}">selected="selected" </c:if>>여자</option>
					</select>
				</td>
				<th>생년월일</th>
				<td><input type="text" class="line" id="brthdy" name="brthdy" value="<c:out value='${userInfo.BRTHDY}'/>" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/></td>
			</tr>
			<c:if test="${userInfo.SECSN_AT ne 'Y'}">
			<tr>
				<th>이메일주소</th>
				<td><input type="text" class="line" id="email" name="email" value="<c:out value='${userInfo.EMAIL}'/>" style="width:200px;" /></td>
				<th>휴대폰번호</th>
				<td><input type="text" class="line" id="mobile" name="mobile" value="<c:out value='${userInfo.MOBILE}'/>"/> <FONT class=extext>010-1234-1234</FONT></td>
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
				<th>지점</th>
				<td>
					<input type="text" name="mtOfficeName" id="mtOfficeName" class="line" value="<c:out value="${userInfo.MT_OFFICE_NAME}"/>" value="">
					<a href="#" onclick="fnCompanyPop();return false;" class= "btn gray small"/>변경</a>
					<input type="hidden" name="mtOfficeCode" id="mtOfficeCode" value="<c:out value="${userInfo.MT_OFFICE_CODE}"/>"/>
				</td>
			</tr>
			<tr>
                <th rowspan="2">주소</th>
                <td colspan="3">
                    <input type="text" class="line" id="lnmZip" name="lnmZip" value="<c:out value="${userInfo.LNM_ZIP}"/>" style="width:70px;"/>&nbsp;
                    <a href="#" onclick="zipSearch();" class= "btn gray small">우편번호검색</a>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="text" class="line" id="lnmAdres1" name="lnmAdres1" value="<c:out value="${userInfo.LNM_ADRES1}"/>" style="width:45%"/>&nbsp;&nbsp;
                    <input type="text" class="line" id="lnmAdres2" name="lnmAdres2" value="<c:out value="${userInfo.LNM_ADRES2}"/>" style="width:45%"/>
                </td>
            </tr>	
			<tr>
				<th>이메일 수신여부</th>
				<td>
					<input type="radio" name="emailRecptnAt" value="Y" title="" <c:if test="${userInfo.EMAIL_RECPTN_AT == 'Y'}"> checked="checked" </c:if>>Y
					<input type="radio"  name="emailRecptnAt" value="N" title="" <c:if test="${userInfo.EMAIL_RECPTN_AT == 'N'}"> checked="checked" </c:if>>N
				</td>
				<th>인증수단</th>
				<td>
					<c:choose>
						<c:when test="${userInfo.AUTH_MODE eq 'M'}">이메일 인증</c:when>
						<c:when test="${userInfo.AUTH_MODE eq 'S'}">SMS 인증</c:when>
						<c:when test="${userInfo.AUTH_MODE eq 'P'}">핸드폰 인증</c:when>
						<c:when test="${userInfo.AUTH_MODE eq 'I'}">아이핀 인증</c:when>
						<c:when test="${userInfo.AUTH_MODE eq 'C'}">카드 인증</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>비밀번호 초기화</th>
				<td>
					<a href="#" onclick="fnPwdClear('<c:out value="${userInfo.USERNO}"/>');return false;" class= "btn red small">초기화</a>
					<strong>(비밀번호 : <c:out value="${REQUEST_DATA.newPwd}"/>)</strong>
				</td>
				<th>인증일시</th>
				<td>
					<c:out value="${userInfo.KCB_AUTH_DATE}"/>
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	
	<%-- <div class="title">수강정보<span></span></div>
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
					<a href="#" onclick="fnPassPrint('<c:out value="${result.MT_CTYPE_CODE}"/>', '<c:out value="${result.CUSERNO}"/>', '<c:out value="${result.USERNO}"/>','<c:out value="${result.STARTDATE}"/>','<c:out value="${result.ENDDATE}"/>'); return false;" class="btn brown">발급</a>
					</c:if>
				</td> 
			</tr> 
			</c:forEach>
		</tbody>
	</table>
	
	<div class="title">강사정보<span></span></div>
	<table class="table-type1 search_form" >
	  	<colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="85%">
		</colgroup>
		<tbody>
			<tr>
				<th>강사여부</th>
				<td>
					<input type="radio" name="tutorAt" value="Y" onclick="fnTutorAtChk(this.value);" <c:if test="${userInfo.TUTOR_AT eq 'Y'}"> checked</c:if>/> 강사&nbsp;&nbsp;
					<input type="radio" name="tutorAt" value="N" onclick="fnTutorAtChk(this.value);" <c:if test="${userInfo.TUTOR_AT eq 'N' || userInfo.TUTOR_AT eq ''}"> checked</c:if>/> 미강사
				</td>
			</tr>
			
			<tr>
				<th>강사구분</th>
				<td>
					<c:set var="tutorCodeHn"><%=SangsProperties.getProperty("Globals.mtCode_MT_TUTOR_CODE_HN")%></c:set>
					<c:if test="${userInfo.TUTOR_AT eq 'Y'}">
						<span id="tutorCode" style="display:none">
							<c:forEach var="result" items="${mtTutorCode }" varStatus="status">
								<input type="radio" name="mtTutorCode" value="${result.MT_SUB_CODE}" 
								<c:if test="${userInfo.TUTOR_CODE eq result.MT_SUB_CODE}"> checked</c:if>/> ${result.MT_SUB_NAME}&nbsp;&nbsp;
							</c:forEach>
						</span>
					</c:if>
					<c:if test="${userInfo.TUTOR_AT ne 'Y'}">-</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="title">상담사정보<span></span></div>
	<table class="table-type1 search_form" >
	  	<colgroup>
				<col class="cellc" width="15%">
				<col class="celll" width="85%">
		</colgroup>
		<tbody>
			<tr>
				<th>상담사여부</th>
				<td>
					<input type="radio" name="counselAt" value="Y" onclick="fnTutorAtChk(this.value);" <c:if test="${userInfo.COUNSELOR_AT eq 'Y'}"> checked</c:if>/> 상담사&nbsp;&nbsp;
					<input type="radio" name="counselAt" value="N" onclick="fnTutorAtChk(this.value);" <c:if test="${userInfo.COUNSELOR_AT eq 'N' || userInfo.COUNSELOR_AT eq ''}"> checked</c:if>/> 미상담사
				</td>
			</tr>
		</tbody>
	</table> --%>
	
	<c:if test="${userInfo.SECSN_AT ne 'Y'}">
		<div class="button">
			<a href="#" onclick="fnUpdate(); return false;"  class= "btn big green">수정</a>  
			<a href="#" onclick="self.close();" class= "btn big gray">취소</a>
		</div>
	</c:if>
	</form>
	
 <%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_pop_inc.jsp"%>
 