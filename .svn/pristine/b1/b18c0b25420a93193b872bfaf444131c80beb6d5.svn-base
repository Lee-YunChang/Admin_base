package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

public interface ClassdeskTutorExamQuizsetService {

    /**
     * 세트방식 출제 정책 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeExamSetList(DataMap data) throws Exception;

    /**
     * 세트방식 세트 등록
     * 
     * @param data
     * @throws Exception
     */
    void insertLeExamSet(DataMap data) throws Exception;

    /**
     * 세트방식 세트 수정
     * 
     * @param data
     * @throws Exception
     */
    void updateLeExamSet(DataMap data) throws Exception;

    /**
     * 세트방식 문제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeExamSetQuizList(DataMap data) throws Exception;

    /**
     * 세트 문제 총 배점 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getSetTotalAllotInfo(DataMap data) throws Exception;

    /**
     * 세트 문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLeExamSetQuizInfo(DataMap data) throws Exception;

    /**
     * updateLeExamSetQuiz
     * 
     * @param data
     * @throws Exception
     */
    void updateLeExamSetQuiz(DataMap data) throws Exception;

    /**
     * insertLeExamSetQuiz
     * 
     * @param data
     * @throws Exception
     */
    void insertLeExamSetQuiz(DataMap data) throws Exception;

    /**
     * 문제 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deletetLeExamSetQuiz(DataMap data) throws Exception;

    /**
     * (문제은행) 출제정책 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getEdExamSectionList(DataMap data) throws Exception;

    /**
     * insertLeExamSetQuizExamBankData
     * 
     * @param data
     * @throws Exception
     */
    void insertLeExamSetQuizExamBankData(DataMap data) throws Exception;

    /**
     * 세트문제 등록 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    void exec(HttpServletRequest request, DataMap rMap) throws Exception;

    /**
     * 세트문제 퀴즈 문제 등록 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    void qExec(HttpServletRequest request, DataMap rMap) throws Exception;

    /**
     * 시험문제 삭제 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    void qDelExec(DataMap data) throws Exception;

    /**
     * 문제은행 문제 등록 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    void quizbankExec(HttpServletRequest request, DataMap rMap) throws Exception;

    /**
     * 엑셀저장
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    void qExcelExec(HttpServletRequest request, DataMap data) throws Exception;

}
