package com.webapp.admin.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 
 * Description : 특강관리 Mapper
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Mapper("adminExcelSmsMapper")
public interface AdminExcelSmsMapper {
	
	/**
     * 특강 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertExcelSmsUpload(DataMap data) throws Exception;
    
    /**
     * 엑셀 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getExcelSmsListCount(DataMap data) throws Exception;
    
    /**
     * 엑셀 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getExcelSmsList(DataMap data) throws Exception;
    
    /**
     * 파일정보 로딩
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getExcelFileInfo(DataMap data) throws Exception;
    }