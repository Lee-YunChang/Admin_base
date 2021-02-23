<%
/****************************************************
    system	: 과정관리 > 교육과정등록
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

<c:set var="offlineCourse"><%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%></c:set>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">교육과정등록 - 과정메타정보 ${titleMode}<span></span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/courseExec.do" method="POST" onsubmit="writeFormCheck(); return false;" Enctype="multipart/form-data" >
<input type="hidden" name="mt_ctype_code" value="${map.MT_CTYPE_CODE}"/>
<input type="hidden" name="mt_cgrp_code" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_CGRP_DEFAULT_CODE")%>"/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.courseImgPath")%>"/>
<input type="hidden" name="courseno"  id="courseno"  value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>
<input type="hidden" name="class_desk" id="class_desk" value=""/>
<input type="hidden" id="insMtCtypeCode" value="<c:out value="${map.MT_CTYPE_CODE}"/>"/>
<input type="hidden" id="insClassDesk" value="<c:out value="${map.CLASS_DESK}"/>"/>

<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="35%">
        <col class="cellc" width="8%">
        <col class="celll" width="35%">
    </colgroup>
    <tbody>
        <tr>
            <th>* 과정명</th>
            <td colspan="3"><input type="text"  class="line" name="coursetitle" id="coursetitle" value="<c:out value="${map.COURSETITLE}"/>" style="width: 100%"/></td>
        </tr>
        <tr>
            <th>사용여부</th>
            <td colspan="3">
                <input type="radio" name="useyn" value="Y" <c:if test="${map.USEYN eq null || map.USEYN == 'Y'}"> checked="checked"</c:if>>사용&nbsp;&nbsp;&nbsp;
            	<input type="radio" name="useyn" value="N" <c:if test="${map.USEYN eq null || map.USEYN == 'N'}"> checked="checked"</c:if>>사용안함
            </td>        
        </tr>
        <%-- <tr>
            <th>* 과정구분</th>
            <td colspan="3">
                <select name="mt_sc_code" id="mt_sc_code" title="과정구분" style="width: 180px">
                    <option value="">선택</option>
                    <c:forEach var="emap" items="${categoryData1}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${map.MT_SC_CODE == emap.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
					
                </select>
            </td>
        </tr>  --%>           
        <%-- <tr>
            <th>* 과정분류</th>
            <td>
                <select name="mtCgrpCode" id="mtCgrpCode" title="과정분류" style="width: 180px">
                    <option value="">선택</option>
                    <c:forEach var="emap" items="${categoryData1}" varStatus="status1">
						<option value="<c:out value="${emap.MT_SUB_CODE}"/>" <c:if test="${map.MT_CGRP_CODE ne null && emap.MT_SUB_CODE eq map.MT_CGRP_CODE}"> selected="selected"</c:if>><c:out value="${emap.MT_SUB_NAME}"/></option>
					</c:forEach>
					
                </select>
            </td>
        </tr> --%>
        
        <c:if test="${REQUEST_DATA.MT_CTYPE_CODE ne offlineCourse}">
        <tr>
            <th>* 수강료(원)</th>
            <td colspan="3"><input type="text"  class="rlinenumber" name="price"  id="price"  value="<fmt:formatNumber value="${map.PRICE}" pattern="#,###" />"  style="width: 180px"> 원</td>
        </tr>
        </c:if>
        <tr>
            <th>과정설명</th>
            <td colspan="3">
                <textarea rows="5" name="description"  id="description"  style="width:100%;"><c:out value="${map.DESCRIPTION}"/></textarea>
            </td>
        </tr>
        <tr>
            <th>교육대상</th>
            <td colspan="3">
                <textarea rows="5" name="target"  id="target"  style="width:100%;" ><c:out value="${map.TARGET}"/></textarea>
            </td>
        </tr>
        <c:if test="${REQUEST_DATA.MT_CTYPE_CODE ne offlineCourse}">
		<tr>
            <th>평가방법</th>
            <td colspan="3">
                <textarea rows="4" name="completion"  id="completion"  style="width:100%;"><c:out value="${map.COMPLETION}"/></textarea>
            </td>
        </tr>
        <tr>
            <th>수료기준점수</th>
            <td colspan="3">
            	<c:set var="compVal" value="${map.COMP_VAL}"/>
            	<c:if test="${REQUEST_DATA.courseno < 1}"><c:set var="compVal"><%=SangsProperties.getProperty("Globals.defaultCompVal")%></c:set></c:if>
            	<input type="text"  class="rlinenumber" name="compVal" id="compVal" style="width: 180px;" value="${compVal}"/> 점
            </td>
        </tr>
        </c:if>
        <tr>
            <th>문의</th>
            <td colspan="3">
                <textarea rows="4" name="ex_description"  id="ex_description"  style="width:100%;" maxlength="80">${map.EX_DESCRIPTION}</textarea>
                <br/><font class=extext>※ 1600 bytes(한글 80자 제한)</font>
            </td>
        </tr>
        <tr>
            <th>파일업로드</th>
            <td colspan="3" style="padding-top: 10px;padding-bottom: 10px;">
            	<input type="file" name="uploadFile1" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/><br/>
                <input type="file" name="uploadFile2" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7; margin-top:10px;"/><br/>
            </td>
        </tr>
                                                
        <%-- <tr>
            <th>과정개요</th>
            <td colspan="3">
                <textarea rows="5" name="description"  id="description"  style="width:100%;" maxlength="80"><c:out value="${map.DESCRIPTION}"/></textarea>
                <br/><font class=extext>※ 1600 bytes(한글 80자 제한)</font>
            </td>
        </tr>
        <tr>
            <th>학습목표</th>
            <td colspan="3">
                <textarea rows="5" name="subject"  id="subject"  style="width:100%;"><c:out value="${map.SUBJECT}"/></textarea>
            </td>
        </tr>
        <tr>
            <th>학습목차</th>
            <td colspan="3">
                <textarea rows="5" name="progress"  id="progress"  style="width:100%;"><c:out value="${map.PROGRESS}"/></textarea>
            </td>
        </tr>
        <tr>
            <th>과정준비사항</th>
            <td colspan="3">
                <textarea rows="5" name="exDescription"  id="exDescription"  style="width:100%;" ><c:out value="${map.EX_DESCRIPTION}"/></textarea>
            </td>
        </tr> --%>

    </tbody>
</table>

<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title">클래스데스크
<span><font class="extext">(항목 중 반드시 하나 이상 선택해야 하며 총 점수의 합이 100이 되어야 합니다.)</font></span></div>
<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
      <tr class="rndbg">
          <th align="center"> <input type="checkbox" name="desk01" id="desk01" onclick="openText('eval_progress', this.checked);" style="ime-mode:disabled;" />  &nbsp; 온라인수강</th>
          <th align="center"> <input type="checkbox" name="desk02" id="desk02" onclick="openText('eval_attend', this.checked);" style="ime-mode:disabled;" /> &nbsp; 출석</th>
          <th align="center"> <input type="checkbox" name="desk03" id="desk03" onclick="openText('eval_exam_final', this.checked);" style="ime-mode:disabled;" /> &nbsp; 시험</th>
          <th align="center"> <input type="checkbox" name="desk04" id="desk04" onclick="return false;" /> &nbsp; 설문</th>
          <th align="center"> <input type="checkbox" name="desk05" id="desk05" onclick="return false;" /> &nbsp; 공지사항</th>
          <th align="center"> <input type="checkbox" name="desk06" id="desk06" onclick="return false;" /> &nbsp; 자료실</th>
      </tr>
      <colgroup>
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
           <col align=middle width="12%">
      </colgroup>
        <tr>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="eval_progress"  id="eval_progress"  disabled="disabled"  value="<c:out value="${map.EVAL_PROGRESS}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber" name="eval_attend"  id="eval_attend"  disabled="disabled"  value="<c:out value="${map.EVAL_ATTEND}"/>"/> 점</td>
            <td align="center"><input type="text" style="width:70px;" maxlength="3" class="rlinenumber"  name="eval_exam_final" id="eval_exam_final"  disabled="disabled"  value="<c:out value="${map.EVAL_EXAM_FINAL}"/>"/> 점</td>
            <td align="center">-</td>
            <td align="center">-</td>
            <td align="center">-</td>
        </tr>
 </table>

<c:if test="${REQUEST_DATA.MT_CTYPE_CODE ne offlineCourse}"> 
<!-- 맛보기 강의 -->
<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title">맛보기 강의&nbsp;<font class=extext>(30초 이하의 mp4파일을 올려야 합니다.)</font>&nbsp;&nbsp;<input type="checkbox" name="sample_yn"  id="sample_yn">사용</div>
<div>
	&nbsp;&nbsp;맛보기 강의 등록&nbsp;<input type="file" name="sampleMp4" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;">
</div> 
</c:if>

<!-- 수료코드정책 -->
<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title">수료코드정책 <a href="#" class="extext" onclick="javascript:helpPop('/admin/course/course.do?subcmd=com_pop',750,600,1,1); return false;">※  수료정책안내</a></div>
     <table class="table-type1 search_form " border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">
    <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="91%">
    </colgroup>
    <tbody>
        <tr>
            <th>수료명</th>
            <td><input type="text"  name="comp_name_kr" size="60" value="<c:out value="${map.COMP_NAME_KR}"/>"/>  <span style="float:right"><font class=extext> ※ 수료증에 사용되는 명칭</font></span> </td>
        </tr>
        
        <tr>
            <th>수료코드</th>
            <td><input type="text"  name="comp_code" size="60" value="<c:out value="${map.COMP_CODE}"/>"/>  <span style="float:right"><font class=extext>※ 수료 라벨코드</font></span> </td>
        </tr>
    </tbody>
</table>

<%-- 
<!-- 온라인일 경우만 온라인교육 추가정보가 보이게 -->
<div class="space"></div><!-- 공백 default 5px -->
<div class="tb_title"><b>온라인교육 추가정보</b></div>

<div class="space5"></div>
<table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="15%">
        <col class="celll" width="85%">
    </colgroup>
    <tbody>
        <tr>
            <th>학습페이지주소(온라인)</th>
            <td><input type="text"  name="conurl" size="60" value="<c:out value="${map.CONURL}"/>"/>  <FONT class=extext>※ http포함 전체경로 입력</FONT> </td>
        </tr>
        <tr>
            <th>샘플보기주소</th>
            <td><input type="text"  name="previewurl" size="60" value="<c:out value="${map.PREVIEWURL}"/>"/>  <FONT class=extext>※ http포함 전체경로 입력</FONT> </td>
        </tr>
    </tbody>
</table>
<div class="typeCode">

<div class="space"></div><!-- 공백 default 5px -->
<div><b>집합교육 양식</b></div>

<div class="space5"></div>
<table class="table-type1 search_form" >
    <colgroup>
        <col class="cellc" width="3%">
        <col class="celll" width="97%">
    </colgroup>
    <tbody>
        <tr>
            <th colspan="2">집합교육 양식</th>
        </tr>
        <c:choose>
	        <c:when test="${fn:length(categoryData3)> 0}">
		        <c:forEach var="emap3" items="${categoryData3}" varStatus="status3">
		        <tr>
		            <td align="center"><input type="radio" name="typeCode" id="typeCode" value="<c:out value="${emap3.MT_SUB_CODE}"/>" <c:if test="${map.TYPE_CODE == emap3.MT_SUB_CODE}"> checked="checked"</c:if>/></td>
		            <td><c:out value="${emap3.MT_SUB_NAME}"/></td>
		        </tr>
		        </c:forEach>
	       </c:when>
	       <c:otherwise>
	        <tr>
	            <td colspan="2">등록된 양식이 없습니다.</td>
	        </tr>
	       </c:otherwise>
       </c:choose>
    </tbody>
</table>
</div>
 --%>
<div class="button">
	<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}">
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
    </c:when>
    <c:otherwise>
        <a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
    </c:otherwise>
    </c:choose>
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
	    var desk01 = ls_tmp.substring(0, 1);//	콘텐츠관리 선택 여부
	    var desk01Value = f1.eval_progress ;	//	콘텐츠관리 점수
	
	    var desk02 = ls_tmp.substring(1, 2);//	과제 선택 여부
	    var desk02Value = f1.eval_report ;	//	과제 점수
	    var desk03 = ls_tmp.substring(2, 3);//	시험 선택 여부
	
	    var desk03Value = f1.eval_exam_final ;//	최종시험 점수
	
	    var desk04 = ls_tmp.substring(3, 4);//	출석 선택 여부
	    var desk04Value = f1.eval_attend ;	//	출석 점수
	
	    var desk05 = ls_tmp.substring(4, 5);//	설문 선택여부
	    var desk06 = ls_tmp.substring(5, 6);//	공지사항 선택 여부
	    var desk07 = ls_tmp.substring(6, 7);//	자료실 선택 여부
	
	    var desk09 = ls_tmp.substring(7, 8);//	토론 선택 여부
	    var desk09Value = f1.eval_discuss ;	//	토론 점수
	    
	    if(desk01 == 1){					// 콘텐츠관리 선택시 체크박스 checked 출력 및 점수 활성화
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
	
	    if(desk04 == 1){					//과제 선택시 체크박스 checked 출력
	        f1.desk04.checked = true;
	        desk04Value.disabled=false;
	    }
	
	    if(desk05 == 1){					//설문 선택시 체크박스 checked
	        f1.desk05.checked = true;
	    }
	
	    if(desk06 == 1){					//공지사항 선택시 체크박스 checked
	        f1.desk06.checked = true;
	    }
	
	    if(desk07 == 1){					//자료실 선택시 체크박스 checked
	        f1.desk07.checked = true;
	    }
	    
	    if(desk09 == 1){					//토론 선택시 체크박스 checked
	        f1.desk09.checked = true;
	        desk09Value.disabled=false;
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

        //강의형태가 집합과정일경우 양식과 종류 유효성 체크
        
        var mtTypeCode = "<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")%>";
        /*if(mtTypeCode == $("#mtCtypeCode").val()){

        	 if(!$("input[name=typeCode]").is(":checked")){
                alert('집합교육 양식을 선택해주세요');
                $("#typeCode").focus();
                return;
            }
            if(!$("input[name=jibCode]").is(":checked")){
                alert('집합교육 종류를 선택해주세요');
                $("#jibCode").focus();
                return;
            }
        }*/

        /*if(f1.mtCgrpCode.value==''){
            alert('과정분류를 선택해주세요');
            f1.mtCgrpCode.focus();
            return;
        }

        if(f1.mtCtypeCode.value==''){
            alert('강의형태를 선택해주세요');
            f1.mtCtypeCode.focus();
            return;
        }*/


        if(f1.coursetitle.value==''){
            alert('과정명을 입력해주세요');
            f1.coursetitle.focus();
            return;
        }

        /*if(f1.useyn.value==''){
            alert('사용여부를 선택해주세요');
            f1.useyn.focus();
            return;
        }*/

        if(f1.description.value==''){
            alert('과정설명을 입력해주세요.');
            f1.description.focus();
            return;
        }

         /* if(f1.price.value <= 0){
            alert('수강료를 0원 이상으로 입력해주세요.');
            f1.price.focus();
            return;
        }

        if(f1.compVal.value <= 0){
            alert('수료점수를 0점 이상으로 입력해주세요.');
            f1.compVal.focus();
            return;
        }
        */

        // 클래스 데스크 > 콘텐츠관리 체크
        if (f1.desk01.checked == true) {
            desk01 = "1";
            if(desk01Value.value<=0){
                alert('콘텐츠관리 점수를 1점 이상으로 입력해주세요.');
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
                alert('과제 점수를 1점 이상으로 입력해주세요.');
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
         
     	// 클래스 데스크 > 토론 체크
        if (f1.desk09.checked == true) {
        	desk09 = "1";
            if(desk09Value.value==0){
                alert('토론 점수를 1점 이상으로 입력해주세요.');
                return;
            }else{
                calssTotal = calssTotal + parseInt(desk09Value.value) ;
            }
        } else {
            desk09 = "0";
            desk09Value.value=0;				// 미 체크시 점수 초기화
        }
         
        // 클래스 데스크 > 과제 체크
        if (f1.desk04.checked == true) {
            desk04 = "1";
            if(desk04Value.value==0){
                alert('출석 점수를 1점 이상으로 입력해주세요.');
                return;
            }else{
                calssTotal = calssTotal + parseInt(desk04Value.value) ;
            }
        } else {
            desk04 = "0";
            desk04Value.value=0;				// 미 체크시 점수 초기화
        }

        // 클래스 데스크 > 설문 체크
        if (f1.desk05.checked == true) {
            desk05 = "1";
        } else {
            desk05 = "0";
        }

        // 클래스 데스크 > 공지사항 체크
        if (f1.desk06.checked == true) {
            desk06 = "1";
        } else {
            desk06 = "0";
        }

        // 클래스 데스크 > 자료실 체크
        if (f1.desk07.checked == true) {
            desk07 = "1";
        } else {
            desk07 = "0";
        }
         if(calssTotal != 100){
            alert('클래스 데스크의 총점이 100점이어야 합니다.');
             return;
        }
         if(f1.comp_code.value==''){
            alert('수료코드를 입력해주세요.');
            f1.comp_code.focus();
            return;
        }
        classDeskIn = desk01 + desk02 + desk03 + desk04 + desk05 + desk06 + desk07 + desk09;
        f1.class_desk.value = classDeskIn;

        var msg = '${titleMode}';
        if(confirm( msg+ " 하시겠습니까?")){
            //f1.encoding = "multipart/form-data";
            f1.submit();
        }

    }

    //수료코드 안내 팝업
    function helpPop(src,width,height,scrollbars, resize) {
        if ( scrollbars=='' ) scrollbars=1;
        if ( resize=='' ) resize=1;
        window.open(src,'','width='+width+',height='+height+',scrollbars='+scrollbars+',resizable='+resize);
    }
</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	