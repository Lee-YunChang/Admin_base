<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("#pform").attr("action", "/admin/stats/eduStats02.do");
    frm.submit();
}
//검색
function list_page(){
    var frm = document.pform;
    $("input[name='listType']").val('LIST');
    $("#pform").attr("action", "/admin/stats/eduStats02.do");
    frm.submit();
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">온라인 교육 운영 현황</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/eduStats02.do" method="post">
<input type="hidden" name="listType" id="listType" value="LIST"/>
<!-- 검색영역 -->
 <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="92%">
      </colgroup>
         <tbody>
           <tr>
            <th>기간선택</th>
            <td>
                <select name="startYear" id="startYear" title="연도">
                    <c:if test="${not empty selectYYYY}">
	                        <c:forEach items="${selectYYYY}" var="emap" varStatus="stat">
	                           <option  value="<c:out value="${emap.SEQYEAR}"/>" <c:if test="${REQUEST_DATA.startYear == emap.SEQYEAR}"> selected="selected"</c:if>><c:out value="${emap.SEQYEAR}"/></option>
	                        </c:forEach> 
	                    </c:if>
	                    <c:if test="${empty selectYYYY}">
	                          <option  value="<%=DateUtil.getYear()%>"><%=DateUtil.getYear()%></option>
	                     </c:if>
                 </select>  년
                 <select id="startMonth" title="월" name="startMonth">
                    <option value="">선택</option>
                    <c:forEach begin="1" end="12" step="1" var="m">
                    <c:if test="${m < 10}">
                    	<c:set var="minMonth">0<c:out value="${m}"/></c:set>
                    	<option value="<c:out value="${minMonth}"/>" <c:if test="${REQUEST_DATA.startMonth == minMonth}"> selected="selected"</c:if>><c:out value="${minMonth}"/></option></c:if>
                    <c:if test="${m > 9}"><option value="<c:out value="${m}"/>" <c:if test="${REQUEST_DATA.startMonth == m}"> selected="selected"</c:if>><c:out value="${m}"/></option></c:if>
                    </c:forEach>
                </select>  월
                
                  ~
                <select name=endYear id="endYear" title="연도">
                     <c:if test="${not empty selectYYYY}">
                        <c:forEach items="${selectYYYY}" var="emap" varStatus="stat">
                           <option  value="<c:out value="${emap.SEQYEAR}"/>" <c:if test="${REQUEST_DATA.endYear == emap.SEQYEAR}"> selected="selected"</c:if>><c:out value="${emap.SEQYEAR}"/></option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty selectYYYY}">
                          <option  value="<%=DateUtil.getYear()%>"><%=DateUtil.getYear()%></option>
                     </c:if>
                 </select> 년

                 <select id="endMonth" title="월" name="endMonth">
                    <option value="">선택</option>
                    <c:forEach begin="1" end="12" step="1" var="m">
                    <c:if test="${m < 10}">
                    	<c:set var="minMonth">0<c:out value="${m}"/></c:set>
                    	<option value="<c:out value="${minMonth}"/>" <c:if test="${REQUEST_DATA.endMonth == minMonth}"> selected="selected"</c:if>><c:out value="${minMonth}"/></option></c:if>
                    <c:if test="${m > 9}"><option value="<c:out value="${m}"/>" <c:if test="${REQUEST_DATA.endMonth == m}"> selected="selected"</c:if>><c:out value="${m}"/></option></c:if>
                    </c:forEach>
                </select>   월
            </td>
          </tr>
        </tbody>
</table> 
  	<div class="button_top">
    	<a href="#" onclick="list_page();" class="btn search brown">검색</a>
    </div>
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->
<div class="space5"></div>
<table width="100%" class="btn_Group">
  <tbody>
    <tr>
        <td align="right"><a href="#" onclick="goExcel();" class="btn down sky">엑셀다운</a></td>
    </tr>
  </tbody>
</table>

<table class="tb table-type1 stats_tb">
    <tr class="rndbg">
    	<th rowspan="2" colspan="3">구분</th>
        <th rowspan="3">운영횟수</th>
        <th colspan="9">공무원</th>
        <th colspan="9">교원</th>
        <th colspan="9">일반사용자</th>
    </tr>
    <tr class="rndbg">
    	<th colspan="4">신청인원</th>
        <th colspan="4">수료인원</th>
        <th rowspan="2">이수율</th>
        <th colspan="4">신청인원</th>
        <th colspan="4">수료인원</th>
        <th rowspan="2">이수율</th>
        <th colspan="4">신청인원</th>
        <th colspan="4">수료인원</th>
        <th rowspan="2">이수율</th>
    </tr>
    <tr class="rndbg">
    	<th>월별</th>
        <th>과정번호</th>
        <th>과정명</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
        <th>남</th>
        <th>여</th>
        <th>정보없음</th>
        <th>합계</th>
    </tr>
    <c:forEach var="result" items="${resultList}" varStatus="status">
    <tr>
    	<%-- <th><c:out value="${result.MM}"/>월</th>
    	<th></th>
    	<th>합계</th> --%>
    	<td><c:out value="${result.YYYY}"/>.<c:out value="${result.MM}"/></td>
    	<td><c:out value="${result.COURSENO}"/></td>
    	<td><c:out value="${result.COURSETITLE}"/></td>
   		<td><c:out value="${result.CNT}"/></td>
    	<td><c:out value="${result.PUBMAPPLY}"/></td>
    	<td><c:out value="${result.PUBFAPPLY}"/></td>
    	<td><c:out value="${result.PUBXAPPLY}"/></td>
    	<td><c:out value="${result.PUBSUMAPPLY}"/></td>
    	<td><c:out value="${result.PUBMPASS}"/></td>
    	<td><c:out value="${result.PUBFPASS}"/></td>
    	<td><c:out value="${result.PUBXPASS}"/></td>
    	<td><c:out value="${result.PUBSUMPASS}"/></td>
    	
		<td><c:out value="${result.PUBPASSPERCENT}"/></td>   
		 	
    	<td><c:out value="${result.TEAMAPPLY}"/></td>
    	<td><c:out value="${result.TEAFAPPLY}"/></td>
    	<td><c:out value="${result.TEAXAPPLY}"/></td>
    	<td><c:out value="${result.TEASUMAPPLY}"/></td>
    	<td><c:out value="${result.TEAMPASS}"/></td>
    	<td><c:out value="${result.TEAFPASS}"/></td>
    	<td><c:out value="${result.TEAXPASS}"/></td>
    	<td><c:out value="${result.TEASUMPASS}"/></td>
    	
    	<td><c:out value="${result.TEAPASSPERCENT}"/></td>  
    	<td><c:out value="${result.NOMMAPPLY}"/></td>
    	<td><c:out value="${result.NOMFAPPLY}"/></td>
    	<td><c:out value="${result.NOMXAPPLY}"/></td>
    	<td><c:out value="${result.NOMSUMAPPLY}"/></td>
    	<td><c:out value="${result.NOMMPASS}"/></td>
    	<td><c:out value="${result.NOMFPASS}"/></td>
    	<td><c:out value="${result.NOMXPASS}"/></td>
    	<td><c:out value="${result.NOMSUMPASS}"/></td>
    	
    	<td><c:out value="${result.NOMPASSPERCENT}"/></td>  
    </tr>
    </c:forEach>
     <tr>
    	<td colspan="3">합계</td>
    	<td><c:out value="${resultList[0].TOTALCOUNT}"/></td>
    	<td colspan="33"></td>
    </tr>
</table>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	