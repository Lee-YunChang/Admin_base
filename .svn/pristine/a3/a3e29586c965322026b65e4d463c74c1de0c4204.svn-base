<%
/****************************************
	system	: ClassDesk > 강사 > 시험
	title	: 시험 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>


<div class="table-header-left"></div>
		<table id="randomList">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%" />
				<col width="15%" />
				<col width="*" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>문제유형</th>
					<th>문제</th>
					<th>답</th>
				</tr>
			</thead>
			<tbody>
			
			<c:choose>
				<c:when test="${not empty subListData}">
					<c:forEach items="${subListData}" var="result" varStatus="stat">
					 	<%-- <input type="hidden" name="secNo" id="secNo${stat.index}" value="${result.SECNO }"> --%> 
						<tr>
							<td><c:out value="${result.RNUM}"/></td>
							<td><c:out value="${result.QTYPE_NM}"/></td>
							<td class="left"><pre><c:out value="${result.QSUBJECT}"/></pre></td>
							<td><c:out value="${result.RCODE}"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" align="center">등록된 정보가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>