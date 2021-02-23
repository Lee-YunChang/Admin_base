<%
/****************************************************
	system	: 상시설문 리스트
	title	: 상시설문 리스트
	summary	:
	wdate	: 2016-08-30
	writer	: 황두은
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">
	function setCookie(name,value,expiredays) {
	    var todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	function closeWin() {
		var pollcseqno = $("#pollcseqno").val();
	    if(document.getElementById("close_view").checked) {
	        setCookie("main_popup_<c:out value="+ pollcseqno +"/>", "done" , 1);
	    }
	    windowClose();
	}
	
	function windowClose() {
	    if (/MSIE/.test(navigator.userAgent))  {
	        //Explorer 8이상일때
	        if(navigator.appVersion.indexOf("MSIE 8.0")>=0)  {
	            window.opener='Self';
	            window.open('','_parent','');
	            window.close();
	        } else if(navigator.appVersion.indexOf("MSIE 7.0")>=0) {
	             //Explorer 7이상일때
	            window.open('about:blank','_self').close();
	        } else {
	              //Explorer 7미만일때
	            window.opener = self;
	            self.close();
	        }
	    } else{
	        //window.open('about:blank','_self').close();''
	        window.close();
	    }
	}
	
	function getSurvey(pollcseqno,pollcseqno2,cnt){
		var frm = document.sform;
		frm.pollcseqno.value = pollcseqno;
		frm.pollcseqno2.value = pollcseqno2; 
		frm.cnt.value=cnt;
		if(confirm('해당 설문지를 가져오시겠습니까?')){
			frm.target='surveyForm';
			frm.action='/admin/site/surveyForm.do';
			frm.submit();
			self.close();
	    }
	}

	function fnListPage(){
		var frm = document.sform;
		$("#sform").attr("action"," /admin/site/surveyListPopup.do");
		frm.submit();
	}
	
	function fnMovePage(cPage){
		var frm = document.sform;
		frm.target = "";
		frm.cPage.value = cPage;
		$("#sform").attr("action", "/admin/site/surveyList.do");
		frm.submit();
	}
	
	function fnWritePage(){
		var frm = document.sform;
		frm.subcmd.value = "form";
		frm.qu.value = 'insert';
		$("#sform").attr("action", "/admin/site/surveyList.do");
		frm.submit();
	}
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">설문지 가져오기</div>

	<!-- 본문 > 상단 > 검색영역 시작 -->
	<form name="sform" id="sform" action="/admin/site/surveyList.do" method="post">
		<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
   		<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
		<input type="hidden" name="pollcseqno" id="pollcseqno" value=""/>
		<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}"/>
		<input type="hidden" id="pollcseqno2" name="pollcseqno2" value="<c:out value="${REQUEST_DATA.pollcseqno2}"/>"/>
		<input type="hidden" id="pageMode" name="pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
		<input type="hidden" id="cnt" name="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>"/>
		
		<table class="table-type1 search_form" >
		  	<colgroup>
		  	<col class="cellc" width="10%">
		  	<col class="celll" width="90%">
		  	</colgroup>	
		  	
			<tbody>
		  	<tr>
				<th>검색</th>
				<td>
			  		<select id="searchMode" name="searchMode" title="검색 설정" style="width: 100px;">
			  			<option value="" <c:if test="${empty REQUEST_DATA.searchMode}"> selected="selected" </c:if>>선택</option>
		                <option <c:if test="${REQUEST_DATA.searchMode eq 'writer'}">selected="selected" </c:if> value="writer">작성자</option>
               			<option <c:if test="${REQUEST_DATA.searchMode eq 'title'}">selected="selected" </c:if> value="title">설문명</option>
		            </select>
		            <input type="text" class="line" id="searchWord" name="searchWord" style="width:350px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
				</td>
		  	</tr>
			</tbody>
		</table>
		
		<div class="button_top">
			<a href="#" onclick="fnListPage();" class="btn search brown">검색</a>
		</div>
	</form>
	<!-- 본문 > 상단 > 검색영역 끝 -->

	<!-- 본문 > 메인 > 서브   영역 시작 -->
	<table width="100%" class="btn_Group">
	 <tbody>
	  <tr>
	   <td class="pageinfo">조회건수 <span class="red"><c:out value="${fn:length(resultList)}"/></span> 건</td></td>
	 </tbody>
	</table>
	
	<!-- 본문 > 메인 > 목록 시작  -->
	<table class="tb table-type1">
	<colgroup>
		<col style="width: 8%;" />
		<col style="width: 27%" />
		<col style="width: 13%;" />
		<col style="width: 13%;" />
		<col style="width: 13%;" />
	</colgroup>	
	<thead>
		<tr class="rndbg">
			<th>NO</th>
			<th>설문명</th>
			<th>작성자</th>
			<th>설문기간</th>
			<th>가져오기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
		  	<td><c:out value='${result.POLLCSEQNO}'/></td>
		  	<td style="text-align:left;padding-left:15px"><c:out value="${result.TITLE}"/></td>
		  	<td><c:out value='${result.WRITER}'/></td>
		  	<td><c:out value='${result.SDATE}'/> ~ <c:out value='${result.EDATE}'/></td>
		  	<td><input type="button" onclick="getSurvey('<c:out value="${result.POLLCSEQNO}"/>','${REQUEST_DATA.pollcseqno2}','${REQUEST_DATA.cnt}')" value="가져오기"></td>
		</tr> 
		</c:forEach>
	</tbody>
	</table>
	<!-- 본문 > 메인 > 목록 끝 -->
	<br/>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${fn:length(resultList)}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
	    </div>
	</c:if>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	