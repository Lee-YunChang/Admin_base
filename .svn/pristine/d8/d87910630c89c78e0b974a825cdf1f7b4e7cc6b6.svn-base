package com.webapp.classdesk.mapper;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk Prog Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskProgMapper")
public interface ClassdeskProgMapper {
	
	/**
	 * 진도처리관련
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getEdCourseTreeInfo(DataMap data) throws Exception;
	
	/**
	 * getLeCourseTreeHistInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getLeCourseTreeHistInfo(DataMap data) throws Exception;
	
	/**
	 * 현재까지 학습한 페이지 (FRAMESEQ)
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	int getFrameseqInfo(DataMap data) throws Exception;
	
	/**
	 * 최초 학습 정보 저장
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertLeCourseTreeHist(DataMap data) throws Exception;
	
	/**
	 * 학습정보 저장3
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeCourseTreeHist(DataMap data) throws Exception;
	
	/**
	 * getEduseqYnInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getEduseqYnInfo(DataMap data) throws Exception;
	
	/**
	 * 성적 산출을 위한 정보
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getResultInfo(DataMap data) throws Exception;
	
	/**
	 * 업데이트 성적
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateEvalProg(DataMap data) throws Exception;
	
}
