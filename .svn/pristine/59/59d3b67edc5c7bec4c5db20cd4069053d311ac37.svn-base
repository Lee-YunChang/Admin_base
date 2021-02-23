package com.sangs.base;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * Description : Sangs 추상 Service 구현 
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2015.02.23  soundheaven1			최초작성
 *
 */
public class SangsAbstractServiceImpl extends EgovAbstractServiceImpl {

    	/*@Resource(name="commonMapper")
    	private CommonMapper supCommonMapper;
    	
    	public void pagingSet(Map<String, String> params) {
    
    		int pageIndex = 1;	 //페이지번호 
    		int perPage = ParamUtil.getIntParam(SangsProperties.getProperty("Globals.defaultPerPageCount"),10);	 //default (페이지당 게시물수): 이값은 값이 안들어올때의 디폴트 값임 페이지당 게시물 수 수정 하려면 controll 에서 셋팅할것
    		
    		int startRow = 0;
    		int endRow = 0;
    		
    		if(!SangsUtil.isEmpty(params.get("pageIndex")))
        		pageIndex = Integer.parseInt(params.get("pageIndex"));
        	
    		if(!SangsUtil.isEmpty(params.get("perPage")))
    			perPage = Integer.parseInt(params.get("perPage"));
    		
    		startRow = ((pageIndex - 1) * perPage) + 1;
    		endRow = pageIndex * perPage;
    		
    		params.put("start_row", String.valueOf(startRow));
    		params.put("end_row", String.valueOf(endRow));
    		 
    	}
    	
    	
    
        *//**
         * 파일을 저장하고 공통 파일에 등록 처리
         * @param req
         * @param filePath
         * @return
         * @throws Exception
         *//*
    	public int saveCmmnFile(HttpServletRequest req, String fileIdntfrCode, String registUserId) throws Exception {
    		return saveCmmnFile(req, fileIdntfrCode, registUserId, "");
    	}
        public int saveCmmnFile(HttpServletRequest req, String fileIdntfrCode, String registUserId, String fileIemSubSn) throws Exception {
        	
    		int fileIemSn = -1;
    		
        	String fileBasePath = "";
        	if(fileIdntfrCode.equals(SangsProperties.getProperty("Globals.fileIdntfrCode_cms"))) {	 //cms 일때는 웹공간 업로드 공간에 저장한다.
        		fileBasePath = SangsProperties.getProperty("Globals.webUploadFileBasePath") + fileIdntfrCode ;
        	} else {
        		fileBasePath = SangsProperties.getProperty("Globals.attFileBasePath") + fileIdntfrCode ;
        	}
        	
        	
        	if(!SangsUtil.isEmpty(fileIemSubSn))
        		fileBasePath = fileBasePath + "/" + fileIemSubSn;
        	 
        	 //파일 저장 
        	List<EgovFormBasedFileVo> list = EgovFileUploadUtil.uploadFiles(req, fileBasePath); //파일 업로드 
    		
           	if (list.size() > 0) {
           		EgovFormBasedFileVo vo = list.get(0);
           		
           		 //db 에 insert
           		fileIemSn = insertCmmnFileInfo(fileIdntfrCode, vo.getPhysicalName(), vo.getFileName(), String.valueOf(vo.getSize()), registUserId);
           		
           	}  
    		return fileIemSn;
    		
        }
        
         
        *//**
         * 파일을 저장하고 공통 파일에 등록 처리
         * @param req
         * @param filePath
         * @return
         * @throws Exception
         *//*
        public HashMap<String, String> saveCmmnMultiFile(HttpServletRequest req, String fileIdntfrCode, String registUserId) throws Exception {
    		HashMap<String, String> rtnMap = new HashMap<String, String>();
    		
    		
        	String fileBasePath = "";
        	if(fileIdntfrCode.equals(SangsProperties.getProperty("Globals.fileIdntfrCode_cms"))) {	 //cms 일때는 웹공간 업로드 공간에 저장한다.
        		fileBasePath = SangsProperties.getProperty("Globals.webUploadFileBasePath") + fileIdntfrCode ;
        	} else {
        		fileBasePath = SangsProperties.getProperty("Globals.attFileBasePath") + fileIdntfrCode ;
        	}
        	
        	 //파일 저장 
        	List<EgovFormBasedFileVo> list = EgovFileUploadUtil.uploadFiles(req, fileBasePath); //파일 업로드 
    		
           	if (list.size() > 0) {
           		int fileIemSn = -1;
           		for(int i = 0 ; i < list.size() ; i++) {
    	       		EgovFormBasedFileVo vo = list.get(i);
    	       		
    	       		 //db 에 insert
    	       		fileIemSn = insertCmmnFileInfo(fileIdntfrCode,  vo.getPhysicalName(), vo.getFileName(), String.valueOf(vo.getSize()), registUserId);
    	       		
    	        	rtnMap.put(vo.getHtmlName(), String.valueOf(fileIemSn));
           		}
           	}  
           	
    		return rtnMap;
    	
    	}
     
        
        
        *//**
         * 공통 파일 DB 에 insert
         * @param fileIdntfrCode
         * @param fileBasePath
         * @param fileNm
         * @param orgFileNm
         * @param fileSize
         * @param registUserId
         * @return
         * @throws Exception
         *//*
        public int insertCmmnFileInfo(String fileIdntfrCode, String fileNm, String orgFileNm, String fileSize, String registUserId) throws Exception {
        	return insertCmmnFileInfo(fileIdntfrCode, fileNm, orgFileNm, fileSize, registUserId, "");
        }
        public int insertCmmnFileInfo(String fileIdntfrCode, String fileNm, String orgFileNm, String fileSize, String registUserId, String fileIemSubSn ) throws Exception {
       
        	String fileBasePath = "";
        	
        	if(fileIdntfrCode.equals(SangsProperties.getProperty("Globals.fileIdntfrCode_cms"))) {	 //cms 일때는 웹공간 업로드 공간에 저장한다.
        		fileBasePath = SangsProperties.getProperty("Globals.webUploadFileBasePath") + fileIdntfrCode ;
        	} else {
        		fileBasePath = SangsProperties.getProperty("Globals.attFileBasePath") + fileIdntfrCode ;
        	}
        	
        	
        	if(!SangsUtil.isEmpty(fileIemSubSn))
        		fileBasePath = fileBasePath + "/" + fileIemSubSn;
        	
        	HashMap<String, String> insMap = new HashMap<String, String>();
        	insMap.put("fileIdntfrCode", fileIdntfrCode);
        	insMap.put("filePathNm", fileBasePath);
        	insMap.put("fileNm", fileNm);
        	insMap.put("fileOrginlNm", orgFileNm); 
        	insMap.put("fileSize", fileSize);
    	    insMap.put("dwldCnt", "0");
    	    insMap.put("registUserId", registUserId);
    	    
    	     //next item no 조회
    	    int fileIemSn = supCommonMapper.selectCmmnFileNextIemSn(insMap);
    		
    		insMap.put("fileIemSn", String.valueOf(fileIemSn));
        	
    		// 공통 파일 저장 
    		supCommonMapper.insertCmmnFileInfo(insMap);
    		
    		return fileIemSn;
        }
        
        
        *//**
         * 공통 파일 DB 에 사용여부 N 처리
         * @param fileIdntfrCode
         * @param fileIemSn
         * @param updtUserId
         * @throws Exception
         *//*
        public void deleteCmmnFileInfo(String fileIdntfrCode, String fileIemSn, String updtUserId ) throws Exception {
    	
    		Map<String, String> delFileData = new HashMap<String, String>();
    		
    		delFileData.put("fileIdntfrCode", fileIdntfrCode);
    		delFileData.put("fileIemSn", fileIemSn);
    	 	delFileData.put("updtUserId", updtUserId);
    		
    		 //첨부파일 삭제 처리
    	 	supCommonMapper.deleteCmmnFileInfo(delFileData);
        }*/

}
