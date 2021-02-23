package com.webapp.classdesk.service;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk UserExam Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskUserExamService {

    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamList(DataMap data) throws Exception;

    /**
     * getUserLectExamAppCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserLectExamAppCnt(DataMap data) throws Exception;

    /**
     * 강의실 시험 응시내역 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertLectExamApp(DataMap data) throws Exception;

    /**
     * insertUserLectExamSetAppHst
     * 
     * @param data
     * @throws Exception
     */
    void insertUserLectExamSetAppHst(DataMap data) throws Exception;

    /**
     * insertUserLectExamBinderAppHst
     * 
     * @param data
     * @throws Exception
     */
    void insertUserLectExamBinderAppHst(DataMap data) throws Exception;

    /**
     * getUserLectExamAppMaxSeq
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserLectExamAppMaxSeq(DataMap data) throws Exception;

    /**
     * 강의실 시험 응시답안 랜덤 등록
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamRandomExecute(Map data) throws Exception;

    /**
     * 시험 응시답안 랜덤 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamRdmMarkingExecute(Map data) throws Exception;

    /**
     * 시험 응시답안 세트 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamSetMarkingExecute(Map data) throws Exception;

    /**
     * 시험 응시답안 바인더 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamBinderMarkingExecute(Map data) throws Exception;

    /**
     * 수강생 시험 랜덤 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamRdmAppHistList(DataMap data) throws Exception;

    /**
     * 수강생 시험 세트 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamSetAppHistList(DataMap data) throws Exception;

    /**
     * 수강생 시험 바인더 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamBinderAppHistList(DataMap data) throws Exception;

    /**
     * 사용자 실시간 응시시간 저장
     * 
     * @param data
     * @throws Exception
     */
    void updateExamRealTmTime(Map data) throws Exception;

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    void updateExamRealTmAns(Map data) throws Exception;

    /**
     * 과정정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getOpenTypeInfo(DataMap data) throws Exception;

    /**
     * 사용자 시험 정보 저장
     * 
     * @param examMap
     * @param rMap
     * @throws Exception
     */
    void saveUserExamInfo(EduMap examMap, DataMap rMap) throws Exception;

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    void saveExamRealTmAns(Map data) throws Exception;

    /**
     * 시험제출
     * 
     * @param data
     * @throws Exception
     */
    void submitExec(DataMap data) throws Exception;
}
