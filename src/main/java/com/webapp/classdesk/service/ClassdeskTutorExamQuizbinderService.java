package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorExamQuizbinder Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskTutorExamQuizbinderService {

    /**
     * 바인더 리스트 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeExamBinderList(DataMap data) throws Exception;

    /**
     * 문제 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeExamQuizList(DataMap data) throws Exception;

    /**
     * getSetTotalAllotInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getSetTotalAllotInfo(DataMap data) throws Exception;

    /**
     * 퀴즈 문제 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLeExamQuizInfo(DataMap data) throws Exception;

    /**
     * 바인더 시험 문제 수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getLeExamQuizTotal(DataMap data) throws Exception;

    /**
     * 바인더 시험 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertLeExamQuizDump(DataMap data) throws Exception;

    /**
     * 저정된 시험지 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deletetLeExamQuiz(DataMap data) throws Exception;

    /**
     * deletetLeExamQuizSeq
     * 
     * @param data
     * @throws Exception
     */
    void deletetLeExamQuizSeq(DataMap data) throws Exception;

    /**
     * updateLeExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    void updateLeExamQuiz(DataMap data) throws Exception;

    /**
     * insertLeExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    void insertLeExamQuiz(DataMap data) throws Exception;

    /**
     * 최종평가
     * 
     * @param data
     * @throws Exception
     */
    void updateLeExamBindYn(DataMap data) throws Exception;

    /**
     * 과정목록 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getEdCourseList(DataMap data) throws Exception;

    /**
     * 바인더  문제 등록 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    void qExec(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 덤프 문제 등록
     * 
     * @param data
     * @throws Exception
     */
    void dumpExec(DataMap data) throws Exception;
}
