package com.webapp.classdesk.service.impl;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorDiscussMapper;
import com.webapp.classdesk.service.ClassdeskTutorDiscussService;

/**
 * Description : Classdesk TutorDiscuss Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.08.19   황두은           최초작성
 *
 */
@Service("classdeskTutorDiscussService")
public class ClassdeskTutorDiscussServiceImpl implements ClassdeskTutorDiscussService {

    @Resource(name = "classdeskTutorDiscussMapper")
    private ClassdeskTutorDiscussMapper classdeskTutorDiscussMapper;

    protected Logger  log = LogManager.getLogger(this.getClass());

    
    /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    public void saveBbs(HttpServletRequest request, DataMap data) throws Exception {
    	int bbsNo = ParamUtil.getIntParam(data.getString("bbsNo"), 0);
    	
        if (bbsNo > 0) {
        	// reply
        	if(data.getString("qu").equals("reply")) {
                 classdeskTutorDiscussMapper.insertDiscussReplyInfo(data); 
                 classdeskTutorDiscussMapper.updateFileBbsno(data);
        	}else{
        		// update
            	classdeskTutorDiscussMapper.updateBoardInfo(data);
//            	classdeskTutorDiscussMapper.updateFileBbsno(data);
            	data.setString("qu", "update");
            	 insertEdDataFile(request, data);
        	}
        }
        
        else {
            // insert
            bbsNo = classdeskTutorDiscussMapper.getMaxBoardNo();
            data.setInt("bbsNo", bbsNo);
            classdeskTutorDiscussMapper.insertDiscussInfo(data);
            insertEdDataFile(request, data);
//            classdeskTutorDiscussMapper.updateFileBbsno(data);
        }
    }    
    /**
     * 게시글 파일 등록
    *
    * @param data
    * @return
    * @throws Exception
    */
	public void insertEdDataFile(HttpServletRequest request , DataMap data)throws Exception{
		
		if (ServletFileUpload.isMultipartContent(request)) {
           MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
           FileUploadUtil uploadUtil = new FileUploadUtil();
           String path = request.getParameter("UPLOAD_DIR").toString();
           request.setAttribute("UPLOAD_DIR", path);
           data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
       }
		
       int fileCnt = data.getInt("UPLOAD_FILE_CNT");
       int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
       if (fileCnt != fileTempCnt) {
           data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
       }
       if(data.getString("qu").equals("update")){
       	String delCheckFile = data.getString("delNum");
   		StringTokenizer str = new StringTokenizer(delCheckFile ,",");
   		//기존파일 삭제
   		while(str.hasMoreTokens()) {
   			data.setString("fileId", str.nextToken());
   			classdeskTutorDiscussMapper.deleteEdDataFile(data);
   		}
       }
       for (int i = 0; i < fileCnt; i++) {
           DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
           DataMap paramFileMap = new DataMap();
           paramFileMap.setString("bbsNo", data.getString("bbsNo"));
           paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
           paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
           paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
           paramFileMap.setString("uploadFileFulltPath",fileMap.get("uploadFileFulltPath", i).toString());
           paramFileMap.setString("uploadFileExt", fileMap.get("uploadFileExt", i).toString());
           classdeskTutorDiscussMapper.insertEdDataFile(paramFileMap);
       }
	}

    /**
     * getCourseDiscussList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseDiscussList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return classdeskTutorDiscussMapper.getCourseDiscussList(data);
    }
     
    /**
     * getDiscussView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getDiscussView(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getDiscussView(data);
    }
    
    /**
     * getGrpNo
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getGrpNo(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getGrpNo(data);
    }
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getFileList(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getFileList(data);
    }
    
    /**
     * updateDiscussViewCnt
     * 
     * @param data
     * @throws Exception
     */
    public void updateDiscussViewCnt(DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.updateDiscussViewCnt(data);
    }
    
    /**
     * getRcmndCount
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getRcmndCount(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getRcmndCount(data);
    }
    
    /**
     * getUnityMberno
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public String getUnityMberno(String unityId) throws Exception {
        return classdeskTutorDiscussMapper.getUnityMberno(unityId);
    }
    
    /**
     * insertRcmndInfo
     * 
     * @param data
     * @throws Exception
     */
    public void insertRcmndInfo(HttpServletRequest request, DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.insertRcmndInfo(data);
    }  
    
    /**
     * getRcmndCount
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> checkRcmnd(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.checkRcmnd(data);
    }
    
    /**
     * updateReplyList
     * 
     * @param data
     * @throws Exception
     */
    public void updateReplyList(DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.updateReplyList(data);
    }

    /**
     *  파일 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseFileList(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getCourseFileList(data);
    }
    /**
     *  파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteEdDataFile(DataMap data) throws Exception {
		//파일삭제
		int saveFilePath = data.getString("savePath").indexOf("utor");
    	data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
    	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
    	classdeskTutorDiscussMapper.deleteEdDataFile(data);
	}

    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getFileInfo2(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getFileInfo2(data);
    }
}
