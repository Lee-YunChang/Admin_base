<%
/****************************************
	system	: ClassDesk > 공통 > 메일보내기 
	title	: 메일폼
	summary	:	
    wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"  %>
  
<!-- 메일 발송관련 초기 세팅 -->
<%
//에디터업로드 이미지 경로 선언 
String webEditPath= SangsProperties.getProperty("Globals.bbsFilePath");
com.ckeditor.CKEditorConfig ckeditorSettings = com.sangs.util.CKEditorUtil.getCKEditorConfig(webEditPath);
%>

<c:set var="ckeditorSettings" value="<%=ckeditorSettings %>"/>

<script type="text/javascript">
	$(function() {
		$( '#selectable' ).selectable();
	});


	function list_del(){
		var current = $('#selectable').find('.ui-selected');
		current.remove(); //삭제
		   
		checkCnt();
	}
	 
	function list_add(){
		 var mailAddr = '-/-/';
		  
		 if ($('input[name=destAdd]').valueEmpty()) {
			alert('추가할 메일 주소를 입력해주세요');	 
			return;
		 }else{
			 mailAddr = mailAddr + $('input[name=destAdd]').val();
			 $('#selectable').append('<li>'+mailAddr+'</li><input type = 'hidden' name='receiver_list' id='receiver_list' value=''+mailAddr+''/>');
			 $('input[name=destAdd]').val('');
				checkCnt();
		 };
 	}
	
	// 수신자 수
	function checkCnt(){ 
		var cnt = $('li').length;
		$('#userCnt').html(cnt);
	}
	
	$( document ).ready(function() {
		checkCnt();
	});
   </script> 

<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">메일발송</h1>
		<!-- 20130820일자 삭제or주석처리 <div class="bg-tnb-line"></div>-->
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content">
	<!-- 문제등록 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">발송정보입력</h3>
	</div>
	<div class="round-box-small blue">
		<!-- 문제등록 테이블 -->
		<form id="mailForm" name="mailForm" action="/classdesk/common/mail/exec.do" method="post">
		<div class="table-type2">
			<table summary="상상스토리 교육시스템의 발송정보입력입니다.">
				<caption>발송정보입력</caption>
				<colgroup>
					<col width="140" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>보내는 사람</th>
						<td><label for="sender_userName">보내는 사람 성명</label><input type="text" class="w98" name="sender_userName" id="sender_userName" value='<c:out value="${REQUEST_DATA.sender_userName}"/>' /></td>
					</tr>
					<tr>
						<th>보내는 사람 메일</th>
						<td><label for="send-mail">보내는 사람 메일주소</label><input type="text" class="w98" name="sender_mailaddr" id="sender_mailaddr" value="<c:out value="${REQUEST_DATA.sender_mailaddr}"/>" /></td>
					</tr>
					<tr>
						<th>받는 사람</th>
						<td>
							<div class="table-in-row">
								<label for="rec-mail">받는 사람 메일주소</label><input type="text" class="w50" name="destAdd" id="destAdd" value="" />
								<a href="#" onclick="list_add()"><img src="/classdesk/images/btn_s_add.png" alt="추가" /></a>
							</div>
							<div class="table-in-row">
								<ul id="selectable"> 
									<c:choose>
										<c:when test="${not empty listData}">
											<c:forEach items="${listData}" var="result" varStatus="stat"> 
													<li><c:out value="${result}"/><input type = "hidden" name="receiver_list" id="receiver_list" value="<c:out value="${result}"/>"/></li> 
											</c:forEach>
										</c:when>
									</c:choose>
								</ul>
 								<p style="float:left;">받는 사람 수 : <strong class="blue" name="userCnt" id="userCnt">0</strong> / 1000 (받는 사람은 최대 1000명까지 가능합니다.)</p>
								<a href="#" onclick="list_del()"><img src="/classdesk/images/btn_s_delete.png" alt="삭제" style="margin-top:9px; float:right;" /></a>
							</div>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><label for="subject">제목</label><input type="text" class="w98" name="subject" id="subject" value="<c:out value="${rowData.TITLE}"/>" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
						
						<div class="w98" style="min-height:250px;">
  							<textarea name="content2" rows="22" style="width:96%;" ><c:out value="${rowData.CONTENT}"/>   </textarea>
  							<ckeditor:replace replace="content2" basePath="${pageContext.request.contextPath}/common/ckeditor" config="${ckeditorSettings}" ></ckeditor:replace>
  						</div> 
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		<!-- //문제등록 테이블 -->
		<!-- 라운드박스 구성요소 -->
		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div>
		<!-- //라운드박스 구성요소 -->
	</div>
	<!-- //문제등록 -->
</div>
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup">
		<a href="#" onclick="fnMailExec()" class="btn-large-blue"><span>발송</span></a>
		<a href="#" class="btn-large-orange"><span>취소</span></a>
	</div>
</div>

<script type="text/javascript">
<!--  
	// 등록 폼
	function fnMailExec(){ 
        $('#mailForm').attr('target', '_cm').submit();
	}
	
	function fnClose(){ 
		self.close();
	}
	 
//-->
</script>
	
</body>
</html>
