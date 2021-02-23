package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorExamQuizbank Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskTutorExamQuizbankService {

    /**
     * getEdExamQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getEdExamQuizList(DataMap data) throws Exception;

    /**
     * getLdExamQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeExamQuizList(DataMap data) throws Exception;

    
    /**
     * getAllCourseQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getAllCourseQuizList(DataMap data) throws Exception;
    
    /**
     * getEdExamQuizInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEdExamQuizInfo(DataMap data) throws Exception;

    /**
     * getLeExamQuizInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLeExamQuizInfo(DataMap data) throws Exception;
    
    /**
     * 문제 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deletetEdExamQuiz(DataMap data) throws Exception;

    /**
     * updateEdExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    void updateEdExamQuiz(DataMap data) throws Exception;

    /**
     * insertEdExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    void insertEdExamQuiz(DataMap data) throws Exception;

    /**
     * 문제은행 저장 / 삭제
     * 
     * @param request
     * @param data
     * @param saveType
     * @throws Exception
     */
    void qExec(HttpServletRequest request, DataMap data, String saveType) throws Exception;

    /**
     * 엑셀저장
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    void qExcelExec(HttpServletRequest request, DataMap data) throws Exception;

}
