<%
/****************************************
	system	: ClassDesk > 강사 > 과제 
	title	: 과제 제출자 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS  
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="task"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<!-- 과제 제출자 목록 -->
	<div>
		<div class="round-box beige">
			<form id="pFrm" name="pFrm" method="post">
				<input type="hidden" name="reportNo" value="<c:out value="${rowData.REPORTNO}"/>">
				<input type="hidden" name="cUserNo">
			</form>
		
			<!--  수정 / 삭제 용  폼 -->
			<form id="updateFrm" name="updateFrm" method="post">
				<input type="hidden" name="reportNo" value="<c:out value="${rowData.REPORTNO}"/>">
				<input type="hidden" name="openYn" value="<c:out value="${rowData.OPENYN}"/>">
				<input type="hidden" name="nextSubcmd" value="user_list">
			</form>
			
			<form id="frm" name="frm">
			<input type="hidden" name="reportNo" id="reportNo" value="<c:out value="${rowData.REPORTNO}"/>"/>
			<input type="hidden" name="resultYn" id="resultYn" />
			
 			<!-- 테이블 -->
			<div class="table-type3">
				<table>
					<caption>과제 제출자 목록</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>과제명</th>
							<td><label for="exam-title">과제명</label><c:out value="${rowData.TITLE}" /></td>
							<th>제출기한</th>
							<td><label for="exam-title">제출기한</label>
								<fmt:formatDate value="${rowData.SDATE}" pattern="yyyy.MM.dd" />  ~ <fmt:formatDate value="${rowData.EDATE}" pattern="yyyy.MM.dd" />
								<c:if test="${rowData.ENDYN eq 'Y'}">  (마감)</c:if>
							</td>
						</tr>
						<tr>
							<th>배점</th>
							<td><label for="exam-title">배점</label><c:out value="${rowData.EVAL}" />/<c:out value="${evalData.EVAL_REPORT}"/></td>
							<th>최종평가 반영 여부</th>
							<td><label for="exam-result">최종평가 반영여부</label><c:out value="${rowData.RESULTYN}" /></td>
						</tr>	
					</tbody>
				</table>
			</div>
			<!-- //시험출제 테이블 -->
			</form>
		</div>
	</div>
	
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnUpdateFrm();" class="btn-large-blue"><span>수정</span></a>
			<a href="#none" onclick="fnDel(); return false;" class="btn-large-orange"><span>삭제</span></a>
		</div>
	</div>
	
	<!-- //과제 평가 -->
	<div class="table-title mg-t18 clearfix">
		<h3 class="ico-table-blue">과제 평가(<c:out value="${rowData.SCNT}" />/<c:out value="${rowData.TOTCNT}" />)</h3>
	</div>
	<!-- 과제 평가 -->
	<div class="table-type1">
		<div class="table-header-left"></div>
		<table id="itemList">
			<caption>과제 평가</caption>
			<colgroup>
				<col width="15%" />
				<col width="*" />
				<col width="10%" />
				<col width="5%" />
				<col width="10%" />
				<col width="8%" />
			</colgroup>
			<thead>
				<tr>
					<th>이름(ID)</th>
					<th>제목</th>
					<th>제출일</th>
					<th>점수</th>
					<th>평가일</th>
					<th>평가결과</th>
				</tr>
			</thead>
			<tbody>
			
			<c:choose>
				<c:when test="${not empty userListData}">
					<c:forEach items="${userListData}" var="result" varStatus="stat">
						<tr>
							<td><c:out value="${result.MBERNM}" />(<c:out value="${result.UNITY_ID}" />) </td>
							<td class="left"><c:out value="${result.TITLE}" /></td>
							<td><fmt:formatDate value="${result.WDATE}" pattern="yyyy-MM-dd" /> </td>
							<td><c:out value="${result.VAL}" /></td>
							<td><fmt:formatDate value="${result.VAL_DATE}" pattern="yyyy-MM-dd" /></td>
							<td>
								<c:choose>
									<c:when test="${empty result.CUSERNO}"></c:when>
									<c:otherwise>
										<a href="#none" onclick="fnEvalPop('<c:out value="${result.CUSERNO}" />'); return false;" class="btn-small-white"><span class="red">평가</span></a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>   
				<tr>
					<td colspan="6" align="center">등록된 정보가 없습니다.</td>
				</tr>
				</c:otherwise>
			</c:choose>	
			</tbody>
		</table>
	</div>
	<!-- // -->
	<!--  버튼영역 -->
 
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-green"><span>목록</span></a>
			<a href="#none" class="btn-large-blue"onclick="fnEvalUpdate(); return false;"><span>최종평가반영</span></a>
 		</div>
		<div class="btn-table left">
				
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
		//평가팝업
		function fnEvalPop(cUserNo){
			$('input[name=cUserNo]').val(cUserNo);
		    $('#pFrm').one('submit', function() {
	            window.open('','pop_target','width=830, height=500, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
	            this.action = '/classdesk/tutor/report/eval_form.do';
	            this.method = 'POST';
	            this.target = 'pop_target';
	        }).trigger('submit');
		}
		
		//최종평가 
		function fnEvalUpdate(fCnt){
			<c:if test="${empty userListData}">
				alert('평가 대상이 없습니다.');
				return false;
			</c:if>
			
			var strEmpty =  true;
			$('#itemList tbody tr').each(function(i){
				if($(this).find('td').eq(4).html() == ''){
					strEmpty = false;
				}
			});
			
			if(!strEmpty){
				if(!confirm('평가되지 않은 과제가 있습니다.\n최종평가 반영을 하시면 현재 진행중인 과제는 마감됩니다.\n그래도 최종 평가를 반영 하시겠습니까?')) return false;
			}else{
				if(!confirm('최종평가반영 하시겠습니까?')) return false;
			}
			
			$('#resultYn').val('Y');
			$('form[name=frm]').attr('action', '/classdesk/tutor/report/eval_final_exec.do').attr('method', 'post').attr('target', '_cm').submit();
		}
		
		/* function fnForm(reportNo, cmd){
			$('#reportNo').val(reportNo);
			$('#subcmd').val(cmd);
			$('form[name=frm]').attr('action', '/classdesk/tutor/report.do').submit();
		} */
		
		//리스트  이동 함수
		function fnList() {
			$('#reportNo').val('');
			$('#frm').attr('target', '_self').attr('action', '/classdesk/tutor/report/list.do').submit();
		}

		// 과제 수정
		function fnUpdateFrm(){
  			$('form[name=updateFrm]').attr('action', '/classdesk/tutor/report/form.do').submit();
		}
		
		// 과제 삭제 ( 사용자 목록 포함)
		function fnDel(){
			if(confirm('삭제시 수강생이 제출한 과제 내용도 함께 일괄 삭제됩니다. \n계속 하시겠습니까? ')){
				$('#updateFrm')
					.attr('action', '/classdesk/tutor/report/delExec.do')
					.attr('method', 'post')
					.attr('target', '_cm')
					.submit();
			}
		}
	</script>

