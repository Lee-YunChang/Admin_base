<%
/****************************************
	system	: ClassDesk > 강사 > 과제
	title	: 과제 평가 폼(팝업)
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS  
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"  %> 

<!-- header -->
<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">과제평가</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content">
	<!-- 과제출제 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">과제출제</h3>
	</div>
	<div>
		<!-- 과제출제 테이블 -->
		<div class="table-type2">
			<table>
				<caption>과제정보</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />  
				</colgroup>
				<tbody>
					<tr>
						<th>수강생이름</th>
						<td><label for="task-title">수강생이름</label><c:out value="${rowData.USERNAME}" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><label for="task-title">제목</label><c:out value="${rowData.TITLE}" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><label for="task-title">내용</label><c:out value="${fn:replace(rowData.SUMMARY, crlf, '<br />')}" escapeXml="false"/></td>
					</tr>
					
					
					
					<tr>  
						<th>첨부파일</th>
						<td><label for="task-title">첨부파일</label>
							<c:if test="${not empty rowData.FILE01_ORG}">
									<span><a href = "#" onclick="fileDown('A', '1')"><c:out value="${rowData.FILE01_ORG}" /></a></span> 
 							</c:if>
							<c:if test="${not empty rowData.FILE02_ORG}">
									<span><a href = "#" onclick="fileDown('A', '2')"><c:out value="${rowData.FILE02_ORG}" /></a></span> 
 							</c:if>
							<c:if test="${not empty rowData.FILE03_ORG}">
									<span><a href = "#" onclick="fileDown('A', '3')"><c:out value="${rowData.FILE03_ORG}" /></a></span> 
 							</c:if>
							<c:if test="${not empty rowData.FILE04_ORG}">
									<span><a href = "#" onclick="fileDown('A', '4')"><c:out value="${rowData.FILE04_ORG}" /></a></span> 
 							</c:if>
							<c:if test="${not empty rowData.FILE05_ORG}">
									<span><a href = "#" onclick="fileDown('A', '5')"><c:out value="${rowData.FILE05_ORG}" /></a></span> 
 							</c:if>
							
 					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="table-title clearfix" style="padding-top: 10px;">
			<h3 class="ico-table-blue">과제평가</h3>
		</div>
		<form id="evalFrm" name="evalFrm">
		<input type="hidden" name="reportNo" value="<c:out value="${rowData.REPORTNO}"/>"/>
		<input type="hidden" name="cUserNo"  value="<c:out value="${rowData.CUSERNO}"/>" />
		<input type="hidden" name="downNo"  id="downNo"  value="" />
		<input type="hidden" name="downType"  id="downType" value="" />
		<input type="hidden" name="cUserNo"  value="<c:out value="${reportApplyData.CUSERNO}"/>" />
		<div class="table-type2">
			<table>
				<caption>과제평가</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>점수</th>
						<td><label for="task-title">점수</label>
							<input type="text" class="w5" name="val" id="val" value='<c:out value="${rowData.VAL}" />' /> /<c:out value="${reportData.EVAL}" />
						</td>
					</tr>
					<tr>
						<th>평가</th>
						<td><label for="task-title">평가</label>
							<textarea title="평가" name="valCmt" id="valCmt" class="w98" rows="5"><c:out value="${rowData.VAL_CMT}" /></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
	</div>
	<!-- //과제출제 -->
	
	<div class="table-btn-group"> 
 		<div class="btn-table">
			<a href="#none" onclick="fnSave(); return false;" class="btn-large-blue"><span>평가완료</span></a>
		</div>
		<div class="btn-table left">
			<a href="#none" onclick="self.close();"  class="btn-large-orange"><span>취소</span></a>
		</div>
	</div>


	<!-- //게시판 버튼영역 -->
</div>
<!-- content -->
</body>
</html>

<script type="text/javascript">
	function fnSave(sFlag){
		if ($('input[name=val]').valueEmpty()) {
			alert('점수를 입력해주세요.');
			$('input[name=val]').focus();
			return;
		}	
		
		if(!$.isNumeric($('input[name=val]').val())){
			alert('점수는 숫자만 입력가능합니다.');			
			$('input[name=val]').focus();
			return;
		}
		
		var maxVal = Number('<c:out value="${reportData.EVAL}" />');
		
		if($('input[name=val]').val() > maxVal ){
			alert('최대 배점 점수는 '+maxVal+'점 입니다.');			
			$('input[name=val]').focus();
			return;
		}
		
		if ($('#valCmt').valueEmpty()) {
			alert('평가를 입력해주세요.');
			$('#valCmt').focus();
			return;
		}	
		
		$('#evalFrm')
			.attr('action', '/classdesk/tutor/report/eval_exec.do')
			.attr('method', 'post').attr('target', '_cm')
			.submit();
	}	
	
	function fileDown(type, no){
		$('#downType').val(type);
		$('#downNo').val(no); 
		$('#evalFrm')
		.attr('action', '<c:out value="${ctx}"/>/classdesk/filedown.do')
		.attr('method', 'post')
		.attr('target', '_cm')
		.submit();
	}
	
</script>
