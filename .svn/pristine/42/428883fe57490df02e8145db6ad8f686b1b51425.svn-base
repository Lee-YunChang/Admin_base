package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk Board Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskBoardMapper")
public interface ClassdeskBoardMapper {

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
     * getFileInfo
     * 
     * @param fileNo
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(int fileNo) throws Exception;

    /**
     * deleteFileInfo
     * 
     * @param data
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;

    /**
     * insertFileInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertFileInfo(DataMap data) throws Exception;

    /**
     * getFileList
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
