<%
/****************************************************
	system	: 과정진행관리 > 수강생정보관리 > 온라인학습
	title	: 수강생정보  
	summary	:	
	wdate	: 2016-05-12
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>
<script type="text/javascript"> 
//<![CDATA[
	
	$(document).ready(function() {
		
		$(".header-tab").each(function() {
			$(this).removeClass("on");
		});
		$("."+$("#subcmd").val()).each(function() {
			$(this).addClass("on");
			$(this).show("fast");
		});
		
		var ispassAt = true;
		$("[id='compExec']").each(function() {
     		if($(this).val() != '100') {
    			ispassAt = false;
    			return false;
    		}
    	});
		if(ispassAt && Math.ceil($("#avgPer").val()) == 100) $("#execBtn").hide();
		else $("#execBtn").show();
	});
     
     
    // 수료처리
	function go_exec() {
    	
		var checkVal = new Array(); 
    	var values = document.getElementsByName('studyCopmYn');

    	for(var i = 0; i<values.length; i++){
    		checkVal.push(values[i].value);
    	}
    	$("#values").val(checkVal);
    	
    	var ispassAt = "";
    	var treeInfo = "";
    	
     	$("[id='compExec']").each(function() {
     		if($(this).val() == '100') {
    			ispassAt = true;
    		}
    		else {
    			//ispassAt = false;
    			 return false;
    		}
    			
    	});
     	
     	var cnt = 0;
     	$("[id='compExec']").each(function() {
     		var treeno = $(this).attr("treeno");
     		var framecnt = $(this).attr("framecnt");
			
     		//if($(this).val() == '100') {
     			treeInfo = treeInfo + treeno+"|"+framecnt+",";
     			cnt = cnt+1;
     		//}
     	});
     	
     	$("#ispassAt").val(ispassAt); // 수료상태 변경하기 (true이면 수료로 변경 로직 실행 )
     	
     	treeInfo = treeInfo.substr(0, treeInfo.length-1);
     	$("#treeInfo").val(treeInfo); 

	    if(cnt > 0) {
	    	
			if(confirm("학습완료 상태를 저장하시겠습니까?\n이미 수료코드가 있는 회원은 재발급되니 다시 확인해 주세요.")) {	
				
				$.ajax({
					url : "/admin/study/cuserOnlineComp.do",
					data : $("#pform").serialize(),
					dataType : "json",
					type : 'get',
					async: "false",
					success : function(data) {
						if(data.result == 'success') {
							alert("수정되었습니다.");	
							location.reload();
							//opener.location.reload();
						}
						
						else alert("수정에 실패하였습니다. 다시 시도해주세요.");
					},
					error : function(e) {
						alert("error :" + e.responseText);
					}
				});	
			}
	     }
	     else alert("학습완료 상태값을 변경해주세요.");return;  
	}
	
//-->
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수강생정보관리<span>온라인학습</span></div>
<c:if test="${REQUEST_DATA.courseno > 0}">
	<jsp:include page="course_user_tab_inc.jsp"></jsp:include>
</c:if>
<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/study/onlineStudyView.do" method="POST">
<input type="hidden" name="subcmd" id="subcmd" value="<c:out value="${REQUEST_DATA.subcmd}"/>"/>
<input type="hidden" name="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="userNo" id="userNo" value="<c:out value="${REQUEST_DATA.userNo}"/>"/>
<input type="hidden" name="cuserno" id="cuserno" value="<c:out value="${REQUEST_DATA.cuserno}"/>"/>
<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
<input type="hidden" name="ispassAt" id="ispassAt" value=""/>
<input type="hidden" name="treeInfo" id="treeInfo" value=""/>

<input type="hidden" name="values" id="values" value=""/>

<input type="hidden" name="avgPer" id="avgPer" value="<c:out value="${prog.AVG_PER}" default="0"/>"/>
<div class="tb_title">진도정보</div>
<span>진도율 : <c:out value="${progressVal}" default="0"/>% | 최종학습일 : <c:out value="${maxEdate}"  default="- (미학습)"/></span>
<div class="space"></div><!-- 공백 default 5px -->
<table class="table-type1 search_form">
	<colgroup>
		<col class="cellc" width="8%">
		<col class="celll" width="*">
		<col class="cellc" width="12%">
		<col class="cellc" width="25%">
		<col class="celll" width="10%">
	</colgroup>
	<thead>
		<th>차시</th>
		<th>차시명</th>
		<th>학습페이지</th>
		<th>마지막학습시간</th>
		<th>학습완료</th>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
			<td><c:out value="${status.index + 1}" /></td>
			<td style="text-align:left;"><c:if test="${result.LEV==2}">&nbsp;&nbsp;&nbsp;</c:if><c:out value="${result.SUBJECT}" /></td>
			<td><c:out value="${result.FRAMESEQ}" /> / <c:out value="${result.FRAMECNT}"  /></td>
			<td><c:out value="${result.EDATE}" /></td>
			<td>
				<select name="studyCopmYn" id="compExec" treeno="<c:out value='${result.TREENO}'/>" framecnt="<c:out value='${result.FRAMECNT}'/>">
					<option value="0">미수료</option>
					<option value="<c:out value='${result.STUDYTIME}'/>" <c:if test="${result.MT_PROG_STATUS_NAME == '학습진행중'}">selected</c:if>>수강중</option>
					<option value="Y" <c:if test="${result.MT_PROG_STATUS_NAME == '학습완료'}">selected</c:if>>수료</option>
				</select>
				<input type="hidden" id="t_frameCnt" value="${result.FRAMECNT}"/>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<div class="button">
	<a href="#" onclick="go_exec();return false;" class="btn big orange">저장</a>  
	<a href="#" onclick="window.close();" class="btn big gray">닫기</a>
</div>
</form>
<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>