<%
/****************************************************
	system	: 대상자선정 > 엑셀다운로드
	title	: 
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
	List list = (List)request.getAttribute("resultList");
	String today = SangsUtil.getToday("yyyyMMdd");
	String fileNm = "대상자선정_"+today+".xls";
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
			<col class="cellc" width="5%">
            <col class="cellc" width="5%">
            <col class="cellc" width="10%">
            <col class="cellc" width="10%">
            <col class="cellc" width="10%">
            <col class="cellc" width="8%">
            <col class="cellc" width="*">
            <col class="cellc" width="10%">
            <col class="cellc" width="14%">
            <col class="cellc" width="8%">
		</colgroup>	

       <thead>
        <tr>
            <th>NO</th>
            <th>회원분류</th>
            <th>소속</th>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>휴대폰번호</th>
            <th>신청일시</th>
            <th>선정여부</th>
        </tr>
       </thead>
       
       <tbody>
           <c:forEach var="result" items="<%=list%>" varStatus="status">
           <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">

               <td><c:out value="${totalCnt - (REQUEST_DATA.cPage-1)*20 - status.count+1}"/></td><!-- NO -->
               <td><c:out value="${result.MT_GRADE_NAME}"/></td>
               <td><c:out value="${result.COMNAME}"/></td>
               <td><c:out value="${result.USERID}"/></td><!-- 아이디 -->
               <td><c:out value="${result.USERNAME}"/></td><!-- 이름 -->
			   <td>${result.EMAIL}</td>
               <td><c:out value="${result.MOBLPHON}"/></td><!-- 과정신청번호 -->
			   <td>${result.F_WDATE}</td>
			   <td>${result.TARGETYN}</td>

           </tr>
           </c:forEach>
       </tbody>
   </table>
</body>
</html>
