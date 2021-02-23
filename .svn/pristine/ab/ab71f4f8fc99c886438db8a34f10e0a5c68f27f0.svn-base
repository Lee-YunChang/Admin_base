<%
/****************************************************
    system	: 과정관리 > 과정정보관리
    title	: 교육과정 등록/수정 양식
    summary	:
    wdate	: 2016-04-18
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>

<!-- 본문 > 상단 > 타이틀 -->
<c:if test="${not empty REQUEST_DATA.courseno && REQUEST_DATA.courseno > 0}">
	<c:set var="titleMode" value="수정"/>
	<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%></c:set>
</c:if>
<c:if test="${empty REQUEST_DATA.courseno || REQUEST_DATA.courseno == 0}">
	<c:set var="titleMode" value="등록"/>
	<c:set var="reg"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
	<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
</c:if>
<c:if test="${!empty REQUEST_DATA.pageMode}"><c:set var="pageMode">${REQUEST_DATA.pageMode}</c:set></c:if>
<div class="title title_top">교육과정등록 - 온라인교육 ${titleMode}<span></span></div>

<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/courseExec.do" method="POST" onsubmit="writeFormCheck(); return false;" enctype="multipart/form-data">
<input type="hidden" name="mt_ctype_code" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%>"/>
<input type="hidden" name="mt_cgrp_code" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_CGRP_DEFAULT_CODE")%>"/>
<input type="hidden" name="courseno" value="${pageMode == reg ? '0' : map.COURSENO}"/>
<input type="hidden" name="class_desk" id="class_desk" value=""/>
<input type="hidden" name="del_files" id="del_files" value=""/>
<input type="hidden" name="sample_yn" id="sample_yn" value=""/>

<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>
<input type="hidden" id="count" value="${fn:length(course_Loan_Info)}"/>
<input type="hidden" id="insClassDesk" value=""/>

<input type="hidden" id="imageCnt" value="${fn:length(fileMap)}"/>

<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="35%">
        <col class="cellc" width="8%">
        <col class="celll" width="35%">
    </colgroup>
    <tbody>
        <tr>
        	<th>* 과정구분</th>
            <td colspan="3">
                <select name="mt_sc_code" id="mt_sc_code" title="과정구분" style="width: 300px">
                    <option value="">선택</option>
                    <c:forEach var="emap" items="${course_title}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${map.MT_SC_CODE == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
                </select>
            </td>
        </tr>
          <tr>
            <th>* 대출과목</th>
            <td colspan="3">
            	<div class="addFileWrap">
            		<c:choose>
            			<c:when test="${empty course_Loan_Info}">
            				<select name="edu_loan_seq" id="edu_loan_seq" title="과정구분" style="width: 300px">
			                    <option value="">선택</option>
			                    <c:forEach var="emap" items="${loanList}" varStatus="status1">
										<option value="<c:out value="${emap.EDU_LOAN_SEQ}"/>" ><c:out value="${emap.EDU_LOAN_NAME}"/></option>
								</c:forEach>
			                </select>&nbsp;
			                <a href="#"  onclick="fnAdd();return false" title="추가" class= "btn small blue">추가</a> <br/>
            			</c:when>
            			<c:otherwise>
            				<c:forEach items="${course_Loan_Info}" var="result">
		            			<div class='mainClass'>
			            			<select name="edu_loan_seq" id="edu_loan_seq" title="과정구분" style="width: 300px">
					                    <option value="">선택</option>
					                    <c:forEach var="emap" items="${loanList}" varStatus="status1">
												<option value="<c:out value="${emap.EDU_LOAN_SEQ}"/>" <c:if test="${result.EDU_LOAN_SEQ == emap.EDU_LOAN_SEQ}"> selected="selected"</c:if>><c:out value="${emap.EDU_LOAN_NAME}"/></option>
										</c:forEach>
					                </select>&nbsp;
				                	<a href="#"  onclick="fnAdd();return false" title="추가" class= "btn small blue">추가</a>&nbsp;<a href='#' class='btn small red add_btn_minus'>삭제</a>
				                </div> <br/>
		            		</c:forEach>
            			</c:otherwise>
            		</c:choose>
	            </div>
			</td>
            
        </tr>
        <tr>
            <th>* 과정명</th>
            <td colspan="3"><input type="text"  class="line" name="coursetitle" id="coursetitle" value="${map.COURSETITLE}" style="width: 400px;"/></td>
        </tr>
        <tr>
            <th>* 과정설명</th>
            <td colspan="3">
                <textarea rows="4" name="description"  id="description"  style="width:100%;">${map.DESCRIPTION }</textarea>
            </td>
        </tr>
        <tr>
            <th>교육대상</th>
            <td colspan="3">
            	<input type="text"  class="line" name="target" id="target" value="${map.TARGET }" style="width: 100%"/>
            </td>
        </tr>
        <tr>
            <th>평가방법</th>
            <td colspan="3">
                <textarea rows="4" name="completion"  id="completion"  style="width:100%;">${map.COMPLETION }</textarea>
            </td>
        </tr>
        <tr>
            <th>수료기준점수</th>
            <td colspan="3"><input type="text"  class="rlinenumber" name="comp_val"  id="comp_val"  value="${pageMode == reg ? '0' : map.COMP_VAL }"  style="width: 180px"> 점</td>
        </tr>
        <tr>
            <th>인정시간</th>
            <td colspan="3">
            <input type="text"  class="rlinenumber" name="studytime"  id="studytime"  value="${empty map.STUDYTIME ? '0' : map.STUDYTIME }"  style="width: 70px"> 분
            </td>
        </tr>
        <tr>
            <th>문의</th>
            <td colspan="3">
                <textarea rows="4" name="ex_description"  id="ex_description"  style="width:100%;">${map.EX_DESCRIPTION }</textarea>
            </td>
        </tr>
        <tr>
        	<th>사용여부</th>
            <td colspan="3">
            	<input type="radio" name="useyn" value="Y" <c:if test="${pageMode eq reg}">checked="checked"</c:if><c:if test="${map.USEYN == 'Y'}">checked="checked"</c:if>>사용&nbsp;&nbsp;&nbsp;
            	<input type="radio" name="useyn" value="N" <c:if test="${map.USEYN == 'N'}">checked="checked"</c:if>>사용안함
            </td>
        </tr>
        <!-- 201905 START -->
        <tr>
            <th>* 썸네일</th>
	            <td class="td-input-wrap" colspan="3">
				<c:if test="${not empty fileMap}">
					<c:forEach var="fileList" items="${fileMap}" varStatus="status">
						<div class="file-wrap">
							<input type="hidden" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
								<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>')" class="btn-down">
									<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
								</a>
							<span class="timebtn">
								<a class="scale-down btn red small" onclick="delThumBtn('<c:out value="${fileList.FILE_ID}"/>', '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>','<c:out value="${fileList.COURSENO}"/>');return false" title="삭제">삭제</a>
							</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty fileMap}">
					<input type='file' name='thumbnail' id="thumbnail" style='width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;'/>
				</c:if>
	            </td>
	        </tr>
        <!-- 201905 END -->
    </tbody>
</table>

<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title">클래스데스크
<span><font class="extext">(항목 중 반드시 하나 이상 선택해야 하며 총 점수의 합이 100이 되어야 합니다.)</font></span></div>
<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
      <tr class="rndbg">
          <th align="center"> <input type="checkbox" name="desk01" id="desk01" onclick="openText('eval_progress', this.checked);" style="ime-mode:disabled;" <c:if test="${map.EVAL_PROGRESS != null && map.EVAL_PROGRESS > 0}">checked="checked"</c:if>/>  &nbsp; 온라인학습</th>
          <th align="center"> <input type="checkbox" name="desk02" id="desk02" onclick="openText('eval_attend', this.checked);" style="ime-mode:disabled;" <c:if test="${map.EVAL_ATTEND != null && map.EVAL_ATTEND > 0}">checked="checked"</c:if>/> &nbsp; 출석</th>
          <th align="center"> <input type="checkbox" name="desk03" id="desk03" onclick="openText('eval_exam_final', this.checked);" style="ime-mode:disabled;" <c:if test="${map.EVAL_EXAM_FINAL != null && map.EVAL_EXAM_FINAL > 0}">checked="checked"</c:if>/> &nbsp; 시험</th>
          <th align="center"> <input type="checkbox" name="desk04" id="desk04" onclick="" <c:if test="${fn:substring(map.CLASS_DESK,3,4) == 1}"> checked </c:if> /> &nbsp; 설문</th>
          <th align="center"> <input type="checkbox" name="desk05" id="desk05" onclick="" <c:if test="${fn:substring(map.CLASS_DESK,4,5) == 1 || map.CLASS_DESK == null}"> checked </c:if> /> &nbsp; 공지사항</th>
          <th align="center"> <input type="checkbox" name="desk06" id="desk06" onclick="" <c:if test="${fn:substring(map.CLASS_DESK,5,6) == 1 || map.CLASS_DESK == null}"> checked </c:if> /> &nbsp; 자료실</th>
      </tr>
      <colgroup>
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
      </colgroup>
        <tr>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="eval_progress"  id="eval_progress"  <c:if test="${empty map.EVAL_PROGRESS or map.EVAL_PROGRESS le 0}">disabled="disabled"</c:if> value="${map.EVAL_PROGRESS}"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="eval_attend"  id="eval_attend"  <c:if test="${empty map.EVAL_ATTEND or map.EVAL_ATTEND le 0}">disabled="disabled"</c:if> value="${map.EVAL_ATTEND}"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="eval_exam_final" id="eval_exam_final"  <c:if test="${empty map.EVAL_EXAM_FINAL or map.EVAL_EXAM_FINAL le 0}">disabled="disabled"</c:if> value="${map.EVAL_EXAM_FINAL}"/> 점</td>
            <td align="center">-</td>
            <td align="center">-</td>
            <td align="center">-</td>
        </tr>
 </table>
 
<!-- 맛보기 강의 -->
<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title">맛보기 강의&nbsp;<font class=extext>(30초 이하의 mp4파일을 올려야 합니다.)</font>&nbsp;&nbsp;<input type="checkbox" id="sampleYn" value="" <c:if test="${map.SAMPLMS_LE_YN == 'Y'}">checked="checked"</c:if> />사용</div>
<table class="table-type1 search_form " border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
    <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="85%">
    </colgroup>
    <tbody>
        <%-- <tr>
            <th>맛보기 강의 썸네일 이미지</th>
            <td>
            	<input type="file" name="img1" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;">
            	<font class=extext>&nbsp;(png,gif,jpg등 이미지파일)</font>
            	<c:if test="${!empty map.IMG1}">
	            	<div style="padding-top:10px;">${map.IMG1}&nbsp;&nbsp;삭제&nbsp;<input type="checkbox" name="delImg1" value="Y"/></div>
            	</c:if>
            </td>
        </tr> --%>
        <%-- <tr>
            <th>맛보기 강의 mp4파일</th>
            <td>
            	<input type="file" name="sampleMedia" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;">
            	<c:if test="${!empty map.PREVIEWURL}">
	            	<div style="padding-top:10px;">${map.PREVIEWURL}&nbsp;&nbsp;삭제&nbsp;<input type="checkbox" name="delPreview" value="Y"/></div>
            	</c:if>
            </td>
        </tr> --%>
    </tbody>
</table>
<div class="button">
	<c:if test="${not empty REQUEST_DATA.courseno && REQUEST_DATA.courseno > 0}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
	</c:if>
	<c:if test="${empty REQUEST_DATA.courseno || REQUEST_DATA.courseno == 0}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
	</c:if>
    <a href="#" onclick="history.back()" class="btn big gray">취소</a>
</div>
</form>

<!-- 본문 > 메인 > 목록 끝 -->
<script type="text/javascript">
	//클래스 데스크 설정
	var f1 = document.pform;
	var ls_tmp = $("#insClassDesk").val();
	//alert(ls_tmp);
	
	if(ls_tmp != null) {
		var desk01 = ls_tmp.substring(0, 1);//	온라인 선택 여부
	    var desk01Value = f1.eval_progress ;//	온라인 점수
	
	    var desk02 = ls_tmp.substring(1, 2);//	출석 선택 여부
	    var desk02Value = f1.eval_attend ;	//	출석 점수
	    
	    var desk03 = ls_tmp.substring(2, 3);//	시험 선택 여부
	    var desk03Value = f1.eval_exam_final ;//시험 점수
	
	    var desk04 = ls_tmp.substring(3, 4);//	설문 선택여부
	    var desk05 = ls_tmp.substring(4, 5);//	공지사항 선택여부
	    var desk06 = ls_tmp.substring(5, 6);//	자료실 선택 여부
	    
	    if(desk01 == 1){					// 온라인 선택시 체크박스 checked 출력 및 점수 활성화
	        f1.desk01.checked = true;
	        desk01Value.disabled=false;
	    }
	
	    if(desk02 == 1){					//출석 선택시 체크박스 checked 출력 및 점수 활성화
	        f1.desk02.checked = true;
	        desk02Value.disabled=false;
	    }
	
	    if(desk03 == 1){					//시험 선택시 체크박스 checked 출력 및 점수 활성화
	        f1.desk03.checked = true;
	        desk03Value.disabled=false;
	        
	    }
	
	    if(desk04 == 1){					//설문 선택시 체크박스 checked 출력
	        f1.desk04.checked = true;
	    }
	
	    if(desk05 == 1){					//공지사항 선택시 체크박스 checked
	        f1.desk05.checked = true;
	    }
	
	    if(desk06 == 1){					//자료실 선택시 체크박스 checked
	        f1.desk06.checked = true;
	    }
	}
	
	//페이지 로딩시 집합교육 타입 on/off 여부 정함
    insureSelect( $("#insMtCtypeCode").val() );

    //집합교육 일경우 하단에 타입셀 추가
    function insureSelect(arg) {
        //강의형태 코드값
        var mtTypeCode = "<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%>";

        //집합교육 일경우
        if(mtTypeCode == arg) {
            $(".typeCode").css("display","block");
        }else{
            $(".typeCode").css("display","none");
        }

    }

    //클래스데스크 체크박스 제어
    function openText(v, c){
        var checkId=v;
        var ckChecked=c;
        if(ckChecked==false){
            document.getElementById(checkId).disabled=true;
        }else if(ckChecked==true){
            document.getElementById(checkId).disabled=false;
        }
    }


    //등록
    function writeFormCheck(){
    	var f1 = document.pform;
        var calssTotal = 0;			// 교재, 출석, 시험, 과제 중 체크한 점수의 합이 100 이어야함.
        var classDeskIn="";			// 최종 classDask 값 지정을 위한 변수 선언


        if ($('input[id=sampleYn]').prop('checked')) {
        	f1.sample_yn.value='Y';
        } else {
        	f1.sample_yn.value='N';
        }
        
        if(f1.mt_sc_code.value==''){
            alert('과정구분을 선택해 주세요');
            f1.mt_sc_code.focus();
            return;
        }
        
        if(f1.coursetitle.value==''){
            alert('과정명을 입력해주세요');
            f1.coursetitle.focus();
            return;
        }


        if(f1.description.value==''){
            alert('과정설명을 입력해주세요.');
            f1.description.focus();
            return;
        }
        
        // 201905 썸네일 추가 START
		if( $('input[name="courseno"]').val() == 0) {
        	
	        if(f1.thumbnail.value == ''){
	            alert('썸네일을 첨부해주세요.');
	            f1.thumbnail.focus();
	            return;
	        }
	        
	       		
	        if(f1.thumbnail.value != ''){
	        	
	        	var thumbnail = f1.thumbnail.value;
	        	var thumbnailSub = thumbnail.slice(thumbnail.lastIndexOf(".") + 1).toLowerCase();
	        	
	        	if (!(thumbnailSub == 'gif' || thumbnailSub == 'jpg' || thumbnailSub == 'png' || thumbnailSub == 'bmp')) {
			    	alert("이미지파일 (.jpg, .png, .gif, .bmp) 만 업로드 가능합니다.");
			    	f1.thumbnail.value = '';
			        return false;
			    }
	        }
	        
        } else if( "0" == $('#imageCnt').val() ) {
        	
        	if(f1.thumbnail.value == ''){
	            alert('썸네일을 첨부해주세요.');
	            f1.thumbnail.focus();
	            return;
	        }
	        
	       		
	        if(f1.thumbnail.value != ''){
	        	
	        	var thumbnail = f1.thumbnail.value;
	        	var thumbnailSub = thumbnail.slice(thumbnail.lastIndexOf(".") + 1).toLowerCase();
	        	
	        	if (!(thumbnailSub == 'gif' || thumbnailSub == 'jpg' || thumbnailSub == 'png' || thumbnailSub == 'bmp')) {
			    	alert("이미지파일 (.jpg, .png, .gif, .bmp) 만 업로드 가능합니다.");
			    	f1.thumbnail.value = '';
			        return false;
			    }
	        }
        	
        }
        // 201905 썸네일 추가 END
        

     // 클래스 데스크 > 온라인교재 체크
        if (f1.desk01.checked == true) {
            desk01 = "1";
            if(desk01Value.value<=0){
                alert('온라인학습 점수를 1점 이상으로 입력해주세요.');
                return;
            }else{
                calssTotal = calssTotal + parseInt(desk01Value.value);
            }
        } else {
            desk01 = "0";
            desk01Value.value=0;				// 미 체크시 점수 초기화
        }

        // 클래스 데스크 > 출석 체크
        if (f1.desk02.checked == true) {
            desk02 = "1";
            if(desk02Value.value<=0){
                alert('출석 점수를 1점 이상으로 입력해주세요.');
                return;
            }else{
                calssTotal = calssTotal + parseInt(desk02Value.value);
            }
        } else {
            desk02 = "0";
            desk02Value.value=0;				// 미 체크시 점수 초기화
        }

        var examVal = parseInt(desk03Value.value);
         // 클래스 데스크 > 시험 체크
        if (f1.desk03.checked == true) {
            desk03 = "1";

            if(examVal <= 0){
                alert('시험 점수를 1점 이상으로 입력해주세요.');
                return;
            }else{
                calssTotal = calssTotal + examVal ;
            }
        } else {
            desk03 = "0";
            desk03Value.value=0;				// 미 체크시 점수 초기화

        }
         

        // 클래스 데스크 > 설문 체크
        if (f1.desk04.checked == true) {
            desk04 = "1";
        } else {
            desk04 = "0";
        }

        // 클래스 데스크 > 공지사항 체크
        if (f1.desk05.checked == true) {
            desk05 = "1";
        } else {
            desk05 = "0";
        }

        // 클래스 데스크 > 자료실 체크
        if (f1.desk06.checked == true) {
            desk06 = "1";
        } else {
            desk06 = "0";
        }
         if(calssTotal != 100){
            alert('클래스 데스크의 총점이 100점이어야 합니다.');
             return;
        }
         
        if(calssTotal != 100){
            alert('클래스 데스크의 총점이 100점이어야 합니다.');
             return;
        }
        
        if($('#edu_loan_seq').val()==''){
        	$('#edu_loan_seq').empty();
        }
        /* if(f1.comp_code.value==''){
            alert('수료코드를 입력해주세요.');
            f1.comp_code.focus();
            return;
        } */
        classDeskIn = desk01 + desk02 + desk03 + desk04 + desk05 + desk06;
        f1.class_desk.value = classDeskIn;

        var msg = '${titleMode}';
        if(confirm( msg+ " 하시겠습니까?")){
            //f1.encoding = "multipart/form-data";
            if ($('input[name=chk_del_file]:checked').length > 0) {
            	var delArr = [];
            	$('input[name=chk_del_file]:checked').each(function(){
            		delArr.push($(this).val());
            		f1.del_files.value = delArr.join(',');
            	});
            }
            f1.submit();
        }

    }

    //수료코드 안내 팝업
    function helpPop(src,width,height,scrollbars, resize) {
        if ( scrollbars=='' ) scrollbars=1;
        if ( resize=='' ) resize=1;
        window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars+',resizable='+resize);
    }
    
    var delcnt = 1;
	var cnt = 1;
	
	function fnAdd() {
		cnt = $("#count").val();
		if (cnt > 8) {
			alert('9개까지 등록 가능합니다.');
			return;
		}
		cnt++;
		$("#count").val(cnt);
		delcnt ++;
		var str = '';
			str = str + "<div class='mainClass'>";
		    str = str + "<select name='edu_loan_seq' id='edu_loan_seq' title='과정구분' style='width: 300px'>";
		    str = str + "<option value=''>선택</option>";
		    str = str + "<c:forEach var='emap' items='${loanList}' varStatus='status1'>";
			str = str + "<option value='<c:out value='${emap.EDU_LOAN_SEQ}'/>'><c:out value='${emap.EDU_LOAN_NAME}'/></option>";
			str = str + "</c:forEach>";
			str = str + "</select> &nbsp;";
	       	
	       	str = str + "<a href='#' onclick='fnAdd();return false' title='추가' class='btn small blue'>추가</a>&nbsp;";
			
	       	str = str + "<a href='#' class='btn small red add_btn_minus'>삭제</a><br/></div>";         
		    
		 $('.addFileWrap').append(str);   
	} 
	
	$(document).on('click', '.add_btn_minus', function(e){
		e.preventDefault();
		var cnt = $("#count").val();
		
		cnt -= 1;
		
		$("#count").val(cnt);
		
		$(this).parents('.mainClass').remove();
		
	});
	
	
    // 썸네일 삭제
	function delThumBtn(fileId, savePath, saveFile, courseNo) {
		
		var fileId = fileId;
		var savePath = savePath;
		var saveFile = saveFile;
		var courseNo = courseNo;
		var ajaxChk='Y';
		
		if(fileId != ''){
			if(confirm("등록된 썸네일을 삭제하시겠습니까?")){
		        $.ajax({
		            url : "/admin/course/deleteThumbnailAjax.do",
		            data : {fileId : fileId, savePath : savePath , saveFile : saveFile, courseNo : courseNo, ajaxChk : ajaxChk},
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
	
</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	