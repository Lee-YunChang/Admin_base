package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorDiscuss Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.08.19   황두은           최초작성
 *
 */
@Mapper("classdeskTutorDiscussMapper")
public interface ClassdeskTutorDiscussMapper {
	
    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertDiscussInfo(DataMap data) throws Exception;	
    
    /**
     * insertBoardReplyInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertDiscussReplyInfo(DataMap data) throws Exception;	
    
    
    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateFileBbsno(DataMap data) throws Exception;
    
    /**
     * getMaxBoardNo
     * 
     * @return
     * @throws Exception
     */
    int getMaxBoardNo() throws Exception;
    
    /**
     * updateBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardInfo(DataMap data) throws Exception;
    
    /**
     * getCourseDiscussList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseDiscussList(DataMap data) throws Exception;
	
    /**
     * getDiscussView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getDiscussView(DataMap data) throws Exception;
	 
    /**
     * getGrpNo
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getGrpNo(DataMap data) throws Exception;
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(DataMap data) throws Exception;
    
    /**
     * updateDiscussViewCnt
     * 
     * @param data
     * @throws Exception
     */
    void updateDiscussViewCnt(DataMap data) throws Exception;
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getRcmndCount(DataMap data) throws Exception;
    
    /**
     * getUnityMberno
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    String getUnityMberno(String unityId) throws Exception;
    
    
    /**
     * insertRcmndInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertRcmndInfo(DataMap data) throws Exception;	
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> checkRcmnd(DataMap data) throws Exception;
    
    /**
     * updateReplyList
     * 
     * @param data
     * @throws Exception
     */
    void updateReplyList(DataMap data) throws Exception;
    
    /**
     *  파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteEdDataFile(DataMap dMap);
    
	/**
     *  파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	void insertEdDataFile(DataMap data) throws Exception;
    
    /**
     *  파일 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseFileList(DataMap data) throws Exception; 
    /**
     * 파일 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo2(DataMap data) throws Exception;
}