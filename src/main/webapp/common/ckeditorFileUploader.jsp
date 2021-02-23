<%
/*********************************************************
system 	: 웹에디터(ck editor)
title	: 사진파일 업로드 페이지
사용jar	: commons-fileupload-1.2.jar, commons-io-1.3.1.jar
**********************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %> 
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.support.FileUploadCheckUtil" %>
<%@ page import="com.sangs.util.StringUtil"%>

<%
//
 // 사진저장 기본 물리경로 (환경에맞게 변경)
String ADDFILE_ROOT_PATH = SangsProperties.getProperty("Globals.addFileRootPath");

// 사진저장 서브 물리경로 (환경에맞게 변경)
String ADDFILE_PATH = request.getParameter("photoUploadPath");

// 사진보여줄 웹 경로 (환경에맞게 변경)
String ADDFILE_URL = SangsProperties.getProperty("Globals.contentsDomain")+"/"+SangsProperties.getProperty("Globals.addFileRooturi")+"/"+ADDFILE_PATH+"/";

// 업로드 파일 용량 (환경에맞게 변경)
int ADDFILE_MAXSIZE = 1024 * 1024 * 5;

// ckeditor > uploadType, CKEditorFuncNum
String uploadType = request.getParameter("uploadType");
String CKEditorFuncNum = request.getParameter("CKEditorFuncNum");


// 실제 저장된 파일명
String sysFileName = "";
// 리턴 메시지
String rMsg = "";

ADDFILE_ROOT_PATH = ADDFILE_ROOT_PATH.replaceAll("&","");
ADDFILE_PATH = ADDFILE_PATH.replaceAll("&","");
// 업로할 경로가 없을 경우 디렉토리 생성
if (!new File( ADDFILE_ROOT_PATH +"/"+ ADDFILE_PATH ).exists()) {
	new File( ADDFILE_ROOT_PATH +"/"+ ADDFILE_PATH ).mkdir();
}

// 파일업로드 관련 인스턴트 및 설정 처리
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(ADDFILE_MAXSIZE);
factory.setRepository(new File(ADDFILE_ROOT_PATH +"/"+ ADDFILE_PATH));
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setSizeMax(ADDFILE_MAXSIZE);

// 첨부된 파일 경로 파싱처리 지시자
Pattern dosSeperator = Pattern.compile("\\\\");
 
try {  
	
	// request로 넘어온 필드 List객체화
	List requestItems = upload.parseRequest(request);

	
	for(int i=0; i<requestItems.size(); i++) {
		FileItem item = (FileItem)requestItems.get(i);
		
		// 파일업로드 필드일경우 실행
		if (!item.isFormField()) {
			String itemName = item.getName();
			itemName = itemName.substring(itemName.lastIndexOf("\\")+1);
			
			// 사용자실제등록 파일명 추출
			String orgFileName = itemName;
			orgFileName = dosSeperator.matcher(orgFileName).replaceAll("/");
	        int idx = orgFileName.lastIndexOf("/");
	        if(idx > -1)
	        	orgFileName = orgFileName.substring(i + 1);
			
	        // 파일확장자추출
	        int idx2 = orgFileName.lastIndexOf('.');
	        String extName = idx2 != -1 ? orgFileName.substring(idx2) : "";
	        
	        boolean checkFile = FileUploadCheckUtil.checkFileExt(orgFileName, ADDFILE_ROOT_PATH, 2); 
	        
			if(checkFile ==true){
				// 저장할 파일명생성
				sysFileName = Long.toString(System.currentTimeMillis()) + extName; //실제 저장되는 파일 이름.
				if(extName != null && ((extName.endsWith(".bmp") || extName.endsWith(".jpg") ||  
						 extName.endsWith(".gif") || extName.endsWith(".png") || extName.endsWith(".tif") || extName.endsWith(".tiff") || extName.endsWith(".tif") || extName.endsWith(".tiff")
						 || extName.endsWith(".txt") || extName.endsWith(".doc") || extName.endsWith(".docx") || extName.endsWith(".ppt")
						 || extName.endsWith(".pptx") || extName.endsWith(".pps") || extName.endsWith(".ppsx") || extName.endsWith(".hwp")
						 || extName.endsWith(".pdf") || extName.endsWith(".xls") || extName.endsWith(".xlsx") || extName.endsWith(".zip")
						 || extName.endsWith(".jpeg") || extName.endsWith(".jpe") || extName.endsWith(".jfif"))))        
				{ 
					// 파일저장
					File sysFile = new File( ADDFILE_ROOT_PATH +"/"+ ADDFILE_PATH +"/"+ sysFileName );
					item.write(sysFile);
					rMsg = "Upload Success";
				}
			}else{
				ADDFILE_URL = "";
				sysFileName = "";
				rMsg = "Upload Fail";
			}
			
		} 
		
	}
} catch (IOException ex) {
	throw ex; 
}catch (Exception ex) {
	throw ex;
}

//사진저장된 전체 URL주소
String fileUrl = ADDFILE_URL + sysFileName; 
//System.out.println("CKEditorFuncNum : "+CKEditorFuncNum);
%>
<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('<%=StringUtil.getContent(CKEditorFuncNum)%>', '<%=StringUtil.getContent(fileUrl)%>', '<%=StringUtil.getContent(rMsg)%>')</script>