<%
/****************************************************
system	: 결제관리 > 대상자관리 > 추첨 선정 팝업
title	: 대상자 추천 선정 팝업
summary	:
wdate	: 2015-02-25
writer	: 김학규
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>


<script type="text/javascript">

$(document).ready(function(){
    $("#randomCnt").numeric();

    if("<c:out value="${msg}"/>" !=""){
        alert("<c:out value="${msg}"/>");
    }

    var pmode = "<c:out value="${param.pmode}"/>";

    if(pmode ==  "historyList"){

        $("#courseCnt").attr("disable", true);
        $("#enableCnt").attr("disable", true);
        $("#randomCnt").attr("disable", true);
        $("#randomCnt").attr("readonly", true);

        $(".saveBtn").css("display","none");
    }

    $($("input[name=pmode]")).click(function(){

        //신규추첨
        if($("input[name=pmode]:checked").val() == "randomList"){
            $("#courseCnt").attr("disable", false);
            $("#enableCnt").attr("disable", false);
            $("#randomCnt").attr("disable", false);
            $("#randomCnt").attr("readonly", false);

            $(".saveBtn").css("display","block");
        }
        //히스토리
        if($("input[name=pmode]:checked").val() == "historyList"){
            $("#courseCnt").attr("disable", true);
            $("#enableCnt").attr("disable", true);
            $("#randomCnt").attr("disable", true);
            $("#randomCnt").attr("readonly", true);

            $(".saveBtn").css("display","none");
        }
    });


 // form에서 엔터로 검색시 1페이지로 셋팅하게 한다.
    $(document).keydown(function(e) {
        if(e.keyCode == 13) {
            randomSerch();
        }
    });

});


//대상자 추첨 실행
function randomSearch(){

    var enableCnt = $("#enableCnt").val();
    var randomCnt = $("#randomCnt").val();



    if($("#searchCseqNo").val() == ""){
        alert("과정을 선택해 주세요.");
        return false;
    }

    if(randomCnt == "" && $("input[name=pmode]:checked").val() == "randomList"){
        alert("추첨인원수를 입력해 주세요.");
        return false;
    }
    if(parseInt(enableCnt) < parseInt(randomCnt) && $("input[name=pmode]:checked").val() == "randomList"){
        alert("추첨가인원수 이하의 숫자만 입력할수 있습니다.");
        return false;
    }
    if($("#randomCnt").val() == "" && $("input[name=pmode]:checked").val() == "randomList"){
        alert("추첨 인원을 입력해 주세요.");
        return false;
    }

    $("#listType2").val("LIST");
    $("#pform").submit();
}

//총인원 재세팅
function reloadCnt(arg){
    var cseqNo = arg;

    $(".courseCnt").html($("#courseCnt_"+cseqNo).val());
    $("#courseCnt").val($("#courseCnt_"+cseqNo).val());

    $(".enableCnt").html($("#enableCnt_"+cseqNo).val());
    $("#enableCnt").val($("#enableCnt_"+cseqNo).val());


}

//추첨 목록 저장
function randomListInsert(){

    if(confirm("저장 하시겠습니까?")){
        $("#frm1").submit();
    }

}

//엑셀 다운로드
function excelDown(){
	
    $("#listType2").val("EXCEL");
    $("#pform").submit();

}


//히스토리 초기화
function resetList(){


   if(confirm("내역을 초기화 하시겠습니까?")){
       $("#resetMode").val("Y");
       $("#pform").submit();
   }


}

</script>
<c:set var="resultSize" value="${fn:length(resultList)}"/>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">대상자 추첨<span></span></div>

    <!-- 히스토리 저장용 히든폼 -->
    <form name="frm1" id="frm1" action="/admin/payment/payRandomUserList.do" method="post">
        <input type="hidden" name="listType"  id="listType" value="INSERT"/>
        <input type="hidden" name="insertSize" id="insertSize" value="<c:out value="${resultSize}"/>"/>
        <input type="hidden" name="insertCseqno"  id="insertCseqno" value="<c:out value="${resultList[0].CSEQNO}"/>">
        <c:forEach var="result" items="${resultList}" varStatus="status">
            <input type="hidden" name="NUM"  id="NUM" value="<c:out value="${result.NUM}"/>"/>
            <input type="hidden" name="USERNO"  id="USERNO" value="<c:out value="${result.USERNO}"/>"/>
            <input type="hidden" name="USERID"  id="USERID" value="<c:out value="${result.USERID}"/>"/>
            <input type="hidden" name="CSEQNO"  id="CSEQNO" value="<c:out value="${result.CSEQNO}"/>"/>
            <input type="hidden" name="CUSERNO"  id="CUSERNO" value="<c:out value="${result.CUSERNO}"/>"/>
        </c:forEach>
    </form>

    <!-- 검색용 폼 -->
    <form name="pform" id="pform" action="/admin/payment/payRandomUserList.do" method="post">
      <input type="hidden" name="listType"	id="listType2"	value="LIST"/>
      <input type="hidden" name="resetMode" id="resetMode" value="N"/>
      <input type="hidden" name="cseqno"	id="cseqno"	value="<c:out value="${cseqNo}"/>">
      <input type="hidden" name="totalStr" id="totalStr" value="<c:out value="${totalStr}"/>"/>
      <c:forEach var="result" items="${resultCodeList}" varStatus="status">
        <input type="hidden" name="courseCnt_<c:out value="${result.CSEQNO}"/>" id="courseCnt_<c:out value="${result.CSEQNO}"/>" value="<c:out value="${result.TOTAL}"/>"/>
        <input type="hidden" name="enableCnt_<c:out value="${result.CSEQNO}"/>" id="enableCnt_<c:out value="${result.CSEQNO}"/>" value="<c:out value="${result.ENABLE_CNT}"/>"/>
      </c:forEach>
      <c:forEach var="result" items="${resultList}" varStatus="status">
         <input type="hidden" name="cuserno"  id="cuserno" value="<c:out value="${result.CUSERNO}"/>"/>
      </c:forEach>


      <!-- 본문 > 상단 > 검색영역 시작 -->
      <table class="table-type1 search_form">
        <colgroup>
            <col class="cellc" width="14%">
            <col class="celll" width="14%">
            <col class="cellc" width="12%">
            <col class="celll" width="12%">
            <col class="cellc" width="14%">
            <col class="celll" width="14%">
        </colgroup>
        <tbody>
          <tr>
            <td colspan="6">
                <input type="radio" name="pmode" id="pmode_random"  value="randomList" <c:if test="${param.pmode eq 'randomList' or param.pmode eq null}">checked</c:if>> 신규 추첨&nbsp;<input type="radio" name="pmode" id="pmode_history" value="historyList" <c:if test="${param.pmode eq 'historyList'}">checked</c:if>> 이전 추첨
            </td>
          </tr>
          <tr>
            <th>과정명</th>
            <td colspan="3">
                <select name="searchCseqNo" id="searchCseqNo" title="과정명" onchange="reloadCnt(this.value);">
                <option value="">선택</option>
                <c:forEach var="result" items="${resultCodeList}" varStatus="status">
                    <option value="<c:out value="${result.CSEQNO}" />" <c:if test="${result.CSEQNO eq param.searchCseqNo}">selected</c:if>><c:out value="${result.SEQ_TITLE}"/></option>
                </c:forEach>
                 </select>
             </td>
             <th>초기화</th>
             <td colspan="1"><a href="#" onclick="resetList();" class="btn red">히스토리 초기화</a></a></td>
        </tr>
        <tr>
             <th>접수인원수</th>
             <td>
             <input type="hidden" name="courseCnt" id="courseCnt" value="<c:out value="${param.courseCnt}"/>"/>
             <c:if test="${empty param.courseCnt || param.courseCnt < 1}">
                <span class="courseCnt">0</span>명
             </c:if>
             <c:if test="${param.courseCnt > 0}">
                <span class="courseCnt"><c:out value="${param.courseCnt}"/></span>명
             </c:if>
             </td>

             <th>추첨가능인원수</th>
             <td>
             <input type="hidden" name="enableCnt" id="enableCnt" value="<c:out value="${param.enableCnt}"/>"/>
             <c:if test="${empty enableCnt || enableCnt < 1}">
                <span class="enableCnt">0</span>명
             </c:if>
             <c:if test="${enableCnt > 0}">
                <span class="enableCnt"><c:out value="${enableCnt}"/></span>명
             </c:if>
             </td>
             <th>추첨인원수</th>
             <td>
                <input type="text" class="line" name="randomCnt" id="randomCnt" value="<c:out value="${param.randomCnt}"/>" size="5"/> 명
             </td>
        </tbody>
    </table>
    <div class="button_top"><a href="#" onclick="randomSearch();" id="searchCnt" class="btn search brown" >조회</a></div>
    <!-- 본문 > 상단 > 검색영역 끝 -->

    <table width="100%" class="btn_Group">
        <tbody>
            <tr>
                <td class="pageinfo">조회건수
                    <span class="red">
                   <c:if test="${param.pmode eq 'randomList'}">
                        <c:out value="${fn:length(resultList)}"/>
                   </c:if>
                   <c:if test="${param.pmode eq 'historyList'}">
                        <c:out value="${fn:length(resultList)}"/>
                   </c:if>
                   </span> 건
                </td>
                <td align="right">
                    <a href="#" onclick="excelDown();return false;" id="excelDown"  class="btn down sky">엑셀 다운로드</a>
                </td>
            </tr>
        </tbody>
    </table>

    <table class="table-type1 search_form" >
        <colgroup>
            <col class="cellc" width="20%"><!-- NO -->
            <col class="cellc" width="20%"><!-- 과정신청번호-->
            <col class="cellc" width="20%"><!-- 이름 -->
            <col class="cellc" width="20%"><!-- 아이디 -->
            <c:if test="${param.pmode eq 'historyList'}">
                <col class="cellc" width="20%"><!-- 등록 차수 -->
            </c:if>
        </colgroup>
        <thead>
        <tr>
            <th>NO</th>
            <th>과정신청번호</th>
            <th>아이디</th>
            <th>이름</th>
            <c:if test="${param.pmode eq 'historyList'}">
                <th>등록 차수</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:choose>
        <c:when test="${not empty resultList}">
            <c:forEach var="result" items="${resultList}" varStatus="status" begin="0">
            <tr align=middle>
                <td><c:out value="${status.count}"/></td><!-- NO -->
                <td><c:out value="${result.CUSERNO}" /></td>
                <td><c:out value="${result.USERID}"/></td><!-- 아이디 -->
                <td><c:out value="${result.USERNAME}"/></td><!-- 이름 -->
                <c:if test="${param.pmode eq 'historyList'}">
	                <td><c:out value="${result.SAVE_SEQ}"/></td><!-- 등록차수 -->
	            </c:if>
            </tr>
            </c:forEach>
        </c:when>
            <c:otherwise>
            <tr>
                <td colspan="4" align="center">결과가 없습니다.</td>
            </tr>

            </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <c:choose>
    <c:when test="${not empty resultList}">
        <div class="button_top saveBtn"><a href="#" onclick="randomListInsert();" id="randomListInsert" class="btn search brown" >저장</a></div>
    </c:when>
    </c:choose>
    </form>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>