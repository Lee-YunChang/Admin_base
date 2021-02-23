<%
/****************************************************
    system	: 회원관리 > 기업정보관리
    title	: 기업정보관리
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

$(document).ready(function() {
    $("#isall").click(function() {
        // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
        if($(this).is(':checked')) {
            $("input[name=comInfo]").attr('checked','checked');
          } else {
              $("input[name=comInfo]").prop("checked", false);
          }
    });

});

// 페이징
function move_page(cPage){
    var frm = document.pform;
     frm.pageMode.value = '<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_LIST"))%>';
    $("input[name='cPage']").val(cPage);
    $("form[name='pform']").attr("method", "post").attr("action", "/admin/user/companyList.do").submit();
}

//검색
function list_page(){
    var frm = document.pform;
    frm.pageMode.value = '<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_LIST"))%>';
    $("input[name='cPage']").val('1');
    $("form[name='pform']").attr("method", "post").attr("action", "/admin/user/companyList.do").submit();
}

//등록
function company_form(){
    var frm = document.pform;
    $("form[name='pform']").attr("method", "post").attr("action", "/admin/user/companyForm.do").submit();
}

//등록페이지
function form_page() {
    var frm = document.pform;
    frm.pageMode.value = '<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_REG"))%>';
    frm.qu.value = 'insert';
    $("form[name=pform]").attr("method", "post").attr("action", "/admin/user/companyForm.do").submit();
}
//상세보기
function view_page(comno) {
    var frm = document.pform;
    frm.pageMode.value = '<%=StringUtil.getContent(SangsProperties.getProperty("Globals.PAGE_MODE_MOD"))%>';
    frm.qu.value = 'update';
    frm.comno.value = comno;
    $("form[name=pform]").attr("method", "post").attr("action", "/admin/user/companyForm.do").submit();
}

function chkEnter(){
    if (event.keyCode==13) list_page();
}

// 일괄 승인
function allApproval() {
    var form =document.pform;
    var chk = $("input:checkbox[name=comInfo]:checked");
    var chklen = $("input:checkbox[name=comInfo]:checked").length;

    if(chklen < 1 ){
        alert('승인할 업체를 선택해주세요.');
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
    if(confirm('일괄 승인하시겠습니까?')){
        $.ajax({
            url : '/admin/user/companyApproval.do',
            data : {chk:chkVal},
            dataType : 'json',
            type : 'get',
            async: 'false',
            success : function(result) {
                if(result == true) {
                    alert('승인되었습니다.');
                    $("#statusGb option:selected").val('');
                    $("form[name=pform]").attr("method", "post").attr("action", "/admin/user/companyList.do").submit();
                }

                else alert('승인에 실패하였습니다. 다시 시도해주세요.');
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });
    }
}

function goExcel(){
    $("input[name=listType]").val('EXCEL');
    $("form[name=pform]").attr("method", "post").attr("action", "/admin/user/companyList.do").submit();
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">기업정보관리<span></span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/user/company.do" method="post">
     <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
    <input type="hidden" name="total" id="total" value="<c:out value="${resultList[0].TOTAL_CNT}"/>"/>
    <input type="hidden" name="listType" id="listType" value="LIST"/>
    <input type="hidden" name="comno" id="comno" value=""/>
    <input type="hidden" name="pageMode" id="pageMode" value=""/>
    <input type="hidden" name="qu" id="qu" value=""/>

    <table class="table-type1 search_form">
        <colgroup>
            <col style="width:8%">
              <col style="width:92%">
        </colgroup><tbody>
        <tr>
            <th>분류</th>
            <td>
                <input type="radio" name="comRegGb" value="" <c:if test="${REQUEST_DATA.comRegGb eq '' || REQUEST_DATA.comRegGb eq null}"> checked="checked"</c:if> /> 전체
                <input type="radio" name="comRegGb" value="1" <c:if test="${REQUEST_DATA.comRegGb eq '1'}"> checked="checked"</c:if>/> 공공기관
                <input type="radio" name="comRegGb" value="2" <c:if test="${REQUEST_DATA.comRegGb eq '2'}"> checked="checked"</c:if>/> 단체
            </td>
         </tr>
         <tr>
            <th>검색</th>
            <td colspan="3">
                  <select name="searchMode" title="검색옵션" style="width: 100px;">
                      <option value="">선택</option>
                      <option <c:if test="${REQUEST_DATA.searchMode eq 'comName'}">selected="selected" </c:if> value="comName">기관/단체명</option>
                      <option <c:if test="${REQUEST_DATA.searchMode eq 'empNm'}">selected="selected" </c:if> value="empNm">담당자</option>
                </select>
            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" OnKeyPress="chkEnter();"/>
            </td>

          </tr>
        </tbody>
    </table>
    <div class="button_top">
        <a href="#" onclick="list_page();" class="btn search brown">검색</a>
    </div>
     <!-- 본문 > 상단 > 검색영역 끝 -->

    <!-- 본문 > 메인 > 서브   영역 시작 -->
    <table width="100%" class="btn_Group">
        <tbody>
            <tr>
                <td class="pageinfo">조회건수 <span class="red"><fmt:formatNumber value="${resultList[0].TOTAL_CNT}" groupingUsed="true" /></span> 건</td>
                <td align="right">
                    <!-- <a href="#" onclick="allApproval();return false;" class="btn sky">기업일괄승인</a> -->
                    <a href="#" onclick="popup3('/admin/user/companyExcelForm.do',700,300,1,1);" class="btn blue">신규기업 엑셀등록</a>
                    <a href="#" onclick="form_page();return false;" class="btn blue">신규등록</a>
                    <a href="#" onclick="goExcel();" class="btn down sky">엑셀다운로드</a>
                </td>
            </tr>
        </tbody>
    </table>
    <!-- 본문 > 메인 > 서브   영역 끝 -->

    <table class="tb table-type1">
        <colgroup>
        	<col align=middle width="4%">
			<col align=middle width="8%">
			<col align=middle width="*">
			<col align=middle width="8%">
			<col align=middle width="10%">
        </colgroup>
        <thead>
            <tr class="rndbg">
                <th>NO</th>
                 <th>분류</th>
                <th>회사명</th>
                <th>담당자</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="result" items="${resultList}" varStatus="status">
                <tr align=middle  onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
                    <td><c:out value='${resultList[0].TOTAL_CNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
                    <td>
                        <c:if test="${result.COM_REG_GB == '1'}">공공기관</c:if>
                        <c:if test="${result.COM_REG_GB == '2'}">단체</c:if>
                    </td>
                    <td align="left"><a href="#" onclick="view_page('${result.COMNO}');return false;" ><b><c:out value='${result.COMNAME}' escapeXml="xml"/>
                        <c:if test="${result.COMNAME == ''}">-</c:if>
                    </b></a>
                    </td>
                    <td><c:out value="${result.REGNM}"/></td>
                    <td><c:out value="${result.REGDATE}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </form>
    <!-- 본문 > 메인 > 목록 끝 -->
    <c:if test="${not empty resultList}">
         <div class="admin-paging paging_wrap">
             <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTAL_CNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
         </div>
     </c:if>
    <!-- // 페이징, 버튼 영역 -->

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>