package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk UserPoll Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskUserPollMapper")
public interface ClassdeskUserPollMapper {
	
	/**
	 * 클래스데스크 > 학생 > 설문
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getPollApplyMainList(DataMap data) throws Exception;
	
	/**
	 * 설문 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getUserPollList(DataMap data) throws Exception;
	
	/**
	 * 강의실 설문 응시내역
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertPollApply(DataMap data) throws Exception;
	
	/**
	 * 강의실 설문 응시답안
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertPollApplyHist(DataMap data) throws Exception;
	
	/**
	 * 설문 실시간 정답
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updatePollRealTmAns(DataMap data) throws Exception;
	
	/**
	 * updatePollApply
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updatePollApply(DataMap data) throws Exception;
	
	/**
	 * 과제 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getPollApplyHistList(DataMap data) throws Exception;
}
