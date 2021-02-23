<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
function move_page(cPage){
	var frm = document.pform;
	frm.cPage.value = cPage;
	$("#pform").attr("action", "/admin/stats/eduStats02detail.do");
	frm.submit();
}
//엑셀다운로드
function goExcel(){
    var frm = document.pform;
    frm.target = "";
    $("input[name='listType']").val('EXCEL');
	$("#pform").attr("action", "/admin/stats/eduStats02detail.do");
    frm.submit();
}
//검색
function list_page(){
    var frm = document.pform;
    $("input[name='listType']").val('LIST');
    $("#pform").attr("action", "/admin/stats/eduStats02detail.do");
    frm.submit();
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">온라인 교육 운영 상세</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/stats/eduStats02.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="listType" id="listType" value="LIST"/>
<!-- 검색영역 -->
 <table class="table-type1 search_form" >
      <colgroup>
          <col class="cellc" width="8%">
          <col class="celll" width="42%">
          <col class="cellc" width="8%">
          <col class="celll" width="42%">
      </colgroup>
         <tbody>
           <tr>
            <th>과정선택</th>
              <td>
                <select name="courseNo" id="courseNo" title="과정선택">
                <option  value=""> -- 선택 -- </option>
                <c:forEach var="emap2" items="${courseList}" varStatus="status2">
					<option value="<c:out value="${emap2.COURSENO}"/>" <c:if test="${REQUEST_DATA.courseNo == emap2.COURSENO}"> selected="selected"</c:if>><c:out value="${emap2.COURSETITLE}"/></option>
				</c:forEach>
                 </select>
            </td>
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
    	<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${resultList[0].TOTALCOUNT}" groupingUsed="true" /></span> 건</td>
        <td align="right"><a href="#" onclick="goExcel();" class="btn down sky">엑셀다운</a></td>
    </tr>
  </tbody>
</table>

<form name="cform" id="cform" action="/admin/study/cuserList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
	<input type="hidden" name="cseqno" id="cseqno" value=""/>
	<input type="hidden" name="courseno" id="courseno" value=""/>
	<input type="hidden" name="userNo" id="userNo" value=""/>
	<input type="hidden" name="cuserno" id="cuserno" value=""/>
	<input type="hidden" name="subcmd" id="subcmd" value=""/>
 	<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value=""/>
 	
	<table class="tb table-type1" >
		<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>이름</th>
			<th>아이디</th>
			<th>회원구분</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>승인여부</th>
			<th>수강상태</th>
			<th>등록일</th>
			<th>소속</th>
			<th>직급</th>
			<th>휴대폰번호</th>
			<th>이메일</th>
			<th>수료여부</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				 <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
					<td><c:out value="${result.TOTALCOUNT-result.RNUM+1}"/></td>
					<td><c:out value='${result.MBERNM}'/></td>
					<td><c:out value='${result.UNITY_ID}'/></td>
					<td><c:out value='${result.MT_GRADE_NAME}'/></td>
					<td><c:out value='${result.SEX}'/></td>
					<td><c:out value='${result.BRTHDY}'/></td>
					<td><c:out value='${result.TARGETYN}'/></td>
					<td><c:out value='${result.USEYN}'/></td>
					<td><c:out value='${result.WDATE}'/></td>
					<td><c:out value='${result.COMNAME}' escapeXml="xml"/></td>
					<td><c:out value='${result.POSITION_NAME}' escapeXml="xml"/></td>
					<td><c:out value='${result.MOBLPHON}'/></td>
					<td><c:out value='${result.EMAIL}'/></td>
					<td><c:out value='${result.COMPYN}'/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!-- 본문 > 메인 > 목록 끝 -->
</form>	
<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	