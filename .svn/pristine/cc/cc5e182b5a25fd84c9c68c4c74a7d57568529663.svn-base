package com.webapp.classdesk.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizbinderMapper;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizsetMapper;
import com.webapp.classdesk.mapper.ClassdeskUserExamMapper;
import com.webapp.classdesk.service.ClassdeskUserExamService;
import com.webapp.classdesk.util.ClassdeskUtil;

/**
 * Description : Classdesk UserExam Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskUserExamService")
public class ClassdeskUserExamServiceImpl implements ClassdeskUserExamService {

    @Resource(name = "classdeskUserExamMapper")
    private ClassdeskUserExamMapper            classdeskUserExamMapper;

    @Resource(name = "classdeskTutorExamQuizsetMapper")
    private ClassdeskTutorExamQuizsetMapper    classdeskTutorExamQuizsetMapper;

    @Resource(name = "classdeskTutorExamQuizbinderMapper")
    private ClassdeskTutorExamQuizbinderMapper classdeskTutorExamQuizbinderMapper;

    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamList(data);
    }

    /**
     * getUserLectExamAppCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserLectExamAppCnt(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamAppCnt(data);
    }

    /**
     * 강의실 시험 응시내역 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLectExamApp(DataMap data) throws Exception {
        classdeskUserExamMapper.insertLectExamApp(data);
    }

    /**
     * insertUserLectExamSetAppHst
     * 
     * @param data
     * @throws Exception
     */
    public void insertUserLectExamSetAppHst(DataMap data) throws Exception {
        classdeskUserExamMapper.insertUserLectExamSetAppHst(data);
    }

    /**
     * insertUserLectExamBinderAppHst
     * 
     * @param data
     * @throws Exception
     */
    public void insertUserLectExamBinderAppHst(DataMap data) throws Exception {
        classdeskUserExamMapper.insertUserLectExamBinderAppHst(data);
    }

    /**
     * getUserLectExamAppMaxSeq
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserLectExamAppMaxSeq(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamAppMaxSeq(data);
    }

    /**
     * 강의실 시험 응시답안 랜덤 등록
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamRandomExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamRandomExecute(data);
    }

    /**
     * 시험 응시답안 랜덤 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamRdmMarkingExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamRdmMarkingExecute(data);
    }

    /**
     * 시험 응시답안 세트 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamSetMarkingExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamSetMarkingExecute(data);
    }

    /**
     * 시험 응시답안 바인더 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamBinderMarkingExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamBinderMarkingExecute(data);
    }

    /**
     * 수강생 시험 랜덤 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamRdmAppHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamRdmAppHistList(data);
    }

    /**
     * 수강생 시험 세트 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamSetAppHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamSetAppHistList(data);
    }

    /**
     * 수강생 시험 바인더 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamBinderAppHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamBinderAppHistList(data);
    }

    /**
     * 사용자 실시간 응시시간 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamRealTmTime(Map data) throws Exception {
        classdeskUserExamMapper.updateExamRealTmTime(data);
    }

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamRealTmAns(Map data) throws Exception {
        classdeskUserExamMapper.updateExamRealTmAns(data);
    }

    /**
     * 과정정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getOpenTypeInfo(DataMap data) throws Exception {
        return classdeskUserExamMapper.getOpenTypeInfo(data);
    }

    /**
     * 사용자 시험 정보 저장
     * 
     * @param examMap
     * @param rMap
     * @throws Exception
     */
    public void saveUserExamInfo(EduMap examMap, DataMap rMap) throws Exception {

        /*강의실 시험 응시내역 저장*/
        classdeskUserExamMapper.insertLectExamApp(rMap);

        /***
         * 랜덤 프로시저 저장
         * 문제은행에 난수를 구하여 사용자 응시답안쪽에 인서트한다.
         */
        if ("R".equals(examMap.getString("PUB_TYPE"))) {
            Map<String, Object> paramMap = new HashMap<String, Object>();

            paramMap.put("P_COURSENO", rMap.getInt("SES_COURSENO"));
            paramMap.put("P_CUSERNO", rMap.getInt("SES_CUSERNO"));
            paramMap.put("P_EXAMNO", rMap.getInt("examNo"));
            paramMap.put("R_RESULT", "0");

            /*강의실 시험 응시답안 랜덤 문제저장*/
            lmsExamRandomExecute(paramMap);
            //세트 저장 
        } else if ("S".equals(examMap.getString("PUB_TYPE"))) {
            rMap.putInt("setno", examMap.getInt("SETNO"));
            rMap.putString("addObject", "Y"); //쿼리 공통이용시 동적쿼리로 and조건 추가

            List setQuizList = classdeskTutorExamQuizsetMapper.getLeExamSetQuizList(rMap);

            int setQuizSize = setQuizList.size();

            EduMap maxSeq = getUserLectExamAppMaxSeq(rMap);

            int rStartNum = maxSeq.getInt("MAX_NO");
            int rEndNum = (rStartNum + setQuizSize);

            /** 랜덤 변수 */
            int[] rqseqValue = ClassdeskUtil.getExamSetRandomList(setQuizSize, rStartNum, rEndNum);

            EduMap setMap = new EduMap();
            for (int i = 0; i < setQuizSize; i++) {
                setMap = (EduMap)setQuizList.get(i);

                rMap.putInt("qNo", setMap.getInt("QNO"));
                rMap.putInt("qseq", rqseqValue[i]);

                insertUserLectExamSetAppHst(rMap);
            }
        } else {
            rMap.putString("addObject", "Y"); //쿼리 공통이용시 동적쿼리로 and조건 추가

            List binderQuizList = classdeskTutorExamQuizbinderMapper.getLeExamQuizList(rMap);

            int binderQuizSize = binderQuizList.size();

            EduMap maxSeq = classdeskUserExamMapper.getUserLectExamAppMaxSeq(rMap);

            int rStartNum = maxSeq.getInt("MAX_NO");
            int rEndNum = (rStartNum + binderQuizSize);

            /** 랜덤 변수 */
            int[] rqseqValue = ClassdeskUtil.getExamSetRandomList(binderQuizSize, rStartNum, rEndNum);

            EduMap binderMap = new EduMap();
            for (int i = 0; i < binderQuizSize; i++) {
                binderMap = (EduMap)binderQuizList.get(i);

                rMap.putInt("qNo", binderMap.getInt("QNO"));
                rMap.putInt("qseq", rqseqValue[i]);

                classdeskUserExamMapper.insertUserLectExamBinderAppHst(rMap);
            }
        }
    }

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    public void saveExamRealTmAns(Map data) throws Exception {
        //사용자 실시간 응시시간 저장
        updateExamRealTmTime(data);
        //사용자 실시간 정답 저장
        updateExamRealTmAns(data);
    }

    /**
     * 시험제출
     * 
     * @param data
     * @throws Exception
     */
    public void submitExec(DataMap data) throws Exception {
        /*시험 응시내역 최종 저장*/
        updateExamRealTmTime(data);

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("P_CUSERNO", data.getInt("SES_CUSERNO"));
        paramMap.put("P_COURSENO", data.getInt("SES_COURSENO"));
        paramMap.put("P_EXAMNO", data.getInt("examNo"));
        paramMap.put("R_VAL", 0);
        paramMap.put("R_RESULT", 0);

        if ("R".equals(data.getString("pubType"))) {
            /* 시험 응시답안 객관식 1차 가채점 */
            lmsExamRdmMarkingExecute(paramMap);
        } else if ("S".equals(data.getString("pubType"))) {
            /* 시험 응시답안 객관식 1차 가채점 */
            lmsExamSetMarkingExecute(paramMap);
        } else {
            /* 시험 응시답안 객관식 1차 가채점 */
            lmsExamBinderMarkingExecute(paramMap);
        }
    }

}
