<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 강의평가 > (팝업) 등록/수정 양식 
	summary	:	
 	wdate	: 2016-05-25
 	writer	: 이진영
 *****************************************************/
 %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<c:set var="mtCpollCode"></c:set>
<c:choose>
	<c:when test="${map.MT_CPOLL_CODE ne null}"><c:set var="mtCpollCode" value="${map.MT_CPOLL_CODE}"/></c:when>
	<c:otherwise><c:set var="mtCpollCode"><%=SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_CHO")%></c:set></c:otherwise>
</c:choose>

<script type="text/javascript">

function isRadioChecked(object){
	var result = "N";
	for(i=0; i<object.length; i++){
		if (object[i].checked == true) {
			result = "Y";
			break;
		}
	}
}

function writeFormCheck(){
	
	var form = document.pform;
	if (form.subject.value == ''){alert("설문 내용을 입력하세요."); form.subject.focus();}
	else if (form.mtcpollcode.value == ''){alert("설문 유형을 선택하세요.");}
	else if (isRadioChecked(form.useyn) == 'N'){alert("사용여부를 선택하세요.");}
	else {
		var submitWin = window.confirm("${titleMode}하시겠습니까?");
		if (submitWin){form.submit();}
	}
}

</SCRIPT>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">설문 ${titleMode}<span> 과정별 설문지를 ${titleMode}할 수 있습니다.</span></div>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" action="/admin/course/pollExec.do" method="post" onsubmit="writeFormCheck(); return false;">
<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="qno" value="<c:out value="${REQUEST_DATA.qno}"/>"/>

<table class="table-type1 search_form">	
	<colgroup>
	<col class=cellc width="20%">
	<col class=celll width="*">
	<tbody>
		<tr>
			<th>설문유형</th>
			<td>
				<select name="mtcpollcode" id="mtcpollcode" title="설문유형" onchange="mtPollCheck(this.value);">
					<c:forEach var="emap" items="${categoryData1}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtcpollcode == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
 				</select>
			</td> 
		</tr>
		<tr>
			<th>설문내용</th>
			<td><textarea name="subject" style="width:100%;height:50px;overflow:visible" class="tline"><c:out value="${map.SUBJECT}" escapeXml="false"/></textarea></td> 
		</tr>
		<tr id="question">
			<th>문항</th>
			<td>
				<p id="a01item">
				1) <input class="line" value="<c:out value="${map.ITEM01}"/>" name="item01" style="width:70%"/> 
				&nbsp; 배점 : <input class="line" value="<c:out value="${map.ITEM01_VAL}"/>" name="item01_val" style="width:40px"/> 
				</p>
				<div class="space5"></div>
				<p id="a02item">
				2) <input class="line" value="<c:out value="${map.ITEM02}"/>" name="item02" style="width:70%"/> 
				&nbsp; 배점 : <input class="line" value="<c:out value="${map.ITEM02_VAL}"/>" name="item02_val" style="width:40px"/> 
				</p>
				<div class="space5"></div>
				<p id="a03item">
				3) <input class="line" value="<c:out value="${map.ITEM03}"/>" name="item03" style="width:70%"/> 
				&nbsp; 배점 : <input class="line" value="<c:out value="${map.ITEM03_VAL}"/>" name="item03_val" style="width:40px"/> 
				</p>
				<div class="space5"></div>
				<p id="a04item">
				4) <input class="line" value="<c:out value="${map.ITEM04}"/>" name="item04" style="width:70%"/> 
				&nbsp; 배점 : <input class="line" value="<c:out value="${map.ITEM04_VAL}"/>" name="item04_val" style="width:40px"/> 
				</p>
				<div class="space5"></div>
				<p id="a05item">
				5) <input class="line" value="<c:out value="${map.ITEM05}"/>" name="item05" style="width:70%"/> 
				&nbsp; 배점 : <input class="line" value="<c:out value="${map.ITEM05_VAL}"/>" name="item05_val" style="width:40px"/> 
				</p>
			</td>
		</tr>
		<tr>
			<th>부가설명(참고자료)</th>
			<td><textarea name="summary" style="width:100%;height:50px;overflow:visible" class="tline"><c:out value="${map.SUMMARY}"/></textarea></td> 
		</tr>
		<tr>
			<th>사용여부</th>
			<td class=noline>
				<input value="Y" type="radio" name="useyn" checked <c:if test="${map.USEYN == 'Y'}"> checked="checked"</c:if>/> 
				Y 
				&nbsp;
				<input value="N" type="radio" name="useyn" <c:if test="${map.USEYN == 'N'}"> checked="checked"</c:if>/>  
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
</div>
</form>
<!-- 본문 > 메인 > 목록 끝 -->

<script type="text/javascript">
function mtPollCheck(code) {

	var mtCpollCodeDes = "<%=SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_DES")%>";
	var mtCpollCodeCho = "<%=SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_CHO")%>";
	
	//주관식일때
	if (code == mtCpollCodeDes){
		$("#question").hide();
	//객관식일때 지문 보이기
	} else if (code == mtCpollCodeCho){
		$("#question").show();
	}

}
document.pform.mtcpollcode.value = '${mtCpollCode}';
mtPollCheck('${mtCpollCode}');
</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>