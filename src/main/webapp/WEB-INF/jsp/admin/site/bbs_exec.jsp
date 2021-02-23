<%
/****************************************************
	system	: 게시판 실행
	title	: 게시판 실행
	summary	:
	wdate	: 2016-04-18
	writer	: 이진영
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form name="form" id="form"action="/admin/site/bbsList.do" method="post">
 <input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
<input type="hidden" name="bbsData" id="bbsData" value="${REQUEST_DATA.bbsData}"/>
<input type="hidden" name="bbsNegative" id="bbsNegative" value="${REQUEST_DATA.bbsNegative}"/>
<input type="hidden" name="bbsTranslation" id="bbsTranslation" value="${REQUEST_DATA.bbsTranslation}"/>
<input type="hidden" name="bbsAdv" id="bbsAdv" value="${REQUEST_DATA.bbsAdv}"/>
<input type="hidden" name="bbsBcateYtnCampaign" id="bbsBcateYtnCampaign" value="${REQUEST_DATA.bbsBcateYtnCampaign}"/>
<input type="hidden" name="bbsBcateResultMovie" id="bbsBcateResultMovie" value="${REQUEST_DATA.bbsBcateResultMovie}"/>
<input type="hidden" name="bbsBcateOpenEdu" id="bbsBcateOpenEdu" value="${REQUEST_DATA.bbsBcateOpenEdu}"/>
 <input type="hidden" name="execCheck" value="Y"/>
</form>

<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	if($("#bcateno").val() == $("#bbsData").val() || $("#bcateno").val() == $("#bbsNegative").val() || $("#bcateno").val() == $("#bbsTranslation").val() || $("#bcateno").val() == $("#bbsAdv").val()) {
		$("#form").attr("action", "/admin/site/bbsContentsList.do");
		document.form.submit();
	} else if($("#bcateno").val() == $("#bbsBcateResultMovie").val()|| $("#bcateno").val() == $("#bbsBcateYtnCampaign").val()|| $("#bcateno").val() == $("#bbsBcateOpenEdu").val()) {
		$("#bcateno").val($("#bbsAdv").val());
		$("#form").attr("action", "/admin/site/bbsContentsList.do");
		document.form.submit();
	} else {
		document.form.submit(); 
	}
});
</script>
