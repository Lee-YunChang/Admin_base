package com.webapp.classdesk.service.impl;

import java.text.DecimalFormat;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskProgMapper;
import com.webapp.classdesk.service.ClassdeskProgService;

/**
 * Description : Classdesk Prog Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskProgService")
public class ClassdeskProgServiceImpl implements ClassdeskProgService {

    @Resource(name = "classdeskProgMapper")
    private ClassdeskProgMapper classdeskProgMapper;

    /**
     * 진도처리관련
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdCourseTreeInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getEdCourseTreeInfo(data);
    }

    /**
     *  getLeCourseTreeHistInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeCourseTreeHistInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getLeCourseTreeHistInfo(data);
    }

    /**
     * 현재까지 학습한 페이지 (FRAMESEQ)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getFrameseqInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getFrameseqInfo(data);
    }

    /**
     * 최초 학습 정보 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeCourseTreeHist(DataMap data) throws Exception {
        classdeskProgMapper.insertLeCourseTreeHist(data);
    }

    /**
     * 학습정보 저장3
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseTreeHist(DataMap data) throws Exception {
        classdeskProgMapper.updateLeCourseTreeHist(data);
    }

    /**
     * getEduseqYnInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEduseqYnInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getEduseqYnInfo(data);
    }

    /**
     * 성적 산출을 위한 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getResultInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getResultInfo(data);
    }

    /**
     * 업데이트 성적
     * 
     * @param data
     * @throws Exception
     */
    public void updateEvalProg(DataMap data) throws Exception {
    	
        classdeskProgMapper.updateEvalProg(data);
    }

    /**
     * 진도처리
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public String progExec(DataMap requestMap) throws Exception {

        String result = "1";
        // 현재까지 학습한 FRAMESEQ 
        int curFrameseq = getFrameseqInfo(requestMap);

        // 현재학습중인 FRAMESEQ 
        String CURRENT_PAGE = ParamUtil.getStrParam(requestMap.getString("CURRENT_PAGE"), "");
        String paramcUserNo = ParamUtil.getStrParam(requestMap.getString("paramcUserNo"), "");
        String paramCourseNo = ParamUtil.getStrParam(requestMap.getString("paramCourseNo"), "");
        String paramcSeqNo = ParamUtil.getStrParam(requestMap.getString("paramcSeqNo"), "");

        
        
        // asis 콘텐츠 CURRENT_PAGE 10 이하 정수를 01, 02 로반환 > 1 , 2 로 변경
        if (CURRENT_PAGE.length() < 3 && CURRENT_PAGE.substring(0, 1).equals("0")) {

            CURRENT_PAGE = CURRENT_PAGE.substring(1, 2);
        }
        int curPage = Integer.parseInt(CURRENT_PAGE);

        //모바일용
        if (!paramcUserNo.equals("")) {
            requestMap.setInt("cuserNo", Integer.parseInt(paramcUserNo));
        }
        if (!paramCourseNo.equals("")) {
            requestMap.setInt("courseno", Integer.parseInt(paramCourseNo));
        }
        if (!paramcSeqNo.equals("")) {
            requestMap.setInt("cseqno", Integer.parseInt(paramcSeqNo));
        }

        requestMap.setInt("frameseq", curPage);
        
        // 콘텐츠 정보 조회 
        EduMap treeInfo = getEdCourseTreeInfo(requestMap);

        EduMap treeHistData = getLeCourseTreeHistInfo(requestMap);

        EduMap progData = getEduseqYnInfo(requestMap);
        String eduseqYn = ParamUtil.getStrParam(progData.getString("EDUSEQ_YN"), "Y"); // 순차학습 여부 Y순차 N 자유
        String opentype = ParamUtil.getStrParam(progData.getString("OPENTYPE"), "D"); // 상시 과정 A , 기간제 D
        String studyYn = ParamUtil.getStrParam(progData.getString("STUDY_YN"), "N"); // 학습여부. 
        String progStatus = SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING");
        
        int runTime =  1;
        if(treeInfo.getInt("RUNTIME") > 0 ) {
        	runTime = treeInfo.getInt("RUNTIME")*60;
        }
        
        if(CURRENT_PAGE.equals("3")){
        	requestMap.setInt("movsec", (runTime+600));
        }
        
        String movCheck ="N";//권장학습시간 통과 여부
        
        if(ParamUtil.getIntParam(requestMap.getString("movsec", 0)) >= runTime) movCheck="Y";
        requestMap.setString("movCheck", movCheck);

        if (treeHistData != null) {
            curFrameseq = treeHistData.getInt("FRAMESEQ");
            progStatus = ParamUtil.getStrParam(treeHistData.getString("MT_PROG_STATUS_CODE"), SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
        }
        int maxFrameSeq = treeInfo.getInt("FRAMECNT");

        // 상시과정일때
        if (opentype.equals("A")) {
            //학습기간인지.
        	requestMap.setString("OPENTYPE", "A");
            if (studyYn.equals("Y")) {
                result = progCall(requestMap, result, curFrameseq, curPage, treeHistData, eduseqYn, progStatus, maxFrameSeq);
            } else {
                result = "1";
            }
        } 
        else if (opentype.equals("D")) {
                //학습기간인지.
            	requestMap.setString("OPENTYPE", "D");
                if (studyYn.equals("Y")) {
                    result = progCall(requestMap, result, curFrameseq, curPage, treeHistData, eduseqYn, progStatus, maxFrameSeq);
                } else {
                    result = "1";
                }
        } else {
            result = progCall(requestMap, result, curFrameseq, curPage, treeHistData, eduseqYn, progStatus, maxFrameSeq);
        }

        // 성적업데이트.
        if (result.equals("1")) {
        	
            EduMap resultMap = getResultInfo(requestMap);
            
            float evalProg = resultMap.getInt("EVAL_PROGRESS"); // 진도율
            float totFrameCnt = resultMap.getInt("TOT_FRAMECNT"); // 총 페이지수
            float totFrameSeq = resultMap.getInt("TOT_FRAMESEQ"); // 수강생 페이지수
            float movSec = resultMap.getInt("MOVSEC"); // 수강시간
            float contentsRunTime = resultMap.getInt("RUNTIME"); // 권장학습시간

            float progVal = (evalProg / totFrameCnt) * totFrameSeq;
           
            DecimalFormat format = new DecimalFormat(".##");
            String str = format.format(progVal);
            
            //일반 컨텐츠
            if(totFrameCnt > 3){
            	progVal = Float.valueOf(str).floatValue();

                requestMap.setFloat("progVal", progVal);

                updateEvalProg(requestMap);
            	
            }else{
            	
            	//동영상과정(페이지 3개)
            	progVal =    ((movSec/(contentsRunTime*60))*100);//0;//진도율 = 들은시간(초) / 러닝타임(권장시간 분*60)
            
            	str = format.format(progVal);
            	progVal = Float.valueOf(str).floatValue();
            	if(progVal > 100)progVal = 100;
            	
            	requestMap.setFloat("progVal", progVal);

            	updateEvalProg(requestMap);
            }
            
        }

        return result;
    }

    
    /**
     * 실제 진도체크 처리 
     * 
     * @param requestMap
     * @param result
     * @param curFrameseq
     * @param curPage
     * @param treeHistData
     * @param eduseqYn
     * @param progStatus
     * @param maxFrameSeq
     * @return
     */
    private String progCall(DataMap requestMap, String result, int curFrameseq, int curPage,
            EduMap treeHistData, String eduseqYn, String progStatus, int maxFrameSeq) throws Exception {
    	
       /* if (eduseqYn.equals("Y")) { //순차학습 여부
            if (curPage <= curFrameseq + 1) {
                if (progStatus.equals(SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"))) {
                    if (treeHistData == null) {
                        // 콘텐츠 학습 코드 : 학습중
                        requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                        insertLeCourseTreeHist(requestMap);
                    } else {
                        if (maxFrameSeq > curPage) {
                            // 콘텐츠 학습코드 : 학습중
                            if (curPage > curFrameseq) {
                                requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                                updateLeCourseTreeHist(requestMap);
                            }
                        } else {
                            // 콘텐츠 학습 코드 : 학습완료
                            requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
                            // 최종 완료일 업데이트
                            
                            if(requestMap.getString("movCheck").equals("Y")){
                            	 // 최종 완료일 업데이트
                                requestMap.setString("compYn", "Y");
                            }
                            
                            updateLeCourseTreeHist(requestMap);
                        }
                    }
                }
            } else {
                result = "0";
            }
        } else {
            if (progStatus.equals(SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"))) {
                if (treeHistData == null) {
                	
                    // 콘텐츠 학습 코드 : 학습중
                    requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                    insertLeCourseTreeHist(requestMap);
                } else {
                	
                    if (maxFrameSeq > curPage) {
                    	
                        // 콘텐츠 학습코드 : 학습중
                        if (curPage > curFrameseq) {
                            requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                            updateLeCourseTreeHist(requestMap);
                        }
                    } else {
                        
                        // 최종 완료일 업데이트
                        
                        if(requestMap.getString("movCheck").equals("Y")){
                        	// 콘텐츠 학습 코드 : 학습완료
                            requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
                        	
                        	 // 최종 완료일 업데이트
                            requestMap.setString("compYn", "Y");
                        }else{
                        	// 콘텐츠 학습 코드 : 학습완료
                            requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                        }
                        
                        updateLeCourseTreeHist(requestMap);
                    }
                }
            }
        }*/
    	
    	if (progStatus.equals(SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"))) {
            if (treeHistData == null) {
            	
                // 콘텐츠 학습 코드 : 학습중
                requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                insertLeCourseTreeHist(requestMap);
            } else {
            	
                if (maxFrameSeq > curPage) {
                	
                    // 콘텐츠 학습코드 : 학습중
                    if (curPage >= curFrameseq) {
                        requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                        updateLeCourseTreeHist(requestMap);
                    }
  
                } else {
                    
                    // 최종 완료일 업데이트
                    
                    if(requestMap.getString("movCheck").equals("Y")){
                    	// 콘텐츠 학습 코드 : 학습완료
                        requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
                    	
                    	 // 최종 완료일 업데이트
                        requestMap.setString("compYn", "Y");
                    }else{
                    	// 콘텐츠 학습 코드 : 학습완료
                        requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                    }
                    
                    updateLeCourseTreeHist(requestMap);
                }
            }
        }

        return result;
    }
}
