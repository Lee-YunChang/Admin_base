package com.webapp.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.sangs.support.DataMap;

/**
 * Description : Common Access Log Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

public interface CommonAccessLogService {

	/**
	 * 접속로그 등록
	 * @param req
	 * @param sysGb
	 * @throws Exception
	 */
	void insertAccessLog (HttpServletRequest req, String sysGb) throws Exception;
	
}
