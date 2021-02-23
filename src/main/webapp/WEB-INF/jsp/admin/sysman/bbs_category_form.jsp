<%
/****************************************************
    system  : 시스템관리 > 게시판코드 관리
    title   : 게시판코드 코드 상세정보 조회
    summary :
    wdate   : 2015-05-31
    writer  : SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />
<c:if test="${pageMode eq pageModeReg}">
<c:set var="titleMode" value="등록" />
</c:if>
<c:if test="${pageMode ne pageModeReg}">
<c:set var="titleMode" value="수정" />
</c:if>


<script type="text/javascript">

$(document).ready(function(){

    // 수정 시 게시판 구분 코드 막기
    if($("#qu").val() == 'update') {
        $('#rootCateNo').attr('disabled', true);
    }
});

// 등록 및 수정 실행
function writeFormCheck(){
     var qu=$("#qu").val();

     var mode = $("#mode").val();

    // 대분류 등록/수정
     if(mode=='bbs'){
         if (qu == 'insert' && $("#cateName").val() == '') {
             alert("게시판명을 입력하세요.");
             ("#cateName").focus();
             return;
         }
         if (qu == 'update' && $("#cateName").val() == '') {
             alert("게시판명을 입력하세요.");
             ("#cateName").focus();
             return;
         }

         var msg = "";

         if (confirm("저장 하시겠습니까?")){
             $("#writeform").submit();
         }

     }
}

//취소
function cancel(){
    var form = document.writeform;
    var mode=form.mode.value;

    if(mode=='bbs'){
        form.subcmd.value="list";
        $("#writeform").attr("action", '/admin/sysman/bbscateList.do');
    }else{
        form.subcmd.value="sub_list";
        $("#writeform").attr("action", '/admin/sysman/bbscateSubList.do');
    }
    $("#writeform").submit();
}

//삭제
function go_delete(bCateNo){
    if(confirm("삭제 하시겠습니까?")){
        $.ajax({
            url : "/admin/sysman/bbscateDelete.do",
            data : {bCateNo:bCateNo},
            dataType : "json",
            type : 'post',
            async: "true",
            success : function(result) {
                if(result < 1) {
                    alert("삭제 되었습니다.");
                    $("#writeform").attr("action",'/admin/sysman/bbscateList.do');
                    $("#writeform").submit();
                }
                else {
                    alert("먼저 세부 카테고리를 삭제해주세요.");
                    return;
                }
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });
    }
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"> 게시판코드 등록 <span> 게시판에 사용되는 게시판 코드를 관리합니다.</span></div>


<!-- 본문 > 메인 > 목록 시작  -->
    <form name="writeform" id="writeform" action="/admin/sysman/bbscateFormExec.do" method="post">
        <input type="hidden" name="mode" id="mode" value="<c:out value="${REQUEST_DATA.mode}" />"/>
        <input type="hidden" name="qu" id="qu" value="<c:out value="${REQUEST_DATA.qu}" />"/>
        <input type="hidden" name="bbsType" id="bbsType" value="<c:out value="${REQUEST_DATA.BBSTYPE}" />"/>
        <input type="hidden" name="isPop" id="isPop" value="<c:out value="${REQUEST_DATA.ISPOP}" />"/>
        <input type="hidden" name="bCateNo" id="bCateNo" value="<c:out value="${REQUEST_DATA.bCateNo}" />"/>
        <!-- 대분류  등록/수정 -->

        <c:if test="${REQUEST_DATA.mode eq 'bbs'}">
            <table class="table-type1 search_form">
                <colgroup>
                    <col class="cellc" width="10%">
                    <col class="celll" widt="40%">
                    <col class="cellc" width="10%">
                    <col class="celll" width="40%">
                </colgroup>
                <tbody>
                    <tr>
                        <th>게시판명</th>
                        <td colspan="3">
                            <input type="text" name="cateName" id="cateName"  class="line" value="<c:out value="${VIEW_DATA.BCATENAME}" />" style="width: 30%;"/>
                        </td>
                    </tr>
                    <tr>
                        <th>사용여부</th>
                        <td colspan="3">
                            <select name="isUse">
                                <option value="Y" <c:if test="${VIEW_DATA.ISUSE eq 'Y'}">selected</c:if>>Y</option>
                                <option value="N" <c:if test="${VIEW_DATA.ISUSE eq 'N'}">selected</c:if>>N</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>답글여부</th>
                        <td>
                            <select name="isAnswer">
                                <option value="Y" <c:if test="${VIEW_DATA.ISANSWER eq 'Y'}">selected</c:if>>Y</option>
                                <option value="N" <c:if test="${VIEW_DATA.ISANSWER eq 'N'}">selected</c:if>>N</option>
                            </select>
                        </td>
                        <th>TOP여부</th>
                        <td>
                            <select name="isTop">
                                <option value="Y" <c:if test="${VIEW_DATA.ISTOP eq 'Y'}">selected</c:if>>Y</option>
                                <option value="N" <c:if test="${VIEW_DATA.ISTOP eq 'N'}">selected</c:if>>N</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>쓰기권한여부</th>
                        <td>
                             <select name="inType">
                                <option value="ADM" <c:if test="${VIEW_DATA.INTYPE eq 'ADM'}">selected</c:if>>ADM</option>
                                <option value="USR" <c:if test="${VIEW_DATA.INTYPE eq 'USR'}">selected</c:if>>USR</option>
                                <option value="ALL" <c:if test="${VIEW_DATA.INTYPE eq 'ALL'}">selected</c:if>>ALL</option>
                            </select>
                        </td>
                        <th>파일업로드개수</th>
                        <td>
                             <select name=fileCnt>
                                <option value="1" <c:if test="${VIEW_DATA.FILE_CNT eq '1'}">selected</c:if>>1</option>
                                <option value="2" <c:if test="${VIEW_DATA.FILE_CNT eq '2'}">selected</c:if>>2</option>
                            </select>
                            (100,000,000byte 까지만 가능)
                        </td>
                    </tr>
                </tbody>
            </table>
        </c:if>

        <div class="button_top" style="text-align: right;">
                <c:if test="${REQUEST_DATA.qu eq 'insert'}">
                    <a onclick="writeFormCheck();return false;" href="#" class="btn blue big">등록</a>
                </c:if>
                <c:if test="${REQUEST_DATA.qu ne 'insert'}">
                    <a onclick="writeFormCheck();return false;" href="#" class="btn green big">수정</a>
                    <a onclick="go_delete('<c:out value="${REQUEST_DATA.bCateNo}" />');return false;" href="#" class="btn red big">삭제</a>
                </c:if>
            <a href="javascript:window.history.back();" class="btn orange big">목록</a>
        </div>
    </form>

<!-- 본문 > 메인 > 목록 끝 -->