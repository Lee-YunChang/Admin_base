<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 최종평가 > (팝업) 문제 등록/수정 양식 
	summary	:	
	wdate	: 2016-05-19
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
<script type="text/javascript">

function isRadioChecked(object){
	var result = 'N';
	for(var i=0; i<object.length; i++) {
		if (object[i].checked == true) {
			result = 'Y';
			break;
		}
	}
}

function writeFormCheck(){
	var form = document.writeform;
	if(form.qtype.value == '' || form.qtype.value == null){
		alert('문제유형을 선택해주세요.');
		return false;
	}
	if (form.qsubject.value == ''){
		alert('문제내용을 입력하세요!'); 
		form.qsubject.focus();
		return false;	
		
	} else if (isRadioChecked(form.rcode) == 'N'){
		alert('정답을  선택하세요!');
		return false;
		
	} else if (isRadioChecked(form.useyn) == 'N'){
		alert('사용여부를 선택하세요!');
		return false;
		
	} else {
		var submitWin = window.confirm('${titleMode}하시겠습니까?');
		if (submitWin){form.submit();}
	}
}

function qtypeCheck(qtype){
	
	if (qtype == 1){	//OX문제
		document.all("a01item").style.display = "block";
		document.all("a02item").style.display = "block";
		document.writeform.a01.value = "O";
		document.writeform.a02.value = "X";
		document.all("a03item").style.display = "none";
		document.all("a04item").style.display = "none";
		document.all("a05item").style.display = "none";
		document.all("rTextArea").style.display = "none";
	} else if (qtype == 2){	//객관식		
		document.writeform.a01.value = document.writeform.a01_hidden.value;
		document.writeform.a02.value = document.writeform.a02_hidden.value;
		document.writeform.a03.value = document.writeform.a03_hidden.value;
		document.writeform.a04.value = document.writeform.a04_hidden.value;
		document.writeform.a05.value = document.writeform.a05_hidden.value;
		document.all("a01item").style.display = "block";
		document.all("a02item").style.display = "block";
		document.all("a03item").style.display = "block";
		document.all("a04item").style.display = "block";
		document.all("a05item").style.display = "block";
		document.all("rTextArea").style.display = "none";
	} else if (qtype == 4){	//단답형
		document.all("a01item").style.display = "none";
		document.all("a02item").style.display = "none";
		document.all("a03item").style.display = "none";
		document.all("a04item").style.display = "none";
		document.all("a05item").style.display = "none";
		document.all("rTextArea").style.display = "block";
		
	} else if (qtype == 5){	//서술형
		document.all("a01item").style.display = "none";
		document.all("a02item").style.display = "none";
		document.all("a03item").style.display = "none";
		document.all("a04item").style.display = "none";
		document.all("a05item").style.display = "none";
		document.all("rTextArea").style.display = "block";
	}

}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">문제관리 > 문제${titleMode}<span></span></div>

<!-- 본문 > 상단 > 안내문구 시작 -->
<!-- <table width="100%" class="tb_Message">
	<tbody>
	<tr>
		<td style="padding-bottom: 10px; padding-left: 10px; padding-right: 0px; padding-top: 7px">
		
			<div style="padding-top: 5px"><b>※ 단답형 문제일 경우 </b></div>
			<div style="padding-top: 7px"><font class=g9 color=#666666>지문 1)번을 정답처리하고 2)번에 유사답안을 입력하세요.(여러개일경우 ; 구분자처리)</font></div>
			
			<div style="padding-top: 5px"><b>※ 서술형 문제일 경우 </b></div>
			<div style="padding-top: 7px"><font class=g9 color=#666666>지문 1)번에 정답관련한 문구를 넣어주세요.</font></div>
		</td>
	</tr>
	</tbody>
</table> -->
<!-- 본문 > 상단 > 안내문구 끝 -->
<!-- <div class="space"></div> --><!-- 공백 default 20px -->
<div style="margin-bottom:10px;"></div>


<!-- 본문 > 메인 > 목록 시작  -->
<form name="writeform" action="/admin/course/examQexec.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="secno" id="secno" value="<c:out value="${REQUEST_DATA.secno}"/>"/>
<input type="hidden" name="qno" value="<c:out value="${REQUEST_DATA.qno}"/>"/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.courseImgPath")%>"/>

<input type="hidden" name="UPLOAD_FILE" id="UPLOAD_FILE" value=""/>
<table class="table-type1 search_form" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
	<colgroup>
		<col class="cellc" width="15%">
			<col class="celll" width="85%">
	</colgroup>
	<tbody>
	<tr>
		<th>문제유형</th>
		<td>
			<select name="qtype" id="qtype" title="문제유형" onchange="qtypeCheck(this.value);">
				<option value="">--문제유형선택--</option>
				<option <c:if test="${map.QTYPE eq '2'}"> selected="selected"</c:if> value="2">객관식</option>
				<option <c:if test="${map.QTYPE eq '1'}"> selected="selected"</c:if> value="1">OX문제</option>
				<%-- <option <c:if test="${map.QTYPE eq '4'}"> selected="selected"</c:if> value="4">단답형</option>
				<option <c:if test="${map.QTYPE eq '5'}"> selected="selected"</c:if> value="5">서술형</option> --%>
	       	</select> 
		</td>
	</tr>
	<tr>
		<th>문제</th>
		<td><textarea name="qsubject" style="width:100%;height:50px;overflow:visible" class="tline"><c:out value="${map.QSUBJECT}"/></textarea></td> 
	</tr>
	<tr>
		<th>문제이미지</th>
		<td>
			<input type="file" name="qsubjectFile" id="qsubjectFile"  style="width:80%; border:none;"/>
			<div class="image-delete">
				<c:if test="${map.QSUBJECT_FILE != null}">
					<img width="150" src="<%=SangsProperties.getProperty("Globals.addFileDomain")%>/<%=SangsProperties.getProperty("Globals.addFileRooturi")%>/<%=SangsProperties.getProperty("Globals.courseImgPath")%>/<c:out value="${map.QSUBJECT_FILE}"/>" alt=""> 
					<input type = "hidden" name="qsubjectFile" id= "qsubjectFile" value="<c:out value="${map.QSUBJECT_FILE}"/>"/>
					<input type="checkbox" name="delQsubjectFile" id="delQsubjectFile" class="check-mid" value="Y" />&nbsp;삭제
				</c:if>
			</div>
		</td> 
	</tr>
	<tr>
		<th>정답</th>
		<td>
			<div id="a01item">
				1) <input class="lline" value="<c:out value="${map.A01}"/>" name="a01" style="width:80%"/>
					<input type="hidden" id="a01_hidden" value="<c:out value="${map.A01}"/>"/> 
					&nbsp;<span class=noline><input value="1" type="radio" name="rcode" <c:if test="${map.RCODE == 1}">checked="checked"</c:if>/> 정답</span> 
					<input type="file" class="w80" name="a01File" id="a01File" style="width:80%; border:none;"/>
				<div class="image-delete"> 	
					<c:if test="${map.A01_FILE != null}">
						<img src="<%=SangsProperties.getProperty("Globals.addFileDomain")%>/<%=SangsProperties.getProperty("Globals.addFileRooturi")%>/<%=SangsProperties.getProperty("Globals.courseImgPath")%>/<c:out value="${map.A01_FILE}"/>" width="100" alt=""/> 
						<input type = "hidden" name="a01File" id= "a01File" value="<c:out value="${map.A01_FILE}"/>"/> 
						<input type="checkbox" name="delA01File" id="delA01File" class="check-mid" value="Y" />&nbsp;삭제
					</c:if>		
				</div>
				<br><br>
			</div>
			
			<div id="a02item">
				2) <input class="lline" value="<c:out value="${map.A02}"/>" name="a02" style="width:80%"/>
					<input type="hidden" id="a02_hidden" value="<c:out value="${map.A02}"/>"/> 
					&nbsp;<span class=noline><input value="2" type="radio" name="rcode" <c:if test="${map.RCODE == 2}">checked="checked"</c:if>/> 정답</span>
					<input type="file" class="w80" name="a02File" id="a02File" style="width:80%; border:none;"/>
				<div class="image-delete"> 	
					<c:if test="${map.A02_FILE != null}">					
						<img src="<%=SangsProperties.getProperty("Globals.addFileDomain")%>/<%=SangsProperties.getProperty("Globals.addFileRooturi")%>/<%=SangsProperties.getProperty("Globals.courseImgPath")%>/<c:out value="${map.A02_FILE}"/>" width="100" alt=""/> 
						<input type="hidden" name="a02File" id= "a02File" value="<c:out value="${map.A02_FILE}"/>"/> 
						<input type="checkbox" name="delA02File" id="delA02File" class="check-mid" value="Y" />&nbsp;삭제
					</c:if>					
				</div> 
				<br><br>
			</div>
			
			<div id="a03item">
				3) <input class="lline" value="<c:out value="${map.A03}"/>" name="a03" style="width:80%"/>
				<input type="hidden" id="a03_hidden" value="<c:out value="${map.A03}"/>"/> 
				&nbsp;<span class=noline><input value="3" type="radio" name="rcode" <c:if test="${map.RCODE == 3}">checked="checked"</c:if>/> 정답</span>
				<input type="file" class="w80" name="a03File" id="a03File"  style="width:80%; border:none;"/>
				<div class="image-delete"> 	
					<c:if test="${map.A03_FILE != null}">					
						<img src="<%=SangsProperties.getProperty("Globals.addFileDomain")%>/<%=SangsProperties.getProperty("Globals.addFileRooturi")%>/<%=SangsProperties.getProperty("Globals.courseImgPath")%>/<c:out value="${map.A03_FILE}"/>" width="100" alt=""/> 
						<input type = "hidden" name="a03File" id= "a03File" value="<c:out value="${map.A03_FILE}"/>"/> 
						<input type="checkbox" name="delA03File" id="delA03File" class="check-mid" value="Y" />&nbsp;삭제
					</c:if>						
				</div> 
				<br><br>
			</div>
			
			<div id="a04item">
				4) <input class="lline" value="<c:out value="${map.A04}"/>" name="a04" style="width:80%"/>
				<input type="hidden" id="a04_hidden" value="<c:out value="${map.A04}"/>"/> 
				&nbsp;<span class=noline><input value="4" type="radio" name="rcode" <c:if test="${map.RCODE == 4}">checked="checked"</c:if> /> 정답</span>
				<input type="file" class="w80" name="a04File" id="a04File"  style="width:80%; border:none;"/>
				<div class="image-delete"> 		
					<c:if test="${map.A04_FILE != null}">				
						<img src="<%=SangsProperties.getProperty("Globals.addFileDomain")%>/<%=SangsProperties.getProperty("Globals.addFileRooturi")%>/<%=SangsProperties.getProperty("Globals.courseImgPath")%>/<c:out value="${map.A04_FILE}"/>" width="100" alt=""/> 
						<input type = "hidden" name="a04File" id= "a04File" value="<c:out value="${map.A04_FILE}"/>"/> 
						<input type="checkbox" name="delA04File" id="delA04File" class="check-mid" value="Y" />&nbsp;삭제
					</c:if>					
				</div> 
				<br><br>
			</div>
			
			<div id="a05item">
				5) <input class="lline" value="<c:out value="${map.A05}"/>" name="a05" style="width:80%"/>
				<input type="hidden" id="a05_hidden" value="<c:out value="${map.A05}"/>"/> 
				&nbsp;<span class=noline><input value="5" type="radio" name="rcode" <c:if test="${map.RCODE == 5}">checked="checked"</c:if> /> 정답</span>
				<input type="file" class="w80" name="a05File" id="a05File"  style="width:80%; border:none;"/>
				<div class="image-delete">
					<c:if test="${map.A05_FILE != null}">					
						<img src="<%=SangsProperties.getProperty("Globals.addFileDomain")%>/<%=SangsProperties.getProperty("Globals.addFileRooturi")%>/<%=SangsProperties.getProperty("Globals.courseImgPath")%>/<c:out value="${map.A05_FILE}"/>" width="100" alt=""/> 
						<input type = "hidden" name="a05File" id= "a05File" value="<c:out value="${map.A05_FILE}"/>"/> 
						<input type="checkbox" name="delA05File" id="delA05File" class="check-mid" value="Y" />&nbsp;삭제
					</c:if>				
				</div> 
			</div>
			
			<!-- 주관식, 서술형일때 -->
			<div id="rTextArea" name="rTextArea" style="display: none;">
				<textarea name="rText" style="width: 100%;height:50px;"><c:out value="${map.RTEXT}"/></textarea>
			</div>
		</td>
	</tr>
	<tr>
		<th>해설</th>
		<td><textarea name="summary" style="width:100%;height:50px;overflow:visible" class="tline"><c:out value="${map.SUMMARY}"/></textarea></td> 
	</tr>
	<tr>
		<th>사용여부</th>
		<td class=noline>
			<input value="Y" type="radio" name="useyn" <c:if test="${map.USEYN == 'Y'}">checked="checked"</c:if> checked/> 
			Y 
			&nbsp;
			<input value="N" type="radio" name="useyn" <c:if test="${map.USEYN == 'N'}">checked="checked"</c:if>/>  
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
	<a href="#" onclick="history.go(-1);" class="btn big gray">취소</a>
<!-- 	<a href="javascript:popCloseCfm('N', '작성을 취소하겠습니까?');"><img src="/resource/images/btn_cancel.gif"></a>  -->
</div>
</form>

<!-- 로딩시 문제유형별 디스플레이 처리 -->
<script type="text/javascript">qtypeCheck('${map.QTYPE}');</script>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	