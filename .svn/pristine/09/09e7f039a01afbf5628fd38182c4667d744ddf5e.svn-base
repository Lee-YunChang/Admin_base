package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorDiscuss Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.08.19   황두은           최초작성
 *
 */
public interface ClassdeskTutorDiscussService {
	 /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    void saveBbs(HttpServletRequest request, DataMap data) throws Exception;	
    
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
     * getFileList - 안쓰는것같음
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
     * getRcmndCount
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
    void insertRcmndInfo(HttpServletRequest request, DataMap data) throws Exception;	
    
    /**
     * getRcmndCount
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
     * 파일리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseFileList(DataMap data) throws Exception;
    /**
     *  파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteEdDataFile(DataMap data) throws Exception;
    
    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo2(DataMap data) throws Exception;
}
