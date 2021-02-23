package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk Board Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskBoardService {

    /**
     * getBoardList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardList(DataMap data) throws Exception;

    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertBoardInfo(DataMap data) throws Exception;

    /**
     * getMaxBoardNo
     * 
     * @return
     * @throws Exception
     */
    int getMaxBoardNo() throws Exception;

    /**
     * getBoardView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardView(DataMap data) throws Exception;

    /**
     * updateBoardViewCnt
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardViewCnt(DataMap data) throws Exception;

    /**
     * updateBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardInfo(DataMap data) throws Exception;

    /**
     * deleteBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void deleteBoardInfo(DataMap data) throws Exception;

    /**
     * getFileInfo - 안쓰는것같음
     * 
     * @param fileNo
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(int fileNo) throws Exception;

    /**
     * deleteFileInfo - 안쓰는것같음
     * 
     * @param data
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;

    /**
     * insertFileInfo - 안쓰는것같음
     * 
     * @param data
     * @throws Exception
     */
    void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * getFileList - 안쓰는것같음
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(DataMap data) throws Exception;

    /**
     * getCourseBbsList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseBbsList(DataMap data) throws Exception;

    /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    void saveBbs(HttpServletRequest request, DataMap data) throws Exception;
    
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
