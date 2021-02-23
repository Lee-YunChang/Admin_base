<%
/****************************************
	system	: ClassDesk > 강사 > 설문
	title	: 설문 폼(팝업)
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
		<h1 class="popup-title">설문등록</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content">
	<!-- 과제출제 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">설문등록</h3>
	</div>
		<form id="frm" name="frm" action="/classdesk/tutor/poll.do">
		<input type="hidden" name="pollcSeqNo" id="pollcSeqNo" value="<c:out value="${REQUEST_DATA.pollcSeqNo}"/>"/>
		<input type="hidden" name="qNo" id="qNo" value="<c:out value="${rowData.QNO}"/>"/>
		<div class="table-type2">
			<table id="itemForm">
				<caption>설문문항</caption>
				<colgroup>
					<col width="13%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th>문제유형</th>
						<td><label for="task-title">점수</label>
							<select name="mtCpollCode">
								<option value="JBBA00" selected="selected">객관식</option>
								<option value="JBAA00">주관식</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th>문제</th>
						<td><label for="task-title">문제</label>
							<input type="text" class="w98" name="subject" id="subject" value='<c:out value="${rowData.SUBJECT}" />' /> 
						</td>
					</tr>
					<tr>
						<th rowspan="5">지문</th>
						<td>
							<span style="padding-right: 10px;">1)  :</span>
							<label for="task-title">1번문항</label>
							<input type="text" class="w90" name="item01" id="item01" value='<c:out value="${rowData.ITEM01}" />' /> 
						</td>
					</tr>
					<tr>
						<td>
							<span style="padding-right: 10px;">2)  :</span>
							<label for="task-title">2번문항</label>
							<input type="text" class="w90" name="item02" id="item02" value='<c:out value="${rowData.ITEM02}" />' /> 
						</td>
					</tr>
					<tr>
						<td>
							<span style="padding-right: 10px;">3)  :</span>
							<label for="task-title">3번문항</label>
							<input type="text" class="w90" name="item03" id="item03" value='<c:out value="${rowData.ITEM03}" />' /> 
						</td>
					</tr>
					<tr>
						<td>
							<span style="padding-right: 10px;">4)  :</span>
							<label for="task-title">4번문항</label>
							<input type="text" class="w90" name="item04" id="item04" value='<c:out value="${rowData.ITEM04}" />' /> 
						</td>
					</tr>
					<tr>
						<td>
							<span style="padding-right: 10px;">5)  :</span>
						    <label for="task-title">5번문항</label>
							<input type="text" class="w90" name="item05" id="item05" value='<c:out value="${rowData.ITEM05}" />' /> 
						</td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td>
							<input type="radio" name="useYn" id="exam-type1" value="Y" checked="checked" />
							<label for="exam-type1" class="visible">Y</label>
							<input type="radio" name="useYn" id="exam-type2" value="N" /><label for="exam-type2" class="visible">N</label>
						</td>
					</tr>
					
					
				</tbody>
			</table>
		</div>
		</form>
	</div>
	<!-- //과제출제 -->
	<!-- 게시판 버튼영역 -->
	<div class="popup-btn-group clearfix">
	<div class="btn-popup"> 
		<a href="#none" onclick="fnSave(); return false;" class="btn-large-blue"><span>저장</span></a>
			<c:if test="${rowData.QNO != null}">
			<a href="#none" onclick="fnDel(); return false;" class="btn-large-orange"><span>삭제</span></a>
			</c:if>
			<a href="#none" onclick="self.close();" class="btn-large-orange"><span>취소</span></a>
	</div>
</div> 
	<!-- //게시판 버튼영역 -->
<!-- content -->
</body>
</html>



<script type="text/javascript">
	$(document).ready(function(){
		$('select[name=mtCpollCode]').val('<c:out value="${rowData.MT_CPOLL_CODE}" default='JBBA00' />').attr('selected', 'selected');
	
		var useYn = '<c:out value="${rowData.USEYN}" />';
		$('input:radio[name=useYn]:input[value='+useYn+']').attr('checked', true);
		
		
		fnMultipleShowHide('<c:out value="${rowData.MT_CPOLL_CODE}" />');
		
		$('select[name=mtCpollCode]').change(function(e){
			fnMultipleShowHide($(this).val());
		});
	});



	/**************************************************
	 함수명 : fnPopFrm
	 설 명 : 설문 문제추가 (팝업)
	***************************************************/ 
	function fnMultipleShowHide(value){
		if(value == 'JBAA00'){
			$('#itemForm tbody tr:eq(2)').hide();
			$('#itemForm tbody tr:eq(3)').hide();
			$('#itemForm tbody tr:eq(4)').hide();
			$('#itemForm tbody tr:eq(5)').hide();
			$('#itemForm tbody tr:eq(6)').hide();				
			
		}else{
			$('#itemForm tbody tr:eq(2)').show();
			$('#itemForm tbody tr:eq(3)').show();
			$('#itemForm tbody tr:eq(4)').show();
			$('#itemForm tbody tr:eq(5)').show();
			$('#itemForm tbody tr:eq(6)').show();
		}
	}

	/**************************************************
	 함수명 : fnPopFrm
	 설 명 : 설문 문제추가 (팝업)
	***************************************************/ 
	function fnDel(){
		if(confirm('삭제 하시겠습니까?')){
			$('#frm')
			    .attr('action', '/classdesk/tutor/poll/q_del_exec.do')
				.attr('method', 'post')
				.attr('target', '_cm')
				.submit();
		}
	}
	
	/**************************************************
	 함수명 : fnPopFrm
	 설 명 : 설문 문제추가 (팝업)
	***************************************************/ 
	function fnSave(){
		if($('#subject').valueEmpty()){
			alert('문제를 입력해 주세요.');
			$('#subject').focus();
			return false;
		}
		 
		 
		if($.getLength(jQuery('#subject')) > 200){
			alert('문제는 200(byte) 이하로 입력해주세요.');
			$('#subject').focus();
			return false;
		}
		 
		// 주관식
		if($('select[name=mtCpollCode]').val() == 'JBAA00'){
			$('input[name*=item0]').val('');	 

		}else{
			if(!SANGS.Classdesk.questionNullCheck($('input[name*=item0]'))){
				alert('지문을 입력해 주세요.');
				return false;
			}
		}
		 

		$('#frm')
		    .attr('action', '/classdesk/tutor/poll/q_exec.do')
		    .attr('method', 'post')
		    .attr('target', '_cm')
		    .submit();
		
	}	
	</script>

