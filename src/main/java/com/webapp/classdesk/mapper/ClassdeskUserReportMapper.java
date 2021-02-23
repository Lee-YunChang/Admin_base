package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk UserReport Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskUserReportMapper")
public interface ClassdeskUserReportMapper {
	
	/**
	 * 과제 목록
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getUserReportList(DataMap data) throws Exception;
	
	/**
	 * 과제 제출 등록(임시/완료)
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertReportApply(DataMap data) throws Exception;
	
	/**
	 * 과제 제출 수정(임시/완료)
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateReportApply(DataMap data) throws Exception;
}
