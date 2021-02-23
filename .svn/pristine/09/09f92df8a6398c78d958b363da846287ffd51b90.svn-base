package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorPoll Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskTutorPollService {

    /**
     * getPollMainList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollMainList(DataMap data) throws Exception;
    /**
     * 설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSurveyList(DataMap data) throws Exception; 
    
    /**
     * 설문 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getModuleList(DataMap data) throws Exception;
    /**
     * 설문 상세보기
    *
    * @param data
    * @return
    * @throws Exception
    */
   List<EduMap> getQuestionList(DataMap data) throws Exception;
   
   /**
    * 설문 상세보기 
    *
    * @param data
    * @return
    * @throws Exception
    */
   List<EduMap> getSurveyModuleList(DataMap data) throws Exception;
   
   /**
    * 설문 상세보기
    *
    * @param data
    * @return
    * @throws Exception
    */
   EduMap getSurveyView(DataMap data) throws Exception;
   
   /**
    * 주관식 객관식 코드 출력 
    *
    * @param data
    * @return
    * @throws Exception
    */
   List<EduMap> selectMtCpollCode(DataMap data) throws Exception;
   
    /**
     * 설문 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollList(DataMap data) throws Exception;

    /**
     * 설문 MAX NO
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMaxPollcSeqNo(DataMap data) throws Exception;

    /**
     * 설문 메인 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertPoll(DataMap data) throws Exception;

    /**
     * 설문 임시저장 / 설문개시
     * 
     * @param data
     * @throws Exception
     */
    void updatePoll(DataMap data) throws Exception;

    /**
     * selectMstPollCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectMstPollCnt(DataMap data) throws Exception;

    /**
     * selectMstPollQuizCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectMstPollQuizCnt(DataMap data) throws Exception;

    /**
     * 설문 문항 일괄 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertMstPollQuiz(DataMap data) throws Exception;

    /**
     * getPollItem
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollItem(DataMap data) throws Exception;

    /**
     * 설문 문항 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertPollQuiz(DataMap data) throws Exception;

    /**
     * 설문 문항 수정
     * 
     * @param data
     * @throws Exception
     */
    void updatePollQuiz(DataMap data) throws Exception;

    /**
     * 설문 문항 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deletePollQuiz(DataMap data) throws Exception;

    /**
     * 설문통계
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollStatList(DataMap data) throws Exception;

    /**
     * 설문 주관식 내용 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollStatEtcList(DataMap data) throws Exception;

    /**
     * getPollcSeqNoInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getPollcSeqNoInfo(DataMap data) throws Exception;

    /**
     * 주관식답변(설문전체)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollStatDesList(DataMap data) throws Exception;

    /**
     * 설문 마스터 일괄저장
     * 
     * @param data
     * @throws Exception
     */
    void mtscallExec(DataMap data) throws Exception;

    /**
     * 설문 문항 등록 / 수정 / 삭제 실행 
     * 
     * @param request
     * @param data
     * @param saveFlg
     * @throws Exception
     */
    void qExec(HttpServletRequest request, DataMap data, String saveFlg) throws Exception;
    
    /**
     * 설문 게시글 최대번호
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxSurveyNo(DataMap data) throws Exception;
    
    
    /**
     * 설문 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertSurveyInfo(DataMap data) throws Exception;
    
    /**
     * 설문 질문 최대번호
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxQuizNo(DataMap data) throws Exception;
    
    /**
     * 설문 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertQuizInfo(DataMap data) throws Exception;
    
    /**
     * 설문 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertQuizItemInfo(DataMap data) throws Exception;
    
    /**
     * 게시글 삭제(설문 수정)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteSurveyInfo(DataMap data) throws Exception;
    
    /**
     * 게시글 삭제(설문 수정)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteQuizInfo(DataMap data) throws Exception; 
    
    
    /**
     * 게시글 삭제(설문 수정)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteQuizItemInfo(DataMap data) throws Exception;
    
    /**
     * 설문 응시 이력(객관식)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollCnt(DataMap data) throws Exception;
    
    /**
     * 설문 응시 이력(주관식)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollAnswer(DataMap data) throws Exception;
    
    /**
     * 해당과정 강사목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorList(DataMap data) throws Exception;
    
    /**
     * 객관식 항목 별 평점
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollAvg(DataMap data) throws Exception;
    
    /**
     * 객관식 강사 별 평점
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollTutorAvg(DataMap data) throws Exception;
    
    List<EduMap> getPollChoiceStatsList(DataMap rMap)throws Exception;
    
    List<EduMap> getPollDesStatsList(DataMap rMap)throws Exception;
}
