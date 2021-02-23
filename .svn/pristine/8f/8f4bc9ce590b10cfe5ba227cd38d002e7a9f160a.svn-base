package com.webapp.classdesk.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("convertJavaToProcedureMapper")
public interface ConvertJavaToProcedureMapper {
	
	/** 일반과정 수료처리(최종성적반영) */
	
	/*개설과정정보 조회*/
	EduMap getPrcNewCourseInfo(Map<String, Object> params) throws Exception;
	/*수료코드 일련번호 반환*/
	int getCompSeq(DataMap data)  throws Exception;
	/*수료코드 등록*/
	void insertPrcCompSeqNics(DataMap data) throws Exception;
	/*수료처리대상자 조회*/
	List<EduMap> getPrcUsersCompExec(Map<String, Object> params) throws Exception;
	/**/
	void updatePrcCompCourseUsers(Map<String, Object> hMap)  throws Exception;
	/*개설과정 수료처리 업데이트*/
	void updatePrcEdCourseSeqForStatCd(Map<String, Object> params);
	/*수료번호 갱신호출  - 수료번호(토파스(T), 민간(P) 수료번호(노동부(L))*/
	void updatePrcCompSeqNics(DataMap data);
	
	
	/** 수강자 개별 수료처리 */
	
	/**/
	int getPrcCourseTreeCnt(Map<String, Object> params);
	/*개설과정정보 및 수료처리대상자 조회*/
	EduMap getPrcNewCourseUsersCompExecInfo(Map<String, Object> params);
	/*과제 성적 반영 대상자 조회*/
	List<EduMap> getPrcReportApplyUsers(Map<String, Object> params);
	/*성적 반영 대상자 조회*/
	List<EduMap> getPrcExamApplyUsers(Map<String, Object> params);
	/*과제/성적 업데이트*/
	void updatePrcExamApplyUsers(Map<String, Object> params);
	/*강의실_시험_응시답안 내역 조회*/
	List<EduMap> getExamApplyHistList(DataMap data);
	/*시험_개설문제지 리스트*/
	EduMap getExamBinderForQuizInfo(DataMap data);
	/*시험 응시내역 채점점수  수정*/
	void updateExamScore(DataMap updMap);
	/*시험 응시내역 채점점수 합계 수정*/
	void updateExamScoreSum(DataMap updMap);
	/**/
	EduMap getExamRandomForQuizInfo(DataMap data);
	/**/
	EduMap getExamSetForQuizInfo(DataMap data);
	/*취소시스템 수강코드 조회*/
	EduMap getPrcCencelPaymentInfo(Map<String, Object> params);
	/*취소시스템 환불/미환불/제외 수정 */
	void updatePrcCencelPayment(Map<String, Object> params);
	/*취소시스템 수강정보 수정 */
	void updatePrcCencelPaymentCourseUser(Map<String, Object> params);
	
	
	List<EduMap> getExamRanExecSectionList(DataMap data);
	int getExamRanExecQuiz(DataMap data);
	int getExamRanExecRQuiz(DataMap data);
	int getExamRanExecApplyHist(DataMap data);
	void insertExamRanExecApplyHist(DataMap data);
	/*회원탈퇴처리*/
	void updateUserCancel(DataMap data);
	/*강사탈퇴처리*/
	void updateTutorCancel(DataMap data);
	/*개설중인 정보 전체삭제*/
	void deleteAllLmsCseqByCseqno(DataMap data);
	/*수료코드 조회*/
	EduMap getPrcCompSeqNicsInfo(DataMap data);
	/*유져정보조회*/
	EduMap getPrcVwCtUserInfoByUserno(Map<String, Object> params);
	
	
	
	/**/
	EduMap getPrcPaymentCountInfo(Map<String, Object> params);
	
	
	void updatePrcPamentSE2001(Map<String, Object> params);
	void updatePrcCourseUserSE2001(Map<String, Object> params);
	int insertPrcCourseUserSE2001(Map<String, Object> params);
	void insertPrcPamentSE2001(Map<String, Object> params);
	void updatePrcPamentSE2002(Map<String, Object> params);
	void updatePrcCourseUserSE2002(Map<String, Object> params);
	int insertPrcCourseUserSE2002(Map<String, Object> params);
	void insertPrcPamentSE2002(Map<String, Object> params);
	int getPrcPamentMaxcode(Map<String, Object> params);

}
