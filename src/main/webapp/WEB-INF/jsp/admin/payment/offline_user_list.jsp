<%
/****************************************************
    system	: 결제관리 > 대상자관리 > 대상자선정 팝업
    title	: 대상자선정 팝업
    summary	:
    wdate	: 2016-05-12
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">

var isPayApprovalGroup = '${REQUEST_DATA.isPayApprovalGroup}';

$(document).ready(function() {

    $("#isall").click(function() {
        // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
        if($(this).is(':checked')) {
            $("input[name=cuserno]").attr('checked','checked');
          } else {
              $("input[name=cuserno]").prop("checked", false);
          }
    });

    $("table input[type=checkbox]").change(function(){
        var checked_user_cnt = $('table tbody input[type=checkbox]:checked').length;
        $('#checked_user').text(checked_user_cnt);
    });

    if (isPayApprovalGroup == 'Y') {
        opener.location.reload();
    }

});

$(window).unload(function(){
    //opener.location.reload();
});

//검색
function list_page(){
    var frm = document.pform;
    $("#pform").attr("action", "/admin/payment/payUserList.do");
    $("input[name=listType]").val("LIST");
    frm.cPage.value = 1;
    frm.submit();
}


//페이징
function move_page(cPage){
    var frm = document.pform;
    frm.cPage.value = cPage;
    $("#pform").attr("action", "/admin/payment/payUserList.do");
    $("input[name=listType]").val("LIST");
    frm.submit();
}

//선착순선발
function goGroupExec(){
    var selectCnt = $('#selectCnt').val();
    if (selectCnt > 0 && confirm(selectCnt + '명의 인원을 신청일 빠른순으로\n선착순 설발 하시겠습니까?')) {

        var frm = document.pform;
        $("#pform").attr("action", "/admin/payment/payApprovalGroup.do");
        frm.submit();
    }
}

//일괄 승인
function goExec(targetYn) {
    //var form =document.pform;
    var chk = $("input:checkbox[name=cuserno]:checked");
    var chklen = $("input:checkbox[name=cuserno]:checked").length;

    if(chklen < 1 ){
        alert('대상자를 선택해주세요.');
        return ;
    }
    var chkVal="";
    for (var i=0; i< chklen; i++){
        if (chk[i].checked){
               var checkValue = chk[i].value;
              chkVal = chkVal +checkValue+ ",";
         }
     }
    chkVal = chkVal.substr(0, chkVal.length-1);
    //alert(chkVal);

    var msg = '';
    if(targetYn == 'Y') msg = '대상자로 등록 하시겠습니까?';
    else msg = '대상자를 취소 하시겠습니까?';

    if(confirm(msg)){
        $.ajax({
            url : "/admin/payment/payApproval.do",
            data : {subcmd:"approval", chk:chkVal, targetYn:targetYn, cseqno:$("#cseqno").val()},
            dataType : "json",
            type : 'get',
            async: "false",
            success : function(result) {
                if(result == true) {

                    //alert("승인되었습니다.");
                    //form.subcmd.value = 'user_list';
                    //form.submit();

                    var remsg = "";
                    if(targetYn == 'Y') remsg = '등록되었습니다.';
                    else remsg = '취소되었습니다.';
                    alert(remsg);

                    opener.location.reload(); //부모창 새로고침
                    location.reload();
                    //window.close();

                }

                else alert('실패하였습니다. 다시 시도해주세요.');
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });
    }
}

function goExcel(){
    $("input[name=listType]").val("EXCEL");
    $("#pform").attr("action", "/admin/payment/excelList.do").submit();
}

//파일다운로드
function filedown(cuserno,fileId){
    
	$('#fileId').val(fileId);
    $('#filecuserno').val(cuserno);
    $("#pform").attr("target", "_self");
    $("#pform").attr("action", "/admin/payment/filedown.do");
    
    $("#pform").submit();

    //$('form[name=pform]').attr('action', '/admin/payment/filedown.do').submit();
}

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">대상자선정<span></span></div>
    <form name="pform" id="pform" action="/admin/payment/payUserList.do" method="post">
    <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
    <input type="hidden" name="cseqno" id="cseqno"	value="<c:out value="${REQUEST_DATA.cseqno}"/>">
    <input type="hidden" name="listType" id="listType" value="LIST"/>

      <!-- 본문 > 상단 > 검색영역 시작 -->
      <table class="table-type1 search_form">
        <colgroup>
            <col class="cellc" width="8%">
            <col class="celll" width="92%">
        </colgroup>
        <tbody>
          <tr>
            <th>선정여부</th>
            <td>
                <input type="radio" name="targetYn" id="targetYn" value="" <c:if test="${empty REQUEST_DATA.targetYn}"> checked="checked"</c:if>> &nbsp;전체&nbsp;&nbsp;
                <input type="radio" name="targetYn" id="targetYn" value="Y" <c:if test="${REQUEST_DATA.targetYn == 'Y'}"> checked="checked"</c:if>> 선정&nbsp;&nbsp;
                <input type="radio" name="targetYn" id="targetYn" value="N" <c:if test="${REQUEST_DATA.targetYn == 'N'}"> checked="checked"</c:if>> 미선정
                <%-- <select name="targetYn" id="targetYn" title="선정여부">
                <option value=""> 전체 </option>
                <option value="Y" <c:if test="${REQUEST_DATA.targetYn == 'Y'}"> selected="selected"</c:if>>Y</option>
                <option value="N" <c:if test="${REQUEST_DATA.targetYn == 'N'}"> selected="selected"</c:if>>N</option>
                </select> --%>
             </td>

            <%-- <th>성별</th>
            <td>
                <input type="radio" name="sex" id="sex" value="" <c:if test="${empty REQUEST_DATA.sex}"> checked="checked"</c:if>> &nbsp;전체&nbsp;&nbsp;
                <input type="radio" name="sex" id="sex" value="M" <c:if test="${REQUEST_DATA.sex == 'M'}"> checked="checked"</c:if>> 남&nbsp;&nbsp;
                <input type="radio" name="sex" id="sex" value="F" <c:if test="${REQUEST_DATA.sex == 'F'}"> checked="checked"</c:if>> 여
             </td> --%>
        </tr>
        <tr>
            <th>검색</th>
            <td>
                 <select name="searchMode" id="searchMode" title="검색">
                     <option <c:if test="${REQUEST_DATA.searchMode == 'userName'}"> selected="selected"</c:if> value="userName">이름</option>
                     <option <c:if test="${REQUEST_DATA.searchMode == 'userId'}"> selected="selected"</c:if> value="userId">아이디</option>
                     <option <c:if test="${REQUEST_DATA.searchMode == 'userMobile'}"> selected="selected"</c:if> value="userMobile">핸드폰번호</option>
                     <%-- <option <c:if test="${REQUEST_DATA.searchMode == 'comName'}"> selected="selected"</c:if> value="comName">소속</option>
                     <option <c:if test="${REQUEST_DATA.searchMode == 'bizno'}"> selected="selected"</c:if> value="bizno">사업자번호</option> --%>

                 </select>
                 <input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="if(event.keyCode == 13)list_page();"/>
             </td>

        </tr>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">조회</a></div>
    <!-- 본문 > 상단 > 검색영역 끝 -->

    <table width="100%" class="btn_Group">
        <tbody>
              <tr>
                   <td class="pageinfo">
                           조회건수 <fmt:formatNumber value="${totalCnt}" groupingUsed="true" /></span> 건
                           &nbsp;&nbsp;&nbsp;
                           선택 <span class="red" id="checked_user">0</span> 명
                       </td>
                   <td align="right">
                    <!-- <span>
                        <input type="text" class="line" id="selectCnt" name="selectCnt" style="width:100px;" value="" />
                        <a href="#" onclick="goGroupExec()" class="btn green">선착순선발</a>
                    </span> -->
                    <a href="#" onclick="goExcel();return false;" class="btn down sky">엑셀 다운로드</a>
                 </td>
              </tr>
         </tbody>
    </table>

    <table class="table-type1" >
        <colgroup>

            <col class="cellc" width="5%"><!-- 체크박스 -->
            <col class="cellc" width="5%"><!-- NO -->
            <col class="cellc" width="10%">
            <col class="cellc" width="10%">
            <col class="cellc" width="10%">
            <col class="cellc" width="8%">
            <col class="cellc" width="*">
            <col class="cellc" width="10%">
            <col class="cellc" width="14%">
            <col class="cellc" width="8%">
            <!-- <col class="cellc" width="5%"> -->
        </colgroup>
        <thead>
        <tr>
            <th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"/></th>
            <th>NO</th>
            <th>회원분류</th>
            <th>소속</th>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>휴대폰번호</th>
            <th>신청일시</th>
            <th>선정여부</th>
            <!-- <th>파일첨부</th> -->
        </tr>
        </thead>
        <tbody>
            <c:forEach var="result" items="${resultList}" varStatus="status">
            <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
                <td><input type="checkbox" name="cuserno" id="cuserno" value="${result.CUSERNO}"/></td><!-- 과정신청번호 -->
                <td><c:out value="${totalCnt - status.count+1}"/></td><!-- NO -->
                <td><c:out value="${result.MT_GRADE_NAME}"/></td>
                <td><c:out value="${result.COMNAME}"/></td>
                <td><c:out value="${result.USERID}"/></td><!-- 아이디 -->
                <td><c:out value="${result.USERNAME}"/></td><!-- 이름 -->
                <td><c:out value="${result.EMAIL}"/></td>
                <td><c:out value="${result.MOBLPHON}"/></td><!-- 과정신청번호 -->
                <td><c:out value="${result.F_WDATE}"/></td>
                <td><c:out value="${result.TARGETYNKOR}"/></td>
                <%-- <td>
	                 <input type="hidden" id="filecuserno" name="filecuserno" value=""/>
	                <input type="hidden" name="fileId" id="fileId" value=""/>
	                <a href="#" onclick="filedown('<c:out value="${result.CUSERNO }"/>','<c:out value="${result.FILE_ID}"/>')" class="btn-down">
	                    <span><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FILE_SIZE}"/>KB)</span>
	                </a>
                </td>  --%>         
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </form>
    <br/>
    <div class="button" style="text-align:center;" >
        <a href="#" onclick="goExec('Y');" class="btn blue big" style="margin:5px; 10px;">대상자선정</a>
        <a href="#" onclick="goExec('N');" class="btn red big" style="margin:5px; 10px;">대상자취소</a>
        <a href="#" onclick="window.close()" class="btn gray big" style="margin:5px; 10px; padding-left: 30px; padding-right: 30px;">닫기</a>
    </div>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>