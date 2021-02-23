package com.webapp.admin.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * 
 * Description : Smsman Service
 *
 * Modification Information
 * 수정일			 수정자						수정내용
 * -----------	-----------------------------  ---------
 * 2016. 6. 9.	 조남훈, epsvkfo@sangs.co.kr 	최초작성
 *
 */

public interface AdminSmsmanService {
	
	/**
     * SMS 템플릿관리 목록 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSySmsTplList(DataMap data) throws Exception;
    
    /**
     * SMS 템플릿관리 팝업 (등록/수정 폼)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getSySmsTplInfo(DataMap data) throws Exception;
    
	/**
     * SMS 템플릿관리 목록 MAX TPLNO 추출
     *
     * @param data
     * @return
     * @throws Exception
     */
	int getSySmsTplTplnoMaxInfo(DataMap data) throws Exception;
	
	/**
     * SMS 템플릿관리 (등록 실행)
     *
     * @param data
     * @throws Exception
     */
	void insertSySmsTplInfo(DataMap data) throws Exception;
	
	/**
     * SMS 템플릿관리 (수정 실행)
     *
     * @param data
     * @throws Exception
     */
	void updateSySmsTplInfo(DataMap data) throws Exception;
	
	/**
     * SMS 템플릿관리 (삭제 실행)
     *
     * @param data
     * @throws Exception
     */
	void smsDeleteExec(DataMap data) throws Exception;
	/**
     * SMS 발송목록관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getSySmsLogList(DataMap data) throws Exception;
	
	/**
     * SMS 발송목록관리 상세보기 팝업
     *
     * @param data
     * @return
     * @throws Exception
     */
	EduMap getSySmsLogInfo(DataMap rMap) throws Exception;

}