<%
/****************************************
	system	: ClassDesk > 강사 > 성적
	title	: 과제 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="result"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 
<style>
input[type=text]{
	width:70px;
}
</style>

<!-- 성적정보 -->
<form id="resultForm" name="resultForm"  method="post" action="" enctype="multipart/form-data"> 

<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTALCOUNT}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>

<input type="hidden" name="cuserInfo" id="cuserInfo" value="">
<input type="hidden" name="usernoArr" id="usernoArr" value="">
<input type="hidden" name="moblphonArr" id="moblphonArr" value="">
<input type="hidden" name="useridArr" id="useridArr" value="">
<input type="hidden" name="openAt" id="openAt" value="N">
<input type="hidden" name="fileId" id="fileId" value="<c:out value="${courseFileInfo[0].FILE_ID}"/>">
<input type="hidden" name="SAVPATH" id="SAVPATH" value="<c:out value="${courseFileInfo[0].SAVPATH}"/>">
<input type="hidden" name="SAVFILE" id="SAVFILE" value="<c:out value="${courseFileInfo[0].SAVFILE}"/>">
<input type="hidden" name="ORGFILE" id="ORGFILE" value="<c:out value="${courseFileInfo[0].ORGFILE}"/>">
<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>">
<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.SES_COURSENO}"/>">

	<div class="table-title clearfix">
		<h3 class="ico-table-blue">수강생 성적 정보 </h3>
	</div>
	<div class="table-type3">
		<table>
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>수료 여부</th>
					<td colspan="3">
						<input type="radio" name="isPass" value="" <c:if test="${empty REQUEST_DATA.isPass}">checked="checked"</c:if>>전체&nbsp;&nbsp;
						<input type="radio" name="isPass" value="Y" <c:if test="${REQUEST_DATA.isPass eq 'Y'}">checked="checked"</c:if>>수료&nbsp;&nbsp;
						<input type="radio" name="isPass" value="N" <c:if test="${REQUEST_DATA.isPass eq 'N'}">checked="checked"</c:if>>미수료&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>대상자 선정 여부</th>
					<td colspan="3">
						<input type="radio" name="targetYn" value="" <c:if test="${empty REQUEST_DATA.targetYn}">checked="checked"</c:if>>전체&nbsp;&nbsp;
						<input type="radio" name="targetYn" value="Y" <c:if test="${REQUEST_DATA.targetYn eq 'Y'}">checked="checked"</c:if>>선정&nbsp;&nbsp;
						<input type="radio" name="targetYn" value="N" <c:if test="${REQUEST_DATA.targetYn eq 'N'}">checked="checked"</c:if>>미선정&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>검색</th>
					<td colspan="3">
						<select name="searchType" style="width: 100px;">
							<option value="" <c:if test="${empty REQUEST_DATA.searchType}">selected="selected"</c:if>>선택</option>
							<option value="ID" <c:if test="${REQUEST_DATA.searchType eq 'ID'}">selected="selected"</c:if>>아이디</option>
							<option value="NAME" <c:if test="${REQUEST_DATA.searchType eq 'NAME'}">selected="selected"</c:if>>이름</option>
						</select>
						&nbsp;
						<input type="text" name="searchWord" style="width: 300px;" value="${REQUEST_DATA.searchWord}">
					</td>
				</tr>
			</tbody>
		</table>
	</div>	 
	
		<div class="table-btn-group">
			<a href="#" class="btn-large-brown" onclick="fnList();return false;"><span>검색</span></a>
		</div>
	 
	 
	 
	 <br>
	 <div class="table-type3">
		<table>
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>출석부 첨부</th>
					<td colspan="3">
					
						<c:choose>
							<c:when test="${not empty courseFileInfo[0].FILE_NAME}">
							
								<a href="#" onclick="filedown()" class="btn-down">
									<span><c:out value="${courseFileInfo[0].FILE_NAME}"/>(<c:out value="${courseFileInfo[0].FILE_SIZE}"/>KB)</span>
								</a>
								<a style="margin-left:10px;" class="btn-small-orange" onclick="deleteFile();return false;"><span>삭제</span></a>
							</c:when>
							<c:otherwise>
								<input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden">
							</c:otherwise>
						</c:choose>
					</td>
					
				</tr>
			</tbody>
		</table>
	</div>	
	
	<div class="table-btn-group">
		<a href="#" class="btn-large-blue" onclick="saveFile();return false;"><span>출석부 등록</span></a>
	</div>
	 
	
	
	<div class="table-title clearfix">
		
		<br><br> &nbsp;  
					<a href="#none" class="btn-small-purple" onclick="mailFormGroup(document.userForm);"><span>메일보내기</span></a>
					<a href="#none" class="btn-small-purple" onclick="smsFormGroup(document.resultForm);"><span>SMS</span></a> 
		<div class="btn-group">
			<div class="btn-group">
 				<a href="#none" onclick="fnAttendVal();" class="btn-small-orange"><span>출석점수부여</span></a>
				<a href="#none" class="btn-small-brown" onclick="fnExcel()"><span>엑셀다운로드</span></a>  
			</div>
		</div>
	</div>
	
	
	<input type="hidden" name="subcmd" id="subcmd"/>
	
	<div class="table-type4">
		<div class="table-header-left"></div>
		<table id="itemList">
			<caption>과제</caption>
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="7%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="9%" />
				<col width="10%" />
				<col width="5%" />
				<col width="5%" />
			</colgroup>
			<thead>
				<tr>
					<th><label for="isall">전체선택</label>
						<input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"  onclick="MsgUserAllCheck();">
					</th>
					<th>NO</th>
					<th>성명</th>
					<th>온라인학습(<c:out value="${rowData.EVAL_PROGRESS}" default="0" /> )</th>
					<th>시험(<c:out value="${rowData.EVAL_EXAM_FINAL}" default="0"/>)</th>
					<th>출석(<c:out value="${rowData.EVAL_ATTEND}"  default="0"/>)</th>
					<th>총점</th>
					<th>수료여부<br>(기준 :<c:out value="${rowData.COMP_VAL}" default="0" /> 점)</th>
					<th>수료코드 <BR>(발급일자)</th>
					<th>석차</th>
					<th>선정여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							
									<tr>
										<td>
											<input type="checkbox" class="msg_user" id="msg_user"  value="${result.EMAIL}"/>
											<input type="hidden"  class="recUsmsg_usererList" id ="recUsmsg_usererList" value = "<c:out value="${result.USERID}"/>/<c:out value="${result.USERNAME}"/>/<c:out value="${result.EMAIL}"/>/<c:out value="${result.MOBILE}"/>" />
											<input type="hidden" class="userid" id="userid" value="${result.USERID}"/>
											<input type="hidden" class="moblphon"  id="moblphon" value="${result.MOBILE}"/>
											<input type="hidden" class="userno" id="userno" value="${result.USERNO}"/>
											<input type="hidden"  name="cuserNo" id="cuserNo" value="<c:out value="${result.CUSERNO}" default="0"/>" /> 
										</td> 
										
										<td><c:out value="${listData[0].TOTALCOUNT - ((((REQUEST_DATA.cPage-1)*200))+stat.index)}"/></td>
										<td><c:out value="${result.USERNAME}" default="-"/> (<c:out value="${result.USERID}" default="-"/>)</td>
										<td><label for="progressVal">온라인학습</label><input type="text" name="progressVal" id="progressVal" value="<c:out value="${result.PROGRESS_VAL}" default="0"/>" onkeyup="lfn_keychk(this);"  maxlength="5"  /> 점</td>
										<td><label for="examFinalVal">최종시험점수</label><input type="text" name="examFinalVal"  id="examFinalVal" value="<c:out value="${result.EXAM_FINAL_VAL}" default="0"/>" onkeyup="lfn_keychk(this);"   maxlength="5"   /> 점</td>
										<td><label for="attendVal">출석점수</label><input type="text" name="attendVal"  id="attendVal" value="<c:out value="${result.ATTEND_VAL}" default="0"/>"  onkeyup="lfn_keychk(this);" maxlength="5"  /> 점  </td>
										<td>
											<span class="red_b" id = "finalValOut">
												<c:out value="${result.FINAL_VAL}" default="0"/>
											</span>
											<input type="hidden" name="finalVal" id="finalVal" value="<c:out value="${result.FINAL_VAL}" default="0"/>"/>
										</td>
										<td>
											<!-- <label for="ispass">수료여부</label> --> 
												<span class="blue_b">
													<c:if test="${result.ISPASS eq 'N'}">미수료</c:if>
													<c:if test="${result.ISPASS eq 'Y'}">수료</c:if>
												</span>
												<input type="hidden" name="ispass"  id="ispass" value="<c:out value="${result.ISPASS}" default="N"/>"/>
										</td>
										<td>
											<span class="blue_b">
												<c:choose>
													<c:when test="${result.ISPASS eq 'Y'}">
														<c:out value="${result.COMPCODE}" default="-"/><br/>(<fmt:formatDate value="${result.COMPDATE}" pattern="yyyy-MM-dd" />)
													</c:when>
													<c:otherwise>
													 - 
													</c:otherwise>
												</c:choose>
											</span>
											
										</td>
										<td>
											<span class="blue_b"><c:out value="${result.RANK}" default="0"/> </span>
											<input type = "hidden" id="rank" name="rank" value= "<c:out value="${result.RANK}" default="0"/>"> 
										</td>
										<td>
											<c:choose>
												<c:when test="${result.TARGETYN eq 'Y'}">선정</c:when>
												<c:otherwise>미선정</c:otherwise>
											</c:choose>
										</td>
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
	</div>
	<div align="cneter" style="text-align: center;">
	<c:if test="${not empty listData}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${listData[0].TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:fnPageList"/>
	    </div>
	</c:if>
	</div>
	
	</form>
	<!-- //성적정보 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" class="btn-large-blue"  onclick="fnForm('N');"><span>성적반영</span></a>
			<a href="#none" class="btn-large-blue"  onclick="fnForm('Y');"><span>최종성적반영</span></a>
		</div>
	</div>
    
    <%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
 
	
	<!-- //게시판 버튼영역 -->
	<script type="text/javascript">

 	// 총점 자동 계산 함수 호출
 	$(document).ready(function(){
 		$('input').bind({
 			keyup : function(){
 				fnChFinalVal();
 			}
 		});
 		
 		fnChFinalVal();
 	});

 	// 총점 자동계산
 	function fnChFinalVal() {
		 var compVal = Number('<c:out value="${rowData.COMP_VAL}"/>');  

	 		 $('#itemList tbody tr').each(function(i) {
 			    var sum=0;
 				for(j=3; j<6; j++){ 
	 				sum+=  Number($(this).find('td').eq(j).find('input').attr('value'));
	 			}
 				
 				if(sum < compVal  ){
 					$(this).find('td').eq(7).find('span').html('미수료'); 
 					$(this).find('td').eq(7).find('spa.tn').attr('class', 'red_b');
 					$(this).find('td').eq(7).find('input').val('N');
	 					
 				}else{
 					$(this).find('td').eq(7).find('span').html('수료');
 					$(this).find('td').eq(7).find('span').attr('class', 'blue_b');
 					$(this).find('td').eq(7).find('input').val('Y');

	 				}
 				
 				$(this).find('td').eq(6).find('span').html(sum);
 				$(this).find('td').eq(6).find('input').val(sum);
 				   
 		 }); 
	 		 // 점수별 수료 여부 자동 계산 
	 		 fnComp();
	 		 fnRank();
	 	} 
 	
 	
 	function fnRank(){
 		var pNum=0;
 		$('#itemList tbody tr').each(function(i){
 			pNum = Number($(this).find('td').eq(6).find('span').html());
 		
 			var rankCnt = 1;
	 		$('#itemList tbody tr').each(function(j){
	 			if(pNum <  Number($(this).find('td').eq(6).find('span').html())){
	 				
	 				rankCnt++;
	 			}
	 		});	
 			$('#itemList tbody tr').eq(i).find('td').eq(9).find('span').html(rankCnt); 
 			$('#itemList tbody tr').eq(i).find('td').eq(9).find('input').val(rankCnt); 
 			
 		}); 
 	}
 	
 	// 총점에 따른 수료여부 자동 계산
 	function fnComp(){ 
 		var compCode = '';
	 		var compVal = Number('<c:out value="${rowData.COMP_VAL}"/>');  
 		
 		$('input[name=finalVal]').each(function(i){
 			if( Number($(this).val()) < compVal ){
 				//compCode = 'N'; 
 				// console.log(compCode);
 	 				//$('#ispass > option[value = ' + compCode + ']').eq(i).attr('selected', 'ture');  
 	 				$(this).find('td').eq(7).find('span').eq(i).html('미수료');
					$(this).find('td').eq(7).find('span').eq(i).attr('class', 'red_b');
					$(this).find('td').eq(7).find('input').eq(i).val('N');
 			}else{
 				//compCode = 'Y';
 				// console.log(compCode);
 	 				//$('#ispass > option[value = ' + compCode + ']').eq(i).attr('selected', 'ture'); 
 	 				$(this).find('td').eq(7).find('span').eq(i).html('수료');
					$(this).find('td').eq(7).find('span').eq(i).attr('class', 'blue_b');
					$(this).find('td').eq(7).find('input').eq(i).val('Y');
 			}
			 
 		}); 
 	}

 	function lfn_keychk(obj){
 	    var val = obj.value;
 	    var re = /[^0-9|.]/gi;
 	    
 	    obj.value = val.replace(re, '');
 	       
 	    var split = val.split('.');
 	    
 	    if(split.length > 2) {  //콤마 1개 이상 못들어오도록.
 	        obj.value = val.substr(0,val.length-1);
 	    }
 	    
 	    if(split[1] != null){  //소수점 아래 한자리 넘지못하도록.
 	        if(split[1].length > 2) {
 	            obj.value = val.substr(0,val.length-1);
 	        }
 	    }
 	} 

	
	// 출석점수부여
	function fnAttendVal() {
		
		var answer = confirm ('출석점수를 일괄 부여 하시겠습니까? \n확인시 모든 수강생의 출석점수는 <c:out value="${rowData.EVAL_ATTEND}"/>점 이됩니다.');
		
		if(answer) {
		    $('input[name=attendVal]').each(function(i){
		        $(this).val('<c:out value="${rowData.EVAL_ATTEND}"/>');
		    });
	    } else {
		    return false;
		}
			
		fnChFinalVal();
	}
	
		// 성적반영
	function fnForm(chVal) {
			
			if ($('input[id=msg_user]:checked').length < 1) {
				alert('선택된 학습자가 없습니다.');
				return;
			}
			
			var finalYn = chVal;
			
			// 진도점수 체크
			var result = true;
		 $('input[name=progressVal]').each(function(i){
 	 		     if( Number($(this).val()) > Number( '<c:out value="${rowData.EVAL_PROGRESS}"/>') ){
	        	 alert('진도점수가 기준 점수를 초과였습니다.');
	        	 $(this).focus();
	        	 result = false;
	        	 return false;
	         }
		 });
		 
		 if(!result) return;
		 
			// 과제점수
			$('input[name=reportVal]').each(function(i){
	  	 		 if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_REPORT}"/>') ){
	        	 alert('과제점수가 기준 점수를 초과였습니다.');
	        	 $(this).focus();
	        	 result = false;
	        	 return false;
	         }
		});
			if(!result) return;
			
			// 중간시험점수
			/* $('input[name=examMtVal]').each(function(i){
		         if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_EXAM_MT}"/>') ){
	        	 alert('중간시험 점수가 기준 점수를 초과였습니다.');
	        	 $(this).focus();
	        	 result = false;
	        	 return false;
	         }
		 });
		 if(!result) return; */
			
		 // 최종시험점수
			$('input[name=examFinalVal]').each(function(i){
	 	  	 	if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_EXAM_FINAL}"/>') ){
	        	 alert('최종시험 점수가 기준 점수를 초과였습니다.');
	        	 $(this).focus();
	        	 result = false;
	        	 return false;
	         }
		});
			if(!result) return;
			
			// 출석 점수
			$('input[name=attendVal]').each(function(i){
	 	  	 	if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_ATTEND}"/>') ){

	        	 alert('출석 점수가 기준 점수를 초과였습니다.');
	        	 $(this).focus();
	        	 result = false;
	        	 return false;
	         }
		});
			if(!result) return;
			// 시험 점수 체크 (최종)
			
			// 출석점수 체크
			
			var paramList = [];
			var param;
			var $tmp;
			$('input[id=msg_user]:checked').each(function(){
				param = "";
				$tmp = $(this).closest('tr');
				param += $tmp.find('input[name=cuserNo]').val() + "@";
				param += $tmp.find('input[name=progressVal]').val() + "@";
				param += $tmp.find('input[name=examFinalVal]').val() + "@";
				param += $tmp.find('input[name=attendVal]').val() + "@";
				param += $tmp.find('input[name=ispass]').val() + "@";
				param += $tmp.find('input[name=finalVal]').val() + "@";
				param += $tmp.find('input[name=rank]').val();
				paramList.push(param);
				
			});
			
			$('form[id=resultForm]').find('input[id=cuserInfo]').val(paramList.join(','));
			
			//최종성적반영
			if(finalYn=='Y'){
				
				if(confirm('최종 성적 반영시 "수료증(수료코드)"이 발급되며, 기존 수료 코드가 존재하는 수강생은 수료 코드가 신규 발급됩니다.\n최종 성적을 반영 하시겠습니까?')){
					// 사용자 정보 데이터 전송
				   
					$('form[id=resultForm]')
						.attr('target', '_cm')
						.attr('action', '/classdesk/tutor/result/result_final_exec.do')
						.submit();
		 		}
			// 성적반영
			}else{
				if(confirm('성적을 반영 하시겠습니까?')){
					
					$('form[id=resultForm]')
						.attr('target', '_cm')
						.attr('action', '/classdesk/tutor/result/result_exec.do')
						.submit();
		 		}
			}

 		
	}
	
	// 페이징 이동 함수
	function fnList() {
		var frm = document.resultForm;
		frm.cPage.value = "1";
		$('#resultForm')
			.attr('target', '_self')
			.attr('action', '/classdesk/tutor/result/result_form.do').submit();
	}
	// 엑셀다운로드
	function fnExcel() {
		$('#resultForm')
			.attr('target', '_self')
			.attr('action', '/classdesk/tutor/result/result_excel.do').submit();
	}
	
	function fnPop(type){
		var popType = type ;
		var w1= 1000;

		if(popType == 'mail'){
			$('form[id=resultForm]')
				.attr('action', '/classdesk/common/mail/form.do');
		}else if( popType == 'sms'){
			w1 = 615;
			$('form[id=resultForm]') 				
				.attr('action', '/classdesk/common/sms/form.do');
			}
		
		SANGS.Util.openPopupSubmit($('#resultForm'), 'qFormPop', 'width='+w1+', height=772, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
	}
		
    
    //SMS발송 - 일괄
	//2016.03.28 수정
	function smsFormGroup(){
		var form = document.resultForm;
		var chk = $("input:checkbox[id=msg_user]:checked");
		
		var usernoArr = new Array;
		var moblphonArr = new Array;
		var useridArr = new Array;
		$('input:checkbox[id=msg_user]').each(function(index, element) {
			var ischecked = $(this).is(':checked');
			if(ischecked) {
			 	usernoArr.push($(this).siblings("#userno").val());
			 	var tmpmob = $(this).siblings("#moblphon").val();
			 	var newtmpmob = tmpmob.replace(/-/g, "");
			 	moblphonArr.push(newtmpmob);
			 	useridArr.push($(this).siblings("#userid").val());
			}
		});
		 
		$("#usernoArr").val(usernoArr);
		$("#moblphonArr").val(moblphonArr);
		$("#useridArr").val(useridArr);
		
		var smspop = window.open("","smsform","width=520,height=650"); 

		form.method = "post";
		form.action = "/admin/common/smsForm.do";
		form.target = "smsform"; 
		form.submit();
		smspop.focus();
	}
	//메일발송 - 일괄
	//2016.03.28 수정
	function mailFormGroup(){
		var form = document.resultForm;
		var chk = $("input:checkbox[id=msg_user]:checked");
		
		var usernoArr = new Array;
		$('input:checkbox[id=msg_user]').each(function(index, element) {
			var ischecked = $(this).is(':checked');
			if(ischecked) {
			 	usernoArr.push($(this).siblings("#userid").val());
			}
		});
		 
		$("#usernoArr").val(usernoArr);
		var specs = "left=10,top=10,width=980,height=800";
		specs += ",menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
		
		var mailpop = window.open("","mailform",specs); 
		
		form.method = "post";
		form.action = "/admin/common/mailForm3.do";
		form.target = "mailform"; 
		form.submit();
		mailpop.focus();
	}
	
	function saveFile(){
		var form = document.resultForm;
		form.action = "/classdesk/tutor/result/saveFile.do";
		form.submit();
	}
	
	//파일다운로드
	function filedown(){ 
		$('#resultForm').attr('action', '/classdesk/tutor/result/filedown.do').submit();
	}
	
	function deleteFile(){ 
		var fileId = $('#fileId').val();
		var savePath = $('#SAVPATH').val();
		var saveFile = $('#SAVFILE').val();
		if(fileId != ''){
			if(confirm("기존파일을 삭제하시겠습니까?")){
		        $.ajax({
		            url : "/classdesk/tutor/result/deleteFile.do",
		            data : {fileId : fileId,savePath:savePath,saveFile:saveFile},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == "SUCCESS"){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	location.reload();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		} 
	}
	
	//페이지 이동
	function fnPageList(cPage){
		var frm = document.resultForm;
		frm.target = "";
		frm.cPage.value = cPage;
		frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
		
		var mtScCodeArr = new Array;
		
		$("#resultForm").attr("action", "/classdesk/tutor/result/result_form.do");
		frm.submit();
	}
	</script>
	 