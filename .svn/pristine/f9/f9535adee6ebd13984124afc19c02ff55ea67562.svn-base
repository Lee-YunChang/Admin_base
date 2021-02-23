package com.webapp.classdesk.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorReport Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskTutorReportService {

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getReportList(DataMap data) throws Exception;

    /**
     * 과제 상세
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getReportItem(DataMap data) throws Exception;

    /**
     * 과제 배점 총 카운트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getReportEvalSummary(DataMap data) throws Exception;

    /**
     * 과제 배점 총 카운트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMaxReportSeqNo(DataMap data) throws Exception;

    /**
     * getEvalReportInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEvalReportInfo(DataMap data) throws Exception;

    /**
     * 과제 등록
     * 
     * @param data
     * @throws Exception
     */
    void insertReport(DataMap data) throws Exception;

    /**
     * 과제 수정
     * 
     * @param data
     * @throws Exception
     */
    void updateReport(DataMap data) throws Exception;

    /**
     * 과제 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deleteReport(DataMap data) throws Exception;

    /**
     * 과제  제출자 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deleteReportApply(DataMap data) throws Exception;

    /**
     * 과제 제출자 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getReportApplyList(DataMap data) throws Exception;

    /**
     * getReportApplyInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getReportApplyInfo(DataMap data) throws Exception;

    /**
     * 과제 최종평가반영
     * 
     * @param data
     * @throws Exception
     */
    void updateReportEvalFinal(DataMap data) throws Exception;

    /**
     * 과제 평가
     * 
     * @param data
     * @throws Exception
     */
    void updateUserReportEval(DataMap data) throws Exception;

    /**
     * getLeExamSetQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeExamSetQuizList(DataMap data) throws Exception;

    /**
     * 성적 업데이트프로시저 실행
     * 
     * @param data
     * @throws Exception
     */
    void callLmsCourseRecordExec(Map data) throws Exception;

    /**
     * 과제 등록 / 수정 / 삭제 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    void execReportApply(HttpServletRequest request, DataMap data, String saveFlg) throws Exception;

    /**
     * 최종평가 반영
     * 
     * @param data
     * @throws Exception
     */
    void execReportEvalFinal(DataMap data) throws Exception;
}
