package com.webapp.common.mapper;

import com.sangs.support.DataMap;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Access Log Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Mapper("commonAccessLogMapper")
public interface CommonAccessLogMapper {
	
	/**
	 * 접속로그 신규등록 
	 * @param data
	 * @throws Exception
	 */
	void insertAccessLogInfo(DataMap data) throws Exception;
	
	/**
	 * 접속로그 통계 등록여부확인용
	 * @param data
	 * @return
	 * @throws Exception
	 */
	int getAccesLogStatsCount(DataMap data) throws Exception;
	
	/**
	 * 접속로그 통계 신규등록
	 * @param data
	 * @throws Exception
	 */
	void insertAccessLogStatsInfo(DataMap data) throws Exception;
	
	/**
	 * 접속로그 통계 업데이트 
	 * @param data
	 * @throws Exception
	 */
	void updateAccessLogStatsInfo(DataMap data) throws Exception;

}
