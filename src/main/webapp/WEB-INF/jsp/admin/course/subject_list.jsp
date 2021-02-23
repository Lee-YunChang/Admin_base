<%
/****************************************************
	system	: 과정관리 > 교육과정등록
	title	: 교육과정 상태(서비스,중지)별 조회
	summary	:	
	wdate	: 2016-04-18
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script id="itemRow" type="text/template">
   <tr align="center">
       <td>{{=idx}}</td>
       <td>
      		<input type="text" class="line" style="width:98%;height:50px;" id="subject" name="subject" value="{{=subject}}"/>
       </td>
       <td><textarea name="content" style="width:100%;height:50px;overflow:visible" class="tline">{{=content}}</textarea></td>
        <td>
	       	<a href="#" id="saveBtn" val="{{=libno}}"  class="btn small green">{{=btnTxt}}</a>
	       	<a href="#" id="delBtn"  val="{{=libno}}"  class="btn small red">삭제</a>
       </td>
   </tr>
</script>
   
<script type="text/javascript">
var selectMtScCode = "";
$(document).ready(function(){
	selectMtScCode = "";
	$('#addRowBtn').click(function(e){
		e.preventDefault();
		$('#itemList').append(_.template($('#itemRow').html())(
				{ 
					idx:$('input[name=subject]').length+1
					, subject:''
					, content:''
					, btnTxt:'등록'
					, libno:''
				}
		)).find('.nonedata').remove(); 
		
		
		$('input[name=subject]:last').focus();
	});	
	
	$('.scCodeArea').click(function(e){
		e.preventDefault();
		$('.tdCss').css('background', 'white');
		$(this).parent().css('background', 'skyblue');
	});
	
	$('.scCodeArea:eq(0)').trigger('click');
	
	
	$('#itemList').on('click', '#delBtn', function(e){
		e.preventDefault();
		var parentsTr = $(this).parent().parent();
		var libno = $.trim($(this).attr('val'));
		if(libno != ''){
			if(confirm("삭제 하시겠습니까?")){
					 
		        $.ajax({
		            url : "/admin/course/courseSubjectProc.do",
		            data : {libno : libno, type : 'D'},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res.result == "SUC"){
		            		alert("삭제되었습니다.");
		            		parentsTr.remove();
		            	}else{
		            		alert('fail');
		            	}
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		
		}else{
			parentsTr.remove();
		}
	});
	
	// 교과목 등록
	$('#itemList').on('click', '#saveBtn', function(e){
		e.preventDefault();
		
		var parentsTr = $(this).parent().parent();
		
		var subject = parentsTr.find('input[name=subject]').val();
		var content = parentsTr.find('textarea[name=content]').val();
		if(subject == '') {
			alert('교과목명을 입력해 주세요.');
			parentsTr.find('input[name=subject]').focus();
			return;
		}
		
		
		if(!confirm($.trim($(this).attr('val')) != '' ? "수정하시겠습니까?" : "등록하시겠습니까?")) return false;
		
		
		var params = {};
		 params.libno = $.trim($(this).attr('val'));
		 params.subject = subject;
		 params.content = content;
		 params.mtScCode = selectMtScCode;
		 params.type = 'S';
			 
        $.ajax({
            url : "/admin/course/courseSubjectProc.do",
            data : params,
            dataType : "json",
            type : 'post',
            success : function(res) {
            	if(res.result == "SUC"){
            		alert("저장되었습니다.");	
            	}else{
            		alert('fail');
            	}
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        }); 
	});
});


//검색
function list_page(){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = "1";
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	$("#pform").attr("action", "/admin/course/courseList.do");
	frm.submit(); 
}




function goSubjectList(mtScCode){
	
	selectMtScCode = mtScCode;
	
		$.ajax({
			url : '/admin/course/subjectListAjax.do',
			data : {mtScCode:mtScCode},
			dataType : 'json',
			type : 'post',
			async: 'false',
			success : function(res) { 
				$('#itemList').empty();
				
				if(res.list.length > 0){
					_.each(res.list, function(item,i){
		        		// console.log(item);
		        		 $('#itemList')
		             		.append(_.template($('#itemRow').html())(
		         				{ 
		         					idx:i+1
		         					, subject:item.SUBJECT
		         					, content:item.CONTENT
		         					, btnTxt:'수정'
		         					, libno:item.LIBNO
		         				}
		         		)); 
		        	}); 
				}else{
					$('#itemList').append('<tr class="nonedata"><td colspan="4" align="center">등록된 교과목이 멊습니다.</td></tr>');
				}
			},
			error : function(e) {
				alert("error :" + e.responseText);
			}
		});	
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정등록</div>


	<!-- 본문 > 상단 > 검색영역 끝 -->
	<table width="100%" class="btn_Group">
		<tbody>
			<tr>
				<td align="right">
					<a href="#" id="addRowBtn" class="btn blue">추가</a>
				</td>
			</tr>
		</tbody>
	</table>

	<!-- 본문 > 메인 > 목록 시작  -->
	<div style="overflow:hidden">
		<div style="width:35%;float:left">
			<table class="tb table-type1" style="margin-right:5px" >
				<tr class="rndbg">
					<th>NO</th>
					<th>과정구분(집합교육)</th>
				</tr>
				<colgroup>
					<col align=middle width="4%">
					<col align=middle width="*">
				</colgroup>	
			
				<tbody id="scList">
				<c:forEach var="result" items="${mtCodes.SC}" varStatus="status">
					<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
						<td><c:out value="${status.count}"/></td> 
						<td class="tdCss"><a href="#none" class="scCodeArea" onclick="goSubjectList('${result.MT_SUB_CODE}'); return false;">${result.MT_SUB_NAME}</a></td>
					</tr> 
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="float:left;width:65%">
			<table class="tb table-type1" style="margin-left:5px" >
				<tr class="rndbg">
					<th>NO</th>
					<th>교과목명</th>
					<th>설명</th>
					<th>저장</th>
				</tr>
				<colgroup>
					<col align=middle width="4%">
					<col align=middle width="40%">
					<col align=middle width="*">
					<col align=middle width="15%">  	
				</colgroup>	
			
				<tbody id="itemList">
				</tbody>
			</table>
		</div>
	</div>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	