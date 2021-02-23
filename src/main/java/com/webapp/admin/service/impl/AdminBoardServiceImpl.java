package com.webapp.admin.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.sangs.support.ContentFileManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.admin.mapper.AdminBoardMapper;
import com.webapp.admin.service.AdminBoardService;

/**
 * 
 * Description : 관리자 게시판 Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService { 

	private Logger log = LogManager.getLogger(AdminBoardServiceImpl.class);
	
    @Resource(name = "adminBoardMapper")
    private AdminBoardMapper adminBoardMapper;
    
    
    /**
     * 게시판 분류 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardCategoryList(DataMap data) throws Exception {
        return adminBoardMapper.getBoardCategoryList(data);
    }
    
    /**
     * 게시판분류 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardCategoryInfo(DataMap data) throws Exception {
        return adminBoardMapper.getBoardCategoryInfo(data);
    }
    
    /**
     * 게시판 공지사항 top 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTopBoardList(DataMap data) throws Exception {
        return adminBoardMapper.getTopBoardList(data);
    }
    
    /**
     * 게시글 리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getBbsListCount(DataMap data) throws Exception {
        return adminBoardMapper.getBbsListCount(data);
    }
    
    /**
     * 게시글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminBoardMapper.getBoardList(data);
    }
    /**
     * 게시글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getContentsList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminBoardMapper.getContentsList(data);
    }
    /**
     * 게시글 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardView(DataMap data) throws Exception {
        return adminBoardMapper.getBoardView(data);
    } 
    
    /**
     * 팝업 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPopupList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminBoardMapper.getPopupList(data);
    }
    
    /**
     * 팝업 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPopupView(DataMap data) throws Exception {
        return adminBoardMapper.getPopupView(data);
    }
    
    /**
     * 팝업 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertPopupInfo(DataMap data) throws Exception {
    	adminBoardMapper.insertPopupInfo(data);
    }
    
    /**
     * 팝업 수정
     *
     * @param data
     * @throws Exception
     */
    public void updatePopupInfo(DataMap data) throws Exception {
    	adminBoardMapper.updatePopupInfo(data);
    }
    
    /**
     * 팝업 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deletePopupInfo(DataMap data) throws Exception {
    	adminBoardMapper.deletePopupInfo(data);
    }
    
    /**
     * 조회수 증가
     *
     * @param data
     * @throws Exception
     */
    public void updateBoardViewCnt(DataMap data) throws Exception {
    	adminBoardMapper.updateBoardViewCnt(data);
    }
    
    /**
     *  파일 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getFileList(DataMap data) throws Exception {
        return adminBoardMapper.getFileList(data);
    }

    /**
     *  파일 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getDataFileList(DataMap data) throws Exception {
        return adminBoardMapper.getDataFileList(data);
    }
    
    /**
     * 파일등록
     *
     * @param data
     * @throws Exception
     */
    public void insertFileInfo(DataMap data) throws Exception {
    	adminBoardMapper.insertFileInfo(data);
    }
    
    /**
     * 파일삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteFileInfo(DataMap data) throws Exception {
    		//파일삭제
//    		int saveFilePath = data.getString("savePath").indexOf(SangsProperties.getProperty("Globals.bbsFilePath")+"/"+data.getString("bbsNo"));
//    		data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.bbsFilePath")+"/"+data.getString("bbsNo"));
    		List<EduMap> fMap = adminBoardMapper.getDeleteFileList(data);
    		if(data.getString("ajaxChk").equals("Y")) {
    			FileUtil.deleteFile(data.getString("savePath") + File.separator + data.getString("saveFile"));
    			adminBoardMapper.deleteFileInfo(data);
    		} else {
    			if(fMap.size() > 0){
    				for(int i = 0 ; i < fMap.size(); i++){
    					EduMap delMap = fMap.get(i);
    					FileUtil.deleteFile(delMap.getString("SAVPATH") + File.separator + delMap.getString("SAVFILE"));
    				}
    				adminBoardMapper.deleteFileInfo(data);
    			}
    		}
    }
    
    /**
     * 파일삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteBannerFileInfo(DataMap data) throws Exception {
    	EduMap fileList = adminBoardMapper.getBannerView(data);
         if (fileList != null) {
                 EduMap fileInfo = (EduMap)fileList;
                 FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("SAVFILE"));
                 if(fileList.get("MOB_SAVFILE") != null){
                 FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("MOB_SAVFILE"));	 
                 }
                 if(fileList.get("TAB_SAVFILE") != null){
                 FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("TAB_SAVFILE"));	 
                 }
         }
    }
    /**
     * 게시글 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertBoardInfo(HttpServletRequest request, DataMap data) throws Exception {
    	adminBoardMapper.insertBoardInfo(data);
    	//insertFileInfo(request, data);
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
            String path = request.getParameter("UPLOAD_DIR").toString() +  "/" +  data.getString("bbsNo");
            request.setAttribute("UPLOAD_DIR", path);
            if(data.getString("increaseFileSize").equals("Y")) {
            	int ADDFILE_MAXSIZE = 1024 * 1024 * 1000;
            	data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), ADDFILE_MAXSIZE));
            } else {
            	data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
            }
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
    			adminBoardMapper.deleteEdDataFile(data);
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
            
            String uploadFileExt =  fileMap.get("uploadFileExt", i).toString();
            if(uploadFileExt.equals("jpg") || uploadFileExt.equals("gif") || uploadFileExt.equals("png") || uploadFileExt.equals("jpeg") || uploadFileExt.equals("bmp") || uploadFileExt.equals("JPG") || uploadFileExt.equals("GIF") || uploadFileExt.equals("PNG") || uploadFileExt.equals("JPEG") || uploadFileExt.equals("BMP") || uploadFileExt.equals("JPG")) {
        	    paramFileMap.setString("fgubun", "IMG");
            } else if (uploadFileExt.equals("mp4") || uploadFileExt.equals("mp3")) {
            	paramFileMap.setString("fgubun", "VIDEO");
            }

            adminBoardMapper.insertEdDataFile(paramFileMap);
        }
	}
	/**
     * 자료실 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteEdDataFile(DataMap data) throws Exception { 
			//파일삭제
			/*if(data.getString("type").equals("D")){//인권교육자료
				int saveFilePath = data.getString("savePath").indexOf(SangsProperties.getProperty("Globals.bbsDataFilePath")+"/"+data.getString("bbsno"));
	        	data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath) + "/" + SangsProperties.getProperty("Globals.bbsDataFilePath")+"/"+data.getString("bbsno"));
	        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
	        	adminBoardMapper.deleteEdDataFile(data);
	        } else if(data.getString("type").equals("N")) {//음성낭독
	        	int saveFilePath = data.getString("savePath").indexOf(SangsProperties.getProperty("Globals.bbsNegativeFilePath")+"/"+data.getString("bbsno"));
	        	data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath) + "/" + SangsProperties.getProperty("Globals.bbsNegativeFilePath")+"/"+data.getString("bbsno"));
	        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
	        } else if(data.getString("type").equals("T")) {//번역문
	        	int saveFilePath = data.getString("savePath").indexOf(SangsProperties.getProperty("Globals.bbsTranslationFilePath")+"/"+data.getString("bbsno"));
	        	data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath) + "/" + SangsProperties.getProperty("Globals.bbsTranslationFilePath")+"/"+data.getString("bbsno"));
	        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
	        } else if(data.getString("type").equals("A")) {//인권교육컨텐츠
	        	int saveFilePath = data.getString("savePath").indexOf(SangsProperties.getProperty("Globals.bbsAdvFilePath")+"/"+data.getString("bbsno"));
	        	data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath) + "/" + SangsProperties.getProperty("Globals.bbsAdvFilePath")+"/"+data.getString("bbsno"));
	        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
	        }*/
		
		
		List<EduMap> fMap = adminBoardMapper.getDeleteDataFileList(data);
		if(data.getString("type").length() > 0) {
			/* 경로 마지막에 /가 있으면 separator를 빼고 파일 삭제 진행 */
			boolean savPathLength  = data.getString("savePath").endsWith("/");
			if(savPathLength){
				FileUtil.deleteFile(data.getString("savePath") + data.getString("saveFile"));
			} else {
				FileUtil.deleteFile(data.getString("savePath") + File.separator + data.getString("saveFile"));
			}
			adminBoardMapper.deleteEdDataFile(data);
		} else {
			if(fMap.size() > 0){
				for(int i = 0 ; i < fMap.size(); i++){
					EduMap delMap = fMap.get(i);
					FileUtil.deleteFile(delMap.getString("SAVPATH") + File.separator + delMap.getString("SAVFILE"));
				}
				adminBoardMapper.deleteEdDataFile(data);
			}
        }
	}
    /**
     * 파일 bbsno 등록
     *
     * @param data
     * @throws Exception
     */
    public void updateFileBbsno(HttpServletRequest request , DataMap data) throws Exception {

    	if (ServletFileUpload.isMultipartContent(request)) {
            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            String path = request.getParameter("UPLOAD_DIR").toString() +  "/" +  data.getString("bbsNo");
            request.setAttribute("UPLOAD_DIR", path);
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
		
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
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

            adminBoardMapper.updateFileBbsno(paramFileMap);
        }
        
    }
    
    /**
     * 게시글 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateBoardInfo(HttpServletRequest request, DataMap data) throws Exception {
    	//insertFileInfo(request, data);
    	adminBoardMapper.updateBoardInfo(data);
    }
    
    /**
     * 게시글 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteBoardInfo(DataMap data) throws Exception {
//    	this.deleteFileInfo(data);
    	adminBoardMapper.deleteBoardInfo(data);
    }
    
    /**
     * 게시글 최대번호
     *
     * @param data
     * @throws Exception
     */
    public int getMaxBoardNo(DataMap data) throws Exception {
    	return adminBoardMapper.getMaxBoardNo(data);
    }
    
    /**
     * 상시설문 게시글 최대번호
     *
     * @param data
     * @throws Exception
     */
    public int getMaxSurveyNo(DataMap data) throws Exception {
    	return adminBoardMapper.getMaxSurveyNo(data);
    }
    /**
     * 상시설문 질문 최대번호
     *
     * @param data
     * @throws Exception
     */
    public int getMaxQuizNo(DataMap data) throws Exception {
    	return adminBoardMapper.getMaxQuizNo(data);
    }

    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getFileInfo(DataMap data) throws Exception {
        return adminBoardMapper.getFileInfo(data);
    }

    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getFileInfo2(DataMap data) throws Exception {
        return adminBoardMapper.getFileInfo2(data);
    }
  
    /**
     * 상시설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSurveyList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminBoardMapper.getSurveyList(data);
    }
    
    /**
     * 온라인교육 개인별 통계 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getOnlinePersonStatsListCnt(DataMap data) throws Exception{
    	return adminBoardMapper.getOnlinePersonStatsListCnt(data);
    }
    
    /**
     * 온라인교육 개인별 통계 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOnlinePersonStatsList(DataMap data) throws Exception{
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
    	return adminBoardMapper.getOnlinePersonStatsList(data);
    }
    
    /**
     * 온라인교육 통계 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getOnlineStatsListCnt(DataMap data) throws Exception{
    	return adminBoardMapper.getOnlineStatsListCnt(data);
    }
    
    /**
     * 온라인교육 통계 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOnlineStatsList(DataMap data) throws Exception{
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
    	return adminBoardMapper.getOnlineStatsList(data);
    }
    
    /**
     * 온라인교육 통계
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOnlineStatsDetail(DataMap data) throws Exception{
    	return adminBoardMapper.getOnlineStatsDetail(data);
    }
    
    
    /**
     * 배너 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBannerList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminBoardMapper.getBannerList(data);
    }
    
    /**
     * 공개여부 Y 개수 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getUseAtCnt(DataMap data) throws Exception {
        return adminBoardMapper.getUseAtCnt(data);
    }
    
    /**
     * 배너 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBannerView(DataMap data) throws Exception {
        return adminBoardMapper.getBannerView(data);
    }
    
    /**
     * 배너 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertBannerInfo(HttpServletRequest request,DataMap data) throws Exception {
    	adminBoardMapper.insertBannerInfo(data);
    	updateFileInfo(request, data);
    }
    
    /**
     * 배너 파일 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateFileInfo(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {
            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            request.setAttribute("UPLOAD_DIR", data.getString("UPLOAD_DIR"));
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");

        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            paramFileMap.set("bannerno", data.getInt("bannerno"));
            if(i == 0){
            	adminBoardMapper.updateFileInfo(paramFileMap);
            }else if(i == 1){
            	adminBoardMapper.updateMobFileInfo(paramFileMap);
            }else if(i == 2){
            	adminBoardMapper.updateTabFileInfo(paramFileMap);
            }
        }
    }
    /**
     * 파일 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");

        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            paramFileMap.set("bannerno", data.getInt("bannerno"));

            adminBoardMapper.insertFileInfo(paramFileMap);
        }
    }
    
    /**
     * 배너 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateBannerInfo(HttpServletRequest request, DataMap data) throws Exception {
//    	this.deleteFileInfo(data);
    	if(data.getString("filechange").equals("Y")) {//파일을 변경했다면
    		this.deleteBannerFileInfo(data);
    	}
    	adminBoardMapper.updateBannerInfo(data);
    	updateFileInfo(request, data);
    }
    
    /**
     * 배너 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteBannerInfo(DataMap data) throws Exception {
    	this.deleteBannerFileInfo(data);
    	adminBoardMapper.deleteBannerInfo(data);
    }
    /**
     * 배너 최대번호
     *
     * @param data
     * @throws Exception
     */
    public int getMaxBannerNo(DataMap data) throws Exception {
    	return adminBoardMapper.getMaxBannerNo(data);
    }
    

	/**
     * 강사 커뮤니티 댓글 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void tutorBoardReplyDelete(DataMap data) throws Exception {
		adminBoardMapper.tutorBoardReplyDelete(data);
	}
	
	/**
     * 강사커뮤니티 댓글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<Map<String,Object>> getTutorBoardAjaxList(DataMap data) throws Exception {
		return adminBoardMapper.getTutorBoardAjaxList(data);
	}
	
	/**
     * 강사 커뮤니티 댓글 입력
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void tutorBoardReplySubmit(DataMap data) throws Exception {
		adminBoardMapper.tutorBoardReplySubmit(data);
	}
	
	/**
     * 강사 커뮤니티 답글 입력
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void tutorBoardCmtReplySubmit(DataMap data) throws Exception{
		adminBoardMapper.tutorBoardCmtReplySubmit(data);
	}
	
	/**
     * 상담회원정보 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertCounselUserInfo(HttpServletRequest request, DataMap data) throws Exception {
    	adminBoardMapper.insertCounselUserInfo(data);
    }
    
    /**
     * 상담회원정보 업데이트
     *
     * @param data
     * @throws Exception
     */
    public void updateCounselUserInfo(HttpServletRequest request, DataMap data) throws Exception {
    	adminBoardMapper.updateCounselUserInfo(data);
    }
    
    /**
     * 게시판분류 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCounselUserInfo(DataMap data) throws Exception {
        return adminBoardMapper.getCounselUserInfo(data);
    }
}