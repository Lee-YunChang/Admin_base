package com.webapp.classdesk.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorResult Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskTutorResultService {

    /**
     * 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeCourseUSerList(DataMap data) throws Exception;

    /**
     * 상시과정 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeCourseAlwaysUSerList(DataMap data) throws Exception;

    /**
     * updateLeCourseUserInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateLeCourseUserInfo(DataMap data) throws Exception;

    /**
     * updateLeCourseUserRankInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateLeCourseUserRankInfo(DataMap data) throws Exception;

    /**
     * getEdCourseInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEdCourseInfo(DataMap data) throws Exception;

    /**
     * courseCompExec
     * 
     * @param data
     * @throws Exception
     */
    void courseCompExec(Map data) throws Exception;

    /**
     * cuserCompExec
     * 
     * @param data
     * @throws Exception
     */
    void cuserCompExec(Map data) throws Exception;

    /**
     * 수강자별 성적 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    void resultExec(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    void resultFinalExec(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 상시 전체 성적 실행
     * 
     * @param request
     * @param data
     * @param isFinal
     * @throws Exception
     */
    void resultAlwaysExec(HttpServletRequest request, DataMap data, boolean isFinal) throws Exception;
    
    /**
     * getOpenTypeInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    String getMtCtypeCode(DataMap data) throws Exception;
    
    /**
     * 과정관리 > 과정관련 파일등록
     * @param fileList
     * @throws Exception
     */
    void insertCourseFileInfo(DataMap fileMap) throws Exception;
    
    /**
     * 과정관리 > 과정관련 파일등록
     * @param fileList
     * @throws Exception
     */
    void insertLectureFileInfo(DataMap fileMap) throws Exception;
    
    /**
     * getEdCourseInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseFileInfo(DataMap data) throws Exception;
    
    /**
     * getEdCourseInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseTxtFileInfo(DataMap data) throws Exception;
    
    /**
     * 자료실 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteFile(DataMap data) throws Exception;
}
