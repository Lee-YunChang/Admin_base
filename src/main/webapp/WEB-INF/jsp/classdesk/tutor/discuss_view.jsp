<%
/****************************************
    system  : ClassDesk > 강사 > BBS 내용보기
    title   : 과제 목록
    summary :   
    wdate   : 2015-04-01
    writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
	
<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassDiscuss')}">discuss</c:if>
</c:set>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<div class="round-box-small blue">
		<!-- 테이블 -->
		<form id="discussForm" name="discussForm">
		<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
		<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
		<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
		<input type="hidden" name="qu"  id="qu" value=""/>
		<input type="hidden" name="ordtmAt"  id="ordtmAt" value="<c:out value="${rowData.ORDTM_AT}" />"/>
		<input type="hidden" name="rcmndUserno"  id="rcmndUserno" value="<c:out value="${checkRcmnd[0].RCMND_USERNO}" />"/>
		<input type="hidden" name="refLevel"  id="refLevel" value="<c:out value="${rowData.REFLEVEL}" />"/>
		<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${rowData.REFSTEP}" />"/>
		<input type="hidden" name="grpno"  id="grpno" value="<c:out value="${rowData.GRPNO}" />"/>
		<input type="hidden" name="userno"  id="userno" value="<c:out value="${rowData.USERNO}" />"/>
		<input type="hidden" id="sesuserno" value="<c:out value="${REQUEST_DATA.SES_USERNO}" />"/> 
		<input type="hidden" id="updateYn" value="<c:out value="${updateYn}" />"/>
		<input type="hidden" name="fileno"  id="fileno" value=""/>
		<input type="hidden" name="fileId" id="fileId" value=""/>
		<input type="hidden" name="filename" id="filename" value=""/>
		<input type="hidden" name="fileName" id="fileName" value=""/>
		<input type="hidden" name="ftype" id="ftype" value=""/>
		<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
		
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 게시판 상세입니다.">
				<caption>클래스데스크 게시판 상세</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목 </th>
						<td><label for="bbs-title">제목</label><c:out value="${rowData.TITLE}" /></td>
					</tr>
					<tr>
						<th>참여기간</th>
						<td>
							<div id="hideshowdate">
							<label for="bbs-title">시작일</label><c:out value="${rowData.DSCSN_SDATE}" />
							 ~ <label for="bbs-title">종료일</label><c:out value="${rowData.DSCSN_EDATE}" />
							</div>
							<div id="always"></div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td style="height: 200px;vertical-align:top;"><c:out value="${fn:replace(rowData.CONTENT, crlf, '<br />')}" escapeXml="false"/></td>
					</tr>
					<tr>
						<th>파일첨부</th>
						<td class="td-input-wrap">
							<c:if test="${!empty fileList}">
								<c:forEach var="fileList" items="${fileList}" varStatus="status">
								<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
									<div  id="eduDate_${status.count}" class="input-wrap mb15"  style="height:25px">
										<div class="file-wrap">
											<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
											<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
												<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
											</a>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</td>
				</tr>
				</tbody>
			</table>
		</div>
		<!-- //과제출제 테이블 -->
		
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
	 <!-- //과제출제 -->
	
	 <!-- 추천 반대 영역 -->
			<input type="button"  value="추천" onclick="rcmnd('추천', 'R'); return false;"/>
			추천수:${rcmndCount[0].RCNT}
			<input type="button" value="반대" onclick="rcmnd('반대', 'J'); return false;"/>
			반대수:${rcmndCount[0].JCNT}
			<input type="hidden"  name="rcmndSeCode"  id="rcmndSeCode" value="">
	<!-- //추천 반대 영역 --> 
	</form>
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
		
            <c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}">
				<c:choose>
					<c:when test="${updateYn > 1}">
						<a href="#none" class="btn-large-blue" id="fnForm" onclick="fnForm2('<c:out value="${rowData.BBSNO}"/>'); return false;"><span>수정</span></a> 
					</c:when>
					<c:otherwise>
						<a href="#none" class="btn-large-blue" id="fnForm" onclick="fnForm('<c:out value="${rowData.BBSNO}"/>','form'); return false;"><span>수정</span></a> 
					</c:otherwise>
				</c:choose>
			</c:if>
 		</div>
		<div class="btn-table left">
			<a href="#none" class="btn-large-green"  onclick="fnList(); return false;"><span>취소</span></a>
		</div>
	</div>

	<!-- //게시판 버튼영역 -->
	
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	
		// 페이징 이동 함수
		function fnList() {
			$('#discussForm').attr('target', '_self').attr('action', '/classdesk/tutor/discuss/list.do').submit();
		}
		
		// 게시글 추천 반대 함수
		function rcmnd(ask, rj) {
			//이미 추천/반대한 사용자인지 확인
			if($('#rcmndUserno').val() > 0) {
				alert('이미 투표하셨습니다.');
				return false;
			}
			
			if(confirm('정말 '+ask+'하시겠습니까? 돌이킬 수 없습니다.')){
				$('#rcmndSeCode').val(rj);
				$('#discussForm').attr('action', '/classdesk/tutor/discuss/rcmnd.do').submit();
			}
		}
		
		function fnForm(bbsNo, cmd) {
			var cseqno = '<c:out value="${rowData.CSEQNO}" />';
			if(cseqno == 1){
				alert('과정마스터 게시물은 관리시스템에서 수정할 수 있습니다.');
				return false;
			} else {
				$('#bbsNo').val(bbsNo);
				$("#qu").val("update");
				$('form[name=discussForm]')
					.attr('action', '/classdesk/tutor/discuss/' + cmd + '.do')
					.submit(); 
			}
		}
		function fnForm2(bbsNo) {
			alert('댓글이 있는 게시글은 수정이 불가합니다(공개여부, 상위고정만 수정할 수 있습니다.)');
			var cseqno = '<c:out value="${rowData.CSEQNO}" />';
			if(cseqno == 1){
				alert('과정마스터 게시물은 관리시스템에서 수정할 수 있습니다.');
				return false;
			} else {
				$('#bbsNo').val(bbsNo);
				$("#qu").val("update");
				$('form[name=discussForm]')
					.attr('action', '/classdesk/tutor/discuss/form2.do')
					.submit(); 
			}
		}
		jQuery(document).ready(function(){
			if($('#ordtmAt').val() == 'Y') {
				$('#hideshowdate').hide();
				$('#always').html('상시참여(기간없음)');
			}
			
			if($('#bbsNo').val() > 0){//수정일 때
				if($('#userno').val() != $('#sesuserno').val()){//내 글만 수정가능
					$('#fnForm').hide();
				}
			}
		});	

		//파일다운로드
		function filedown(fileId,fname,type,orgFile,fileSeq){ 
			$('#fileId').val(fileId);
			$('#filename').val(encodeURIComponent(fname));
			$('#fileName').val(encodeURIComponent(orgFile));
			$('#ftype').val(type);
			$('#fileSeq').val(fileSeq);
			$('form[name=discussForm]').attr('action', '/classdesk/tutor/discuss/filedown.do').submit();
		}
	</script>

