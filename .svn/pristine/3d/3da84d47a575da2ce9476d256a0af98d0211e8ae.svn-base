<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
		
<c:choose>
	<c:when test="${pageMode == 'reg'}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<script type="text/javascript" src="/admin/common/js/cate.js"></script>

<script type="text/javascript">
 
//등록실행 체크 
function writeFormCheck(){ 
	var form = document.pform;
	if (form.fileUpload.value) {
		var msg = '${titleMode}';
	    if(confirm("기존에 등로된 차시정보가 있으면 삭제후 등록됩니다.\n" + msg + ' 하시겠습니까?')){
			form.target = '';
			form.submit();
			
			//opener.location.reload();
			//window.close();
		}
	} else {
		alert('선택한 파일이 없습니다.');
	}
}

$(document).ready(function(){
});

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">콘텐츠관리 > XML 업로드<span>xml 메타정보로부터 PC용 차시구성을 자동으로 생성합니다.</span></div>

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/course/treeUploadExec.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="UPLOAD_DIR" value="${REQUEST_DATA.courseno}"/>
<br/>
<div class="tb_title">콘텐츠 관리</div>
<p style="padding-left:10px;"><font class=extext>※ xml 메타정보로 PC 차시구성을 자동으로 생성합니다.</font></p>
<p style="padding-left:10px;"><font class=extext>※ xml 파일 업로드 후 FTP로 플래시 파일 업로드를 진행해야 합니다.</font></p>
<p style="padding-left:10px;"><font class=extext>※ xml 파일 업로드 후 차시 구성이 불가합니다.</font></p>
<br/>
<br/>

<div class="tb_title">웹 콘텐츠</div>
<div style="padding:8px;/*border:1px solid gray*/">
<!-- <p style="padding-left:10px;"><font class=extext>imsmanifest.xml 파일를 업로드 합니다.</font></p>
<br/><br/> -->
<table class="table-type1 search_form">
	<colgroup>
		<col class=cellc width="15%"> 
		<col class=celll width="*">
	</colgroup>
		<tbody>
			<tr>
				<th>XML 파일</th>
				<td>
					<input type="file" name="fileUpload"> 
				</td>
			</tr>
		</tbody>
</table>
</div>


</form>
<br/>


<br/><br/>

<div class="button" align="center">
	<c:choose>
	<c:when test="${pageMode == 'reg'}">
		<a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
	</c:when>
	<c:otherwise>
		<a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>      
	</c:otherwise>
	</c:choose>
	<a href="#" onclick="window.close();" class="btn big gray">취소</a> 
</div>

<!-- 본문 > 메인 > 목록 끝 -->
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>