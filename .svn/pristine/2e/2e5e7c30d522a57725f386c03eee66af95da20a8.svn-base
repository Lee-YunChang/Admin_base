<%
/****************************************************
	system	: 회원관리
	title	: 회원정보관리
	summary	:
	wdate	: 2016-03-28
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

	// 날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd"
	};	
	
	$(document).ready(function(){
		// 달력
		$("#sdate").datepicker(dateFormat);
		$("#edate").datepicker(dateFormat);
	});

	// 페이지 이동
	function move_page(cPage){
 		$("input[name=cPage]").val(cPage);
 		$("input[name=listType]").val('LIST');
		$("form[name=pform]").attr("method", "post").attr("action", "/admin/user/userList.do").submit();
	}

	// 조회
	function list_page(){
		$("input[name='cPage']").val('1');
		$("input[name='listType']").val('LIST');
		$("form[name='pform']").attr("method", "post").attr("action", "/admin/user/userList.do").submit();
	}
		
	// 회원 상세정보
	function user_form(userNo){
		window.open("/admin/user/userForm.do?userNo="+userNo, "user_form", "width=800, height=400");
	}
	
	// 엑셀다운로드
	function goExcel(){
			$("input[name='listType']").val('EXCEL');
			$("form[name='pform']").attr("method", "post").attr("action", "/admin/user/userList.do").submit();
	}
	
	function enterChk(){
		if (event.keyCode==13) list_page();
	}

	//메일발송 - 일괄
	//2016.03.28 수정
	function mailFormGroup(){
		var form = document.userForm;
		var chk = $("input:checkbox[name=msg_user]:checked");
		
		var usernoArr = new Array;
		$('input:checkbox[name=msg_user]').each(function(index, element) {
			var ischecked = $(this).is(':checked');
			if(ischecked) {
			 	usernoArr.push($(this).siblings("#userid").val());
			}
		});
		 
		$("#usernoArr").val(usernoArr);
		var specs = "left=10,top=10,width=980,height=800";
		specs += ",menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes";
		
		var mailpop = window.open("","mailform",specs); 
		
		form.method = "post";
		form.action = "/admin/common/mailForm.do";
		form.target = "mailform"; 
		form.submit();
		mailpop.focus();
	}

	//SMS발송 - 일괄
	//2016.03.28 수정
	function smsFormGroup(){
		var form = document.userForm;
		var chk = $("input:checkbox[name=msg_user]:checked");
		
		var usernoArr = new Array;
		var moblphonArr = new Array;
		var useridArr = new Array;
		$('input:checkbox[name=msg_user]').each(function(index, element) {
			var ischecked = $(this).is(':checked');
			if(ischecked) {
			 	usernoArr.push($(this).siblings("#userno").val());
			 	var tmpmob = $(this).siblings("#moblphon").val();
			 	var newtmpmob = tmpmob.replace(/-/g, "");
			 	moblphonArr.push(newtmpmob);
			 	useridArr.push($(this).siblings("#userid").val());
			}
		});
		 
		$("#usernoArr").val(usernoArr);
		$("#moblphonArr").val(moblphonArr);
		$("#useridArr").val(useridArr);
		
		var smspop = window.open("","smsform","width=520,height=650"); 

		form.method = "post";
		form.action = "/admin/common/smsForm.do";
		form.target = "smsform"; 
		form.submit();
		smspop.focus();
	}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">회원정보관리<span></span></div>

	<!-- 본문 > 상단 > 검색영역 시작 -->
	<form name="pform" action="/admin/user/userList.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${totalCount}"/>"/>
    <input type="hidden" name="listType" id="listType" value="LIST"/>
	<input type="hidden" name="useridArr" id="useridArr" value="">
	<table class="table-type1 search_form" summary="상상스토리 교육시스템 회원 검색입니다.">
		<thead>
			<colgroup>
			  	<col style="width:8%">
			  	<col style="width:42%">
			  	<col style="width:8%">
			  	<col style="width:42%">
			</colgroup>
		</thead>	
		<tbody>
			<tr>
				<th>회원구분</th>
				<td colspan="3">
					 <select name="mtGradeCode" id="mtGradeCode" title="회원구분" >
					 		<option value="">전체</option>
							<c:forEach items="${userGradeList}" var="result" varStatus="stat">
								<option value="<c:out value="${result.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtGradeCode eq result.MT_SUB_CODE}">selected="selected" </c:if>><c:out value="${result.MT_SUB_NAME}"/></option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>	
				<th>검색</th>
				<td>
			  		<select name="searchMode" title="검색옵션">
			  			<option value="">선택</option>
			  			<option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if> value="userId">아이디</option>
		                <option <c:if test="${REQUEST_DATA.searchMode eq 'userName' || REQUEST_DATA.searchMode eq ''}">selected="selected" </c:if> value="userName">이름</option>
			  			<option <c:if test="${REQUEST_DATA.searchMode eq 'mobile'}">selected="selected" </c:if> value="mobile">휴대폰번호</option>
			  			<option <c:if test="${REQUEST_DATA.searchMode eq 'email'}">selected="selected" </c:if> value="email">이메일</option>
			  			<option <c:if test="${REQUEST_DATA.searchMode eq 'officeName'}">selected="selected" </c:if> value="officeName">지점</option>
		            </select>
	            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();" />
				</td>
				<th>가입일</th>
				<td>
					<span id="dateSelect">
					<input type="text" class="line" name="sdate" id="sdate" value="<c:out value="${REQUEST_DATA.sdate}"/>" readonly="readonly" style="width: 75px;"/>
					 	<a href="#" onclick="$('#sdate').focus(); return false;" class="">
					 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
					 	</a>
					~
					<input type="text" class="line" name="edate" id="edate" value="<c:out value="${REQUEST_DATA.edate}"/>" readonly="readonly" style="width: 75px;"/>
						<a href="#" onclick="$('#edate').focus(); return false;" class="">
							<img src="/admin/images/btn_calendar.png" alt="가입기간 종료일">
						</a>
					</span> 
				</td>	
				
			  </tr>
		</tbody>
	</table>
	
	<div class="button_top">
		<a href="#" onclick="list_page();" class="btn search brown">검색</a>
	</div>
	
	</form>
	<!-- 본문 > 상단 > 검색영역 끝 -->

	<!-- 본문 > 메인 > 서브   영역 시작 -->
	<table width="100%" class="btn_Group" summary="상상스토리 교육시스템 회원 목록입니다.">
		<tbody>
	  		<tr>
	   			<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" />/<fmt:formatNumber value="${totalUserCount}" groupingUsed="true" /></span> 건</td></td>
	   			<td align="right">
					<a href="#" onclick="mailFormGroup(document.userForm);" class="btn sky">메일발송</a>
 					<a href="#" onclick="smsFormGroup(document.userForm);" class="btn sky">SMS발송</a>
 					<a href="#" onclick="goExcel();" class="btn sky">엑셀다운로드</a>		        
 				</td>
	  		</tr>
	 	</tbody>
	</table>
	<!-- 본문 > 메인 > 목록 시작  -->
	<form name="userForm" action="user.do" method="post">
	<input type="hidden" name="usernoArr" id="usernoArr" value="">
	<input type="hidden" name="moblphonArr" id="moblphonArr" value="">
	<input type="hidden" name="useridArr" id="useridArr" value="">
	<table class="tb table-type1">
		<colgroup>
			<col align=middle width="4%">
			<col align=middle width="4%">
			<col align=middle width="8%">
			<col align=middle width="8%">
			<col align=middle width="9%">
			<col align=middle width="9%">
			<col align=middle width="12%">
<!-- 			<col align=middle width="12%"> -->
			<col align=middle width="10%">
			<col align=middle width="6%">
		</colgroup>	
		<thead>
			<tr class="rndbg">
				<th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"  onclick="MsgUserAllCheck();"/></th>
				<th>NO</th>
				<th>회원구분</th>
				<th>지점</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
<!-- 				<th>휴대폰번호</th> -->
				<th>가입일시</th>
				<th>강사여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
					<td><input type="checkbox" name="msg_user" id="msg_user"  value="${result.EMAIL}"/><input type="hidden" id="userid" value="${result.USERID }"/><input type="hidden" id="moblphon" value="${result.MOBLPHON }"/><input type="hidden" id="userno" value="${result.USERNO }"/></td> 
					<td><c:out value='${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td> 
					<td><c:out value='${result.MT_GRADE_NAME}'/></td>
					<td><c:out value='${result.MT_OFFICE_NAME}'/></td>
					<td><c:out value='${result.USERID}'/></td>
					<td><a href="#" onclick="user_form('${result.USERNO}');"><b><c:out value='${result.USERNAME}'/></b></a></td>
					<td>
					<c:out value="${fn:substring(result.BRTHDY, 0, 4)}"/>.<c:out value="${fn:substring(result.BRTHDY, 4, 6)}"/>.<c:out value="${fn:substring(result.BRTHDY, 6, 8)}"/>
					
					<%--  <c:out value='${result.BRTHDY}'/>  --%>
					
					</td>
<%-- 					<td><c:out value='${result.MOBLPHON}'/></td>	 --%>	
					<td><c:out value='${result.WRITE_DATE}'/></td>
					<td><c:out value='${result.TUTOR_NAME}'/></td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
	</form>
	<!-- 본문 > 메인 > 목록 끝 -->
	<br/>
	<!-- 페이징, 버튼 영역 -->
    <c:if test="${not empty resultList}">
         <div class="admin-paging paging_wrap">
             <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
         </div>
     </c:if>
	<!-- // 페이징, 버튼 영역 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	