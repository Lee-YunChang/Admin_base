<%
/****************************************
	system	: ClassDesk > 강사 > 시험 
	title	: 바인더방식 문제 목록
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
		<h1 class="popup-title">바인더 목록</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->

<div id="content">

	<form id="binderForm" name="binderForm">
	<input type="hidden" name="pubType" id="pubType"/>
	<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
	<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}" default="0"/>">
    <input type="hidden" name="bindYnVal" id="bindYnVal">
	<!--
	<div class="table-title clearfix">
        <div class="table-search left">
                 <label for="searchMode">검색조건</label>
 				<table>
 					<tr>
 						<td>과정</td>
 						<td>
 							 <c:choose>
								<c:when test="${not empty courseList}">
						            <select name="chCourseno" id="chCourseno" onchange="fnChCourseList(this.value);">
										<c:forEach items="${courseList}" var="result" varStatus="stat">
											<option value="${result.COURSENO}" <c:if test="${REQUEST_DATA.courseno eq result.COURSENO }"> selected</c:if>> 
												[<c:out value="${result.MT_CTYPE_NAME}"/>] [<c:out value="${result.MT_CGRP_NAME}"/>] <c:out value="${result.COURSETITLE}"/>
											</option>
										</c:forEach>
									</select>
								</c:when>
							</c:choose>
 						</td>
 						<td>바인더 사용여부</td>
 						<td>
 							<select name="searchBindYn" id="searchBindYn" onchange="fnBinderList();">
			                    <option value="" 		<c:if test="${REQUEST_DATA.searchBindYn eq '' }"> selected</c:if>>전체</option>
			                    <option value="Y" <c:if test="${REQUEST_DATA.searchBindYn eq 'Y' }"> selected</c:if>>사용</option>
			                    <option value="N" 		<c:if test="${REQUEST_DATA.searchBindYn eq 'N' }"> selected</c:if>>미사용</option>
			                </select>
 						</td>
 					</tr>
 					<tr>
 						<td>검색</td>
 						<td colspan="3">
	 						<select name="searchMode" id="searchMode">
                    			<option value="all" 		<c:if test="${REQUEST_DATA.searchMode eq 'all' }"> selected</c:if>>전체</option>
                    			<option value="seq_title" <c:if test="${REQUEST_DATA.searchMode eq 'seq_title' }"> selected</c:if>>차수명</option>
                    			<option value="title" 		<c:if test="${REQUEST_DATA.searchMode eq 'title' }"> selected</c:if>>시험제목</option>
                			</select>
                			<label for="searchWord">검색어입력</label>
                			<input type="text" name="searchWord" id="searchWord" style="width:200px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>"  onKeyPress="if(event.keyCode==13){fnBinderList();} "/>
                			<input type="image" src="/classdesk/images/btn_s_search.png" alt="검색" onclick="fnBinderList();" />
 						</td>
 					</tr>
 				</table>
                
           
        </div>
    </div>
      -->
    <div class="beige">
    	<div class="table-type3">
    		<table summary="상상스토리 교육시스템 클래스데스크의 바인더 목록입니다.">
    			<colgroup>
    				<col width="15%" />
    				<col width="35%" />
    				<col width="15%" />
    				<col width="35%" />
    			</colgroup>
    			<tbody>
    				<tr>
    					<th>과정</th>
    					<td>
    						<c:choose>
								<c:when test="${not empty courseList}">
						            <select name="chCourseno" id="chCourseno" onchange="fnChCourseList(this.value);">
										<c:forEach items="${courseList}" var="result" varStatus="stat">
											<option value="<c:out value="${result.COURSENO}"></c:out>" <c:if test="${REQUEST_DATA.courseno eq result.COURSENO }"> selected</c:if>> 
												[<c:out value="${result.MT_CTYPE_NAME}"/>] [<c:out value="${result.MT_CGRP_NAME}"/>] <c:out value="${result.COURSETITLE}"/>
											</option>
										</c:forEach>
									</select>
								</c:when>
							</c:choose>
    					</td>
    					<th>바인더 사용여부</th>
    					<td>
    						<select name="searchBindYn" id="searchBindYn" onchange="fnBinderList();">
			                    <option value="" <c:if test="${REQUEST_DATA.searchBindYn eq '' }"> selected</c:if>>전체</option>
			                    <option value="Y" <c:if test="${REQUEST_DATA.searchBindYn eq 'Y' }"> selected</c:if>>사용</option>
			                    <option value="N" <c:if test="${REQUEST_DATA.searchBindYn eq 'N' }"> selected</c:if>>미사용</option>
			                </select>
    					</td>
    				</tr>
    				<tr>
    					<th>검색</th>
    					<td colspan="3">
    						<select name="searchMode" id="searchMode">
                    			<option value="all" 		<c:if test="${REQUEST_DATA.searchMode eq 'all' }"> selected</c:if>>전체</option>
                    			<option value="seq_title" <c:if test="${REQUEST_DATA.searchMode eq 'seq_title' }"> selected</c:if>>차수명</option>
                    			<option value="title" 		<c:if test="${REQUEST_DATA.searchMode eq 'title' }"> selected</c:if>>시험제목</option>
                			</select>
                			<label for="searchWord">검색어입력</label>
                			<input type="text" name="searchWord" id="searchWord" style="width:200px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>"  onKeyPress="if(event.keyCode==13){fnBinderList();} "/>
                			<input type="image" src="/classdesk/images/btn_s_search.png" alt="검색" onclick="fnBinderList();" />
    					</td>
    				</tr>
    			</tbody>
    		</table>
    	</div>
    </div>
	<div class="blue" style="margin-top:20px;">
		<div class="table-type5">
			<table summary="상상스토리 교육시스템 클래스데스크의 바인더 목록입니다.">
				<colgroup>
					<col width="*" />
					<col width="8%" />
                    <col width="18%" />
                    <col width="*" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>과정명</th>
						<th>차수</th>
                        <th>시험유형<br>(출제방식)</th>
                        <th>시험제목</th>
                        <th>배점</th>
                        <th>사용여부</th>
                        <th>등록</th>
					</tr>
				</thead>
                <tbody>
					<c:choose>
						<c:when test="${not empty listData}">
								<c:forEach items="${listData}" var="result" varStatus="stat">
		 							<tr>
				                    	<td style="text-align:left !important;"><c:out value="${result.SEQ_TITLE}"/></td> 
				                        <td><c:out value="${result.CSEQNO}"/></td>
				                        <td><c:out value="${result.EXAM_TYPE}"/>(<c:out value="${result.PUB_TYPE}"/>)</td>
				                        <td style="text-align:left !important;"><c:out value="${result.TITLE}"/></td>
				                        <td><c:out value="${result.EVAL}"/></td>
				                        <td>
												<select id="bindYn" name="bindYn" onchange="updateBndYn('<c:out value="${result.EXAMNO}"/>' , '<c:out value="${result.PUB_TYPE}"/>', this); return false;"> 
													 <option value="Y" 		<c:if test="${result.BIND_YN eq 'Y' }"> selected</c:if>>사용</option>
													 <option value="N" 		<c:if test="${result.BIND_YN eq 'N' }"> selected</c:if>>미사용</option>
												</select>
										</td>
				                        <td>
				                        	<a href="#none" onclick="fnSave('<c:out value="${result.EXAMNO}"/>' , '<c:out value="${result.PUB_TYPE}"/>'); return false;"  class="btn-small-white"><span class="blue">등록</span></a>
				                        </td>
				                    </tr>
								</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
                    			<td colspan="7">등록된 바인더가 없습니다. </td>
                    		</tr>
						</c:otherwise>
					</c:choose> 
                </tbody>
			</table>
		</div>
	</div>
	 </form>
</div>

	 
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup"> <!-- 
		<a href="#none" onclick="fnSave(); return false;"  class="btn-large-blue"><span>등록</span></a>
		<a href="#none" onclick="self.close();"  class="btn-large-orange"><span>닫기</span></a>  -->
	</div>
</div>


<!-- //팝업 버튼영역 -->

<script type="text/javascript">
<!-- 
	/**************************************************
	함수명 : fnBinderList
	설 명 : 검색
	***************************************************/
	
	function fnBinderList(){
		$('#binderForm').attr('method', 'post').attr('target', '_self').attr('action', '/classdesk/tutor/quizbinder/search_list.do').submit();
	}
	
	function fnSave(exno, ptype) {
		if(confirm('등록하시겠습니까?\n바인더 시험 등록시 임시 저장 상태로 저장되며, 기존 시험 문제가 있을경우 모두 삭제된 후 재등록 됩니다.\n ')){
			$('#binderExamNo', opener.document).val(exno);  
			$('#binderPubType', opener.document).val(ptype);  
			$( opener.location ).attr( 'href' , 'javascript:fnBinderDumpExec();');
			self.close();	
		}
	}
	
	// 과정 분류 변경.
	function fnChCourseList(cno){
		var courseno = cno ;
		$('#courseno').val(courseno);   
	}
	
	function updateBndYn(exno, ptype, selObj) {
		if(confirm('바인더 상태를 변경 하시겠습니까? ')){
			$('#examNo').val(exno);
			$('#bindYnVal').val($(selObj).find(':selected').val());
			$('#binderForm').attr('method', 'post').attr('target', '_cm').attr('action', '/classdesk/tutor/quizbinder/bind_status_exec.do').submit();
		}
	}
	
    /* 	
	$(function(){
		$('#searchBindYn').change(function() {
	        alert()
		});	
	}
	*/
//-->
</script>
	
	
</body>
</html>
