<%
/****************************************************
    system  : 시스템관리 > 게시판 카테고리 등록 실행
    title   : 카테고리 목록 조회
    summary :
    wdate   : 2016-05-31
    writer  : sangs
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>

<form name="form" id="form" action="/admin/sysman/bbscateList.do" method="post">

       <input type="hidden" name="qu" id="qu" value="<c:out value="${cfn:clearXSSMinimum(qu)}" />"/>
       <input type="hidden" name="mode" id="mode" value="<c:out value="${cfn:clearXSSMinimum(mode)}" />"/>
       <input type="hidden" name="bCateNo" id="bCateNo" value="<c:out value="${cfn:clearXSSMinimum(bCateNo)}" />"/>

</form>
<script type="text/javascript">

alert('<c:out value="${msg}"/>');

if('<c:out value="${js}" escapeXml="false" />' != "") {
    eval("<c:out value='${js}'/>");
}else{
    $("#form").attr('action', '<c:out value="${returnUrl}" />');
    $("#form").submit();
}






</script>