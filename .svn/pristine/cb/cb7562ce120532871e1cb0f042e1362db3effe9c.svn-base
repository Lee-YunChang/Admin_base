<%
/****************************************************
system	: 연간일정관리 상세보기
title	: 연간일정관리 상세보기
summary	:
wdate	: 2017-02-15
writer	: 고상현
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">


    function go_update(){
        var form = document.form;
        $("#pform").attr("action", "/admin/site/annualScheduleForm.do");
        form.qu.value = 'update';
        form.pageMode.value = '<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>';
        form.submit();
    }


</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">연간일정관리<span>사이트 게시물을 관리합니다.</span></div>

<div class="space"></div><!-- 공백 default 20px -->

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="pform" action="" method="post" >
    <input type="hidden" name="pageMode" id="pageMode" value=""/>
    <input type="hidden" name="bbsno" id="bbsno" value="<c:out value="${map.BBSNO }"/>"/>
    <input type="hidden" name="bcateno" id="bcateno" value="10"/>
    <input type="hidden" name="qu" value=""/>
   	<table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
          <col class="cellc" width="15%">
          <col class="celll" width="35%">
      </colgroup>
      <tr>
            <td  colspan="4" style="height: 100">
                <div class="">
                	<c:if test="${empty map.CONTENT }">작성된 글이 없습니다.</c:if>
           
                     <c:out value="${map.CONTENT}" escapeXml="false"/>
                </div>
            </td>
      </tr>
      </table>

    <div class="button_top" style="text-align:right;">
    	<c:if test="${empty map.BBSNO}">
        <a href="#" onclick="go_update();"class="btn green">작성</a>
        </c:if>
        <c:if test="${not empty map.BBSNO}">
        <a href="#" onclick="go_update();"class="btn green">수정</a>
        </c:if>
    </div>
</form>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>