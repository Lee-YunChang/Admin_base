package com.sangs.support;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @제목 FileUploadUtil
 * @설명 실제 파일업로드 수행
 * @작성자 이내희
 * @마지막날짜 2010.12.17
 */
public class FileUploadCheckUtil {
 

    /* Log를 위한 정의 */
	protected Log  log = LogFactory.getLog(this.getClass());   

    // 페이징 Utility
   
    /**
	 * @TODO : 파일 확장자 확인
	 * @author : 2011. 10. 25. (inha)
	 */
	public static Boolean checkFileExt( String file, String subPath, int type) throws Exception
	{
		Boolean result = true ;
		String fileName = file; 
		
		if(subPath.equalsIgnoreCase("..") || subPath.equalsIgnoreCase("/") || fileName.equalsIgnoreCase("..") || fileName.equalsIgnoreCase("/")){
			result = false;
		}
		
		if (fileName == null || fileName.length() < 2) {
			result = false;
		}
		 
		String[] fileArr = fileName.split("\\."); 
		if (fileArr == null) {
			result =false; 
		}
		
		int fileLen = fileArr.length;	// 파일형식 체크
		if (fileLen < 2) {
			result = false;
		
		}
		String fileExt = fileArr[fileLen - 1]; 
		if (fileExt == null || fileExt.length() < 3) { // 파일형식 체크
			result = false;
		}
		
		String[] extArr  = null;
		
		String[] uploadExtArrImg 	= {"bmp", "gif", "jpeg", "jpg", "png", "mp4", "mp3"};
		String[] uploadExtArrFile	=  {"bmp", "gif", "jpeg", "jpg", "png", "txt", "doc", "docx", "ppt", "pptx", "pps", "ppsx", "hwp", "pdf", "xls","xlsx", "zip", "mp4", "mp3", "xml"
				, "tiff", "tif" , "TIFF", "TIF"
				, "BMP", "GIF", "JPEG", "JPG", "PNG", "TXT", "DOC", "DOCX", "PPT", "PPTX", "PPS", "PPSX", "HWP", "PDF", "XLS","XLSX", "ZIP", "MP4", "MP3","XML"};
		
		if(type == 1){
			extArr = uploadExtArrFile;
		}else if(type == 2){
			extArr = uploadExtArrImg;
		}
		
		
		

		fileExt = fileExt.toLowerCase();
		StringBuffer extStr = new StringBuffer();
		int extCnt = extArr.length;
		boolean check = false;
		for (int i=0; i<extCnt; i++) {
			if (i != 0) {
				extStr.append(",");
			}
			extStr.append(extArr[i]);
			
			if (fileExt.equals(extArr[i])) {
				check = true; // 일치할 경우에만 설정함.
			}
		}
		
		if (check == false) { 	// 확장자 체크
			result = false;
		}

		return result;
	}
} 