package com.webapp.classdesk.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorResultMapper;
import com.webapp.classdesk.service.ClassdeskTutorResultService;
import com.webapp.common.component.EmsManager;
import com.webapp.common.vo.SendMailVO;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : Classdesk TutorResult Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorResultService")
public class ClassdeskTutorResultServiceImpl implements ClassdeskTutorResultService {

    @Resource(name = "classdeskTutorResultMapper")
    private ClassdeskTutorResultMapper classdeskTutorResultMapper;

    @Resource(name = "emsManager")
    private EmsManager                 emsManager;

    private Logger                     log = LogManager.getLogger(this.getClass());

    /**
     * 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeCourseUSerList(DataMap data) throws Exception {
    	data.setInt("rowCount", 200);
        ParamUtil.setPagingValue(data);
        return classdeskTutorResultMapper.getLeCourseUSerList(data);
    }

    /**
     * 상시과정 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeCourseAlwaysUSerList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return classdeskTutorResultMapper.getLeCourseAlwaysUSerList(data);
    }

    /**
     * updateLeCourseUserInfo
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseUserInfo(DataMap data) throws Exception {
        classdeskTutorResultMapper.updateLeCourseUserInfo(data);
    }

    /**
     * updateLeCourseUserRankInfo
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseUserRankInfo(DataMap data) throws Exception {
        classdeskTutorResultMapper.updateLeCourseUserRankInfo(data);
    }

    /**
     * getEdCourseInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdCourseInfo(DataMap data) throws Exception {
        return classdeskTutorResultMapper.getEdCourseInfo(data);
    }

    /**
     * courseCompExec
     * 
     * @param data
     * @throws Exception
     */
    public void courseCompExec(Map data) throws Exception {
        classdeskTutorResultMapper.courseCompExec(data);
    }

    /**
     * cuserCompExec
     * 
     * @param data
     * @throws Exception
     */
    public void cuserCompExec(Map data) throws Exception {
        classdeskTutorResultMapper.cuserCompExec(data);
    }

    /**
     * 수강자별 성적 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void resultExec(HttpServletRequest request, DataMap data) throws Exception {
        String[] arr = request.getParameter("cuserInfo").split("[,]");
        String[] tmp = null;
        for (int i=0; i<arr.length; i++) {
        	tmp = arr[i].split("@");
        	data.set("cuserno", tmp[0]);
            data.set("progVal", tmp[1]);
            data.set("examFinalVal", tmp[2]);
            data.set("attendVal", tmp[3]);
            data.set("ispass", tmp[4]);
            data.set("finalVal", tmp[5]);
            data.set("rank", tmp[6]);
            
            updateLeCourseUserInfo(data);
            
        }
    }

    private static float toNumber(String str) {
    	try {
    		return Float.valueOf(str);
    	} catch (Exception e) {
    		
    		return 0;
    	}
    }
    
    /**
     * 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void resultFinalExec(HttpServletRequest request, DataMap data) throws Exception {
        
    	
    	EduMap courseSeqInfo = classdeskTutorResultMapper.getEdCourseSeqInfo(data);
    	String[] arr = request.getParameter("cuserInfo").split("[,]");
    	int itemCnt = arr.length;
        String[] tmp = null;
        float sumVal = 0;
        List<Integer> passUsers = new ArrayList<Integer>();
        
        for (int i=0; i<arr.length; i++) {
        	tmp = arr[i].split("@");
        	data.set("cuserno", tmp[0]);
            data.set("progVal", tmp[1]);
            data.set("examFinalVal", tmp[2]);
            data.set("attendVal", tmp[3]);
            data.setString("ispass", tmp[4]);
            data.set("finalVal", tmp[5]);
            data.set("rank", tmp[6]);
            
            sumVal = toNumber(tmp[1])+toNumber(tmp[2])+toNumber(tmp[3]);
            if (sumVal >= courseSeqInfo.getInt("COMP_VAL")) {
            	data.setString("compYN", "Y");
            	
            	String gubunCode = classdeskTutorResultMapper.getCompGubunInfo(data);
            	data.setString("gubun_code", gubunCode);
            	
            	/*수료코드생성*/
            	String compCode="";

            	java.util.Date d = new java.util.Date();
            	SimpleDateFormat date = new SimpleDateFormat("yyyy");

            	String year = date.format(d);
            	
            	int maxcompcode = classdeskTutorResultMapper.getMaxCompCode(data);
            	String strI = String.valueOf(maxcompcode);
            	compCode = year+"-"+gubunCode+"-"+strI;
            	
            	data.setString("compCode", compCode);
            	data.setString("ispass", "Y");
            	
            	passUsers.add(Integer.valueOf(tmp[0]));
            	
            	data.setInt("compSeq", maxcompcode);
            	
            	// 수료코드 발급
                classdeskTutorResultMapper.updateMaxCompCode(data);
            } else {
            	data.setString("compYN", "N");
            	data.setString("ispass", "N");
            }
            updateLeCourseUserInfo(data);
        }
        
    }

    /**
     * 상시 전체 성적 실행
     * 
     * @param request
     * @param data
     * @param isFinal
     * @throws Exception
     */
    public void resultAlwaysExec(HttpServletRequest request, DataMap data, boolean isFinal) throws Exception {

        Map<String, Object> hashMap = null;

        int itemCnt = request.getParameterValues("cuserNo").length;

        int checkedCnt = request.getParameterValues("resultChecked").length;

        String[] resultCheckeds = request.getParameterValues("resultChecked");

        try {

            if (data.containsKey("resultChecked")) {
                if (checkedCnt > 0) {

                    for (int i = 0; i < checkedCnt; i++) {

                        for (int j = 0; j < itemCnt; j++) {

                            if (ParamUtil.getIntParam(resultCheckeds[i]) == j) {


                                data.set("cuserNo", ParamUtil.getStrParam(request.getParameterValues("cuserNo")[j]));
                                data.set("progressVal", ParamUtil.getStrParam(request.getParameterValues("progressVal")[j]));
                                data.set("reportVal", ParamUtil.getStrParam(request.getParameterValues("reportVal")[j]));
                                data.set("examMtVal", ParamUtil.getStrParam(request.getParameterValues("examMtVal")[j]));
                                data.set("examFinalVal", ParamUtil.getStrParam(request.getParameterValues("examFinalVal")[j]));
                                data.set("attendVal", ParamUtil.getStrParam(request.getParameterValues("attendVal")[j]));
                                data.set("ispass", ParamUtil.getStrParam(request.getParameterValues("ispass")[j]));
                                data.set("finalVal", ParamUtil.getStrParam(request.getParameterValues("finalVal")[j]));
                                data.set("rank", ParamUtil.getStrParam(request.getParameterValues("rank")[j]));

                                updateLeCourseUserInfo(data);

                                /** * 최종성적 반영인 경우에만 수료증 프로시저 호출  */

                                if (isFinal) {

                                    hashMap = new HashMap<String, Object>();

                                    hashMap.put("P_COURSENO", data.getInt("SES_COURSENO"));
                                    hashMap.put("P_CSEQNO", data.getInt("SES_CSEQNO"));
                                    hashMap.put("P_CUSERNO", ParamUtil.getIntParam(request.getParameterValues("cuserNo")[j]));
                                    hashMap.put("R_RESULT", "");


                                    //프로시저
                                    cuserCompExec(hashMap);


                                }
                            }
                        }
                    }

                    data.putString("rMsg", "정상적으로  처리되었습니다.");
                    data.putString("rScript", "fnList()");
                }
            }

        } catch (Exception ex) {
            throw new Exception(ex);
        } finally {

            // 강의형태 및 템플릿 필요 정보 조회
            EduMap courseInfoMap = (EduMap)getEdCourseInfo(data);

            for (int i = 0; i < checkedCnt; i++) {

                for (int j = 0; j < itemCnt; j++) {

                    if (ParamUtil.getIntParam(resultCheckeds[i]) == j) {

                        if (isFinal) {

                            try {

                                /*******************************************************************************************
                                 탬플릿 기반 메일 발송 모듈 코드  메일 발송 
                                 > 이러닝 과정일 경우에만 발송 
                                *******************************************************************************************/
                                DataMap mailTplMap = new DataMap();

                                mailTplMap.add("SEQ1", courseInfoMap.getString("SEQ_TITLE")); // SEQ는 1부터 시작. 
                                mailTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_CLASSDESK_COMP_EXEC")); // 템플릿 고유번호 

                                List<SendMailVO> sendMailList = new ArrayList<SendMailVO>();

                                SendMailVO mailVo = new SendMailVO();
                                mailVo.setRecUserid(request.getParameterValues("recUserList")[j].split("/")[0]);
                                mailVo.setReceiver_alias(request.getParameterValues("recUserList")[j].split("/")[1]);
                                mailVo.setRecEmail(request.getParameterValues("recUserList")[j].split("/")[2]);
                                mailVo.setWriterUserid(data.getString("SES_USERID"));
                                mailVo.setWriterUsername(data.getString("SES_USERNAME"));


                                sendMailList.add(mailVo);

                                // 발송 manager 실행  
                                emsManager.sendMailProc(mailTplMap, sendMailList);

                                /*******************************************************************************************
                                 탬플릿 기반 SMS 발송 모듈 코드 
                                 *******************************************************************************************/
                                DataMap msgTplMap = new DataMap();

                                msgTplMap.add("SEQ1", courseInfoMap.getString("SEQ_TITLE"));
                                msgTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_CLASSDESK_COMP_EXEC"));

                                List<SendMsgVO> sendMsgList = new ArrayList<SendMsgVO>();

                                SendMsgVO msgVo = new SendMsgVO();
                                msgVo.setRecUserid(request.getParameterValues("recUserList")[j].split("/")[0]); // 받는사람 아이디
                                msgVo.setRecUsername(request.getParameterValues("recUserList")[j].split("/")[1]); // 받는사람 이름
                                msgVo.setRcvphns(request.getParameterValues("recUserList")[j].split("/")[3]); // 받는사람 핸드폰 번호

                                msgVo.setSendUserid(data.getString("SES_USERID"));


                                sendMsgList.add(msgVo);

                                emsManager.sendMsgProc(msgTplMap, sendMsgList);

                            } catch (Exception e) {
                            }

                        }
                    }
                }
            }

        }
    }
    
    /**
     * getOpenTypeInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public String getMtCtypeCode(DataMap data) throws Exception {
        return classdeskTutorResultMapper.getMtCtypeCode(data);
    }
    
    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    public void insertCourseFileInfo(DataMap fileMap) throws Exception {
    	classdeskTutorResultMapper.insertFileInfo(fileMap);
    }
    
    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    public void insertLectureFileInfo(DataMap fileMap) throws Exception {
    	classdeskTutorResultMapper.insertLectureFileInfo(fileMap);
    }
    
    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> getCourseFileInfo(DataMap fileMap) throws Exception {
    	return classdeskTutorResultMapper.getCourseFileInfo(fileMap);
    }
    
    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> getCourseTxtFileInfo(DataMap fileMap) throws Exception {
    	return classdeskTutorResultMapper.getCourseTxtFileInfo(fileMap);
    }
    
    /**
     * 자료실 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteFile(DataMap data) throws Exception { 
		/* 경로 마지막에 /가 있으면 separator를 빼고 파일 삭제 진행 */ 
		boolean savPathLength  = data.getString("savePath").endsWith("/");
		if(savPathLength){
			FileUtil.deleteFile(data.getString("savePath") + data.getString("saveFile"));
		} else {
			FileUtil.deleteFile(data.getString("savePath") + File.separator + data.getString("saveFile"));
		}
		classdeskTutorResultMapper.deleteFile(data);
	}
}
