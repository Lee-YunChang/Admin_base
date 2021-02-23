package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorProgress Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorProgressMapper")
public interface ClassdeskTutorProgressMapper {
	
	/**
	 * getEdCourseTreeList
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getEdCourseTreeList(DataMap data) throws Exception;
	
	/**
	 * getConurlInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getConurlInfo(DataMap data) throws Exception;
}
