package com.webapp.admin.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 
 * Description : Mailman Mapper 
 *
 * Modification Information
 * 수정일			 수정자						수정내용
 * -----------	-----------------------------  -------
 * 2016. 6. 9.	 조남훈, epsvkfo@sangs.co.kr 	최초작성
 *
 */
@Mapper("adminMailmanMapper")
public interface AdminMailmanMapper {

	/**
     * 메일 템플릿 관리 목록 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSyMailTplList(DataMap data) throws Exception;
    
    /**
     * 메일 템플릿관리 (등록/수정 폼)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getSyMailTplInfo(DataMap data) throws Exception;
    
    /**
     * 메일 템플릿관리 목록 MAX TPLNO 추출
     *
     * @param data
     * @return
     * @throws Exception
     */
	int getSyMailTplTplnoMaxInfo(DataMap data) throws Exception;
	
	/**
     * 메일 템플릿관리 (등록 실행)
     *
     * @param data
     * @throws Exception
     */
	void insertSyMailTplInfo(DataMap data) throws Exception;
	
	/**
     * 메일 템플릿관리 (수정 실행)
     *
     * @param data
     * @throws Exception
     */
	void updateSyMailTplInfo(DataMap data) throws Exception;
	
	/**
     * 메일 템플릿관리 (삭제 실행)
     *
     * @param data
     * @throws Exception
     */
	void mailDeleteExec(DataMap data) throws Exception;
	
	/**
     * 메일 발송목록관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getSyMailLogList(DataMap data) throws Exception;
	
	/**
     * 메일 발송목록관리 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
	EduMap getSyMailLogInfo(DataMap rMap) throws Exception;

}
