package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk UserReport Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskUserReportService {

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserReportList(DataMap data) throws Exception;

    /**
     * 과제 제출 등록(임시/완료)
     * 
     * @param data
     * @throws Exception
     */
    void insertReportApply(DataMap data) throws Exception;

    /**
     * 과제 제출 수정(임시/완료)
     * 
     * @param data
     * @throws Exception
     */
    void updateReportApply(DataMap data) throws Exception;

    /**
     * 과제 제출 저장(임시/완료)
     * 
     * @param data
     * @throws Exception
     */
    void saveReportApply(HttpServletRequest request, DataMap data) throws Exception;
}
