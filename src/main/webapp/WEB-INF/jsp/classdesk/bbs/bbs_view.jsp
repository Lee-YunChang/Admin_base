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
	
<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassData')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassNotice')}">notice</c:if>
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassData')}">data</c:if>
</c:set>

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<!-- //개설과목명 -->

	<div class="round-box-small blue">
		<div class="table-title clearfix">
			<c:if test="${topMenuCode eq 'notice'}"><h3 class="ico-table-blue">공지사항</h3></c:if>
			<c:if test="${topMenuCode eq 'data'}"><h3 class="ico-table-blue">자료실</h3></c:if>
		</div>
		<!-- 테이블 -->
		<form id="bbsForm" name="bbsForm" action="" enctype="multipart/form-data" method="post">
		<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
		<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
		<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
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
						<th>등록일</th>
						<td><label for="bbs-title">제목</label><c:out value="${rowData.WDATE}" /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><label for="bbs-title">제목</label><c:out value="${rowData.WRITER}" /></td>
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
		</form>
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
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
            <%--
			<c:if test="${REQUEST_DATA.SES_GRADENO == SUPERGRADENO}">
            --%>
            <c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}">
				<a href="#none" class="btn-large-blue" onclick="fnForm('<c:out value="${rowData.BBSNO}"/>','form'); return false;"><span>수정</span></a> 
				<c:if test="${rowData.BBSNO > 0 && rowData.USERNO == REQUEST_DATA.SES_USERNO }">
 					<a href="#none" onclick="fnDel(); return false;"  class="btn-large-orange"><span>삭제</span></a>
				</c:if>
			</c:if>
 		</div>
		<div class="btn-table left">
			<a href="#none" class="btn-large-green"  onclick="fnList(); return false;"><span>목록</span></a>
		</div>
	</div>

	<!-- //게시판 버튼영역 -->
	
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
		jQuery(document).ready(function(){
			SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));
		});	
		
		//파일다운로드
		function filedown(fileId,fname,type,orgFile,fileSeq){ 
			$('#fileId').val(fileId);
			$('#filename').val(encodeURIComponent(fname));
			$('#fileName').val(encodeURIComponent(orgFile));
			$('#ftype').val(type);
			$('#fileSeq').val(fileSeq);
			$('form[name=bbsForm]').attr('action', '/classdesk/bbs/filedown.do').submit();
		}
 
		// 페이징 이동 함수
		function fnList() {
			$('#bbsForm').attr('target', '_self').attr('action', '/classdesk/bbs/list.do').submit();
		}
		
		function fnCancle(){
			$('#bbsForm')
				.attr('target', '_cm')
				.attr('action', '/classdesk/bbs/list.do')
				.submit();
		}
		
		function fnDel(){
			var cseqno = '<c:out value="${rowData.CSEQNO}" />';
			if(cseqno == '0'){
				alert('과정마스터 게시물은 관리시스템에서 삭제할 수 있습니다.');
				return false;
			}else{
				if(confirm('해당 게시물을 삭제하시겠습니까?')){
					$('#bbsForm')
					.attr('target', '_cm')
	 				.attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/del_exec.do')
					.attr('method', 'post')
					.submit();
	  			}
			}
		}
		
		function fnForm(bbsNo, cmd){
			var cseqno = '<c:out value="${rowData.CSEQNO}" />';
			if(cseqno == '0'){
				alert('과정마스터 게시물은 관리시스템에서 수정할 수 있습니다.');
				return false;
			}else{
				$('#bbsNo').val(bbsNo);
				$('form[name=bbsForm]')
					.attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/' + cmd + '.do')
					.submit();
			}
		}
	</script>

