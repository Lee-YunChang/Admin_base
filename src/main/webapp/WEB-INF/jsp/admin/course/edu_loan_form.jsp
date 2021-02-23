<%
/****************************************************
    system	: 과정관리 > 과정정보관리
    title	: 교육과정 등록/수정 양식
    summary	:
    wdate	: 2016-04-18
    writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>
<!-- 본문 > 메인 > 목록 끝 -->

<script id="itemTpl" type="text/template">
<p style="height: 30px;">{{=name}} / {{=kndnm}} <a class='scale-down btn red small fnDel' value="{{=ukey}}" title='삭제'>삭제</a></p>

</script>
<script type="text/javascript">
var loanList = [];
$(document).ready(function(){
	<c:forEach var="result" items="${loans}" varStatus="status">
		var data = {}
		data.ukey = '<c:out value="${result.LOAN_PRD_GRP}"/><c:out value="${result.LOAN_PRD_CODE}"/><c:out value="${result.LOAN_USE_CODE}"/>';
		data.pcode = '<c:out value="${result.LOAN_PRD_GRP}"/>';
		data.code = '<c:out value="${result.LOAN_PRD_CODE}"/>';
		data.name = '<c:out value="${result.GDNM}"/>';
		data.knd = '<c:out value="${result.LOAN_USE_CODE}"/>';
		data.kndnm = '<c:out value="${result.FND_KND_NM}"/>';
		loanList.push(data);
		
		
	</c:forEach>
	
	
	$('#loanArea').empty();
	
	 _.each(loanList, function(item, i){
		 $('#loanArea')
  		.append(_.template($('#itemTpl').html())(
				{
					ukey:item.ukey,
              		name:item.name,
              		kndnm:item.kndnm
				}
		));
	 });
	 
	 
	 
	 $('body').on('click','.fnDel', function(e){
		 var delKey = $.trim($(this).attr('value'));
		 
		 loanList = _.filter(loanList, function(item) {
				return (item.ukey != delKey);
		});
		 
		 $(this).parents('p').remove(); 
		 
		 console.log(JSON.stringify(loanList));	
		 console.log(loanList.length);
		 
	 });
	
	
});

function goSubmit(){
	if(confirm('저장하시겠습니까?')){
		$('#jsonParam').val(JSON3.stringify(loanList));
		$('#pform').attr('action', 'eduLoanExec.do').submit();	
	}
}

function addSelectLoan(list){
	 _.each(list, function(item, i){
		 loanList.push(item);
	 });
	loanList = _.uniq(loanList, function(item, i){
		return item.ukey; 
	}); 
	
	console.log(JSON.stringify(loanList));	
	console.log(loanList.length);
	
	
	$('#loanArea').empty();
	
	 _.each(loanList, function(item, i){
		 $('#loanArea')
 		.append(_.template($('#itemTpl').html())(
				{
					ukey:item.ukey,
              		name:item.name,
              		kndnm:item.kndnm
				}
		));
	 });
}
    
</script>



<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/eduLoanExec.do" method="POST">
<input type="hidden" id="edu_loan_seq" name="edu_loan_seq" value="${result.EDU_LOAN_SEQ }"/>
<input type="hidden" id="jsonParam" name="jsonParam" value=""/>


<table class="table-type1 search_form">
    <colgroup>
      <col class="cellc" width="8%">
	  <col class="celll" width="42%">
	  <col class="cellc" width="8%">
	  <col class="celll" width="42%">
    </colgroup>
    <tbody>
    
    
        <tr>
           <th>과목명</th>
			<td colspan="3">
				<input type="text" class="line" id="edu_loan_name" name="edu_loan_name" style="width:400px" title="과목명" value="<c:out value="${result.EDU_LOAN_NAME}"/>"/>				
 			</td>
        </tr>
        <tr>
        	<th>의무구분</th>
			<td colspan="3">
				<input type="radio" name="duty_gbn" value="HOUR" title="의무과정" <c:if test="${result.DUTY_GBN == 'HOUR'}">checked="checked"</c:if>> 대출의무기준과목수 &nbsp;&nbsp;&nbsp;
            	<input type="radio" name="duty_gbn" value="COMP"  title="의무수료" <c:if test="${result.DUTY_GBN == 'COMP'}">checked="checked"</c:if>> 의무교육수료(1과정이상)
 			</td>
        </tr>
        <tr>
            <th>수료과정</th>
            <td colspan="3">
            	<input type="text"  class="line i-numOnly" name="duty_hour" id="duty_hour" title="의무과정수" value="<c:out value="${result.DUTY_HOUR}"/>" maxlength="2"/> 과정
            </td>
        </tr>
         <tr>
           <th>대출상품</th>
			<td>
			<div id="loanArea">
			</div>
			<br />
			<div>
 				<a href="#" onclick="popup3('/admin/course/loanGoods.do',600,600,1);" class="btn small green">조회</a>
 				</div>
 			</td>
        </tr>
        <tr>
            <th>교육방법</th>
            <td colspan="3">
                <textarea rows="4" name="etc"  id="etc"  style="width:100%;"><c:out value="${result.ETC}"/></textarea>
            </td>
        </tr>
        <tr>
        	<th>사용여부</th>
            <td colspan="3">
            	<input type="radio" name="use_yn" value="Y" <c:if test="${result.USE_YN ne 'N'}">checked="checked"</c:if>>사용&nbsp;&nbsp;&nbsp;
            	<input type="radio" name="use_yn" value="N" <c:if test="${result.USE_YN eq 'N'}">checked="checked"</c:if>>사용안함
            </td>
        </tr>
    </tbody>
</table>
<div class="button">
	<a href="#none" onclick="goSubmit(); return false;" class= "btn big blue">저장</a>
    <a href="#none" onclick="history.back()" class="btn big gray">취소</a>
</div>
</form>


<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>	