<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script id="itemRow" type="text/template">
   <tr align="center">
       <td><input type="text" class="line" style="width:98%" id="thema" name="thema" value=""/></td>
       <td>
      		<input type="text" class="line datepicker" name="startDt" id="startDt_{{=dateIdx}}" value="" readonly="readonly" style="width: 75px;"/>
		<a href="#" onclick="$('#startDt_{{=dateIdx}}').focus(); return false;" class=""><img src="/admin/images/btn_calendar.png" alt="시작일"></a>
       ~
      		<input type="text" class="line datepicker" name="endDt" id="endDt_{{=dateIdx}}" value="" readonly="readonly" style="width: 75px;"/>
		<a href="#" onclick="$('#endDt_{{=dateIdx}}').focus(); return false;" class=""><img src="/admin/images/btn_calendar.png" alt="시작일"></a>
       </td>
       <td><input type="text" class="line" style="width:98%" id="applyOrgan" name="applyOrgan" value=""/></td>
       <td><input type="text" class="line" style="width:98%" id="target" name="target" value=""/></td>
       <td><input type="text" class="line" style="width:98%" id="personCnt" name="personCnt" value=""/></td>
        <td>
       	<a href="#" id="saveBtn" val=""  class="btn small green">등록</a>
       	<a href="#" id="delBtn"  val=""  class="btn small red">삭제</a>
       </td>
   </tr>
	
</script>


	

<script type="text/javascript">
	_.templateSettings = {
		interpolate: /\{\{\=(.+?)\}\}/gim,
		evaluate: /\{\{([\s\S]+?)\}\}/gim,
		escape: /\{\{\-(.+?)\}\}/gim
	};
	
	$.datepicker.setDefaults({
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		changeMonth: true,
			changeYear: true,
			showMonthAfterYear: true,
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: 'yy-mm-dd'
	}); 
	
	$(function(){
		
		$('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
		
		// 숫자만 입력가능
		$("input:text[numberOnly]").live("keyup", function() {
	        $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	    });
		
		$('#hisTbl').on('click', '#delBtn', function(e){
			e.preventDefault();
			
			var parentsTr = $(this).parent().parent();
			var id = $(this).attr('id');
			var hisno = $.trim($(this).attr('val'));
			if(hisno != ''){
				if(confirm("삭제 하시겠습니까?")){
						 
			        $.ajax({
			            url : "/admin/tutor/tutorHisProc.do",
			            data : {hisno : hisno, type : 'D'},
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
		
		// 이력 사항 등록
		$('#hisTbl').on('click', '#saveBtn', function(e){
			e.preventDefault();
			
			var parentsTr = $(this).parent().parent();
			var id = $(this).attr('id');
			
			var thema = parentsTr.find('input[name=thema]').val();
			var startDt = parentsTr.find('input[name=startDt]').val();
			var endDt = parentsTr.find('input[name=endDt]').val();
			var applyOrgan = parentsTr.find('input[name=applyOrgan]').val();
			var target = parentsTr.find('input[name=target]').val();
			var personCnt = parentsTr.find('input[name=personCnt]').val();
			
			if(thema == '') {
				alert('교육희망주제를 입력해 주세요.');
				parentsTr.find('input[name=thema]').focus();
				return;
			}
			
			if(startDt == '') {
				alert('시작일을 입력해 주세요.');
				parentsTr.find('input[name=startDt]').focus();
				return;
			}
			
			if(endDt == '') {
				alert('종료일을 입력해 주세요.');
				parentsTr.find('input[name=endDt]').focus();
				return;
			}
			
			if(applyOrgan == '') {
				alert('소속을 입력해 주세요.');
				parentsTr.find('input[name=applyOrgan]').focus();
				return;
			}
			
			if(target == '') {
				alert('교육대상을 입력해 주세요.');
				parentsTr.find('input[name=target]').focus();
				return;
			}
			
			if(personCnt == '') {
				alert('인원을 입력해 주세요.');
				parentsTr.find('input[name=personCnt]').focus();
				return;
			}

			
			if(!confirm($.trim($(this).attr('val')) != '' ? "수정하시겠습니까?" : "등록하시겠습니까?")) return false;
			
			
			 var params = {};
			 params.hisno = $.trim($(this).attr('val'));
			 params.thema = thema;
			 params.startDt = startDt;
			 params.endDt = endDt;
			 params.target = target;
			 params.applyOrgan = applyOrgan; 
			 params.personCnt = personCnt;  
			 params.userno = $('#userno').val();
			 params.type = 'S';
				 
	        $.ajax({
	            url : "/admin/tutor/tutorHisProc.do",
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
	
	
	// 첨부파일 삭제
	function deleteReportFile(saveFile , saveFilePath){
		
		 if(confirm("파일을 삭제하시겠습니까?")){
			$('#qu').val('delete');
			$('#saveFile').val(saveFile);
			$('#saveFilePath').val(saveFilePath);
			$('#frm').attr('action', '/admin/tutor/deleteLecture.do').submit();
		}else{
			return false;
		} 
	}

	
	
	
	//우편번호찾기
	function zipSearch(){
		window.open("/admin/common/postEtc.do","post_pop", "width=600,height=450, scrollbars=YES");
	}
	
	
	function goUpdate(){
		if(confirm("수정하시겠습니까?")){
			$("#frm").attr("action", "/admin/tutor/updateTutor.do").submit();	
		}
	}
	
	function addHisRow(){
		$('#hisTbl').append(_.template($('#itemRow').html())(
				{ dateIdx:$('input[name=thema]').length+1}
		)).find('.nonedata').remove(); 
		
		
		$('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
	}
	
	//우편번호 콜백 스크립트
	function fnZipCodePopupCallBack(data){
	 	var zipCodes = data.zip_code.split('-');
	 	
	 	$('#zipno').val(data.zip_code);
	 	$('#addr1').val(data.adres);
	 	$('#addr2').val('');
	 	$('#addr2').focus();
	}
	
	function reportDown(obj) {
		var frm = document.fileDownFrm;
		frm.filename.value = $(obj).text();
		frm.realFilePath.value = $(obj).attr('realFilePath');
		frm.submit();		
	}
	
/* 	function lectFileDown(slno, sltno, fileno) {
		console.log(slno, '/', sltno, '/', fileno);
		var frm = document.frm;
		frm.slno.value = slno;
		frm.sltno.value = sltno;
		frm.fileno.value = fileno;
		$("#frm").attr("action", "/admin/tutor/tutorLectFile.do").submit();
	} */
	
	//파일다운로드
	function lectFileDown(fname){
		$('#filename').val(encodeURIComponent(fname));
		$('form[name=frm]').attr('action', '/admin/tutor/tutorLectFile2.do').submit();
	}
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강사정보관리</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="frm" id="frm" action="/admin/tutor/tutorDetail.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="userno" id="userno" value="${tutor.USERNO }"/>
<input type="hidden" name="lecno" id="lecno" value=""/>
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="searchType" id="searchType" value="<c:out value="${REQUEST_DATA.searchType }"/>"/>
<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord }"/>"/>
<input type="hidden" name="downDir" id="downDir" value="tutor"/>
<input type="hidden" name="slno" id="slno" value=""/>
<input type="hidden" name="sltno" id="sltno" value=""/>
<input type="hidden" name="fileno" id="fileno" value=""/>
<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
<input type="hidden" name="saveFile" id="saveFile" value=""/>
<input type="hidden" name="filename" id="filename" value=""/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>

<div class="tb_title"><b>기본정보</b></div>

	<table class="table-type1 search_form">
	  	<colgroup> 
				<col class="cellc" width="8%">
				<col class="celll" width="35%">
				<col class="cellc" width="8%">
				<col class="celll" width="35%">
		</colgroup>
		
		<tbody>
			<tr>
				<th>아이디</th>
				<td><c:out value="${tutor.UNITY_ID}"/></td>
				<th>메일주소</th>
				<td><c:out value="${tutor.EMAIL}"/></td>
			</tr> 
			<tr>
				<th>이름</th>
				<td><c:out value="${tutor.MBERNM}"/></td>
				<th>휴대폰번호</th>
				<td><c:out value="${tutor.MOBLPHON}"/></td>
			</tr> 
			<tr>
				<th>구분</th>
				<td>
					 <select name="mtTutorSeCode" id="mtTutorSeCode" title="구분">
	                    <c:forEach var="result" items="${mtCodes.JG}" varStatus="status">
							<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${result.MT_SUB_CODE eq tutor.MT_TUTOR_CODE}"> selected="selected"</c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select> 
				</td>
				<th>지원분야</th>
				<td>
					 <select name="mtFieldCode" id="mtFieldCode" title="지원분야">
	                    <c:forEach var="result" items="${mtCodes.FD}" varStatus="status">
							<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${result.MT_SUB_CODE eq tutor.MT_FIELD_CODE}"> selected="selected"</c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select> 
				</td>
			</tr> 
			<tr>
				<th>지역(1순위)</th>
				<td>
					<select name="mtArea1Code" id="mtArea1Code" title="지역1">
	                    <c:forEach var="result" items="${mtCodes.AC}" varStatus="status">
							<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${result.MT_SUB_CODE eq tutor.MT_AREA1_CODE}"> selected="selected"</c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select> 
				</td>
				<th>지역(2순위)</th>
				<td>
					<select name="mtArea2Code" id="mtArea2Code" title="지역2">
	                    <c:forEach var="result" items="${mtCodes.AC}" varStatus="status">
							<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${result.MT_SUB_CODE eq tutor.MT_AREA2_CODE}"> selected="selected"</c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select> 
				</td>
			</tr> 
			<tr>
				<th>최종학력</th>
				<td>
				<select name="mtAcdmcrCode" id="mtAcdmcrCode" title="최종학력">
	                    <c:forEach var="result" items="${mtCodes.AM}" varStatus="status">
							<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${result.MT_SUB_CODE eq tutor.MT_ACDMCR_CODE}"> selected="selected"</c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
						</c:forEach>
	                </select> 
				</td>
				<th scope="row">졸업년월</th>
                <td>
					<input type="text" name="school_out_dt" id="school_out_dt"class="form-control" maxlength="7"  title="졸업년월" placeholder="2014.03" value='<c:out value="${tutor.SCHOOL_OUT_DT}"/>'>
                </td>
			</tr>
			<tr>
				<th>학교</th>
				<td><input type="text" name="schul" id="schul" value="<c:out value="${tutor.SCHUL }"/>"> </td>
				<th>전공</th>
				<td><input type="text" name="major" id="major" value="<c:out value="${tutor.MAJOR }"/>"> </td>
			</tr>
			<tr>
                <th scope="row">현 직장</th>
					<td><input type="text" name="workAfter" id="workAfter" class="form-control" title="현 직장 입력" value="<c:out value="${tutor.WORK_AFTER}"/>"/></td>
				 <th scope="row">입사년월</th>
				    <td><input type="text" name="work_in_dt" id="work_in_dt" class="form-control" title="입사년월 입력" value='<c:out value="${tutor.WORK_IN_DT}"/>'/></td>
            </tr>
            <tr>
                <th scope="row">부서</th>
					<td><input type="text" name="dept_nm" id="dept_nm" class="form-control" title="부서입력" value="<c:out value="${tutor.DEPT_NM}"/>"/></td>
				 <th scope="row">직위</th>
				    <td><input type="text" name="position_nm" id="position_nm" class="form-control" title="직위입력" value='<c:out value="${tutor.POSITION_NM}"/>'/></td>
            </tr>
            <tr>
                <th scope="row">전직장1</th>
					<td><input type="text" name="work_nm2" id="work_nm2" class="form-control" title="현 직장 입력" value="<c:out value="${jobList[0].WORK_NM}"/>"/></td>
				 <th scope="row">부서/직위</th>
				    <td><input type="text" name="dept_info2" id="dept_info2" class="form-control" placeholder="생산/과장" title="부서/직위 입력" value='<c:out value="${jobList[0].DEPT_INFO}"/>'/></td>
            </tr>
            <tr>
                <th scope="row">입사년월</th>
					<td><input type="text" name="work_in_dt2" id="work_in_dt2" maxlength="7" placeholder="2011.03" class="form-control" title="현 직장 입력" value="<c:out value="${jobList[0].WORK_IN_DT}"/>"/></td>
				 <th scope="row">퇴사년월</th>
				    <td><input type="text" name="work_out_dt2" id="work_out_dt2" maxlength="7" placeholder="2014.08" class="form-control" title="전 직장 입력" value='<c:out value="${jobList[0].WORK_OUT_DT}"/>'/></td>
            </tr>
             <tr>
                <th scope="row">전직장2</th>
					<td><input type="text" name="work_nm3" id="work_nm3" class="form-control" title="현 직장 입력" value="<c:out value="${jobList[1].WORK_NM}"/>"/></td>
				 <th scope="row">부서/직위</th>
				    <td><input type="text" name="dept_info3" id="dept_info3" class="form-control" placeholder="영업/대리" title="부서/직위 입력" value='<c:out value="${jobList[1].DEPT_INFO}"/>'/></td>
            </tr>
            <tr>
                <th scope="row">입사년월</th>
					<td><input type="text" name="work_in_dt3" id="work_in_dt3" class="form-control" maxlength="7" placeholder="2002.03" title="현 직장 입력" value="<c:out value="${jobList[1].WORK_IN_DT}"/>"/></td>
				 <th scope="row">퇴사년월</th>
				    <td><input type="text" name="work_out_dt3" id="work_out_dt3" class="form-control" maxlength="7" placeholder="2005.12" title="전 직장 입력" value='<c:out value="${jobList[1].WORK_OUT_DT}"/>'/></td>
            </tr>
            <tr>
				<th>자격증</th>
				<td colspan="3">
					<input type="text" name="crqfc" id="crqfc" value="<c:out value="${tutor.CRQFC }"/>">
				</td>
			</tr>
            
            <tr>
				<th>첨부파일</th>
				<td colspan="3">
					<div class="form-inline">
						<c:choose>
						<c:when test="${not empty fileList}">
						<c:forEach items="${fileList}" var="result" varStatus="status">
	            			<div class="form-group">
	            				<a href="#" onclick="lectFileDown('<c:out value="${result.SAVEFILE}"/>')" class="btn-down">
									<span><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FILE_SIZE}"/>KB)</span>
								</a>
	                        </div>
	          			</c:forEach>
	          			</c:when>
	          			 <c:otherwise>
			               	  첨부파일이 없습니다
						</c:otherwise>
						</c:choose>
					</div>
				</td>
			</tr>
				
	
			<%--  
			<tr>
				<th>회원분류</th>
				<td colspan="3"><c:out value="${tutor.MT_GRADE_NAME}"/></td>
			</tr> --%>
		</tbody>
	</table>

	
	<div class="space"></div><!-- 공백 default 5px -->
	<div class="tb_title"><b>수강 이력</b></div>
		<table class="tb table-type1">
		    <tr class="rndbg">
		        <th>NO</th>
		        <th>구분</th>
		        <th>과정명</th>
		        <th>학습기간</th>
		        <th>이수여부</th>
		    </tr>
		    <colgroup>
		        <col width="10%">
		        <col width="20%">
		        <col width="30%">
		        <col width="30%">
		        <col width="10%">
		    </colgroup>
		
		    <c:if test="${fn:length(courseList) > 0}">
		    <c:forEach var="result" items="${courseList}" varStatus="status">
		    <tr align="center">
		        <td>${status.count}</td>
		        <td><c:out value="${result.SEQ_TITLE}" /></td>
		        <td><c:out value="${result.MT_CTYPE_NAME}"/></td>
		        <td><c:out value="${result.STUDY_SDATE}" /> ~ <c:out value="${result.STUDY_EDATE}" /></td>
		        <td><c:out value="${result.ISPASS eq 'Y' ? '이수' : '미이수'}" /></td>
		    </tr>
		    </c:forEach>
		    </c:if>
		    <c:if test="${fn:length(courseList) == 0}">
		    	<tr align="center">
		    		<td colspan="5" align="center">등록된 데이타가 없습니다.</td>
		    	</tr>
		    </c:if>
	</table>
	
	<div class="space"></div><!-- 공백 default 5px -->
	<div class="tb_title"><b>집합교육 강의이력</b></div>
	<table class="tb table-type1">
	    <tr class="rndbg">
	        <th>No</th>
	        <th>과정구분</th>
	        <th>과정명</th>
	        <th>교육기간</th>
	        <th>교육시간</th>
	        <th>만족도</th>
	    </tr>
	    <colgroup>
	        <col width="5%">
	        <col width="30%">
	        <col width="20%">
	        <col width="15%">
	        <col width="10%">
	        <col width="10%">
	    </colgroup>
	
	    <c:if test="${fn:length(courseOffList) > 0}">
	    <c:forEach var="result" items="${courseOffList}" varStatus="status">
	    <tr align="center">
	        <td>${status.count}</td>
	        <td><c:out value="${result.MT_SC_NAME}"/></td>
	        <td><c:out value="${result.SEQ_TITLE}"/></td>
	        <td>
	        	<c:choose>
	        		<c:when test="${result.OPENTYPE eq 'D'}">
	        			${result.STUDY_SDATE} ~ ${result.STUDY_EDATE} 
	        		</c:when>
	        		<c:otherwise></c:otherwise>
	        	</c:choose>
	        </td>
	        <td></td>
	        <td></td>
	    </tr>
	    </c:forEach>
	    </c:if>
	    <c:if test="${fn:length(courseOffList) == 0}">
	    	<tr align="center">
	    		<td colspan="6" align="center">등록된 데이타가 없습니다.</td>
	    	</tr>
	    </c:if>
	</table>
	
	<div class="space"></div><!-- 공백 default 5px -->
	<div class="tb_title"><b>방문교육 강의이력</b></div>
	<table class="tb table-type1">
	    <tr class="rndbg">
	        <th>No</th>
	        <th>교육장소</th>
	        <th>교육일</th>
	        <th>신청기관</th>
	        <th>참석인원</th>
	        <th>강의료</th>
	        <th>수강생만족도</th>
	    </tr>
	    <colgroup>
	        <col width="5%">
	        <col width="*">
	        <col width="20%">
	        <col width="20%">
	        <col width="7%">
	        <col width="8%">
	        <col width="8%">
	    </colgroup>
	
	    <c:if test="${fn:length(lecList) > 0}">
	    <c:forEach var="result" items="${lecList}" varStatus="status">
	    <tr align="center">
	        <td>${status.count}</td>
	        <td><c:out value="${result.EDU_AREA}" /></td>
	        <td><c:out value="${result.DS_SDATE}"/> ~ <c:out value="${result.DS_EDATE}"/></td>
	        <td>
	        	<c:out value="${result.APPLY_ORGAN_NM}" />
	        </td>
	        <td><c:out value="${result.COM_CNT}"/></td>
	        <td><c:out value="${result.PAY}"/></td>
	        <td><c:out value="${result.APPLY_SCORE}"/></td>
	    </tr>
	    </c:forEach>
	    </c:if>
	    <c:if test="${fn:length(lecList) == 0}">
	    	<tr align="center">
	    		<td colspan="7" align="center">등록된 데이타가 없습니다.</td>
	    	</tr>
	    </c:if>
	</table>
	
	<div class="space"></div><!-- 공백 default 5px -->
	<div class="tb_title"><b>개인 경력</b>
		<span style="float:right;padding-bottom:5px;"><a href="#" onclick="addHisRow(); return false;" class="btn small blue">추가</a></span>
	</div>
	
	<table class="tb table-type1" id="hisTbl">
	    <tr class="rndbg">
	        <th>교육희망 주제</th>
	        <th>교육기간</th>
	        <th>소속</th>
	        <th>교육대상</th>
	        <th>인원</th>
	        <th></th>
	    </tr>
	    <colgroup>
	    	<col width="*">
	        <col width="25%">
	        <col width="20%">
	        <col width="15%">
	        <col width="5%">
	        <col width="10%">
	    </colgroup>
		<tbody>
	    <c:if test="${fn:length(hisList) > 0}">
	    <c:forEach var="result" items="${hisList}" varStatus="status">
	    <tr align="center">
	        <td><input type="text" class="line" style="width:98%" id="thema" name="thema" value="<c:out value="${result.THEMA}"/>"/></td>
	        <td>
	       		<input type="text" class="line datepicker" name="startDt" id="startDt_${status.count}" value="${result.START_DT }" readonly="readonly" style="width: 75px;"/>
				 <a href="#" onclick="$('#startDt_${status.count}').focus(); return false;" class=""><img src="/admin/images/btn_calendar.png" alt="시작일"></a> 
	        ~
	       		<input type="text" class="line datepicker" name="endDt" id="endDt_${status.count}" value="${result.END_DT }" readonly="readonly" style="width: 75px;"/>
				<a href="#" onclick="$('#endDt_${status.count}').focus(); return false;" class=""><img src="/admin/images/btn_calendar.png" alt="시작일"></a>
	        </td>
	        <td><input type="text" class="line" style="width:98%" id="applyOrgan" name="applyOrgan" value="<c:out value="${result.APPLY_ORGAN}"/>"/></td>
	        <td><input type="text" class="line" style="width:98%" id="target" name="target" value="<c:out value="${result.TARGET}"/>"/></td>
	        <td><input type="text" class="line" style="width:98%" id="personCnt" name="personCnt" value="<c:out value="${result.PERSON_CNT}"/>"/></td>
	         <td>
	        	<a href="#" id="saveBtn" val="<c:out value="${result.HISNO}"/>"  class="btn small green">수정</a>
	        	<a href="#" id="delBtn"  val="<c:out value="${result.HISNO}"/>"  class="btn small red">삭제</a>
	        </td>
	    </tr>
	    </c:forEach>
	    </c:if>
	    
	    <c:if test="${fn:length(hisList) == 0}">
	    	<tr class="nonedata">
	    		<td colspan="6" align="center">등록된 데이타가 없습니다.</td>
	    	</tr>
	    </c:if>
	    </tbody>
	</table>
	
	
	
	<div class="button" >
		<a href="#" onclick="goUpdate(); return false;" class="btn big green">수정</a>
		<a href="/admin/tutor/tutorList.do" class="btn big gray">취소</a>
	</div>

</form>
 