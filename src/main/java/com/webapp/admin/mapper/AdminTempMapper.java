package com.webapp.admin.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 *
 * Description : User Mapper
 *
 * Modification Information
 * 수정일			 수정자	수정내용
 * -----------	-------------  -------
 * 2016. X. XX.	 XXX 	최초작성
 *
 */
@Mapper("adminTempMapper")
public interface AdminTempMapper {

    /**
     * list
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTempList(DataMap data) throws Exception;

    /**
     * info
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTempInfo(DataMap data) throws Exception;

    /**
     * update
     *
     * @param data
     * @throws Exception
     */
    void updateTempInfo(DataMap data) throws Exception;


    /**
     * insert
     *
     * @param data
     * @throws Exception
     */
    void insertTempInfo(DataMap data) throws Exception;


    /**
     * delete
     *
     * @param data
     * @throws Exception
     */
    void deleteTempInfo(DataMap data) throws Exception;


}