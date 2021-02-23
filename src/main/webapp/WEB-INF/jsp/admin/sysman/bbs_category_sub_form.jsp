<%
/****************************************************
    system  : 시스템관리 > 게시판코드  상세 목록 관리
    title   : 게시판코드 코드  상세 목록 조회
    summary :
    wdate   : 2016-06-01
    writer  : SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">

    // 등록 및 수정 실행
    function writeFormCheck(){
    	
    	
         if ($("#cateName").val() == ''){
             alert("카테고리명을 입력하세요.");
             $("#cateName").focus();
         }

        if (confirm("등록하겠습니까?")){
            $("#writeform").submit();
        }
    }

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">게시판코드관리 > 카테고리관리</span></div>


<!-- 본문 > 메인 > 목록 시작  -->
    <form id="writeform" name="writeform" id="writeform" action="/admin/sysman/bbscateSubFormPopExec.do" method="post">
        <input type="hidden" name="mode" id="mode" value="<c:out value="${REQUEST_DATA.mode}"/>"/>
        <input type="hidden" name="qu" id="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
        <input type="hidden" name="bCateNo" id="bCateNo" value="<c:out value="${VIEW_DATA.BCATENO}"/>" />
        <input type="hidden" name="inType" id="inType" value="<c:out value="${VIEW_DATA.INTYPE}"/>" />
        <input type="hidden" name="isCmt" id="isCmt" value="<c:out value="${VIEW_DATA.ISCMT}"/>" />
        <input type="hidden" name="isAnswer" id="isAnswer" value="<c:out value="${VIEW_DATA.ISANSWER}"/>" />
        <input type="hidden" name="isTop" id="isTop" value="<c:out value="${VIEW_DATA.ISTOP}"/>" />
        <input type="hidden" name="fileCnt" id="fileCnt" value="<c:out value="${VIEW_DATA.FILE_CNT}"/>" />
        
        

            <c:if test="${REQUEST_DATA.qu eq 'update'}">
                 <input type="hidden" name="rootCateNo" id="rootCateNo"  value="<c:out value="${VIEW_DATA.PBCATENO}"/>"/>
            </c:if>
            <c:if test="${REQUEST_DATA.qu eq 'insert'}">
                <input type="hidden" name="rootCateNo" id="rootCateNo"  value="<c:out value="${REQUEST_DATA.pbCateNo}"/>"/>
            </c:if>

            <table class="table-type1 search_form">
                <colgroup>
                    <col class="cellc" width="15%">
                    <col class="celll" width="85%">
                </colgroup>
                <tbody>
                    <tr>
                        <th>게시판명</th>
                        <td colspan="3">
                            <c:if test="${REQUEST_DATA.qu eq 'update'}">
                                <c:out value="${VIEW_DATA.ROOT_CATENAME}"/>
                            </c:if>
                            <c:if test="${REQUEST_DATA.qu eq 'insert'}">
                            <c:out value="${REQUEST_DATA.bcatename}"/>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>카테고리명</th>
                        <td colspan="3">
                            <input type="text" name="cateName" id="cateName" class="lline" value="<c:out value="${VIEW_DATA.BCATENAME}"/>" style="width:80%"/>
                        </td>
                    </tr>
                    <tr>
                        <th>사용여부</th>
                        <td>
                            <select name="isUse">

                                <option value="Y" <c:if test="${VIEW_DATA.ISUSE eq 'Y'}">selected</c:if>>Y</option>
                                <option value="N" <c:if test="${VIEW_DATA.ISUSE eq 'N'}">selected</c:if>>N</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>

        <div class="button">
            <a href="#" onclick="writeFormCheck();return false;" class="btn blue big">등록</a>
            <a href="#"  onclick="window.close();" class="btn gray big">취소</a>
        </div>
    </form>

<!-- 본문 > 메인 > 목록 끝 -->

