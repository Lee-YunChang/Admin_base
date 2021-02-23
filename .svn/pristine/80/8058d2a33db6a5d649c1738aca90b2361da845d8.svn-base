package com.sangs.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.EgovWebUtil;

/**
 * @Class Name  : EgovFileUploadUtil.java
 * @Description : Spring 기반 File Upload 유틸리티
 * @Modification Information
 *
 * 수정일         		수정자                  	 수정내용
 * -------      --------    ---------------------------
 * 2016.03.28  	이진영                
 *	 				
 * @author 공통컴포넌트 fileupload
 * @since 2014.04.01
 * @version 1.0
 * @see
 */
public class EgovFileUploadUtil extends EgovFormBasedFileUtil {
	
	private static Logger log = LogManager.getLogger(EgovFileUploadUtil.class);
	
    /**
     * 파일을 Upload 처리한다.
     * @param request
     * @param where
     * @param maxFileSize
     * @return
     * @throws Exception
     */
    public static List<EgovFormBasedFileVo> uploadFiles(HttpServletRequest request, String where) throws Exception {
    	
		List<EgovFormBasedFileVo> list = new ArrayList<EgovFormBasedFileVo>();
		try {
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			Iterator<?> fileIter = mptRequest.getFileNames();
		
			while (fileIter.hasNext()) {
			    MultipartFile mFile = mptRequest.getFile((String)fileIter.next());
			    EgovFormBasedFileVo vo = new EgovFormBasedFileVo();
			    
			    String tmp = mFile.getOriginalFilename();
			    if (tmp.lastIndexOf("\\") >= 0) {
		        	tmp = tmp.substring(tmp.lastIndexOf("\\") + 1);
		        }
			    
	            vo.setFileName(tmp);
	            vo.setContentType(mFile.getContentType());
	            vo.setServerSubPath(getTodayString());
	            vo.setPhysicalName(getPhysicalFileName());
	            vo.setSize(mFile.getSize());
	            vo.setHtmlName(mFile.getName());
	            
	            if (tmp.lastIndexOf(".") >= 0) {
	       	 		vo.setPhysicalName(vo.getPhysicalName() + tmp.substring(tmp.lastIndexOf(".")));
	            }
		            
	            //파일생성 
		        if (mFile.getSize() > 0) {

	            	// 업로드 가능 확장자 
	            	String[] extWhiteNames = {"xls", "xlsx", "doc", "docx","ppt", "pptx", "hwp","pdf","zip", "txt", "tif", "tiff","gif","bmp","png", "jpg","jpeg", "flv"
	            			, "XLS", "XLSX", "DOC", "DOCX","PPT", "PPTX", "HWP","PDF","ZIP", "TXT", "TIF", "TIFF","GIF","BMP","PNG", "JPG","JPEG", "FLV"};
	            	String fileExt = tmp.substring(tmp.lastIndexOf(".")).toLowerCase().replaceAll("\\.", ""); //.을 없애고  확장자 소문자로
	            	boolean canUploadExt = false;
	            	
	            	for(int i = 0 ; i < extWhiteNames.length; i++) {
	            		if(extWhiteNames[i].equals(fileExt)) {
	            			canUploadExt = true;
	            		}
	            	}
	            	
	            	if(!canUploadExt)
	            		throw new Exception("Can not save file type Exception : " + fileExt);
	            	
	            	saveFile(mFile.getInputStream(), new File(EgovWebUtil.filePathBlackList(where+File.separator+vo.getPhysicalName())));
	            	
	            	list.add(vo);
	            }
			}
		} catch(Exception e) {
			
			throw e;
		}
		return list;
    }
}
