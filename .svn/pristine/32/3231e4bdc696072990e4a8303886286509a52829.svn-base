package com.webapp.admin.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 
 * Description : Login Mapper
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Mapper("adminLoginMapper")
public interface AdminLoginMapper {

	/**
     * 대분류 메뉴 리스트 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCmmnRootMenuList(DataMap data) throws Exception;
    
    /**
     * 소분류 메뉴 리스트 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCmmnSubMenuList(DataMap data) throws Exception;
    
    
	/**
     * 선택된 대분류 메뉴 정보 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCmmnRootMenuInfo(DataMap data) throws Exception;
    

	/**
     * 선택된 메뉴 정보 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCurrentMenuInfo(DataMap data) throws Exception;
    
    /**
     * 로그인 세션 저장
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateLoginInfo(DataMap data) throws Exception;
    
}
