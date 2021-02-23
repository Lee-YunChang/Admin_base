<%
/****************************************
	system	: ClassDesk > 강사 > 시험 > 세트문제 출제
	title	: 세트 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="test"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %>

	<!-- 시험출제 -->
	<div class="table-title mg-t18 clearfix">
		<h3 class="ico-table-blue">세트문제 설정</h3>
	</div>
	
 
	<div class="table-type1">
		<div class="table-header-left"></div>
		<form id="examForm" name="examForm" method="post">
		<input type="hidden" name="examNo" id="examNo" value='<c:out value="${REQUEST_DATA.examNo}"/>'/>
		<table  id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 출제시험입니다.">
			<caption>출제시험</caption>
			<colgroup>
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="160">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>세트명</th>
					<th>사용여부</th>
					<th>문제수</th>
					<!-- 접근성 인증을 위해 새창이 열릴 경우 title="새창"과 target="_blank" 표시 -->
					<th>
						<a href="#none" onclick="addTr();" class="btn-small-white"><span class="blue">+추가</span></a>
						
				 </th>
				</tr>
			</thead>
			<tbody>
				<c:set var="SETLIST" value="Y"/>	<!-- 세트 목록관련 변수 -->
				<c:choose>
					<c:when test="${not empty listData}">
 						<c:forEach items="${listData}" var="result" varStatus="stat">
	 						<tr>
								<td>
									<c:out value="${result.RNUM}"/>
									<input type="hidden" id="setno" name="setno" value="<c:out value="${result.SETNO}"/>"/>
								</td>
								<td><input type="text" id="title" name ="title" value="<c:out value="${result.TITLE}"/>" maxlength="66"/></td>
								<td> 
									<select name="useyn" id="useyn">
									
									
									
										<option value="Y" <c:if test="${result.USEYN eq 'Y'}">selected="selected"</c:if>>사용</option>
										<option value="N" <c:if test="${result.USEYN eq 'N'}">selected="selected"</c:if>>미사용</option>
									</select>
									
									
								</td>
								<td><c:out value="${result.TOTALQNUM}"/></td>
								<td>
									<a href="#none" onclick="fnSetQuizList('<c:out value="${result.SETNO}"/>')" class="btn-small-white"><span class="green">문제목록</span></a>
								</td>
							</tr>
						</c:forEach> 
					</c:when>
					<c:otherwise>
						 <c:set var="SETLIST" value="N"/><!-- 세트 목록관련 변수 -->
						<tr id = "noneList"> <td colspan="5">등록된세트가 없습니다</td></tr>
					</c:otherwise>
				</c:choose>
			 
			</tbody>
		</table>
		</form>
	</div>
	
	<!-- 문제목록 이동 form -->
	<form id="qForm" name="qForm" method="post">
		<input type="hidden" name="subcmd" id="subcmd"/>
		<input type="hidden" name="setno" id="setno"/>
		<input type="hidden" name="examNo" id="examNo" value='<c:out value="${REQUEST_DATA.examNo}"/>'/>
		
	</form>

	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
 			<a href="#none" onclick="fnSave('N'); return false;" class="btn-large-orange"><span>저장</span></a>
 		</div>
		<div class="btn-table left">
			<a href="#none" onclick="fnBack();" class="btn-large-blue"><span>등록화면 바로가기</span></a>
  		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	
	<script type="text/javascript">
    	// 추가
        function addTr(){
     		var setListYn = "<c:out value='${SETLIST}'/>";
     		var rowCount = $('#set_exam tr').length; 
    
     		if(setListYn=='N' && rowCount <3 ){
     			$('#noneList').hide();
     		}
     		
            var newitem = '<tr> <td><input type=\'hidden\' id=\'setno\' name=\'setno\' value=\'0\'/>-</td> <td><input type=\'text\' id=\'title\' name =\'title\' value=\'\'/></td> <td><select name=\'useyn\' id=\'useyn\'>n<option value=\'Y\' selected=\'selected\'>사용</option> <option value=\'N\'>미사용</option> </select></td> <td>-</td> <td><a href=\'#none\' class=\'btn-small-white\' onclick=\'delTr(this);\'><span class=\'red\'>삭제</span></a></td> </tr>';
            $('#set_exam').append(newitem);
        }
        
    	// 삭제
        function delTr(obj){ 
     		var setListYn =  "<c:out value='${SETLIST}'/>";
     		var rowCount =0;
        	rowCount = $('#set_exam tr').length; 
        	if(setListYn=='N' && rowCount ==3 ){ 
     			$('#noneList').show();
     		}
        	var clickedRow = $(obj).parent().parent();
            
        	clickedRow.remove();
        }
        
    	// 저장
    	function fnSave(){
    		$('form[name=examForm]').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/exec.do').submit();
    	}
    	
    	// 페이징 이동 
    	function fnList() {
    		$('#examForm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/list.do').submit();
    	}
    	
    	function fnBack() {
    		$('#examNo').val("<c:out value='${REQUEST_DATA.examNo}'/>");
    		$('#examForm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/exam/form.do').submit();
    	}
    	
    	// 문제 목록 이동
    	function fnSetQuizList(setno){ 
    		$('#qForm > input[name="setno"]').val(setno);
    		$('#qForm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_list.do').submit();
    	}
	</script>

