<%
/****************************************************
    system	: 시스템관리 > 로그관리 > 관리자접속로그관리 > 엑셀다운
    title		: 관리자 접속 로그 리스트  엑셀 다운
    summary	:
    wdate		: 2013-06-26
    writer	: 장선아
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%
    String today = SangsUtil.getToday("yyyyMMdd");
    String fileNm = "개인정보처리로그_"+today+".xls";

    response.setContentType("application/vnd.ms-excel;charset=utf-8");
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

<table border=1 cellspacing=0 cellpadding=0 width="100%">

    <tr>
        <th>시스템구분</th>
        <th>인증구분</th>
        <th>일자</th>
        <th>아이디</th>
        <th>IP주소</th>
        <th>설명</th>
        <th>프로그램</th>
    </tr>
    <c:if test="${fn:length(LIST_DATA) > 0}">
    <c:forEach var="result" items="${LIST_DATA}" varStatus="status" begin="0">
    <tr align="middle"  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
        <td><c:out value="${cfn:clearXSSMinimum(result.SYS_GB_NAME)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TRANS_GB_NAME)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TRANS_DT)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.TRANS_USERID)}"/></td>
        <td><c:out value="${cfn:clearXSSMinimum(result.ipAddr)}"/></td>
        <td style="text-align:left;word-break:break-all"><c:out value="${result.SUMMARY}"/></td>
        <td align="left"><c:out value="${result.PROG_ID}"/><br/><c:out value="${result.PROG_NM}"/></td>
    </tr>
    </c:forEach>
    </c:if>
</table>


</body>
</html>