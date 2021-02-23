package com.webapp.admin.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 *
 * Description : XXX Service
 *
 * Modification Information
 * 수정일           수정자    수정내용
 * -----------  --------------- -------
 * 2016. X. XX.  XX          최초작성
 *
 */
public interface AdminTempService {

    /**
     * list
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTempList(DataMap data) throws Exception;

    /**
     * info
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getTempInfo(DataMap data) throws Exception;

    /**
     * insert
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertTempInfo(DataMap data) throws Exception;

    /**
     * update
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateTempInfo(DataMap data) throws Exception;

    /**
     * delete
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteTempInfo(DataMap data) throws Exception;

}
