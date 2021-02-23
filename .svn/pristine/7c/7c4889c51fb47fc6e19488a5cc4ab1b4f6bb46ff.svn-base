<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 최종평가 > 출제정책목록 
	summary	:	
 	wdate	: 2016-05-19
 	writer	: 이진영
 *****************************************************/
 %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

//삭제
function objDelete(courseno, secno){
	var form = document.pform;
	var delwin = window.confirm("선택한 시험을 삭제하시겠습니까?\n삭제한 시험은 복구가 불가합니다.");

	if(delwin){
		form.courseno.value = courseno;
		form.secno.value = secno;
		$("#pform").attr("action", "/admin/course/examSecQdelExec.do");
		form.target = "";
		form.submit();
	}
}

function parentReload(){
	
	var form = document.pform;
	$("#pform").attr("action", "/admin/course/examSecList.do");
	form.target = "";
	form.submit();
}

function fnExamPop(src, secno, pageMode ,width,height,scrollbars, resize)
{
	var url = src + "?courseno=" + $("#courseno").val() +"&secno="+secno;
	if(pageMode != '') url = url+ "&pageMode=" + pageMode;
	if(scrollbars=='') scrollbars=1;
	if(resize=='') resize=1;
	//window.open(url,'','width='+width+',height='+height+',scrollbars='+scrollbars+',resizable='+resize);
	popup4(url,width,height,scrollbars,resize);
}

//페이지 이동
function move_page(cPage){
	var frm = document.pform;
	frm.target = "";
	frm.cPage.value = cPage;
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	$("#pform").attr("action", "/admin/course/examSecList.do");
	frm.submit();
}


</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">교육과정등록 - 문제은행<span></span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_tab_inc.jsp"></jsp:include>
</c:if>
<form name="pform" id="pform" method="post" action="/admin/course/examSecList.do">
<input type="hidden" name="courseno"  id="courseno"  value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="MT_CTYPE_CODE" id="MT_CTYPE_CODE" value="${REQUEST_DATA.MT_CTYPE_CODE}"/>
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
<input type="hidden" name="secno" value=""/>
</form>

<div style="margin-bottom:10px; text-align: right;">
	<a href="#" onclick="fnExamPop('examSecForm.do', 0, 'reg', 600,400,1,1);" class="btn small green">출제정책등록</a>
</div>

<!-- 본문 > 메인 > 목록 시작  -->
<table class="tb table-type1" border="1" bordercolor="#e6e6e6" cellpadding="5" style="width: 100%; border-collapse: collapse;">	
	<tr class="rndbg">
		<th>NO</th>
		<th>출제정책명</th>
		<th>설명</th>
		<th>문제수</th>
		<th>사용여부</th>
		<th>문제목록</th>
		<th>삭제</th>

	</tr>	
	<colgroup>
		<col align=middle width="5%">
		<col align=middle width="20%">
		<col align=middle width="25%">
		<col align=middle width="5%">
		<col align=middle width="5%">
		<col align=middle width="10%">
		<col align=middle width="10%">
	</colgroup>
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr height=70 align=middle>
		<td><c:out value="${status.index+1}"/></td>
		<%-- <td><c:out value="${result.SECNO}"/></td> --%>
		<td><a href="#" onclick="fnExamPop('examSecForm.do', '<c:out value="${result.SECNO}"/>', 'mod', 600,400,1,1)">${result.SECTITLE}</a></td>
		<td><textarea name="textarea" style="width:100%;height:50px;overflow:visible" class="tline" readonly="readonly"><c:out value="${result.DESCRIPTION}"/></textarea></td>
		<%-- <td><c:out value="${result.ALLOT}"/></td> --%>
		<td><c:out value="${result.QCNT}"/></td>
		<td><c:out value="${result.USEYN}"/></td>
		<%-- <td><c:out value="${result.QCNT}"/></td> --%> 
		<td>
			<a href="#" onclick="fnExamPop('examQlist.do', '<c:out value="${result.SECNO}"/>', '', 1200,550,1,1);" class="btn sky">문제목록</a>
		</td>
		<td>
			<%-- <a href="#" onclick="fnExamPop('examSecForm.do', '<c:out value="${result.SECNO}"/>', 'mod', 600,400,1,1);" class="btn green">수정</a> --%>
			<a href="#" onclick="objDelete('<c:out value="${REQUEST_DATA.courseno}"/>','<c:out value="${result.SECNO}"/>');" class="btn red">삭제</a>
			<%-- <a href="#" onclick="fnExamPop('examQlist.do', '<c:out value="${result.SECNO}"/>', '', 1200,550,1,1);" class="btn sky">문제목록</a> --%>
		</td>
	</tr> 
	</c:forEach>
</table>
<br/>

<c:if test="${not empty resultList}">
    <div class="admin-paging paging_wrap">
        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
    </div>
</c:if>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	