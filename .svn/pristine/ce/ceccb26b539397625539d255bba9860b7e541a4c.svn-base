 
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
		// 마지막 접속일 달력
		$("#loginDateSdate").datepicker(dateFormat);
		$("#loginDateEdate").datepicker(dateFormat);
		// 메일 발송일 달력
		$("#secsnMailYnSdate").datepicker(dateFormat);
		$("#secsnMailYnEdate").datepicker(dateFormat);
	});

	// 페이지 이동
	function move_page(cPage){
 		$("input[name=cPage]").val(cPage);
 		$("input[name=listType]").val('LIST');
		$("form[name=pform]").attr("method", "post").attr("action", "/admin/user/userMngList.do").submit();
	}

	// 조회
	function list_page(){
		$("input[name='cPage']").val('1');
		$("input[name='listType']").val('LIST');
		$("form[name='pform']").attr("method", "post").attr("action", "/admin/user/userMngList.do").submit();
	} 

	//메일발송 - 일괄
	//2016.03.28 수정
	function mailFormGroup(){
		var form = document.userForm;
		var chk = $("input:checkbox[name=msg_user]:checked");
		
		$('#secsnMailYn').val('Y');//회원운영관리 > 메일발송
		
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
 
	//회원탈퇴
	function withdraw(){
		var chk = $("input:checkbox[name=msg_user]:checked");
		
		var usernoArr = new Array;
		$('input:checkbox[name=msg_user]').each(function(index, element) {
			var ischecked = $(this).is(':checked');
			if(ischecked) {
			 	usernoArr.push($(this).siblings("#userid").val());
			}
		});
		 
		var successChk = 0;
		if(usernoArr.length > 0){
			$("#usernoArr").val(usernoArr); 
			if(confirm('선택한 회원을 탈퇴시키겠습니까?')){
				for(var i = 0 ; i < usernoArr.length ; i ++ ){
					successChk++;
					$.ajax({
			            url : "/admin/user/withdrawAjax.do",
			            data : { userId : usernoArr[i], mtSecsnCode : 'PC0004' },
			            dataType : "json",
			            type : 'post', 
			            error : function(e) {
			                alert("error :" + e.responseText);
			            }
			        });
				}
			}
		} else {
			alert('회원을 선택하여 주세요.')
		}
		
		if(successChk > 0){
			alert('선택한 회원이 탈퇴되었습니다.');
			location.reload();
		}
	}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">회원운영관리<span></span></div>

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
			  	<col style="width:92%"> 
			</colgroup>
		</thead>	
		<tbody>
			<tr>
				<th>마지막 접속일</th>
				<td>
					<span id="dateSelect">
					<input type="text" class="line" name="loginDateSdate" id="loginDateSdate" value="<c:out value="${REQUEST_DATA.loginDateSdate}"/>" readonly="readonly" style="width: 75px;"/>
					 	<a href="#" onclick="$('#loginDateSdate').focus(); return false;" class="">
					 		<img src="/admin/images/btn_calendar.png" alt="마지막 접속일 시작">
					 	</a>
					~
					<input type="text" class="line" name="loginDateEdate" id="loginDateEdate" value="<c:out value="${REQUEST_DATA.loginDateEdate}"/>" readonly="readonly" style="width: 75px;"/>
						<a href="#" onclick="$('#loginDateEdate').focus(); return false;" class="">
							<img src="/admin/images/btn_calendar.png" alt="마지막 접속일 종료">
						</a>
					</span> 
				</td>	
			</tr>
			<tr>
				<th>메일 발송일</th>
				<td>
					<span id="dateSelect">
					<input type="text" class="line" name="secsnMailYnSdate" id="secsnMailYnSdate" value="<c:out value="${REQUEST_DATA.secsnMailYnSdate}"/>" readonly="readonly" style="width: 75px;"/>
					 	<a href="#" onclick="$('#secsnMailYnSdate').focus(); return false;" class="">
					 		<img src="/admin/images/btn_calendar.png" alt="가입기간 시작일">
					 	</a>
					~
					<input type="text" class="line" name="secsnMailYnEdate" id="secsnMailYnEdate" value="<c:out value="${REQUEST_DATA.secsnMailYnEdate}"/>" readonly="readonly" style="width: 75px;"/>
						<a href="#" onclick="$('#secsnMailYnEdate').focus(); return false;" class="">
							<img src="/admin/images/btn_calendar.png" alt="가입기간 종료일">
						</a>
					</span> 
				</td>	
			</tr> 
			<tr>	
				<th>검색</th>
				<td>
			  		<select name="searchMode" title="검색옵션">
			  			<option value="">선택</option>
			  			<option <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected="selected" </c:if> value="userId">아이디</option>
		                <option <c:if test="${REQUEST_DATA.searchMode eq 'userName' || REQUEST_DATA.searchMode eq ''}">selected="selected" </c:if> value="userName">이름</option>
		            </select>
	            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();" />
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
	   			<td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${totalCount}" groupingUsed="true" /></span> 건</td></td>
	   			<td align="right">
					<a href="#" onclick="mailFormGroup(document.userForm);" class="btn sky">메일발송</a>
 					<a href="#" onclick="withdraw()" class="btn sky">회원탈퇴</a>
 				</td>
	  		</tr>
	 	</tbody>
	</table>
	
	<!-- 본문 > 메인 > 목록 시작  -->
	<form name="userForm" action="user.do" method="post">
	<input type="hidden" name="usernoArr" id="usernoArr" value="">
	<input type="hidden" name="moblphonArr" id="moblphonArr" value="">
	<input type="hidden" name="useridArr" id="useridArr" value="">
	<input type="hidden" name="secsnMailYn" id="secsnMailYn" value=""/>
	<table class="tb table-type1">
		<colgroup>
			<col align=middle width="4%">
			<col align=middle width="4%">
			<col align=middle width="8%">
			<col align=middle width="20%">
			<col align=middle width="20%">
			<col align=middle width="22%">
			<col align=middle width="22%">
		</colgroup>	
		<thead>
			<tr class="rndbg">
				<th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"  onclick="MsgUserAllCheck();"/></th>
				<th>NO</th>
				<th>회원분류</th>
				<th>아이디</th>
				<th>이름</th>
				<th>마지막 접속일시</th>
				<th>메일 발송일시</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
					<td><input type="checkbox" name="msg_user" id="msg_user"  value="${result.EMAIL}"/><input type="hidden" id="userid" value="${result.USERID }"/><input type="hidden" id="moblphon" value="${result.MOBLPHON }"/><input type="hidden" id="userno" value="${result.USERNO }"/></td> 
					<td><c:out value='${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td> 
					<td><c:out value='${result.MT_GRADE_NAME}'/></td>
					<td><c:out value='${result.USERID}'/></td>
					<td><c:out value='${result.USERNAME}'/></td>
					<td><c:out value='${result.LOGIN_DATE}'/></td>
					<td><c:out value='${result.REC_DATE}'/></td>
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