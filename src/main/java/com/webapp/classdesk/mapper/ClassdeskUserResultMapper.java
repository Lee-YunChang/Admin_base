package com.webapp.classdesk.mapper;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk UserResult Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskUserResultMapper")
public interface ClassdeskUserResultMapper {
	
	/**
	 * getLeCourseUserResultInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getLeCourseUserResultInfo(DataMap data) throws Exception;
}
