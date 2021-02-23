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
<form name="form" id="form" action="">
<input type="hidden" name="sysGb" id="sysGb" value=""/>
</form>
<script type="text/javascript">

    if('<c:out value="${REQUEST_DATA.returnUrl}"/>' == 'delete') {
        $("#sysGb").val('<c:out value="${REQUEST_DATA.sysGb}"/>');
        $("#form").attr("action", '/admin/sysman/menumngList.do');
        $("#form").submit();
    }else{
        opener.location.reload(); //부모창 새로고침
        window.close();
    }

</script>


<script type="text/javascript">

</script>
