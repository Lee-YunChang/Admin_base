<%
/****************************************************
	system	:  클래스데스크 > 성적 > 엑셀다운
	title	: 과정별 성적  엑셀 다운
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
*****************************************************/
%> 


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>

<% 
	response.setContentType("application/vnd.ms-excel; charset=utf-8");
 	response.setHeader("Content-Description", "JSP Generated Data");  
	response.setHeader("Content-Disposition", "attachment;filename=result_list.xls;");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

 
<style type="text/css">
table th { background-color:#6EE3F7;} 

</style>
</head>
<body>
<table id="itemList" border="1">
 			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="*" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="10%" />
				<col width="5%" />
			</colgroup>
			<thead>
				<tr >
					<td colspan="11" align="center"><c:out value="${rowData.SEQ_TITLE}"/> (<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>)</td>
				</tr> 
				<tr>
					<th>No</th>
					<th>성명</th>
					<th>메일</th>
					<th>핸드폰</th>
					<th>기관/단체명</th>
					<th>온라인학습(<c:out value="${rowData.EVAL_PROGRESS}" default="0" /> )</th>
					<th>과제(<c:out value="${rowData.EVAL_REPORT}"  default="0"/>)</th>
					<th>시험(<c:out value="${rowData.EVAL_EXAM_MT + rowData.EVAL_EXAM_FINAL}" default="0"/>)</th>
					<th>출석(<c:out value="${rowData.EVAL_ATTEND}"  default="0"/>)</th>
					<th>부가점수</th>
					<th>총점</th>
					<th>수료여부<br/>(기준 :<c:out value="${rowData.COMP_VAL}" default="0" /> 점)</th>
					<th>석차</th>
				</tr>
				<%-- <tr>
					<th>교재(<c:out value="${rowData.FRAMECNT}" default="0" />p)</th>
					<th>점수</th>
					<th>중간(<c:out value="${rowData.EVAL_EXAM_MT}" default="0"/>)</th>
					<th>최종(<c:out value="${rowData.EVAL_EXAM_FINAL}" default="0"/>)</th>
				</tr> --%>
			</thead>
			<!-- 접근성 인증을 위해 각각의 label과 id를 번호화 시켜야함 // 접근은 name으로 할 것 -->
			<tbody>
				<c:choose>
					<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							
									<tr>
 										<td align="center"><c:out value="${stat.count}"/></td>
 										<td><c:out value="${result.USERNAME}" default="-"/> (<c:out value="${result.USERID}" default="-"/>)</td>
 										<td><c:out value="${result.EMAIL}" default="-"/></td>
 										<td><c:out value="${result.MOBILE}" default="-"/></td>
 										<td><c:out value="${result.COMNAME}" default="-"/></td>
										<%-- <td align="right">
											 
 												<c:out value="${result.FRAMESEQ}" default="0"/><strong>P</strong> 
												<c:if test="${rowData.FRAMECNT > 0 }">
													(<c:out value="${result.PROG}" default="0"/><strong>%</strong> )				
												</c:if>
  										
										</td> --%>
										<td align="right"><c:out value="${result.PROGRESS_VAL}" default="0"/>점</td>
										<td align="right"><c:out value="${result.REPORT_VAL}" default="0"/>점</td>
										<td align="right"><c:out value="${result.EXAM_FINAL_VAL}" default="0"/>점</td>
										<td align="right"><c:out value="${result.ATTEND_VAL}" default="0"/>점</td>
										<td align="right"><c:out value="${result.EXAM_MT_VAL}" default="0"/>점</td>
										<td align="right"><c:out value="${result.FINAL_VAL}" default="0"/>점</td>
										<td align="center">
												<c:if test="${result.ISPASS eq 'Y'}">수료</c:if>
												<c:if test="${result.ISPASS eq 'N'}">미수료</c:if>
										</td>
										<td align="center"><c:out value="${result.RANK}" default="0"/></td>
									</tr>
									
									 
								</c:forEach>
						</c:when>
						<c:otherwise>   
									<tr>
										<td colspan="11" align="center">등록된 정보가 없습니다.</td>
									</tr>
					</c:otherwise>
						
 				</c:choose>

			</tbody>
		</table>

</body>
</html>