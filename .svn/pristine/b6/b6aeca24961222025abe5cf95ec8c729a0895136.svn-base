<%@page import="com.sangs.util.StringUtil"%>
<%
/****************************************
	system	: ClassDesk > 강사 > 토론 등록폼
	title	: 토론 목록
	summary	:	
	wdate   : 2016-08-19
	writer  : 황두은 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>

<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassDiscuss')}">discuss</c:if>
</c:set>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

<script type="text/javascript">
		
		// 상시참여 체크하면 날짜 선택란 안보임
		jQuery(document).ready(function(){
			$("input[type=text]").prop('disabled',true);
			$("input[type=file]").prop('disabled',true);
			$("input[type=checkbox]").prop('disabled',true);
			$("textarea").prop('disabled',true);
		});	 
		
		// 페이징 이동 함수
		function fnList() {
			$('#discussForm').attr('target', '_self').attr('method', 'get').attr('action', '/classdesk/tutor/discuss/list.do').submit();
		}
		
		function fnSave(bbsNo){ 
	        var form = document.discussForm; 
			$('#discussForm input').on('change', function() {
			   $('input[name=openAt]:checked', '#discussForm').val(); 
			   $('input[name=topYn]:checked', '#discussForm').val(); 
			});
  			if(confirm('등록하시겠습니까?')){
  					$("#bbsNo").val(bbsNo);
					$('#discussForm')
					.attr('action', '/classdesk/tutor/discuss/exec.do')
					.attr('target', '_cm')
					.submit();
				}
		}
</script>

	<!-- //개설과목명 -->
	<div class="round-box-small blue">
	<!-- 토론 테이블 -->
	<form id="discussForm" name="discussForm" action="" enctype="multipart/form-data" method="post">
		<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
 		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
		<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
		<input type="hidden" name="qu"  id="qu" value="${REQUEST_DATA.qu }"/>
		<input type="hidden" name="fileId" value="<c:out value="fileUploadObj1.fileId"/>"/>
		<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.bbsFilePath"))%>"/>
 		<input type="hidden" name="refLevel"  id="refLevel" value="<c:out value="${REQUEST_DATA.refLevel}" />"/>
		<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${REQUEST_DATA.refStep}" />"/>
		<input type="hidden" name="grpno"  id="grpno" value="<c:out value="${REQUEST_DATA.grpno}" />"/>
		<input type="hidden" id="userno" value="<c:out value="${REQUEST_DATA.userno}" />"/>
		<input type="hidden" id="sesuserno" value="<c:out value="${REQUEST_DATA.SES_USERNO}" />"/>
		<input type="hidden" id="updateYn" value="<c:out value="${updateYn}" />"/>
 		<div class="table-title clearfix">
		<c:if test="${rowData.BBSNO == null && rowData.BBSNO ==''}"><h3 class="ico-table-blue">토론 등록</h3></c:if>
		
		</div>
 			
 			
		<c:if test="${rowData.ISTOP eq 'N'}">
	        <input type="hidden" name="topYn" value="N"/>
	    </c:if>
			
		<div class="table-type2">
			<table>
				<caption>토론등록 테이블</caption>
				<colgroup>
					<col width="13%" />
					<col width="37%" />
					<col width="13%" />
					<col width="37%" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><c:out value="${rowData.TITLE}" /></td>
					</tr>
					
					<tr>
						<th>참여 기간</th>
						<td colspan="3">
							<div id="hideshowdate">
								<label for="task-date1">시작날짜선택</label>
								<c:out value="${rowData.DSCSN_SDATE}"/>~<c:out value="${rowData.DSCSN_EDATE}"/>
								<c:if test="${rowData.ORDTM_AT eq 'Y'}">상시참여</c:if>
						</td>
					</tr>
					
					<tr>
						<th>공개 여부</th>
						<td>
							<input type="radio" id="openAt" name="openAt" value="N" <c:if test="${rowData.OPEN_AT eq 'N'}"> checked="checked"</c:if>>미공개 
							<input type="radio" id="openAt" name="openAt" value="Y" <c:if test="${rowData.OPEN_AT eq 'Y'}"> checked="checked"</c:if>>공개
						</td>
						
						<th>상위 고정</th>
						<td colspan="3">
							<input type="radio" id="topYn" name="topYn" value="N" <c:if test="${rowData.TOPYN eq 'N'}"> checked="checked"</c:if>>고정 안함
							<input type="radio" id="topYn" name="topYn" value="Y" <c:if test="${rowData.TOPYN eq 'Y'}"> checked="checked"</c:if>>고정
					</tr>
					
					<tr>
						<th>내용</th>
						<td style="padding:20px 10px 20px 10px;" colspan="3">
								<c:out value="${rowData.CONTENT}" escapeXml="false"/>
						</td>
					</tr>
					 
				</tbody>  
			</table>
		</div>
		
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
	<!-- // 토론 등록 테이블 -->
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
	
		<div class="btn-table"> 
			<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
				<a href="#none" id="fnSave" onclick="fnSave('<c:out value="${REQUEST_DATA.bbsNo}" />'); return false;" class="btn-large-blue"><span>등록</span></a>
			</c:if>
		</div>
		
		<div class="btn-table left">
			<a href="#none"  onclick="fnList(); return false;"  class="btn-large-orange"><span>취소</span></a> 
		</div>
		
	</div>
	<!-- //게시판 버튼영역 -->
	</form>
	
	
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>