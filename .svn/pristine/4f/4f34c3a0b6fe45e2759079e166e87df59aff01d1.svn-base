package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorExamQuizset Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorExamQuizsetMapper")
public interface ClassdeskTutorExamQuizsetMapper {
	
	/**
	 * 세트방식 출제 정책 리스트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeExamSetList(DataMap data) throws Exception;
	
	/**
	 * 세트방식 세트 등록
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertLeExamSet(DataMap data) throws Exception;
	
	/**
	 * 세트방식 세트 수정
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeExamSet(DataMap data) throws Exception;
	
	/**
	 * 세트방식 문제 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeExamSetQuizList(DataMap data) throws Exception;
	
	/**
	 * 세트 문제 총 배점 
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getSetTotalAllotInfo(DataMap data) throws Exception;
	
	/**
	 * 세트 문제 정보
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getLeExamSetQuizInfo(DataMap data) throws Exception;
	
	/**
	 * updateLeExamSetQuiz
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeExamSetQuiz(DataMap data) throws Exception;
	
	/**
	 * insertLeExamSetQuiz
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertLeExamSetQuiz(DataMap data) throws Exception;
	
	/**
	 * 문제 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deletetLeExamSetQuiz(DataMap data) throws Exception;
	
	/**
	 * (문제은행) 출제정책 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getEdExamSectionList(DataMap data) throws Exception;
	
	/**
	 * insertLeExamSetQuizExamBankData
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertLeExamSetQuizExamBankData(DataMap data) throws Exception;
	
}
