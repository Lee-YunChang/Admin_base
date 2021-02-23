<%
/****************************************************
    system  : 시스템관리 > 공통코드 등록 실행
    title   : 공통 코드 목록 조회
    summary :
    wdate   : 2016-05-16
    writer  : sangs
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>



<form name="form" id="form" action="/admin/sysman/mtcodeSubList.do" method="post">
<input type="hidden" name="mtCode" id="mtCode" value="<c:out value="${cfn:clearXSSMinimum(mtCode)}" />"/>
<input type="hidden" name="mtSubCode" value="<c:out value="${cfn:clearXSSMinimum(mtSubCode)}" />"/>
<input type="hidden" name="qu" id="qu" value="<c:out value="${cfn:clearXSSMinimum(qu)}" />"/>
<input type="hidden" name="mode" id="mode" value="<c:out value="${cfn:clearXSSMinimum(mode)}" />"/>
</form>
 
<script type="text/javascript">

alert('<c:out value="${msg}"/>');

$("#form").attr('action', '<c:out value="${returnUrl}" />');
$("#form").submit();
</script>