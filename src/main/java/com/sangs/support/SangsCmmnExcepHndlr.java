package com.sangs.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

/**
 * Description : 공통서비스의 exception 처리 클래스
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2015.02.23  soundheaven1			수정
 *
 */

public class SangsCmmnExcepHndlr implements ExceptionHandler {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	* @Description 공통 Exception 발생
	* @param ex
	* @param packageName
	*  
	*/
	@Override
	public void occur(Exception ex, String packageName) {
	}
	
}
