<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 과정별 출석부
	title	: 30시간 이상 출석부 출력
	summary	:	
	wdate	: 2016-05-11
	writer	: 
*****************************************************/
%>
<%@ page contentType="application/x-msdownload; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/cfn.tld" prefix="cfn"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="ext" %>
<%@ taglib uri = "/WEB-INF/tlds/admin-paging-taglib.tld" prefix="paging" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="com.sangs.util.SangsUtil" %>
<%@ page import="java.util.List"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>
<%
	List list = (List)request.getAttribute("tutorList");
	String today = SangsUtil.getToday("yyyyMMdd");
	String fileNm = "강사출력_"+today+".xls";
	String filename = new String(fileNm.getBytes("euc-kr"),"iso-8859-1");
	
	response.setContentType("application/x-msdownload;charset=utf-8");
    response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "utf-8") + ";");
 %>
<html>

<head>
<meta http-equiv='Content-Type' content='application/x-msdownload; charset=utf-8'/>

<style type="text/css">
table th { background-color:#6EE3F7;}

</style>
</head>
<body>
	<table class="tb table-type1" border="1">
		<colgroup>
            <col width="5%">
	        <col width="10%">
	        <col width="15%">
	        <col width="9%">
	        <col width="11%">
	        <col width="13%">
	        <col width="13%">
	        <col width="13%">
		</colgroup>	       
	    <tr class="rndbg">
	        <th>No</th>
	        <th>강사분류</th>
	        <th>분야</th>
	        <th>지역</th>
	        <th>이름</th>
	        <th>이메일</th>
	        <th>전화번호</th>
	        <th>실주소</th>
	        <th>최초위촉일</th>
	        <th>최근위촉일</th>
	    </tr>	
	    <c:forEach var="result" items="${resultList}" varStatus="status">
	    <tr align="center">
	        <td><c:out value='${status.count}'/></td>
	        <td><c:out value="${result.MT_TUTOR_NAME}"/></td>
	        <td><c:out value="${result.MT_FIELD_NAME}"/></td>
	        <td><c:out value="${result.MT_AREA_NAME}"/></td>
	        <td><c:out value="${result.MBERNM}"/></td>
	        <td><c:out value="${result.EMAIL}"/></td>
	        <td><c:out value="${result.TELNO}"/></td>
	        <td><c:out value="${result.ADDR1}"/></td>
	        <td><c:out value="${result.ENTRST_DATE}"/></td> 
	        <td><c:out value="${result.ENTRST_DATE}"/></td> 
	    </tr>
	    </c:forEach>
   </table>
</body>
</html>
