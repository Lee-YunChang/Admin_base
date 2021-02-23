<%
	/****************************************************
	system	: 게시판
	title	: 등록 폼
	summary	:
	wdate	: 2016-05-25
	writer	: 
	*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

    function go_reg(){
    	var form = document.form;
    		$("#pageMode").val("insert");
    		$("#qu").val("insert");
    		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    		form.content.value = document.getElementById("content").value;
    		 //내용
    		var str=form.content.value;
    		
    		str = str.replace(/&nbsp;/g,"");
    		str = str.replace(/<p>/g,"");
    		str = str.replace(/<\/p>/g,"");
    		str = str.replace(/\r\n/g,"");
    		if(str.length<=0) {
    			alert("내용을 입력해 주세요.");
    			return false;
    		}
			$("#pform").attr("action", "/admin/site/annualScheduleExec.do");
			if(confirm("저장하시겠습니까?")) {
	        	form.submit();
			}
		}
    
    function go_update(){
    	var form = document.form;
    		$("#pageMode").val("update");
    		$("#qu").val("update");
    		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    		form.content.value = document.getElementById("content").value;
    		 //내용
    		var str=form.content.value;
    		
    		str = str.replace(/&nbsp;/g,"");
    		str = str.replace(/<p>/g,"");
    		str = str.replace(/<\/p>/g,"");
    		str = str.replace(/\r\n/g,"");
    		
    		if(str.length<=0) {
    			alert("내용을 입력해 주세요.");
    			return false;
    		}
			$("#pform").attr("action", "/admin/site/annualScheduleExec.do");
			if(confirm("저장하시겠습니까?")) {
	        	form.submit();
			}
		}
     
    
</script>
<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"><c:out value="${titleMap.TITLENAME}"/> 연간일정관리 <span>사이트 게시물을 관리합니다.</span></div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="pform" action="" method="post">
	<input type="hidden" name="bcateno" id="bcateno" value="10"/>
    <input type="hidden" name="qu" id="qu" value=""/>
    <input type="hidden" name="bbsNo" value="<c:out value="${map.BBSNO}"/>"/>
	<input type="hidden" name="title" id="title" value="연간일정관리">
	<input type="hidden" name="pageMode" id="pageMode" value=""/>
		
    <c:set var="bbsGuide"><%=SangsProperties.getProperty("Globals.bbsBcateSiteGuide")%></c:set>
	
    <table class="table-type1 search_form">
      <colgroup>
          <col class="cellc" width="100%">
      </colgroup>  
      <tr>
         <td style="padding:20px 10px 20px 10px;" colspan="3">
               <div>
                   <textarea name="content" id="content" rows="40" style="width:100%;" ><c:out value="${map.CONTENT}" escapeXml="false"/></textarea>
               </div>
         </td>
        </tr>
    </table>
<div class="button" style="text-align:center;">
    <c:if test="${map.BBSNO eq null}">
	  	<a href="#" onclick="go_reg(); return false;" class="btn green big">등록</a>
  	</c:if>
	<c:if test="${map.BBSNO ne null}">
	    <a href="#" onclick="go_update(); return false;" class="btn green big">수정</a>
    </c:if>
   		<a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

</script>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%> 