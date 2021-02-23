<%
/****************************************
	system	: ClassDesk > 강사 > 토론
	title	: 토론 목록
	summary	:	
	wdate   : 2016-08-19
	writer  : 황두은
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="d"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassDiscuss')}">discuss</c:if>
</c:set>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<div class="table-title clearfix">
		<h3 class="ico-table-blue">토론</h3>
	</div>
	
	
	<form name="frm" id="frm" method="post" action="/classdesk/tutor/discuss/list.do">
	<!-- 검색폼 -->
		<div class="table-type3" style="padding-top: 10px;">
			<table>
				<tbody>
					<tr>
						<th>검색</th>
						<td colspan="3"><label for="exam-title">토론명</label>
							<select id="searchMode" name="searchMode" title="검색 설정">
								<option value="" <c:if test="${empty REQUEST_DATA.searchMode}"> selected="selected" </c:if>>선택</option>
								<option value="writer" <c:if test="${REQUEST_DATA.searchMode eq 'writer' }">selected="selected" </c:if>>작성자</option>
								<option value="title" <c:if test="${REQUEST_DATA.searchMode eq 'title' }">selected="selected" </c:if>>토론명</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" title="검색어" style="width:150px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
							<a href="#" onclick="javascript:fnSearch('1');return false;"> <img alt="검색" src="/classdesk/images/btn_s_search.png"></a>
						</td>
					</tr>
				</tbody> 
			</table>
		</div>
	<!-- // 검색폼 -->
</br>
	<table width="100%" class="btn_Group">
	 <tbody>
	  <tr>
	   <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</td></td>
	  </tr>
	 </tbody>
	</table></br>
	<!-- 토론리스트 -->
		<input type="hidden" name="cPage"  		id="cPage" 		value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
		<input type="hidden" name="pbcateno"  	id="pbcateno" 	value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
		<input type="hidden" name="bbsNo"  		id="bbsNo" 		value=""/>
		<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${courselistData[0].STEP}" />"/>
		<input type="hidden" name="grpno"  id="grpno" value="<c:out value="${courselistData[0].GNO}" />"/>
		<input type="hidden" name="qu"  id="qu" value=""/>
		
		<div class="table-type1">
			<div class="table-header-left"></div>
			<table>
				<caption>토론 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>토론명</th>
						<th>작성자</th>
						<th>추천</th>
						<th>반대</th>
						<th>등록일시</th>
						<th>공개여부</th>
						<th>조회수</th>
					</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty courselistData}">
		 						<c:forEach items="${courselistData}" var="result" varStatus="stat">
									<tr>
										<c:if test="${result.TOPYN eq 'Y' && result.STEP == 0}"><td>[TOP]</td></c:if>
										<c:if test="${result.TOPYN eq 'Y' && result.STEP > 0}"><td> </td></c:if>
										<c:if test="${result.TOPYN eq 'N' }"><td><c:out value="${totalCount+1 - result.RNUM}"/></td></c:if>
										
										<td class="left">
											<a href="#none" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view'); return false;">
												<c:if test="${result.STEP > 0}">
													<img style="padding-left:${result.STEP * 10}px" src="/admin/images/bbs_answer_arrow.png" alt="">
												</c:if>
												<c:out value="${result.TITLE}"/>
											</a>
										</td>
										<td><c:out value="${result.WRITER}"/></td>
										<td><c:out value="${result.RECCNT}"/></td>
										<td><c:out value="${result.OPPCNT}"/></td>
										<td><c:out value="${result.WDATE}"/></td>
										<td><c:out value="${result.OPEN_AT}"/></td>
										<td><c:out value="${result.RCNT}"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>   
							<tr>
								<td colspan="8" align="center">등록된 정보가 없습니다.</td>
							</tr>
							</c:otherwise>
						</c:choose>	 
					</tbody>
			</table>
		</div>
	</form>
	 
	<!-- //토론리스트 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/> 
		<!-- //게시물 페이징 -->
		<div class="btn-table">
 			<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
 				<a href="#none" onclick="fnForm('0','form','insert'); return false;" class="btn-large-blue"><span>등록</span></a>
			</c:if>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	//조회
	function fnSearch(page) {
		if(page) {
			$('#cPage').val(page);
		}
		$('#frm').attr('target', '_self');
		$('#frm').submit();
	}
	
	<!--
		$(function($) {
		});
	
		function fnForm(bbsNo, cmd,qu){
			$('#qu').val(qu);
			$('#bbsNo').val(bbsNo);
			$('form[name=frm]').attr('action', '/classdesk/tutor/discuss/' + cmd + '.do').submit();
		}
		
			function move_page(cPage){
			$('#cPage').val(cPage);
			$('form[name=frm]').attr('action', '/classdesk/tutor/discuss/list.do').submit();
		}
	//-->
	</script> 
 