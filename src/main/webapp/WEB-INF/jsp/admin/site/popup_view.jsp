<%
/****************************************************
system	: 팝업 상세보기
title	: 팝업 상세보기
summary	:
wdate	: 2016-05-16
writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

    function go_list(){
        var form = document.form;
		$("#pform").attr("action", "/admin/site/popupList.do");
        form.submit();
    }

    function go_update(){
        var form = document.form;
        $("#pform").attr("action", "/admin/site/popupForm.do");
        form.qu.value = 'update';
        form.pageMode.value = '<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>';
        form.submit();
    }

    function go_delete(){
        if(confirm('삭제하시겠습니까?')){
            var form = document.form;
            $("#pform").attr("action", "/admin/site/popupExec.do");
            form.qu.value = 'delete';
            form.submit();
        }
    }
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">팝업관리<span></span></div>

<div class="space"></div><!-- 공백 default 20px -->

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="pform" action="/admin/site/popupView.do" method="post" >
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="popNo" value="<c:out value="${popupInfo.POP_NO}"/>"/>
    <input type="hidden" name="pageMode" id="pageMode" value=""/>
    <input type="hidden" name="qu" value=""/>
   
    <table class="table-type1 search_form" >
      <colgroup>
          <col style="width:15%;" />
        <col style="width:35%;" />
        <col style="width:15%;" />
        <col style="width:35%;" />
      </colgroup>
      <tr>
            <th>제목</th>
            <td colspan="3"><c:out value="${popupInfo.POP_TITLE}"/></td>
      </tr>
      <tr>
            <th>노출 시작일시</th>
            <td><c:out value="${popupInfo.START_DATE}"/> <c:out value="${popupInfo.START_HOUR}"/>시</td>
            <th>노출 종료일시</th>
            <td><c:out value="${popupInfo.END_DATE}"/> <c:out value="${popupInfo.END_HOUR}"/>시</td>
      </tr>
      <tr>
            <th>사이즈 width</th>
            <td><c:out value="${popupInfo.WIDTH_SIZE}"/></td>
            <th>사이즈 height</th>
            <td><c:out value="${popupInfo.HEIGHT_SIZE}"/></td>
        </tr>
        <tr>
            <th>위치 top</th>
            <td><c:out value="${popupInfo.LOC_TOP_PX}"/></td>
            <th>위치 left</th>
            <td><c:out value="${popupInfo.LOC_LEF_PX}"/></td>
        </tr>
        <tr>
            <th><em>*</em> 팝업 템플릿 선택</th>
            <td colspan="3">
				<c:choose>
					<c:when test="${popupInfo.POP_TEMPLATE eq '0'}">없음</c:when>
					<c:when test="${popupInfo.POP_TEMPLATE eq '1'}"><img src="/admin/images/sitemngr/pop_bg_0.png" width="120px" height="70px"/></c:when>
					<c:when test="${popupInfo.POP_TEMPLATE eq '2'}"><img src="/admin/images/sitemngr/pop_bg_1.png" width="120px" height="70px"/></c:when>
					<c:when test="${popupInfo.POP_TEMPLATE eq '3'}"><img src="/admin/images/sitemngr/pop_bg_2.png" width="120px" height="70px"/></c:when>
					<c:when test="${popupInfo.POP_TEMPLATE eq '4'}"><img src="/admin/images/sitemngr/pop_bg_3.png" width="120px" height="70px"/></c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
            </td>
        </tr>
      <tr>
            <th>내용</th>
            <td colspan="3"><c:out value="${popupInfo.POP_CONTENT}" escapeXml="false"/></td>
      </tr>
      <tr>
            <th>사용여부</th>
            <td colspan="3"><c:out value="${popupInfo.USE_AT}"/></td>
      </tr>
    </table>

    <div class="button_top" style="text-align:right;">
        <a href="#" onclick="go_update();"class="btn green">수정</a>
        <a href="#" onclick="go_delete();" class="btn red">삭제</a>
        <a href="#" onclick="go_list();" class="btn orange">목록</a>
    </div>
</form>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>