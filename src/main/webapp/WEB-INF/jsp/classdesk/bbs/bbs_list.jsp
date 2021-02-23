<%
/****************************************
	system	: ClassDesk > 강사 > 과제
	title	: 과제 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassData')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassNotice')}">notice</c:if>
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassData')}">data</c:if>
</c:set>
    
    <%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 
    
	<!-- 개설과목명 -->
	<div id="Right_Area" >
	<div class="table-title clearfix">
		<c:if test="${topMenuCode eq 'notice'}"><h3 class="ico-table-blue">공지사항</h3></c:if>
		<c:if test="${topMenuCode eq 'data'}"><h3 class="ico-table-blue">자료실</h3></c:if>
	</div>
	<!-- //개설과목명 -->
	 
	<form name="frm" action="">
		<input type="hidden" name="cPage"  		id="cPage" 		value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
		<input type="hidden" name="pbcateno"  	id="pbcateno" 	value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
		<input type="hidden" name="bbsNo"  		id="bbsNo" 		value=""/>
		<div class="table-type1">
			<div class="table-header-left"></div>
			<table summary="상상스토리 교육시스템 클래스데스크의 게시판입니다.">
				<caption> 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일시</th>
						<th>공개여부</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:if test="${not empty resultList}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<c:if test="${result.TOPYN eq 'Y' }"><td>[TOP]</td></c:if>
							<c:if test="${result.TOPYN eq 'N' }"><td><c:out value="${result.RNUM}"/></td></c:if>
							<td class="left">
								<a href="#none" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view'); return false;">
									<c:if test="${result.COMYN eq 'Y'}"></c:if> <c:out value="${result.TITLE}"/>
								</a></td>
							<td><c:out value="${result.WRITER}"/></td>
							<td><c:out value="${result.WDATE}"/></td>
							<td>
								<c:if test="${result.OPEN_AT eq 'Y'}">공개</c:if>
								<c:if test="${result.OPEN_AT eq 'N'}">비공개</c:if>
							</td>
							<td><c:out value="${result.RCNT}"/></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty resultList}">
					 <tr>
					 	<td colspan="6">등록된 내용이 없습니다.</td>
					 </tr>
				</c:if>
			</table>
		</div>
	</form> 
	
	<c:if test="${not empty resultList}">
		<div class="table-btn-group">
			<paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/> 
		</div>
	</c:if>
	<c:if test="${empty resultList}">
		</br>
	</c:if>
	
	<!-- 게시판 버튼영역 -->
	</div>
	<div id="Right_Area">
		<div class="btn-table right">
			<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
 				<a href="#none" onclick="fnForm('0','form'); return false;"class="btn-large-blue" ><span>등록</span></a>
			</c:if>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	
	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	<script type="text/javascript">
	<!--
		$(function($) {
		});
	
		function fnForm(bbsNo, cmd){
			$('#bbsNo').val(bbsNo);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/' + cmd + '.do').submit();
		}
		
  		function move_page(cPage){
			$('#cPage').val(cPage);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/list.do').submit();
		}
	//-->
	</script>