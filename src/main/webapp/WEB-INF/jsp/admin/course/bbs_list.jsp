<%
/****************************************************
	system	: 일반과정관리 > 교육과정등록
	title	: 공지사항, 자료실
	summary	:
	wdate	: 2016-04-14
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	function move_page(cPage){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/course/bbsList.do");
		frm.cPage.value = cPage;
		frm.submit();
	}
	
	// 수정
	function go_update(bbsNo, courseno){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/course/bbsForm.do");
		frm.bbsNo.value = bbsNo;
		frm.courseno.value = courseno;
		frm.pageMode.value= "<%=SangsProperties.getProperty("Globals.PAGE_MODE_MOD")%>";
		frm.qu.value = 'update';
		frm.submit();	
	}

	// 목록
	function list_page(){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/course/bbsList.do");
		frm.submit();
	}
	
	function write_page(){
		var frm = document.pform;
		$("#pform").attr("action", "/admin/course/bbsForm.do");
		frm.qu.value = 'insert';
		frm.submit();
	}
	
	var preNo = -1;
	function answer_page(no){
		document.getElementById("answer"+no).style.display = "block";
		if(preNo != '-1'){
			document.getElementById("answer"+preNo).style.display = "none";
		}
		preNo = no;
	}
	
	// 등록페이지
	function form_page(courseno){
		var frm = document.pform;
		frm.bbsNo.value = 0;
		frm.courseno.value = courseno;
		frm.pageMode.value= "<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_REG"))%>";
		frm.qu.value = "insert";
		$("#pform").attr("action", "/admin/course/bbsForm.do");
		frm.submit();
	}

</script>

<c:set var="bbsNotice"><%=SangsProperties.getProperty("Globals.bbsBcateCourseNotice")%></c:set>
<c:set var="bbsCourse"><%=SangsProperties.getProperty("Globals.bbsBcateCourseData")%></c:set>
<c:if test="${REQUEST_DATA.bcateno == '1010'}"><c:set var="title" value="공지사항"/></c:if>
<c:if test="${REQUEST_DATA.bcateno == '1020'}"><c:set var="title" value="자료실"/></c:if>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정등록 - ${title}<span></span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/course/bbsList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
	<input type="hidden" name="bbsNo" id="bbsNo" value="0"/>
	<input type="hidden" name="qu" id="qu" value=""/>
	<input type="hidden" name="courseno"  id="courseno"  value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
	<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
	<input type="hidden" name="pageMode" id="pageMode" value=""/>
	<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>


<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1">
	<tr class="rndbg">
		<th>NO</th>
		<th>제목</th>
		<th>작성자</th> 
		<th>등록일자</th>
		<th>조회수</th>
	</tr>
	<colgroup>
		<col align=middle width="8%">
		<col align=middle width="20%">
	  	<col align=middle width="10%">
	  	<col align=middle width="10%">
	  	<col align=middle width="8%">
	</colgroup>
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
	  	<td><c:out value='${fn:length(resultList) - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
	  	<td style="text-align:left;padding-left:15px">
	  		<c:if test="${result.REFSTEP > 0}">
	  		</c:if>
	  		<%-- <%
	    	if(map.getInt("REFSTEP") > 0){ 
				for(int j=0;j<map.getInt("REFSTEP");j++){
					if(j == map.getInt("REFSTEP")-1){
						/* out.print("<img src='/resource/images/etc/re.gif'>"); */
						out.print("&nbsp;&nbsp;");
					} else {
						out.print("&nbsp;&nbsp;");
					}
	        	}
	        }
			%> --%>
		  	<a href="#" onclick="go_update('<c:out value="${result.BBSNO}"/>','<c:out value="${REQUEST_DATA.courseno}"/>')"><c:out value="${result.TITLE}"/></a>
		  	<c:if test="${result.FILECNT > 0}">
		  		<img src="/admin/images/etc/blt_etc_01.gif" alt="">
		  	</c:if>
	  	</td>
	  	<td><c:out value='${result.WRITER}'/></td>
	  	<td><c:out value='${result.WDATE}'/></td>
	  	<td><c:out value='${result.RCNT}'/></td>
	  </tr> 
	</c:forEach>
</table>
<div class="space5"></div>
<div align="right"><a href="#" onclick="form_page('<c:out value="${REQUEST_DATA.courseno}"/>');return false;" class="btn blue">등록</a></div>
</form>
<!-- 본문 > 메인 > 목록 끝 -->
<br/>
<c:if test="${not empty resultList}">
     <div class="admin-paging paging_wrap">
         <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
     </div>
 </c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	
