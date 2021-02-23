package com.webapp.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsMap;

/**
 * 
 * Description : 특강관리 Service
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 21.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
public interface AdminExcelSmsService {
	
	/**
	 * 특강 엑셀 업로드 실행
	 * @param rMap
	 * @throws Exception
	 */
	void insertExcelSmsUpload(DataMap rMap) throws Exception;
	
	/**
     * 공통코드 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getExcelSmsListCount(DataMap data) throws Exception;
    
    /**
     * 공통코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getExcelSmsList(DataMap data) throws Exception;
    
    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getExcelFileInfo(DataMap data) throws Exception;
}