<%/****************************************************
system	: QNA게시판 등록/수정 폼
title	: QNA게시판 등록/수정 폼
summary	:
wdate	: 2013.07.09
writer	: 심위보
*****************************************************/%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="java.util.List"%>
<%@ page import = "com.sangs.util.StringUtil" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.sangs.support.SangsProperties" %>
<%
	DataMap requestMap = (DataMap)request.getAttribute("REQUEST_DATA"); 
	requestMap.setNullToInitialize(true);

	int cPage = requestMap.getInt("cPage");
	String pbcateno = requestMap.getString("pbcateno");
	
	EduMap map = (EduMap)request.getAttribute("VIEW_DATA"); 
	if(map == null) map = new EduMap();
	
	List typeList = (List)request.getAttribute("CATEGORY_DATA"); 
	List fileList = (List)request.getAttribute("FILE_LIST");
	
	
	EduMap titleMap = new EduMap();
	if(typeList.size() > 0){
		titleMap = (EduMap)typeList.get(0);
	}
	
	String title = map.getString("TITLE");
	if(requestMap.getString("qu").equals("reply")){
		title = "[RE]"+ title;
	}

	// 에디터 관련 선언
	//에디터업로드 이미지 경로 선언 
	String webEditPath=SangsProperties.getProperty("Globals.bbsFilePath");
	com.ckeditor.CKEditorConfig ckeditorSettings = com.sangs.util.CKEditorUtil.getCKEditorConfig(webEditPath);
%>

<!--  에디터 로드 -->
<c:set var="ckeditorSettings" value="<%=ckeditorSettings%>"/>
<script type="text/javascript">
	function go_list(){
		var form = document.forms[0];
		//form.action = '/academy/community/bbs.do';
		form.subcmd.value = 'list';
		form.submit();	
	}
	
	function go_exec(){
	
		var form = document.form;

		if(form.title.value == ''){
			alert("제목을 입력해 주세요.");
			return;
		}
		
		// 삭제 대상 첨부파일 번호 set
		form.delCheckFile.value = "";
		if(form.delFileChk) {
			if(!form.delFileChk.length) {
				 if(form.delFileChk.checked)
					 form.delCheckFile.value = form.delFileChk.value;
				 
			} else {
				
				for(var i = 0 ; i < form.delFileChk.length; i++) {
					if(form.delFileChk[i].checked)
						form.delCheckFile.value = form.delCheckFile.value + form.delFileChk[i].value + ",";
				}
			}
		}
		
		//form.action = '/academy/community/bbs.do';
		form.subcmd.value = 'exec';
		//form.encoding = "multipart/form-data";
		form.submit();	
	}
	
	function fileUpChange(obj){
		var filename = obj.value.substring(obj.value.lastIndexOf(".")).toLowerCase();
		if(filename == '') 
			return;
		var maxSize = '<%=SangsProperties.getProperty("Globals.addFileMaxSize")%>';
		var maxMageSize = '<%=SangsProperties.getProperty("Globals.addFileMaxMegaSize ")%>';
		if(typeof document.body.style.maxHeight != 'undefined'){
			var fso = new ActiveXObject("Scripting.FileSystemObject");
			var f = fso.GetFile(obj.value);
			var fileSize = f.size;
			f = null;
			fso = null;
		} else {
			var img = new Image();
			img.dynsrc = obj.value;
			var fileSize = img.fileSize;
		}
		fileSize = parseInt(fileSize);
		maxSize = parseInt(maxSize);

		if(fileSize > maxSize){
			alert("파일업로드 허용용량 " + maxMageSize + "M Byte를 초과하였습니다.");
			fileValueReset(obj.name);
			return;
		}
		if(!(filename == '.jpg' || filename == '.gif' || filename == '.hwp' || filename == '.doc' || filename == '.ppt' || filename == '.zip' || filename == '.txt' || filename == '.xls')){
			alert("첨부할수 없는 확장자입니다.");
			fileValueReset(obj.name);
			return;
		}

	}
	function fileValueReset(file){
		document.getElementById(file).select();
		document.selection.clear();
	}
	
	function delete_file(){
		form.delFile.value = "Y";
		document.getElementById("fileDiv").style.display = "none";
		document.getElementById("uploadFile").style.display = "block";
	}
	
	function filedown(fileno){
		var form = document.form;
		form.action = '/admin/filedown.do';
		form.fileno.value = fileno;
		form.submit();		
	}
	
</script>


<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"><%=StringUtil.getContent(titleMap.getString("TITLENAME"))%> 관리<span>사이트 게시물을 관리합니다.</span></div>


<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" action="bbs.do" method="post" >
	<input type="hidden" name="subcmd" id="subcmd" value="exec"/>
    <input type="hidden" name="cPage" id="cPage" value="<%=cPage%>"/>
    <input type="hidden" name="pbcateno" id="pbcateno" value="<%=pbcateno%>">
    <input type="hidden" name="searchWord" value="<%=StringUtil.getContent(requestMap.getString("searchWord"))%>"/>
    <input type="hidden" name="searchMode" value="<%=StringUtil.getContent(requestMap.getString("searchMode"))%>"/>
    <input type="hidden" name="qu" value="<%=StringUtil.getContent(requestMap.getString("qu"))%>"/>
    <input type="hidden" name="oFileNo" value="<%=map.getInt("FILENO")%>"/>
    <input type="hidden" name="fileno" value=""/>
    <input type="hidden" name="delFile" value=""/>
    <input type="hidden" name="bbsNo" value="<%=map.getInt("BBSNO")%>"/>
    <input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bbsFilePath")%>"/>
    <input type="hidden" name="grpNo" value="<%=map.getInt("GRPNO") %>"/>
	<input type="hidden" name="refLevel" value="<%=map.getInt("REFLEVEL") %>"/>
	<input type="hidden" name="refStep" value="<%=map.getInt("REFSTEP") %>"/>
	<input type="hidden" name="delCheckFile" value=""/>
	<input type="hidden" name="topYn" value="N"/>
	
	<table class="table-type1 search_form">
	  <colgroup>
	  	<col class="cellc" width="15%">
	  	<col class="celll"  width="35%">
	  	<col class="cellc" width="15%">
	  	<col class="celll" width="35%">
	  </colgroup>
	  <tr>
			<th>제목</th> 
			<td style="text-align:left;" colspan="3"><%=StringUtil.getContent(map.getString("TITLE")) %></td>
	  </tr>
	   <tr>
			<th>분류</th>
			<td>
				<%
					int bcateno = 0;
					if(map.containsKey("BCATENO")){
						bcateno = map.getInt("BCATENO");
					}
					for(int i=0;i<typeList.size();i++){
						EduMap emap = (EduMap)typeList.get(i);
				%>
				<%=StringUtil.getContent(emap.getString("BCATENAME"))%>
				<%
					}
				%>
			</td>
	  </tr>
	   <tr>
			<th>작성자</th> 
			<td>
				<%=StringUtil.getContent(map.getString("WRITER")) %>(<%=StringUtil.getContent(map.getString("USERID")) %>)
			</td>
			<th>작성일</th>
			<td><%=StringUtil.getContent(map.getString("WDATE")) %></td>
	  </tr>
	   <tr>
	  	 <th >내용</th>
	     <td style="padding:20px 10px 20px 10px;" colspan="3">
		    <%=StringUtil.getContent2(map.getString("CONTENT")) %>
           </td>
       </tr>  
	</table>
	
	<br/>
	
	<table class="table-type1 search_form">
		<colgroup>
	  	<col class="cellc" width="15%">
	  	<col class="celll" width="85%">
	  </colgroup>
		<tr>
			<th>제목</th>
			<td colspan="2" ><input type="text" name="title" style="width:600px" value="<%=StringUtil.getContent(title)%>"/></td>
		</tr>
		<tr>
		  	 <th>답변</th>
		     <td style="padding:20px 10px 20px 10px;" colspan="3">
	     			<div>
						<!-- [필수]에디터 안에 글내용 영역 -->
						<textarea name="content" id="content" rows="22" style="width:100%;" ></textarea>
						<ckeditor:replace replace="content" basePath="${pageContext.request.contextPath}/resource/ckeditor" config="${ckeditorSettings}" ></ckeditor:replace>
					</div>
			 </td>
	       </tr>  
	</table>

<div class="button_top" >
	<img onclick="go_exec()" src="/resource/images/btn_register.gif" style="cursor:hand" alt="등록">
	<a href="#" onclick="history.back()"><img src="/resource/images/btn_cancel.gif" alt="취소"></a>
</div>
</form>
<!-- 본문 > 상단 > 검색영역 끝 -->


