package com.webapp.classdesk.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorResult Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorResultMapper")
public interface ClassdeskTutorResultMapper {
	
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
	 * updateLeCourseUserInfo
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeCourseUserInfo2(DataMap data) throws Exception;
	
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
	
	EduMap getEdCourseSeqInfo(DataMap rMap) throws Exception;
	
	void updateCourseFinal(DataMap rMap) throws Exception;
	
	/**
	 * 수료코드번호생성
	 * 
	 * @param data
	 * @throws Exception
	 */
	int getMaxCompCode(DataMap rMap) throws Exception;

	/**
	 * 수료코드번호업데이트
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateMaxCompCode(DataMap rMap) throws Exception;
	
	/**
     * getOpenTypeInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    String getMtCtypeCode(DataMap data) throws Exception;

    /**
     * 과정관리 > 게시글 파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertFileInfo(DataMap data) throws Exception;
    
    /**
     * 과정관리 > 게시글 파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertLectureFileInfo(DataMap data) throws Exception;
    
    /**
     * 과정관리 > 게시글 파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseFileInfo(DataMap data) throws Exception;
    
    /**
     * 과정관리 > 게시글 파일 등록
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
    void deleteFile(DataMap dMap);
    

    
    /**
     * 수료코드 구분값 가져오기
     *
     * @param data
     * @return
     * @throws Exception
     */
    String getCompGubunInfo(DataMap data) throws Exception;
}
