package com.webapp.classdesk.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ConvertJavaToProcedureMapper;
import com.webapp.classdesk.service.ConvertJavaToProcedureService;


/**
 * 프로시저 자바 변환 모음 클래스 
 * @author kmg
 *
 */
@Service("convertJavaToProcedureService")
public class ConvertJavaToProcedureServiceImpl implements ConvertJavaToProcedureService{
	
	private Logger log = LogManager.getLogger(this.getClass());
	
	@Resource(name = "convertJavaToProcedureMapper")
    private ConvertJavaToProcedureMapper convertJavaToProcedureMapper;
	
	/**
     * 수강신청 프로시저     proceduer name : LMS_COURSE_APPLY_EXEC
     * @param params
     * @throws Exception 
     */
    public void lmsCourseApplyExec(Map<String, Object> params) throws Exception{
    	params.put("MT_PM_TYPE_CODE", "SFCOUR");
    	
    	EduMap payInfo = convertJavaToProcedureMapper.getPrcPaymentCountInfo(params);
    	EduMap seqInfo = convertJavaToProcedureMapper.getPrcPaymentCountInfo(params);
    	
    	params.put("MT_PM_STATUS_CODE", payInfo.get("MT_PM_STATUS_CODE"));
    	params.put("PAYMENT_UID_CNT", payInfo.get("PAYMENT_UID_CNT"));
    	params.put("PUID_CUSER_CNT", payInfo.get("PUID_CUSER_CNT"));
    	params.put("STUDY_SDATE", seqInfo.get("TODATE"));
		params.put("STUDY_EDATE", seqInfo.get("OP_DATE"));
    	
    	if("A".equals(seqInfo.getString("OPENTYPE"))){
    		params.put("STUDY_SDATE", seqInfo.get("TODATE"));
    		params.put("STUDY_EDATE", seqInfo.get("OP_DATE"));
    	}
    	
    	//TODO: MAXCODE 조회 쿼리 해야함.
    	//params.put("MAXCODE", 1); //임시
    	
    	params.put("MAXCODE", convertJavaToProcedureMapper.getPrcPamentMaxcode(params));
    	
    	if("SE2001".equals(payInfo.getString("MT_PM_STATUS_CODE"))){
    		if(payInfo.getInt("PAYMENT_UID_CNT") > 0 ){
    			convertJavaToProcedureMapper.updatePrcPamentSE2001(params);
    			convertJavaToProcedureMapper.updatePrcCourseUserSE2001(params);
    			
    		}else{
    			if(payInfo.getInt("PUID_CUSER_CNT") > 0 ){
    				throw new Exception("SE2001 error 프로시저 확인바람");
    			}
    			
    			int seqCuserno = convertJavaToProcedureMapper.insertPrcCourseUserSE2001(params);
    			
    			
    			params.put("SEQ_CUSERNO", seqCuserno);
    			convertJavaToProcedureMapper.insertPrcPamentSE2001(params);
    		}
    		
    	}else if("SE2002".equals(payInfo.getString("MT_PM_STATUS_CODE"))){
    		if(payInfo.getInt("PAYMENT_UID_CNT") > 0 ){
    			
    			convertJavaToProcedureMapper.updatePrcPamentSE2002(params);
    			convertJavaToProcedureMapper.updatePrcCourseUserSE2002(params);
    			
    		}else{
    			if(payInfo.getInt("PUID_CUSER_CNT") > 0 ){
    				throw new Exception("SE2002 error 프로시저 확인바람");
    			}
    			
    			int seqCuserno = convertJavaToProcedureMapper.insertPrcCourseUserSE2002(params);
    			
    			
    			params.put("SEQ_CUSERNO", seqCuserno);
    			
    			
    			
    			convertJavaToProcedureMapper.insertPrcPamentSE2002(params);
    		}
    	}
    }
	

    /**
     * 수강자 개별 수료처리
     * proceduer name : CUSER_COMP_EXEC
     * @param data
     * 		 courseno 과정코드
	 * 	 	 cseqno  개설코드
     * 		 cuserno 수강코드
     * @throws Exception 
     */
    public void cuserCompExec(Map<String, Object> params) throws Exception{
    	//TODO :안쓰는거 같음 프로시저에서 frameCnt가 사용되고 있지 않음
		int frameCnt = convertJavaToProcedureMapper.getPrcCourseTreeCnt(params);

		/*개설과정정보조회*/
		EduMap course = convertJavaToProcedureMapper.getPrcNewCourseUsersCompExecInfo(params); // cSeqNo

		/*유져정보조회*/
		params.put("USERNO", course.getInt("USERNO"));
		EduMap user = convertJavaToProcedureMapper.getPrcVwCtUserInfoByUserno(params);


		// -- 골드수료생
		if (course.getInt("FINAL_VAL") >= course.getInt("COMP_GVAL")) {
			
			params.put("MT_COMP_TYPE", "SA0003");/* 일반과정 고정 */
			params.put("COMPDATE", course.getString("STUDY_EDATE"));
			params.put(
					"COMPCODE",
					COMP_SEQ_GET("DAAA00".equals(course.getString("MT_CTYPE_CODE")) ? "E" : "C"
					, String.valueOf(params.get("compdate")), course.getString("COURSE_COMP_CODE")));
			params.put("ISPASS", "Y");
			params.put("COMNO", user.getInt("COMNO"));
			params.put("COMNAME", user.getString("COMNAME"));
			params.put("DEPTNAME", user.getString("DEPT_NAME"));
			params.put("POSITIONNAME", user.getString("POSITION_NAME"));
			
			convertJavaToProcedureMapper.updatePrcCompCourseUsers(params);

		} else {
			params.put("COMPDATE", "");
			params.put("COMPCODE", "");
			params.put("MT_COMP_TYPE", "");
			params.put("ISPASS", "N");
			params.put("COMNO", "");

			convertJavaToProcedureMapper.updatePrcCompCourseUsers(params);
		}
	}
    
    
    public String COMP_SEQ_GET(String gubun, String edateYear, String courseCompCode) throws Exception{
		DataMap data = new DataMap();
		data.putString("P_GUBUN", gubun);
		data.putString("P_YYYY", edateYear);
		data.putString("P_COURSE_COMP_CODE", courseCompCode);
		
		EduMap seqInfo = convertJavaToProcedureMapper.getPrcCompSeqNicsInfo(data);
		
		if(seqInfo != null){
			data.putInt("SEQ", seqInfo.getInt("SEQ"));
			data.putString("SEQSTR", seqInfo.getString("SEQSTR"));
		
		}else{
			data.putInt("SEQ", 1);
			data.putString("SEQSTR", "A");
			convertJavaToProcedureMapper.insertPrcCompSeqNics(data);
		}
		
		//TODO : seqInfo 데이타가 없을때도 로직을 타야하는지 체크
		if(data.getInt("SEQ") == 9999){
			data.putInt("SEQ", 1);
			data.putString("SEQSTR", String.valueOf(((char) (((int) data.getString("SEQSTR").charAt(0))+1))));
			
		}else{
			data.putInt("SEQ", data.getInt("SEQ")+1);
		}
		
		StringBuilder sb = new StringBuilder(); 
		
		if("C".equals(data.getString("P_GUBUN"))){
			sb.append("제");
			sb.append(data.getString("P_GUBUN"));
			sb.append(data.getString("P_YYYY"));
			sb.append("-");
			sb.append(lpad(data.getInt("SEQ"), 4, "0"));
			sb.append("호");
		
		}else if("E".equals(data.getString("P_GUBUN"))){
			sb.append("제");
			sb.append(data.getString("P_GUBUN"));
			sb.append(data.getString("P_YYYY"));
			sb.append("-");
			sb.append(data.getString("P_COURSE_COMP_CODE"));
			sb.append("-");
			sb.append(data.getString("SEQSTR"));
			sb.append(lpad(data.getInt("SEQ"), 4, "0"));
			sb.append("호");
		}
		
		convertJavaToProcedureMapper.updatePrcCompSeqNics(data);
		
		return sb.toString();
	}
    
    
    /**
     * 일반과정(온라인/집합/테스트) 취소시스템
     * proceduer name : LMS_COURSE_CANCEL_EXEC
     * @param data
     */
    public void lmsCourseCancelExec(Map<String, Object> params){
    	/***********************************************************
        SUBJECT    : 일반과정(온라인/집합/테스트) 취소시스템
        P_PAYMENT_UID        VARCHAR2,    -- 결제코드
	    P_USERNO            NUMBER,        -- 회원코드
	    P_MT_PM_STATUS_CODE    CHAR,        -- 취소상태코드 : SE1001 취소승인(환불) SE1002 취소승인(미환불)
	
	    P_CANCEL_APPDATE    VARCHAR2,    -- 취소 신청일자 : DEFAULT SYSDATE
	    P_CANCEL_CMT        VARCHAR2,    -- 취소 사유내용
	    P_CANCEL_REGDATE    VARCHAR2,    -- 취소 승인일자 : DEFAULT SYSDATE
	    P_CANCEL_PRICE        NUMBER,        -- 취소 환불금액
        ***********************************************************/    	
    	//-- 수강코드 조회
    	EduMap map =  convertJavaToProcedureMapper.getPrcCencelPaymentInfo(params);
    	
    	params.put("CUSERNO", map.getInt("CUSERNO"));
    	/*취소시스템 수강정보 수정 */
    	convertJavaToProcedureMapper.updatePrcCencelPaymentCourseUser(params);
    	/*취소시스템 환불/미환불/제외 수정 */
    	convertJavaToProcedureMapper.updatePrcCencelPayment(params);
    
    }
    
    
    
    /**
     *  성적반영 프로시저
     * proceduer name : LMS_COURSE_RECORD_EXEC
     * @param data
     */
    public void lmsCourseRecordExec(Map<String,Object> params){
    	 /*****************************************************************
        SUBJECT    : 성적반영 프로시저

        - 사전조건 :
            1) 과제 : 사용자가 과제를 제출하였으며, 최종 평가 완료된 과제 점수만 업데이트
        - 처리사항
            1) 각각 획득 점수를 조회하여 개별 성적 반영

        ****************************************************************/
    	/*P_KEY                    VARCHAR2,            -- 업무구분 키값 (EXAM : 시험 , REPORT : 과제 PROG : 진도)
	    P_CSEQNO                    NUMBER,            -- 개설코드 */
    	
    	
    	List<EduMap> list = new ArrayList<EduMap>();
    	
    	//  과제 성적 반영
    	if("REPORT".equals(params.get("P_KEY"))){
    		list =  convertJavaToProcedureMapper.getPrcReportApplyUsers(params); 
    	
    	}else if("EXAM_M".equals(params.get("P_KEY")) || "EXAM_F".equals(params.get("P_KEY"))){
    		list =  convertJavaToProcedureMapper.getPrcExamApplyUsers(params);
    	}
    	
    	for (EduMap eMap : list) {
    		params.put("CUSERNO", eMap.getString("CUSERNO"));
    		params.put("VAL", eMap.getString("VAL"));
    		convertJavaToProcedureMapper.updatePrcExamApplyUsers(params);
		}
    }
    
    /**
     *  클래스데스크 시험 바인더방식 채점 처리
     * proceduer name : LMS_COURSE_RECORD_EXEC
     * @param params
     */
    public void lmsExamBndMarkingExecute(DataMap data){
		/***********************************************************
	    SUBJECT    : 클래스데스크 시험 바인더방식 채점 처리
	    
	    LMS_EXAM_BND_MARKING_EXECUTE
	    LMS_EXAM_MARKING_EXECUTE
	    LMS_EXAM_SET_MARKING_EXECUTE
	    
	    P_COURSENO      NUMBER,     -- 과정코드
	    P_CUSERNO       NUMBER,     -- 수강코드
	    P_EXAMNO           NUMBER,  -- 시험출제순번
	    R_VAL           OUT NUMBER, -- 최종점수
	    
	    ptype <-- 타입별로 프로시저를 수행한다.
	    VALUE : BINDER, RANDOM, SET
	    ***********************************************************/
    	
    	DataMap quizParams = new DataMap();
    	quizParams.putString("P_EXAMNO", data.getString("P_EXAMNO"));
    	
    	String userAn = "";
    	String userAnText = "";
    	DataMap updMap = null;
    	int rVal = 0;
    	
    	for(EduMap pMap : convertJavaToProcedureMapper.getExamApplyHistList(data)){
    		quizParams.putInt("qno", pMap.getInt("QNO"));
    		
    		EduMap cMap = null;
    		
    		if("BINDER".equals(data.getString("ptype"))){
    			cMap = convertJavaToProcedureMapper.getExamBinderForQuizInfo(data);
    			
    		}else if("RANDOM".equals(data.getString("ptype"))){
    			cMap = convertJavaToProcedureMapper.getExamRandomForQuizInfo(data);
    			
    		}else if("SET".equals(data.getString("ptype"))){
    			cMap = convertJavaToProcedureMapper.getExamSetForQuizInfo(data);
    		}
    		
    			
			String isright = "N";
	    	int eval = 0;
			
			if(cMap.getInt("QTYPE") == 1 || cMap.getInt("QTYPE") == 2){
				userAn = pMap.getString("ITEMSEQ");
				
				if(cMap.getString("QUEST_AN").equals(cMap.getString("USER_AN"))){
					isright = "Y";
					eval = cMap.getInt("ALLOT");
				}
			}
			
			if(cMap.getInt("QTYPE") == 4){
				userAnText = pMap.getString("ANSWER");
				
				if(cMap.getString("QUEST_AN_TEXT").equals(cMap.getString("USER_AN_TEXT"))){
					isright = "Y";
					eval = cMap.getInt("ALLOT");
				}
			}
    			
			updMap =  new DataMap();	
			updMap.putInt("val", eval);
			updMap.putString("isright", isright);
			updMap.putInt("cuserno", data.getInt("cuserno"));
			updMap.putInt("examno", data.getInt("examno"));
			updMap.putInt("qseq", pMap.getInt("QSEQ"));
			
			//시험 응시내역 채점점수 합계 수정
			convertJavaToProcedureMapper.updateExamScore(updMap);
    		
			rVal = rVal+ eval;
    	}
    	
    	
    	data.putInt("val", rVal);
    	convertJavaToProcedureMapper.updateExamScoreSum(data);
    }
    
    
    
    /**
     * 클래스데스크 시험 랜덤 출제 처리
     * @param data
     */
    public void LMS_EXAM_RANDOM_EXECUTE(DataMap data){
        /***********************************************************
        SUBJECT    : 클래스데스크 시험 랜덤 출제 처리
	    P_COURSENO      NUMBER, -- 과정코드
	    P_CUSERNO       NUMBER, -- 수강코드
	    P_EXAMNO        NUMBER, -- 시험출제코드        
    	***********************************************************/    	
    	
    	int cnt = 1;
    	int qseq = 1;
    	
    	for(EduMap pMap : convertJavaToProcedureMapper.getExamRanExecSectionList(data)){
    		
    		data.putInt("secno", pMap.getInt("SECNO"));
    		int qcnt = convertJavaToProcedureMapper.getExamRanExecQuiz(data);
    		
    		while(pMap.getInt("TOTALQNUM") >= cnt){
    			data.putInt("randno", randomRange(1, qcnt));
    			
    			int qno = convertJavaToProcedureMapper.getExamRanExecRQuiz(data);
    			
    			data.putInt("qno", qno);
    			int idx = convertJavaToProcedureMapper.getExamRanExecApplyHist(data);
    			
    			if(idx == 0){
    				data.putInt("qseq", qseq);
    				convertJavaToProcedureMapper.insertExamRanExecApplyHist(data);
    				qseq = qseq+1;
    				idx = 0;
    				break;
    			}
    			cnt = cnt+1;
    		}
    		cnt = 1;
    	}
    }
    
    
    /**
     * 회원탈퇴 처리 시스템
     * @param data
     */
    public void LMS_USER_CANCEL_EXEC(DataMap data){
        /***********************************************************
        SUBJECT    : 회원탈퇴 처리 시스템
        P_USERNO            NUMBER,        	-- 회원코드
	    P_MT_CANCEL_CODE    CHAR,        	-- 탈퇴사유코드
	
	    P_ETC01    VARCHAR2,    
	    P_ETC02    VARCHAR2,    
	    P_ETC03    VARCHAR2,    
	    P_ETC04    VARCHAR2,    
	    P_ETC05    VARCHAR2, 
        ***********************************************************/    	
    	
    	/*회원탈퇴처리*/
    	convertJavaToProcedureMapper.updateUserCancel(data);
    	/*강사탈퇴처리*/
    	convertJavaToProcedureMapper.updateTutorCancel(data);
    	
    }
    
    public void LMS_CSEQ_DEL_EXEC(DataMap data){
    	convertJavaToProcedureMapper.deleteAllLmsCseqByCseqno(data);
    }
    
	/**
	 * Random 함수
	 *  지정된 범위의 정수 1개를 램덤하게 반환하는 메서드
	   n1 은 "하한값", n2 는 상한값
	   0에서부터 시작하는 것이 아니라, 파라미터로 지정해 준, 하한값과 상한값 사이의 숫자에서 난수를 출력하는 메소드(함수)입니다.
	   "상한값 - 1"까지가 아니라 정확히 상한값까지입니다. 즉, 2에서 5까지 지정했다면, 2, 3, 4, 5 이렇게 2~5를 출력합니다. 좀더 직관적으로 사용할 수 있게끔 하기 위해서입니다.
	*/
	public static int randomRange(int n1, int n2) {
		return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	}

    /** lpad 함수
    * @param s대상문자열, len 길이, addStr 대체문자
    * @return 문자열
    */

	public static String lpad(Object s, int len, String addStr) {
		String result = String.valueOf(s);
		int templen = len - result.length();

		for (int i = 0; i < templen; i++) {
			result = addStr + result;
		}

		if (result.length() > len) {
			result = result.substring(0, len);
		}

		return result;
	}
}

	