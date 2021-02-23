package com.webapp.classdesk.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
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
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorReportMapper;
import com.webapp.classdesk.service.ClassdeskTutorReportService;

/**
 * Description : Classdesk TutorReport Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorReportService")
public class ClassdeskTutorReportServiceImpl implements ClassdeskTutorReportService {

    @Resource(name = "classdeskTutorReportMapper")
    private ClassdeskTutorReportMapper classdeskTutorReportMapper;

    protected Logger  log = LogManager.getLogger(this.getClass());
    
    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getReportList(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getReportList(data);
    }

    /**
     * 과제 상세
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getReportItem(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getReportItem(data);
    }

    /**
     * 과제 배점 총 카운트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getReportEvalSummary(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getReportEvalSummary(data);
    }

    /**
     * 과제 배점 총 카운트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMaxReportSeqNo(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getMaxReportSeqNo(data);
    }

    /**
     * getEvalReportInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEvalReportInfo(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getEvalReportInfo(data);
    }

    /**
     * 과제 등록
     * 
     * @param data
     * @throws Exception
     */
    public void insertReport(DataMap data) throws Exception {
        classdeskTutorReportMapper.insertReport(data);
    }

    /**
     * 과제 수정
     * 
     * @param data
     * @throws Exception
     */
    public void updateReport(DataMap data) throws Exception {
        classdeskTutorReportMapper.updateReport(data);
    }

    /**
     * 과제 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteReport(DataMap data) throws Exception {
        classdeskTutorReportMapper.deleteReport(data);
    }

    /**
     * 과제  제출자 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteReportApply(DataMap data) throws Exception {
        classdeskTutorReportMapper.deleteReportApply(data);
    }

    /**
     * 과제 제출자 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getReportApplyList(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getReportApplyList(data);
    }

    /**
     * getReportApplyInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getReportApplyInfo(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getReportApplyInfo(data);
    }

    /**
     * 과제 최종평가반영
     * 
     * @param data
     * @throws Exception
     */
    public void updateReportEvalFinal(DataMap data) throws Exception {
        classdeskTutorReportMapper.updateReportEvalFinal(data);
    }

    /**
     * 과제 평가
     * 
     * @param data
     * @throws Exception
     */
    public void updateUserReportEval(DataMap data) throws Exception {
        classdeskTutorReportMapper.updateUserReportEval(data);
    }

    /**
     * getLeExamSetQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeExamSetQuizList(DataMap data) throws Exception {
        return classdeskTutorReportMapper.getLeExamSetQuizList(data);
    }

    /**
     * 성적 업데이트프로시저 실행
     * 
     * @param data
     * @throws Exception
     */
    public void callLmsCourseRecordExec(Map data) throws Exception {
        classdeskTutorReportMapper.callLmsCourseRecordExec(data);
    }

    /**
     * 과제 등록 / 수정 / 삭제 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void execReportApply(HttpServletRequest request, DataMap data, String saveFlg) throws Exception {

        FileUploadUtil uploadUtil = new FileUploadUtil();
        request.setAttribute("UPLOAD_DIR", request.getParameter("UPLOAD_DIR"));
        data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));

        /**
         * 파일 삭제 필요
         * 
         */
        int fileCnt = data.getInt("UPLOAD_FILE_CNT"); //파일 개수 Cnt

        EduMap delData = getReportItem(data);
        String delFile = "";

        // 파일삭제 실행
        for (int i = 1; i < 5; i++) {
            delFile = ParamUtil.getStrParam(data.getString("delFile0" + i), "");

            if (delFile.equals("Y")) {
                try {
                    FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("FILE0" + i + "_SAVE"));
                    data.setString("file0" + i + "Org", "");
                    data.setString("file0" + i + "Save", "");
                } catch (FileNotFoundException e) {
                }
            }
        }

        // 파일맵에 저장된 데이터 사용 용도
        String uploadFieldName = "";
        String uploadFileOrgName = "";
        String uploadFileSaveName = "";
        String uploadFileFulltPath = "";

        //임시저장 삭제
        if ("D".equals(saveFlg)) {
            deleteReportApply(data);
            deleteReport(data);

            data.putString("rMsg", "삭제되었습니다.");
            data.putString("rScript", "fnList()");
        } else {

            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");

            // 파일업로드 시작
            for (int i = 0; i < fileCnt; i++) {

                uploadFieldName = ParamUtil.getStrParam(fileMap.get("uploadFieldName", i).toString(), "");
                uploadFileOrgName = ParamUtil.getStrParam(fileMap.get("uploadFileOrgName", i).toString(), "");
                uploadFileSaveName = ParamUtil.getStrParam(fileMap.get("uploadFileSaveName", i).toString(), "");
                uploadFileFulltPath = ParamUtil.getStrParam(fileMap.get("uploadFileFulltPath", i).toString(), "");

                data.setString("filePath", uploadFileFulltPath); // 파일패스 저장

                // 퀴즈문제 이미지
                if (uploadFieldName.equals("file01")) {
                    data.setString("file01Org", uploadFileOrgName);
                    data.setString("file01Save", uploadFileSaveName);
                } else if (uploadFieldName.equals("file02")) {
                    data.setString("file02Org", uploadFileOrgName);
                    data.setString("file02Save", uploadFileSaveName);
                } else if (uploadFieldName.equals("file03")) {
                    data.setString("file03Org", uploadFileOrgName);
                    data.setString("file03Save", uploadFileSaveName);
                } else if (uploadFieldName.equals("file04")) {
                    data.setString("file04Org", uploadFileOrgName);
                    data.setString("file04Save", uploadFileSaveName);
                }

            }

            try {
                //저장 
                if (data.containsKey("reportNo") && ParamUtil.getIntParam(data.getString("reportNo"), 0) > 0) {
                    updateReport(data);
                } else {
                    EduMap map = (EduMap)getMaxReportSeqNo(data);
                    data.putInt("reportNo", map.getInt("SEQ_REPORT_NO"));
                    insertReport(data);
                }

                if ("Y".equals(data.getString("openYn"))) {

                    if (data.getString("nextSubcmd").equals("user_list")) {
                        data.putString("rMsg", "과제 수정되었습니다.");
                        data.putString("rScript", "fnUserList()");
                    } else {
                        data.putString("rMsg", "과제 출제되었습니다.");
                        data.putString("rScript", "fnList()");
                    }

                } else {
                    data.putString("rMsg", " 임시 저장되었습니다.");
                    data.putString("rScript", "fnList(\\'" + data.get("reportNo") + "\\')");
                }
            } catch (Exception e) {
                throw new Exception();
            }
        }
    }

    /**
     * 최종평가 반영
     * 
     * @param data
     * @throws Exception
     */
    public void execReportEvalFinal(DataMap data) throws Exception {
        updateReportEvalFinal(data);
        
        // 성적 반영을위한 점수와 유저번호 리스트
        List<EduMap> evalList = getEvalList(data);
        List<EduMap> cuserNoList = getCuserNoList(data);
        EduMap reportEvalInfo = null;
        EduMap reportCuserNoInfo = null;
        
        if(evalList.size() == cuserNoList.size()){
        	for(int i = 0 ; i < evalList.size(); i++){
            	reportEvalInfo = (EduMap)evalList.get(i);
            	reportCuserNoInfo = (EduMap)cuserNoList.get(i);
            	data.putString("EVAL", Integer.toString(reportEvalInfo.getInt("EVAL")));
            	data.putString("CUSERNO", Integer.toString(reportCuserNoInfo.getInt("CUSERNO")));
            	classdeskTutorReportMapper.reportEvalFinalExec(data);
            }
        }
    }
    
    /**
     * 최종평가 점수List
     * 
     * @param data
     * @throws Exception
     */
    public List<EduMap> getEvalList(DataMap data) throws Exception {
    	return classdeskTutorReportMapper.getEvalList(data);
    }
    
    /**
     * 최종평가 수강생List
     * 
     * @param data
     * @throws Exception
     */
    public List<EduMap> getCuserNoList(DataMap data) throws Exception {
    	return classdeskTutorReportMapper.getCuserNoList(data);
    }
    
    
}
