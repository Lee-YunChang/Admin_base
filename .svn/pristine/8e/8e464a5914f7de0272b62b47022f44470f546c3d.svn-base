<%
/****************************************************
    system	: 결제관리 > 대상자관리 > 대상자선정 팝업
    title	: 대상자선정 팝업
    summary	:
    wdate	: 2016-05-12
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function() {

	$('div.title').text(opener.seq_title + ' > 수강생(비회원) 등록');
	
    $("#isall").click(function() {
        // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
        if($(this).is(':checked')) {
            $("input[name=userno]").attr('checked','checked');
          } else {
              $("input[name=userno]").prop("checked", false);
          }
    });
    
    $("table input[type=checkbox]").change(function(){
        var checked_user_cnt = $('table input[name=userno]:checked').length;
        $('#checked_user').text(checked_user_cnt);
    });

});

function enterChk(){
    if (event.keyCode==13) list_page();
}

//검색
function list_page(){
    var frm = document.pform;
	$("#pform").attr("action", "/admin/payment/nmberList.do");
    frm.cPage.value = 1;
    frm.submit();
}


//페이징
function move_page(cPage){
    var frm = document.pform;
    frm.cPage.value = cPage;
    $("#pform").attr("action", "/admin/payment/nmberList.do");
    frm.submit();
}

//선착순선발
function goGroupExec(){
	var selectCnt = $('#selectCnt').val();
	if (selectCnt > 0 && confirm(selectCnt + '명의 인원을 신청일 빠른순으로\n선착순 설발 하시겠습니까?')) {
		
		var frm = document.pform;
		$("#pform").attr("action", "/admin/payment/payApprovalGroup.do");
		frm.submit();
	}
}

//일괄 승인
function goExec(targetYn) {
    //var form =document.pform;
    var chk = $("input:checkbox[name=cuserno]:checked");
    var chklen = $("input:checkbox[name=cuserno]:checked").length;

    if(chklen < 1 ){
        alert('대상자를 선택해주세요.');
        return ;
    }
    var chkVal="";
    for (var i=0; i< chklen; i++){
        if (chk[i].checked){
               var checkValue = chk[i].value;
              chkVal = chkVal +checkValue+ ",";
         }
     }
    chkVal = chkVal.substr(0, chkVal.length-1);
    //alert(chkVal);

    var msg = '';
    if(targetYn == 'Y') msg = '대상자로 등록 하시겠습니까?';
    else msg = '대상자를 취소 하시겠습니까?';

    if(confirm(msg)){
        $.ajax({
            url : "/admin/payment/payApproval.do",
            data : {subcmd:"approval", chk:chkVal, targetYn:targetYn, cseqno:$("#cseqno").val()},
            dataType : "json",
            type : 'get',
            async: "false",
            success : function(result) {
                if(result == true) {
                	
                    //alert("승인되었습니다.");
                    //form.subcmd.value = 'user_list';
                    //form.submit();

                    var remsg = "";
                    if(targetYn == 'Y') remsg = '등록되었습니다.';
                    else remsg = '취소되었습니다.';
                    alert(remsg);

                    opener.location.reload(); //부모창 새로고침
                    window.close();

                }

                else alert('실패하였습니다. 다시 시도해주세요.');
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });
    }
}

function applyUser(exec) {
	
	// exec가 Y이면 수강등록, N이면 수강취소
	
	var execFlag = false;
	
	if ($('input[name=userno]:checked').length > 0) {
		if (exec == 'Y') {
			if (confirm('선택된 인원을 수강등록 하시겠습니까?')) {
				execFlag = true;
			}
		} else {
			if (confirm('선택된 인원을 수강등록 취소하시겠습니까?')) {
				execFlag = true;
			}
		}
	} else {
		alert('인원을 선택하세요');
		return;
		
	}
	
	var duple = 'N';
	
	if (execFlag) {
		
		var param = {};
		var tmp = [];
		param.cseqno = $('input[name=cseqno]').val();
		
		$('input[name=userno]:checked').each(function(){
			if (exec == 'Y') {
				if($(this).attr('radio') == 'O'){
					duple = 'Y';
					return;
				}else {
					if ($(this).attr('currApply') == 'N') {
						// 현재 수강되어있지 않은 사람 수강신청
						tmp.push($(this).val());
					}
				}
			} else if (exec == 'N') {
				if ($(this).attr('currApply') == 'Y') {
					// 현재 수강되어있는 사람을 수강취소
					tmp.push($(this).val());
				}
			}
		});
		
		if(duple == 'Y'){
			alert("이미 수강등록 된 인원은 등록되지 않습니다.");
		}
		
		param.usernos = tmp.join(',');
		param.command = exec;
		
		$.ajax({
			url:'/admin/payment/applyUser.do'
			,type:'post'
			,data:param
			,dataType:'json'
			,success:function(data) {
				if (data.result == 'Ysuccess') {
					alert("신청 되었습니다.");
				} else if (data.result == 'Nsuccess'){
					alert("신청취소 되었습니다.");
				} else {
					alert("신청여부를 확인해주세요.");
				}
				location.reload();
			}
		});
		
	}
		
}


/* function excelSubmit(){
	var frm = document.pform;
	
	if(frm.excelFile.value =='' || frm.excelFile.value == null ){
		alert('엑셀파일을 선택해주세요.');
		return;
	}
	
	
	if (confirm('업로드 하시겠습니까?')) {
		frm.cPage.value = cPage;
	    $("#pform").attr("action", "/admin/payment/nmberExcelUpload.do");
	    frm.submit();	
	}
} */

function goExit() {
	opener.location.reload();
	window.close();
}

//회원 상세정보
function user_form(userNo){
	window.open("/admin/user/userForm.do?userNo="+userNo, "user_form", "width=800, height=700, scrollbars=yes");
}


//매뉴얼 다운로드
function sampleFileDown() {
    downManualDoc('nonmember_sample.xls', 'edu-data/download');
}

//엑셀다운로드
function goExcel(){
	$("input[name='listType']").val('EXCEL');
	$("form[name='pform']").attr("method", "post").attr("action", "/admin/user/nmberListExcel.do").submit();
}

</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">대상자선정<span></span></div>
    <form name="pform" id="pform" action="/admin/payment/userList.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
	<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>  
    <input type="hidden" name="cseqno" id="cseqno"	value="<c:out value="${REQUEST_DATA.cseqno}"/>">

      <!-- 본문 > 상단 > 검색영역 시작 -->
      <table class="table-type1 search_form">
        <colgroup>
            <col class="cellc" width="15%">
            <col class="celll" width="*">
        </colgroup>
        <tbody>
          <tr>
            <th>신청여부</th>
            <td>
            	<input type="radio" name="applyYn" id="applyYn" value="" <c:if test="${empty REQUEST_DATA.applyYn}"> checked="checked"</c:if>> &nbsp;전체&nbsp;&nbsp;
            	<input type="radio" name="applyYn" id="applyYn" value="Y" <c:if test="${REQUEST_DATA.applyYn == 'Y'}"> checked="checked"</c:if>> 신청&nbsp;&nbsp;  
            	<input type="radio" name="applyYn" id="applyYn" value="N" <c:if test="${REQUEST_DATA.applyYn == 'N'}"> checked="checked"</c:if>> 미신청
            </td>
        </tr>
        <tr>
            <th>검색</th>
            <td colspan="3">
                 <select name="searchType" id="searchType" title="검색">
                     <option <c:if test="${REQUEST_DATA.searchType == 'NAME'}"> selected="selected"</c:if> value="NAME">이름</option>
                     <%-- <option <c:if test="${REQUEST_DATA.searchType == 'ID'}"> selected="selected"</c:if> value="ID">아이디</option> --%>
                     <option <c:if test="${REQUEST_DATA.searchType == 'MOBILEPH'}"> selected="selected"</c:if> value="MOBILEPH">핸드폰번호</option>
                 </select>
                 <input type="text" class="line" id="searchWord" name="searchWord" style="width:150px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="enterChk();"/>
             </td>
        </tr>
        </tbody>
    </table>
    
    <div class="button_top"><a href="#" onclick="list_page();" class="btn search brown">조회</a></div>
    <!-- 본문 > 상단 > 검색영역 끝 -->

    <table width="100%" class="btn_Group">
        <tbody>
              <tr>
                 <td class="pageinfo">
                   		<%-- 조회건수 <span class="red"><c:out value="${fn:length(resultList)}"/></span> 건
                   		&nbsp;&nbsp;&nbsp; --%>
                   		선택 <span class="red" id="checked_user">0</span> 명
                 </td>
                 
                 <td align="right">
                 	<!-- <input type="file" name="excelFile" style="width:300px"/> -->
                 	<a href="#" onclick="popup3('/admin/payment/selectNmberListExcelForm.do',700,300,1,1);" class="btn red">엑셀 업로드</a>
		            <!-- <a href="#" onclick="excelSubmit();" class="btn red">엑셀업로드</a> -->
		            <a href="#" onclick="goExcel();" class="btn sky">엑셀다운로드</a>	
		        </td>
        
        
              </tr>
         </tbody>
    </table>

    <table class="table-type1" >
        <thead>
	        <tr>
	            <th><input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"/></th>
	            <th>No</th>
	            <th>회원분류</th>
	            <th>지점명</th>
	            <th>이름</th>
	            <th>생년월일</th>
	            <th>휴대폰번호</th>
	            <th>신청여부</th>
	        </tr>
        </thead>
        
        <colgroup>

            <col class="cellc" width="5%">
            <col class="cellc" width="5%">
            <col class="cellc" width="15%">
            <col class="cellc" width="*">
            <col class="cellc" width="15%">
            <col class="cellc" width="10%">
            <col class="cellc" width="15%">
            <col class="cellc" width="8%">

        </colgroup>
        
        <tbody>
            <c:forEach var="result" items="${resultList}" varStatus="status">
	            <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
	
	                <td><input type="checkbox" class="checkBox" name="userno" id="userno" value="${result.UNITY_MBERNO}" radio="${result.USEYN == 'Y' and fn:indexOf(result.CSEQNO, REQUEST_DATA.cseqno+'') > -1 ? 'O' : 'X'}"
	                 currApply="${result.USEYN == 'Y' and fn:indexOf(result.CSEQNO, REQUEST_DATA.cseqno+'') > -1 ? 'Y' : 'N'}"/></td>
	                <td><c:out value="${totalCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}"/></td>
	                <td><c:out value="${result.MT_GRADE_NAME}"/></td>
	                <td><c:out value="${result.MT_OFFICE_NAME}"/></td>
	                <td><a href="#" onclick="user_form('${result.UNITY_MBERNO}');"><b><c:out value="${result.MBERNM}"/></b></a></td>
	                <td><c:out value="${result.BRTHDY}"/></td>
					<td>${result.MOBLPHON}</td>
					<td>
						<c:choose>
							<c:when test="${result.USEYN == 'Y' and fn:indexOf(result.CSEQNO, REQUEST_DATA.cseqno+'') > -1}">신청</c:when>
							<c:otherwise>미신청</c:otherwise>
						</c:choose>
					</td>
	            </tr>
            </c:forEach>
        </tbody>
    </table>
    </form>

    <c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
	    </div>
	</c:if>
    <br/><br/>
    <div class="button" style="text-align:center;" >
        <a href="#" onclick="applyUser('Y');" class="btn blue big" style="padding-left:20px; padding-right:20px; margin:3px 5px">신청</a>
        <a href="#" onclick="applyUser('N');" class="btn orange big" style="padding-left:20px; padding-right:20px; margin:3px 5px">미신청</a>
        <a href="#" onclick="goExit();" class="btn gray big" style="padding-left:20px; padding-right:20px; margin:3px 5px">닫기</a>
    </div>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>