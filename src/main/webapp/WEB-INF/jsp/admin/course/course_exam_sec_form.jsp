<%
/****************************************************
	system	: 교육과정관리 > 과정정보관리
	title	: 최종평가 > 출제정책 등록/수정 양식 
	summary	:	
 	wdate	: 2016-05-19
 	writer	: 이진영
 *****************************************************/
 %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">

	function writeFormCheck(){
		var frm = document.pform;
		var result = 'N';
		for(var i=0; i<frm.useyn.length; i++){
			if (frm.useyn[i].checked == true) {
				result = 'Y';
				break;
			}
		}

		$("#pform").attr("action", "/admin/course/examSecExec.do");
		if (frm.sectitle.value == ''){
			alert('출제정책명을 입력하세요!'); frm.sectitle.focus();
		}else if (result == 'N'){
			alert('사용여부를 선택하세요!');
		}else {
			var submitWin = window.confirm('${titleMode}하시겠습니까?');
			if (submitWin){frm.submit();}
		}
	}
</script>
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">문제은행 &gt; 출제정책 ${titleMode}</div><%-- <span>시험 랜덤 문제은행의 출제정책을 ${titleMode}합니다.</span> --%>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/examSecForm.do" method="post" onsubmit="writeFormCheck(); return false;">
	<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
	<input type="hidden" name="secno" id="secno" value="<c:out value="${REQUEST_DATA.secno}"/>"/>

<table class="tb table-type1" style="width:100% "> 
	<colgroup>
	<col class=cellc>
	<col class=celll>
	<tbody>
	<tr>
		<th>*출제정책명</th>
		<td style="border-top:0 !important;"><input class="lline" value="<c:out value="${map.SECTITLE}"/>" name="sectitle"/> </td>
	</tr>
	<tr>
		<th>설명</th>
		<td><textarea name="description" style="width:100%;height:50px;overflow:visible" class="tline"><c:out value="${map.DESCRIPTION}"/></textarea></td> 
	</tr>
	<%-- <tr>
		<th>출제문제수</th>
		<td><input class="line" value="<c:out value="${map.TOTALQNUM}"/>" name="totalqnum"/> <FONT class=extext>출제될 문제수 정의, 숫자로 설정</FONT></td>
	</tr> --%>
	<tr>
		<th>*사용여부</th>
		<td class=noline>
			<input value="Y" type="radio" name="useyn" checked <c:if test="${map.USEYN eq 'Y'}"> checked="checked" </c:if>/> 
			Y 
			&nbsp;
			<input value="N" type="radio" name="useyn" <c:if test="${map.USEYN eq 'N'}"> checked="checked"</c:if>/>  
			N
		</td> 
	</tr>
	
	</tbody>
</table>

<div class="button">
	<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}">
		<a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
	</c:when>
	<c:otherwise>
		<a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>      
	</c:otherwise>
	</c:choose>
	<a href="#" onclick="self.close();" class="btn big gray">취소</a> 
<!-- <a href="javascript:popCloseCfm('N', '작성을 취소하겠습니까?');"><img src="/resource/images/btn_cancel.gif"></a>  -->
</div>
</form>

<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	
