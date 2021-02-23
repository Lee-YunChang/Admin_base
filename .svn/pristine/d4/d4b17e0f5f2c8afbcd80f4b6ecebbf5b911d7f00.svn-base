<%
/****************************************************
    system	: 회원관리 > 기업정보관리
    title	: 기업정보관리 등록폼
    summary	:
    wdate	: 2016-03-28
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

    // 날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
    var dateFormat={
        dayNamesMin:['일','월','화','수','목','금','토'],
        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        showMonthAfterYear: true, //연월 순서로 보여줌
        changeMonth: true, //월을 셀렉트박스로 표현
        changeYear: true, //년을 셀렉트박스로 표현
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        yearRange: "1940:2020"
    };

    $(document).ready(function(){
        $("#comRegDate").datepicker(dateFormat);

        // 숫자만 입력가능
        $("input:text[numberOnly]").live("keyup", function() {
            $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
        });

        // 사업자번호 잘라서 넣기
        var bizno = $("#bizno").val();
        /* $("#bizno1").val(bizno.split("-")[0]);
        $("#bizno2").val(bizno.split("-")[1]);
        $("#bizno3").val(bizno.split("-")[2]); */

        if($("#empInfo").val() == '') {
            $("#empBox").show();
            $("#empInfoBox").hide();
        } else {
            $("#empBox").hide();
            $("#empInfoBox").show();
        }
    });


// 등록및수정
function go_exec(qu){
    var form =document.pform;
    if($.trim($("#comname").val()).length < 1){
        alert('회사명을 입력해주세요.');
        $("#comname").focus();
        return;
    }
    var msg = $(".button a").eq(0).text();

    if(qu == 'delete') {
        msg = '해당 소속에 가입되어있는 회원정보 및 수강정보가 삭제됩니다.\ 삭제';
        $("#useAt").val("N");
    }else if('delete'){
        $("#useAt").val("Y");
    }


    if(confirm( msg+ ' 하시겠습니까?')){

        form.empEmail.value = form.email1.value + '@' + form.email2.value;

        $("#form").attr("action", "/admin/user/companyExec.do");
        form.qu.value = qu;
        form.submit();
    }
}

//우편번호찾기
function zipSearch(){
    window.open("/admin/common/postEtc.do","post_pop", "width=600,height=450, scrollbars=YES");
}

// 소속회원정보
function userInfoSearch(comno){

    window.open("/admin/user/companyUserSearchList.do?comno="+comno, "comNameSearch", "width=670, height=620, scrollbars=yes");
}

//우편번호 호출 (postcode 에서 zipPost 함수를 호출해서 가져옴)
function zipPost(postcode,addr){
    document.pform.zip01.value = postcode.substr(0,3);
    document.pform.zip02.value = postcode.substr(4,3);
    document.pform.addr01.value = addr;
}

//우편번호 콜백 스크립트
function fnZipCodePopupCallBack(data){
     var zipCodes = data.zip_code.split('-');
     //$('#zip01').val(zipCodes[0]);
     //$('#zip02').val(zipCodes[1]);
     $('#zip').val(data.zip_code);
     $('#addr01').val(data.adres);
     $('#addr02').focus();
}

//기업담당자 삭제
function fnEmpDel(comno, userid, userNo) {
    if(confirm('기업담당자를 삭제 하시겠습니까?\n삭제완료는 수정버튼을 누르셔야 삭제됩니다.')){
        $("#userNo").val('');
        $("#emp").val('');
        $("#empInfo").val('');
        $("#empBox").show();
        $("#empInfoBox").hide();
    }
}

function biznoClear() {
    $('#duplBiznoFlag').val('');
    $("#biznoMsg").text('');
}

//이메일 셀렉트박스 세팅
function emailSelect(val){
    $('#email2').val(val);
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">기업정보등록/수정<span> </span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="form" action="/admin/user/companyForm.do" method="post">
<%-- <input type="hidden" name="bizno" id="bizno" value="<c:out value="${comInfo.BIZNO}"/>"/> --%>
<input type="hidden" name="comno" id="comno" value="<c:out value="${comInfo.COMNO}"/>"/>
<input type="hidden" name="qu" id="qu" value=""/>
<input type="hidden" name="duplBiznoFlag" id="duplBiznoFlag" value="Y" />
<input type="hidden" name="empEmail" id="empEmail" value="Y" />
<input type="hidden" name="useAt" id="useAt" value="Y" />

<div class="space5"></div><!-- 공백5 -->
    <table class="table-type1 search_form">
          <colgroup>
                <col class="cellc" width="15%">
                <col class="celll" width="35%">
                <col class="cellc" width="15%">
                <col class="celll" width="35%">
        </colgroup>

        <tbody>
            <tr>
                <th>* 기관/단체명</th>
                <td>
                    <input type="text" class="line" id="comname" name="comname" value="<c:out value="${comInfo.COMNAME}"/>" style="width:97%"/>
                </td>
                <th>* 소속구분</th>
                <td>
                    <input type="radio" id="comRegGb" name="comRegGb" value="1" <c:if test="${comInfo.COM_REG_GB eq '1' || comInfo.COM_REG_GB == null}"> checked="checked" </c:if> /> 공공기관 &nbsp;
                    <input type="radio" id="comRegGb" name="comRegGb" value="2" <c:if test="${comInfo.COM_REG_GB eq '2'}"> checked="checked" </c:if>/> 단체
                </td>
            </tr>
            <tr>
                <th>사업자번호</th>
                <td colspan="3">
                    <input type="text" class="line" id="bizno" name="bizno" value="<c:out value="${comInfo.BIZNO}"/>" style="width:45%" maxlength="20"/>

                </td>
            </tr>
            <tr>
                <th rowspan="2">사업장소재지</th>
                <td colspan="3">
                    <c:set var="zip" value="${comInfo.ZIP}"/>
                    <input type="text" class="line" id="zip" name="zip" value="<c:out value="${zip}"/>" style="width:70px;"/>&nbsp;
                    <a href="#" onclick="zipSearch();" class= "btn gray small">우편번호검색</a>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="text" class="line" id="addr01" name="addr01" value="<c:out value="${comInfo.ADDR01}"/>" style="width:45%"/>&nbsp;&nbsp;
                    <input type="text" class="line" id="addr02" name="addr02" value="<c:out value="${comInfo.ADDR02}"/>" style="width:45%"/>
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="line" id="tel" name="tel" value="<c:out value="${comInfo.TEL}"/>"/>&nbsp;<font class="extext"> ex) 02-1234-1234</font></td>
                <th>팩스번호</th>
                <td><input type="text" class="line" id="fax" name="fax" value="<c:out value="${comInfo.FAX}"/>"/></td>
            </tr>
            <tr>
                <th>담당자이름</th>
                <td>
                    <input type="text" class="line" id="empNm" name="empNm" value="<c:out value="${comInfo.EMP_NM}"/>"/>
                </td>
                <th>담당자ID</th>
                <td>
                    <input type="text" class="line" id="empId" name="empId" value="<c:out value="${comInfo.EMP_ID}"/>"/>
                </td>
            </tr>
            <tr>
                <th>담당자연락처</th>
                <td><input type="text" class="line" id="empTel" name="empTel" value="<c:out value="${comInfo.EMP_TEL}"/>"/>&nbsp;<font class="extext"> ex) 010-1234-1234</font></td>
                <th>담당자이메일 </th>
                <td>
                    <input type="text" id="email1" name="email1" title="이메일 아이디" style="width: 90px;" value="<c:out value="${comInfo.EMP_EMAIL1}"/>"/> @ <input type="text" id="email2" name="email2" title="이메일주소 뒷부분" value="<c:out value="${comInfo.EMP_EMAIL2}"/>" style="width: 90px;" />
                    <select id="email3" name="email3"  onchange="javascript:emailSelect(this.value);return false;" title="이메일주소 선택" style="width:90px;" >
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                    </select>
                </td>
            </tr>
            <c:if test="${comInfo.COMNO != null}">
            <tr>
                <th>소속회원정보 </th>
                <td colspan="3">
                    <a href="#" onclick="userInfoSearch('<c:out value="${comInfo.COMNO}"/>');return false;" class= "btn gray small"/>소속회원정보</a>
                </td>
            </tr>
            </c:if>
        </tbody>
    </table>

    <div class="button" >
        <c:choose>
        <c:when test="${comInfo.COMNO ne null}">
            <a href="#" onclick="go_exec('update'); return false;" class="btn big green">수정</a>
            <a href="#" onclick="go_exec('delete'); return false;" class="btn big red">삭제</a>
        </c:when>
        <c:otherwise>
            <a href="#" onclick="go_exec('insert'); return false;" class="btn big blue">등록</a>
        </c:otherwise>
        </c:choose>
        <a href="/admin/user/companyList.do" class="btn big gray">취소</a>
    </div>

</form>
