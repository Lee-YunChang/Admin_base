package com.webapp.classdesk.service.impl;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorExamMapper;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizbinderMapper;
import com.webapp.classdesk.mapper.ClassdeskUserExamMapper;
import com.webapp.classdesk.service.ClassdeskTutorExamService;

/**
 * Description : Classdesk TutorExam Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorExamService")
public class ClassdeskTutorExamServiceImpl implements ClassdeskTutorExamService {
    @Resource(name = "classdeskTutorExamMapper")
    private ClassdeskTutorExamMapper           classdeskTutorExamMapper;

    @Resource(name = "classdeskTutorExamQuizbinderMapper")
    private ClassdeskTutorExamQuizbinderMapper classdeskTutorExamQuizbinderMapper;

    @Resource(name = "classdeskUserExamMapper")
    private ClassdeskUserExamMapper            classdeskUserExamMapper;

    /**
     * 과정 타입 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public String selectMtCtypeCode(DataMap data) throws Exception {
        return classdeskTutorExamMapper.selectMtCtypeCode(data);
    }
    
    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectExamList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLectExamList(data);
    }

    /**
     * 시험 제출자 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamSubList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getUserLectExamSubList(data);
    }

    /**
     * 시험 상세
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLectExamItem(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLectExamItem(data);
    }

    /**
     * getLeExamEvalInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeExamEvalInfo(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLeExamEvalInfo(data);
    }

    /**
     * 교육시험 출제정책 랜덤방식 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEduExamSectionList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getEduExamSectionList(data);
    }

    /**
     * 교육시험 출제정책 랜덤방식 리스트 조회수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getEduExamSectionCnt(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getEduExamSectionCnt(data);
    }
    
    /**
     * 사전/사후시험 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getLeExamBeAfterCnt(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLeExamBeAfterCnt(data);
    }
    

    /**
     * 강의실 출제정책 랜덤방식 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectExamSectionList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLectExamSectionList(data);
    }

    /**
     * 시험 MAx No
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMaxLeExamSeqNo(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getMaxLeExamSeqNo(data);
    }
    
    /**
     * 선택한 SECTION 문제번호 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSecQuizNumList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getSecQuizNumList(data);
    }

    /**
     * 최종평가
     * 
     * @param data
     * @throws Exception
     */
    public void updateLectExamResult(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateLectExamResult(data);
    }

    /** 
     * 시험 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLectExam(DataMap data) throws Exception {
        classdeskTutorExamMapper.insertLectExam(data);
    }
    
    /** 
     * 시험 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertExam(DataMap data) throws Exception {
        classdeskTutorExamMapper.insertExam(data);
    }
    
    /** 
     * 시험 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExam(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExam(data);
    }

    /**
     * 문제 리스트 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEdExamQuizList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getEdExamQuizList(data);
    }
    
    /**
     * 해당 코스 문제은행 목록조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAllCourseQuizList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getAllCourseQuizList(data);
    }
    
    /**
     * insertLeExamQuiz
     * 
     * @param insertMap
     * @throws Exception
     */
    public void insertLeExamQuiz(EduMap data) throws Exception {
        classdeskTutorExamMapper.insertLeExamQuiz(data);
    }
    
    /**
     * 사후시험 > 문제등록
     * 
     * @param insertMap
     * @throws Exception
     */
    public void insertLeAfterExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamMapper.insertLeAfterExamQuiz(data);
    }
    
    
    /**
     * setRandomQuizSeq
     * 
     * @param insertMap
     * @throws Exception
     */
    public void setRandomQuizSeq(DataMap data) throws Exception {
        classdeskTutorExamMapper.setRandomQuizSeq(data);
    }
    
    /**
     * setSectionUse
     * 
     * @param insertMap
     * @throws Exception
     */
    public void setSectionUse(DataMap data) throws Exception {
        classdeskTutorExamMapper.setSectionUse(data);
    }
    
    /**
     * insertLectExamSec
     * 
     * @param data
     * @throws Exception
     */
    public void insertLectExamSec(EduMap data) throws Exception {
        classdeskTutorExamMapper.insertLectExamSec(data);
    }
    
    /**
     * insertLeExamSec
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeExamSec(EduMap data) throws Exception {
        classdeskTutorExamMapper.insertLeExamSec(data);
    }
    
    /**
     * 사후시험 출제정책
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeAfterExamSec(DataMap data) throws Exception {
        classdeskTutorExamMapper.insertLeAfterExamSec(data);
    }
    

    /**
     * 강사 시험 응시내역 채점
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamAppMarking(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExamAppMarking(data);
    };

    /**
     * 강사 시험 응시답안 채점
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamAppHstMarking(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExamAppHstMarking(data);
    }

    /**
     * 시험 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExam(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExam(data);
    }

    /**
     * 시험 응시내역 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExamApp(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExamApp(data);
    }

    /**
     * 시험 응시답안 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExamAppHst(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExamAppHst(data);
    }

    /**
     * 랜덤 시험 문제은행 출제정책 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExamSec(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExamSec(data);
    }

    /**
     * 성적 업데이트프로시저 실행
     * 
     * @param data
     * @throws Exception
     */
    public void callLmsCourseRecordExec(Map data) throws Exception {
        classdeskTutorExamMapper.callLmsCourseRecordExec(data);
    }

    /**
     * 과정정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getOpenTypeInfo(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getOpenTypeInfo(data);
    }

    /**
     * (상시) 시험 사용여부 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeExamUseYn(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateLeExamUseYn(data);
    }

    /**
     * (상시) 시험 문제 사용여부 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateQuizUseYn(DataMap data) throws Exception {
        
        String tname = data.getString("tname");
    	
    	if (tname.equals("LE_EXAM_SET_QUIZ")) {
    		classdeskTutorExamMapper.updateQuizUseYn1(data);
	    } else if (tname.equals("LE_EXAM_QUIZ")) {
	    	classdeskTutorExamMapper.updateQuizUseYn2(data);
	    } else if (tname.equals("ED_EXAM_QUIZ")) {
	    	classdeskTutorExamMapper.updateQuizUseYn3(data);
	    }
    }

    /**
     * 사용자 실시간 응시시간 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamSubmit(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExamSubmit(data);
    }

    /**
     * 시험 등록 / 수정 / 삭제 실행
     * 
     * @param request
     * @param data
     * @param saveFlg
     * @throws Exception
     */
    public void exec(HttpServletRequest request, DataMap data, String saveFlg) throws Exception {
    	
    	
    	data.putString("isNew", "N");
        if (!data.containsKey("examNo") || ParamUtil.getIntParam(data.getString("examNo"), 0) == 0) {
        	insertExam(data);
        	
            EduMap map = getMaxLeExamSeqNo(data);
            data.putInt("examNo", map.getInt("SEQ_EXAM_MAX_NO"));
            data.putString("isNew", "Y");
        }else{
        	updateExam(data);
        }
        
        String sdate = data.getString("sdate");
        String edate = data.getString("edate");
        
        data.setString("sdate", sdate);
        data.setString("edate", edate);

        data.setInt("lecNum", data.getInt("totalQnums"));
        
        if(data.containsKey("qu") && "insert".equals(data.getString("qu"))){
        	
        	List<EduMap> secMap = getEduExamSectionList(data);
        	List<EduMap> quziMap = getAllCourseQuizList(data);
        	//시험 정책 등록
        	//최초 1회만 ED_EXAM_SECTION 테이블에있는 문제를 LE_EXAM_SECTION 테이블로 등록한다.
        	
        	// 사전시험
    		if( "B".equals(data.getString("examType"))) {

	        	for(int i = 0; i < secMap.size(); i++){
	       		 EduMap insertMap = (EduMap)secMap.get(i);
		      		insertMap.put("examNo", data.getInt("examNo"));
		      		insertMap.put("secTitle", insertMap.getString("SECTITLE"));
		      		insertMap.put("description", insertMap.getString("DESCRIPTION"));
		      		insertMap.put("totalQnum", insertMap.getInt("TITALQNUM"));
		      		insertMap.put("allot", insertMap.getInt("ALLOT"));
		      		insertMap.put("useYn", "Y");
		      		
	    			insertLeExamSec(insertMap);
	    			
	    			for(int j = 0; j < quziMap.size(); j++){
		      			EduMap iquizMap = (EduMap)quziMap.get(j);
		      			if(insertMap.getInt("SECNO") == iquizMap.getInt("SECNO")){
			        		iquizMap.put("examNo", data.getInt("examNo"));
			        		iquizMap.put("allots" , data.getString("allots"));
			        		iquizMap.put("seq", j);
			        		iquizMap.put("USEYN", "Y");
			  	      		
			        		// 사전시험
			        		if( "B".equals(data.getString("examType"))) {
			        			insertLeExamQuiz(iquizMap);
			        		}
			  	      		
		      			}
		      			
		      		}
	    		
	        	}
    		}
    		// 사후시험
    		else if("A".equals(data.getString("examType"))) {

	        	insertLeAfterExamSec(data);
				insertLeAfterExamQuiz(data);  // 문제도 바로 사전시험 가져와서 출제
			
    		}
        	
        } else {
        	
            List<Integer> uniqueNumbers = new ArrayList<Integer>();
            
            for(int i = 0; i < data.getInt("lecNum"); i++){
            	uniqueNumbers.add(i);
            }
            
            //랜덤일경우 배열 섞기
            if ("R".equals(data.getString("pubType"))) {
            	int temp, seed;
            	for(int i=0;i<uniqueNumbers.size();i++){
            		seed=(int)(new SecureRandom().nextDouble()*uniqueNumbers.size());
            		temp = uniqueNumbers.get(i);
        			uniqueNumbers.set(i, uniqueNumbers.get(seed));
        			uniqueNumbers.set(seed, temp);
        		}
            	
            	List<EduMap> quizNumList = getSecQuizNumList(data);
            	for(int i=0;i<uniqueNumbers.size();i++){
            		int seq = quizNumList.get(i).getInt("SEQ");
            		data.setInt("ranSeq", uniqueNumbers.get(i)+1);
            		data.setInt("seq", seq);
            		
            		setRandomQuizSeq(data);
            	}
            	
            }
            
        	List<EduMap> quizNumList = getSecQuizNumList(data);
        	for(int i=0;i<uniqueNumbers.size();i++){
        		int seq = quizNumList.get(i).getInt("SEQ");
        		data.setInt("ranSeq", uniqueNumbers.get(i)+1);
        		data.setInt("seq", seq);
        		
        		setRandomQuizSeq(data);
        	}
            
            List<EduMap> secMap = getLectExamSectionList(data);
            
            for(int i = 0; i < secMap.size(); i++){
            	int secno = data.getInt("secNos");
            	
            	if("Y".equals(secMap.get(i).getString("USEYN"))){
            		data.setString("secUseyn", "N");
            		data.setInt("secSecno", secMap.get(i).getInt("SECNO"));
            		setSectionUse(data);
            	}
            	if( secno == secMap.get(i).getInt("SECNO")){
            		data.setString("secUseyn", "Y");
            		data.setInt("secSecno", secMap.get(i).getInt("SECNO"));
            		setSectionUse(data);
            	}
            }
        }
        
/*        data.setString("sdate", sdate);
        data.setString("edate", edate);

        String[] strSecNos = request.getParameterValues("secNos");
        String[] strSecTitles = request.getParameterValues("secTitles");
        String[] strDescriptions = request.getParameterValues("descriptions");
        String[] strAllots = request.getParameterValues("allots");
        String[] strTotalQnums = new String[strAllots.length];
        String[] strTotalQnums2 = request.getParameterValues("totalQnums");
        for(int i = 0 ; i < strAllots.length ; i ++ ){
        	strTotalQnums[i]=strTotalQnums2[0];
        }
//            String[] strTotalQnums = request.getParameterValues("lecNum"); 
        String[] strLeUseYns = request.getParameterValues("leUseYns");

        int randomSize = strSecNos.length;

        if (randomSize > 0) {
            DataMap randomDataMap = null;
            for (int i = 0; i < randomSize; i++) {

                randomDataMap = new DataMap();
                randomDataMap.putInt("examNo", data.getInt("examNo"));
                randomDataMap.putInt("secNo", ParamUtil.getIntParam(strSecNos[i]));
                randomDataMap.putString("secTitle", ParamUtil.getStrParam(strSecTitles[i], ""));
                randomDataMap.putString("description", ParamUtil.getStrParam(strDescriptions[i], ""));
                randomDataMap.putFloat("allot", ParamUtil.getFloatParam(strAllots[i]));
                randomDataMap.putInt("totalQnum", ParamUtil.getIntParam(strTotalQnums[i]));
                randomDataMap.putString("useYn", ParamUtil.getStrParam(strLeUseYns[i], ""));
                
                insertLectExamSec(randomDataMap);

            }
        }*/

        if("Y".equals(data.getString("isNew"))){
        	data.putString("rMsg", "출제정책이 저장 되었습니다. 문제를 등록해주세요.");
            data.putString("rScript", "fnSecSave(\\'" + data.get("examNo") + "\\')");
        } else if ("Y".equals(data.getString("openYn"))) {
            data.putString("rMsg", "시험 출제되었습니다.");
            data.putString("rScript", "fnList()");
        } else {
            data.putString("rMsg", " 임시 저장되었습니다.");
            data.putString("rScript", "fnDetail(\\'" + data.get("examNo") + "\\')");
        }
    }

    /**
     * 시험 정보 전체삭제
     * 
     * @param data
     * @throws Exception
     */
    public void delExec(DataMap data) throws Exception {
        /* 시험 응시답안 삭제 */
        deleteLeExamAppHst(data);
        /* 시험 응시내역 삭제 */
        deleteLeExamApp(data);
        /* 바인더 시험 삭제 */
        classdeskTutorExamQuizbinderMapper.deletetLeExamQuiz(data);
        /* 랜덤 시험 문제은행 출제정책 삭제 */
        deleteLeExamSec(data);
        /* 시험 삭제 */
        deleteLeExam(data);
    }

    /**
     * 시험 평가(채점) 양식 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void evalExec(HttpServletRequest request, DataMap data) throws Exception {
        String qSeqs[] = request.getParameterValues("qSeq");//출제문제 순번
        String isRights[] = request.getParameterValues("isRight"); //정답여부
        String vals[] = request.getParameterValues("val"); //문항 점수

        data.setDouble("val", data.getDouble("sumVal"));

        updateExamAppMarking(data);

        DataMap histMap = null;
        for (int i = 0; i < qSeqs.length; i++) {

            histMap = new DataMap();

            histMap.putInt("cUserNo", data.getInt("cUserNo"));
            histMap.putInt("examNo", data.getInt("examNo"));
            histMap.putInt("qSeq", ParamUtil.getIntParam(qSeqs[i]));
            histMap.putString("isRight", isRights[i]);
            histMap.putDouble("val", ParamUtil.getDoubleParam(vals[i]));

            //사용자 설문 응시답안 저장
            updateExamAppHstMarking(histMap);
        }
    }

    /**
     * 시험 수강생 재응시 승인
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void delUserExec(HttpServletRequest request, DataMap data) throws Exception {
        String[] cUserNos = request.getParameterValues("cUserNos");

        DataMap delMap = null;

        if (cUserNos.length > 0) {
            //for (String str : cUserNos) {
            for(int i=0; i < cUserNos.length; i++) {
            	String str = cUserNos[i];
                delMap = new DataMap();

                delMap.putInt("examNo", data.getInt("examNo"));
                delMap.putInt("cUserNo", ParamUtil.getIntParam(str));
                /* 시험 응시답안 삭제 */
                deleteLeExamAppHst(delMap);
                /* 시험 응시내역 삭제 */
                deleteLeExamApp(delMap);

            }
        }
    }

    /**
     * 강사제출
     * 
     * @param data
     * @throws Exception
     */
    public void tutorSubmitExec(DataMap data) throws Exception {
        /*시험 응시내역 최종 저장*/
        updateExamSubmit(data);

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("P_CUSERNO", data.getInt("cUserNo"));
        paramMap.put("P_COURSENO", data.getInt("SES_CUSERNO"));
        paramMap.put("P_EXAMNO", data.getInt("examNo"));
        paramMap.put("R_VAL", 0);
        paramMap.put("R_RESULT", 0);

        if ("R".equals(data.getString("pubType"))) {
            /* 시험 응시답안 객관식 1차 가채점 */
            classdeskUserExamMapper.lmsExamRdmMarkingExecute(paramMap);
        } else if ("S".equals(data.getString("pubType"))) {
            /* 시험 응시답안 객관식 1차 가채점 */
            classdeskUserExamMapper.lmsExamSetMarkingExecute(paramMap);
        } else {
            /* 시험 응시답안 객관식 1차 가채점 */
            classdeskUserExamMapper.lmsExamBinderMarkingExecute(paramMap);
        }
    }

    /**
     * 시험 최종평가반영
     * 
     * @param data
     * @throws Exception
     */
    public void evalFinalExec(DataMap data) throws Exception {
        DataMap dmap = new DataMap();
        updateLectExamResult(data);
        EduMap eMap = getLectExamItem(data);
        String examType = eMap.getString("EXAM_TYPE");
        if (examType.equals("M")) {
            dmap.putString("P_KEY", "EXAM_M"); // 중간시험 프로시저
        } else {
        	dmap.putString("P_KEY", "EXAM_F"); // 최종시험 프로시저
        }
        // 최종 성적 반영 프로시저 실행            
        dmap.putInt("P_CSEQNO", data.getInt("SES_CSEQNO"));
        List<EduMap> list = classdeskTutorExamMapper.getExamFinalNowUsers(data);
        data.setInt("cseqno", data.getInt("SES_CSEQNO"));
        EduMap edCourseSeqInfo = classdeskTutorExamMapper.getLectExamItem(data);
        //float totalqnum = edCourseSeqInfo.getFloat("TOTALQNUM");//전체 문항 수
        //float evalExamFinal = edCourseSeqInfo.getInt("EVAL");//시험가중치
        DataMap param = null;
        for (int i=0; i<list.size(); i++) {
        	param = new DataMap();
        	float val = list.get(i).getFloat("EXAM_SCORE");
        	val = list.get(i).getFloat("EXAM_FINAL_VAL") + val ;//기존성적+현재시험성적
        	param.putFloat("VAL", val);
        	param.putInt("CUSERNO", list.get(i).getInt("CUSERNO"));
        	param.putString("P_KEY", dmap.getString("P_KEY"));
        	param.putInt("examNo", data.getInt("examNo"));
        	
        	if(list.get(i).getString("EXAM_YN").equals("N")){
        		if(data.getString("mtClCode").equals("CL0001") && data.getString("mtCtypeCode").equals("DAAA01") && list.get(i).getInt("GROUP_NO") > 0){
        			//정규교육 심화가정이며 그룹에 속한모든 회원을 업데이트
        			param.putInt("GROUP_NO", list.get(i).getInt("GROUP_NO"));
        			param.putInt("SES_CSEQNO", data.getInt("SES_CSEQNO"));
        			param.putString("mtClCode", data.getString("mtClCode"));
        			classdeskTutorExamMapper.updateGroupFinalVal(param);
        			classdeskTutorExamMapper.updateAllExamCheckYn(param);      //최종성적반영여부 수정
        		}else{
        			classdeskTutorExamMapper.updateFinalVal(param);
        			classdeskTutorExamMapper.updateExamCheckYn(param); //최종성적반영여부 체크 수정
        		}
        	}
        }
        //callLmsCourseRecordExec(hashMap);
    }

    /**
     * 시험 사용여부 등록
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void useExec(HttpServletRequest request, DataMap data) throws Exception {

        int itemCnt = request.getParameterValues("useExamNo").length;

        if (itemCnt > 0) {
            for (int i = 0; i < itemCnt; i++) {
                data.set("useYn", ParamUtil.getStrParam(request.getParameterValues("useYn")[i]));
                data.set("examNo", ParamUtil.getStrParam(request.getParameterValues("useExamNo")[i]));

                updateLeExamUseYn(data);
            }
        }
    }
}
