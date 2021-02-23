package com.webapp.classdesk.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorReport Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorReportMapper")
public interface ClassdeskTutorReportMapper {
	
	/**
	 * 과제 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getReportList(DataMap data) throws Exception;
	
	/**
	 * 과제 상세
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getReportItem(DataMap data) throws Exception;
	
	/**
	 * 과제 배점 총 카운트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getReportEvalSummary(DataMap data) throws Exception;
	
	/**
	 * 과제 배점 총 카운트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getMaxReportSeqNo(DataMap data) throws Exception;
	
	/**
	 * getEvalReportInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getEvalReportInfo(DataMap data) throws Exception;
	
	/**
	 * 과제 등록
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertReport(DataMap data) throws Exception;
	
	/**
	 * 과제 수정
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateReport(DataMap data) throws Exception;
	
	/**
	 * 과제 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deleteReport(DataMap data) throws Exception;
	
	/**
	 * 과제  제출자 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deleteReportApply(DataMap data) throws Exception;
	
	/**
	 * 과제 제출자 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getReportApplyList(DataMap data) throws Exception;
	
	/**
	 * getReportApplyInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getReportApplyInfo(DataMap data) throws Exception;
	
	/**
	 * 과제 최종평가반영
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateReportEvalFinal(DataMap data) throws Exception;
	
	/**
	 * 과제 평가
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateUserReportEval(DataMap data) throws Exception;
	
	/**
	 * getLeExamSetQuizList
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeExamSetQuizList(DataMap data) throws Exception;
	
	/**
	 * 성적 업데이트프로시저 실행
	 * 
	 * @param data
	 * @throws Exception
	 */
	void callLmsCourseRecordExec(Map data) throws Exception;
	
	/**
	 * getValList
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getEvalList(DataMap data) throws Exception;
	
	/**
	 * getCuserNoList
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getCuserNoList(DataMap data) throws Exception;
	
	/**
	 * reportEvalFinalExec
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	void reportEvalFinalExec(DataMap data) throws Exception;
	
}
