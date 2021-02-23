<%/****************************************************
	system	: 시스템관리 > 메일 템플릿관리 등록수정 폼
	title	: 메일 템플릿관리 등록수정 폼
	summary	:	
	wdate	: 2016-06-09
	writer	: 조남훈
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<!-- 변수 setting -->
<c:if test="${REQUEST_DATA.pageMode == 'reg'}">
	<c:set var="titleMode" value="등록" /> 
</c:if>
<c:if test="${REQUEST_DATA.pageMode == 'mod'}"> 
	<c:set var="titleMode" value="수정" />
</c:if>

<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
    $("input:text[numberOnly]").live("keyup", function() {
        $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
    });
});

	function writeFormCheck(){
		
	 	var form = document.writeform;
	 	var qu=form.qu.value;  
	 	
	 	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	 	
	    //내용 필수 입력
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		}
		
   		if (form.tplname.value == ''){
 			alert("템플릿명을 입력하세요."); 
 			form.tplname.focus();
 			
 		} else if (form.title.value == ''){
 			alert("제목을 입력하세요."); 
 			form.title.focus();
 		} else if (form.tplUid.value == ''){
 			alert("탬플릿 UID를 입력하세요."); 
 			form.tplUid.focus();
 		} else if (form.useyn.value == ''){
 			alert("사용여부를 선택하세요."); 
 		} else {
 			var submitWin = window.confirm('<c:out value="${titleMode}" />하시겠습니까?'); 
 			if (submitWin){
 				form.submit();
 			}
 		}
	 	  
	}

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">메일탬플릿 <c:out value="${titleMode}" /> </div>
<!-- 본문 > 메인 > 목록 시작  -->
<form name="writeform" action="/admin/sysman/mailmanTplExec.do" method="post">
	<input type="hidden" name="tplno"	id="tplno"		value="<c:out value="${REQUEST_DATA.tplno}" />"/>	 
	<input type="hidden" name="qu"		id="qu"			value="<c:out value="${REQUEST_DATA.qu}" />"/>	 
	<table class="table-type1 search_form">
	  <colgroup>
		<col class="cellc" width="15%">
		<col class="celll" width="85%">
		</colgroup><tbody>
		<tr>
			<th>탬플릿명</th>
			<td colspan="3"><input type="text" class="line" id="tplname" name="tplname" style="width:100%" title="탬플릿명" value="${mapInfo.TPLNAME}"/>  </td>
		</tr> 
	  	<tr>
			<th>사용여부</th>
			<td colspan="3">
 			  	<input type="radio" name="useyn" value="Y" <c:if test="${mapInfo.USEYN == 'Y' || mapInfo.USEYN == ''}">checked="checked" </c:if>style="border:0px" checked/> 사용  &nbsp;
			  	<input type="radio" name="useyn" value="N" <c:if test="${mapInfo.USEYN == 'N'}">checked="checked" </c:if>style="border:0px"/> 미사용  
 
 			</td>
		</tr> 
		<tr>
			<th>탬플릿UID</th>
			<td colspan="3">
				<input type="text" class="line" id="tplUid" name="tplUid" style="width:25%" title="탬플릿UID" value="<c:out value="${mapInfo.TPL_UID}" />" numberonly="true" maxlength="10"/>
				<font class=extext>숫자만 입력 가능 합니다.(최대 10자리)</font> 
			</td>
		</tr>
		<tr>
 			<th>메일 발송 제목</th>
 			<td><input type="text" class="line" id="title" name="title" style="width:100%" title="제목" value="<c:out value="${mapInfo.TITLE}" />"/>  </td>
		</tr>
		<tr>
			<th>메일 내용</th>
			  <td style="padding:20px 10px 20px 10px;" colspan="3">
	               <div>
	                   <!-- [필수]에디터 안에 글내용 영역 -->
	                   <textarea name="content" id="content" rows="22" style="width:100%;" ><c:out value="${mapInfo.CONTENT}" escapeXml="false"/></textarea>
	                   <%-- <ckeditor:replace replace="content" basePath="${pageContext.request.contextPath}/admin/common/ckeditor" config="${ckeditorSettings}" ></ckeditor:replace> --%>
	               </div>
	         </td>
		</tr>
		</tbody>
	</table>
	 
	<div class="button">
			<c:if test="${REQUEST_DATA.pageMode == 'reg'}">
				<a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a> 
			</c:if>
			<c:if test="${REQUEST_DATA.pageMode == 'mod'}"> 
				<a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
			</c:if>
			<a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
	</div>
</form> 

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

</script>
 <%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_pop_inc.jsp"%>

