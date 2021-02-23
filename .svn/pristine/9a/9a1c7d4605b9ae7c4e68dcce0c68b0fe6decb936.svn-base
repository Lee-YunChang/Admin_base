package com.webapp.classdesk.service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk Prog Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskProgService {

    /**
     * 진도처리관련
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEdCourseTreeInfo(DataMap data) throws Exception;

    /**
     * getLeCourseTreeHistInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLeCourseTreeHistInfo(DataMap data) throws Exception;

    /**
     * 현재까지 학습한 페이지 (FRAMESEQ)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getFrameseqInfo(DataMap data) throws Exception;

    /**
     * 최초 학습 정보 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertLeCourseTreeHist(DataMap data) throws Exception;

    /**
     * 학습정보 저장3
     * 
     * @param data
     * @throws Exception
     */
    void updateLeCourseTreeHist(DataMap data) throws Exception;

    /**
     * getEduseqYnInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEduseqYnInfo(DataMap data) throws Exception;

    /**
     * 성적 산출을 위한 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getResultInfo(DataMap data) throws Exception;

    /**
     * 업데이트 성적
     * 
     * @param data
     * @throws Exception
     */
    void updateEvalProg(DataMap data) throws Exception;

    /**
     * 진도처리
     * 
     * @param data
     * @return
     * @throws Exception
     */
    String progExec(DataMap requestMap) throws Exception;

    
}
