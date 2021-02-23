package com.webapp.classdesk.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

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
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizsetMapper;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizsetService;

/**
 * Description : Classdesk TutorExamQuizset Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorExamQuizsetService")
public class ClassdeskTutorExamQuizsetServiceImpl implements ClassdeskTutorExamQuizsetService {

    @Resource(name = "classdeskTutorExamQuizsetMapper")
    private ClassdeskTutorExamQuizsetMapper classdeskTutorExamQuizsetMapper;

    private Logger                          log = LogManager.getLogger(this.getClass());

    /**
     * 세트방식 출제 정책 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeExamSetList(DataMap data) throws Exception {
        return classdeskTutorExamQuizsetMapper.getLeExamSetList(data);
    }

    /**
     * 세트방식 세트 등록
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeExamSet(DataMap data) throws Exception {
        classdeskTutorExamQuizsetMapper.insertLeExamSet(data);
    }

    /**
     * 세트방식 세트 수정
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeExamSet(DataMap data) throws Exception {
        classdeskTutorExamQuizsetMapper.updateLeExamSet(data);
    }

    /**
     * 세트방식 문제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeExamSetQuizList(DataMap data) throws Exception {
        return classdeskTutorExamQuizsetMapper.getLeExamSetQuizList(data);
    }

    /**
     * 세트 문제 총 배점 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSetTotalAllotInfo(DataMap data) throws Exception {
        return classdeskTutorExamQuizsetMapper.getSetTotalAllotInfo(data);
    }

    /**
     * 세트 문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeExamSetQuizInfo(DataMap data) throws Exception {
        return classdeskTutorExamQuizsetMapper.getLeExamSetQuizInfo(data);
    }

    /**
     * updateLeExamSetQuiz
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeExamSetQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizsetMapper.updateLeExamSetQuiz(data);
    }

    /**
     * insertLeExamSetQuiz
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeExamSetQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizsetMapper.insertLeExamSetQuiz(data);
    }

    /**
     * 문제 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deletetLeExamSetQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizsetMapper.deletetLeExamSetQuiz(data);
    }

    /**
     * (문제은행) 출제정책 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEdExamSectionList(DataMap data) throws Exception {
        return classdeskTutorExamQuizsetMapper.getEdExamSectionList(data);
    }

    /**
     * insertLeExamSetQuizExamBankData
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeExamSetQuizExamBankData(DataMap data) throws Exception {
        classdeskTutorExamQuizsetMapper.insertLeExamSetQuizExamBankData(data);
    }

    /**
     * 세트문제 등록 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    public void exec(HttpServletRequest request, DataMap rMap) throws Exception {
        String[] setno = request.getParameterValues("setno");
        int setNoSize = setno.length;
        DataMap setDataMap = null;
        setDataMap = new DataMap();

        setDataMap.putInt("courseno", ParamUtil.getIntParam(rMap.getString("SES_COURSENO"), 0));

        if (setNoSize > 0) {

            for (int i = 0; i < setNoSize; i++) {

                setDataMap.putInt("setno", ParamUtil.getIntParam(setno[i]));
                setDataMap.putString("title", ParamUtil.getStrParam(request.getParameterValues("title")[i]));
                setDataMap.putString("useyn", ParamUtil.getStrParam(request.getParameterValues("useyn")[i], "Y"));

                if (ParamUtil.getIntParam(setno[i]) > 0) {
                    updateLeExamSet(setDataMap);
                } else {
                    insertLeExamSet(setDataMap);
                }

            }
        }
    }

    /**
     * 세트문제 퀴즈 문제 등록 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    public void qExec(HttpServletRequest request, DataMap data) throws Exception {

        // 파일 업로드
        FileUploadUtil uploadUtil = new FileUploadUtil();
        data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));

        int qno = data.getInt("qno", 0);
        int fileCnt = data.getInt("UPLOAD_FILE_CNT"); //파일 개수 Cnt

        EduMap delData = getLeExamSetQuizInfo(data);

        String uploadFieldName = "";
        String uploadFileSaveName = "";
        String uploadFileFulltPath = "";

        // 파일삭제 체크
        String delQsubjectFile = ParamUtil.getStrParam(data.getString("delQsubjectFile"), "");
        String delA01File = ParamUtil.getStrParam(data.getString("delA01File"), "");
        String delA02File = ParamUtil.getStrParam(data.getString("delA02File"), "");
        String delA03File = ParamUtil.getStrParam(data.getString("delA03File"), "");
        String delA04File = ParamUtil.getStrParam(data.getString("delA04File"), "");
        String delA05File = ParamUtil.getStrParam(data.getString("delA05File"), "");

        //파일 삭제 실행

        // 문제이미지 삭제
        if (!"".equals(delQsubjectFile)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("QSUBJECT_FILE"));
                data.setString("qsubjectFile", "");
            } catch (FileNotFoundException e) {
            	
            }
            // 지문 01 이미지 삭제
        }
        if (!"".equals(delA01File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A01_FILE"));
                data.setString("a01File", "");
            } catch (FileNotFoundException e) {
            	
            }
            // 지문 02 이미지 삭제
        }
        if (!"".equals(delA02File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A02_FILE"));
                data.setString("a02File", "");
            } catch (FileNotFoundException e) {
            	
            }
            // 지문 03 이미지 삭제  
        }
        if (!"".equals(delA03File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A03_FILE"));
                data.setString("a03File", "");
            } catch (FileNotFoundException e) {
            	
            }
            // 지문 04 이미지 삭제
        }
        if (!"".equals(delA04File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A04_FILE"));
                data.setString("a04File", "");
            } catch (FileNotFoundException e) {
            	
            }
            // 지문 05 이미지 삭제
        }
        if (!"".equals(delA05File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A05_FILE"));
                data.setString("a05File", "");
            } catch (FileNotFoundException e) {
            	
            }
        }

        // 파일업로드 시작
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");

            uploadFieldName = ParamUtil.getStrParam(fileMap.get("uploadFieldName", i).toString(), "");
            uploadFileSaveName = ParamUtil.getStrParam(fileMap.get("uploadFileSaveName", i).toString(), "");
            uploadFileFulltPath = ParamUtil.getStrParam(fileMap.get("uploadFileFulltPath", i).toString(), "");

            data.setString("file_path", uploadFileFulltPath);
            // 퀴즈문제 이미지
            if (uploadFieldName.equals("qsubjectFile")) {
                data.setString("qsubjectFile", uploadFileSaveName);

                // 지문1 이미지
            } else if (uploadFieldName.equals("a01File")) {
                data.setString("a01File", uploadFileSaveName);

                // 지문2 이미지
            } else if (uploadFieldName.equals("a02File")) {
                data.setString("a02File", uploadFileSaveName);

                //지문3 이미지
            } else if (uploadFieldName.equals("a03File")) {
                data.setString("a03File", uploadFileSaveName);

                // 지문4 이미지
            } else if (uploadFieldName.equals("a04File")) {
                data.setString("a04File", uploadFileSaveName);

                // 지문5 이미지
            } else if (uploadFieldName.equals("a05File")) {
                data.setString("a05File", uploadFileSaveName);
            }

        }

        // 수정
        if (qno > 0) {
            updateLeExamSetQuiz(data);
            data.putString("rMsg", "수정되었습니다.");
            data.putString("rScript", "fnReload()");
            // 등록
        } else {
            insertLeExamSetQuiz(data);
            data.putString("rMsg", "등록되었습니다.");
            data.putString("rScript", "fnReload()");
        }
    }

    /**
     * 시험문제 삭제 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    public void qDelExec(DataMap data) throws Exception {
        EduMap delInfo = getLeExamSetQuizInfo(data);


        // 문제이미지 삭제
        if (!"".equals(delInfo.getString("QSUBJECT_FILE"))) {
            try {
                FileUtil.deleteFile(delInfo.getString("FILE_PATH") + File.separator + delInfo.getString("QSUBJECT_FILE"));
            } catch (FileNotFoundException e) {
            	
            }
        }

        for (int i = 1; i < 6; i++) {
            if (!"".equals(delInfo.getString("A0" + i + "_FILE"))) {
                try {
                    FileUtil.deleteFile(delInfo.getString("FILE_PATH") + File.separator + delInfo.getString("A0" + i + "_FILE"));
                } catch (FileNotFoundException e) {
                }
            }
        }

        deletetLeExamSetQuiz(data);
    }

    /**
     * 문제은행 문제 등록 실행
     * 
     * @param request
     * @param rMap
     * @throws Exception
     */
    public void quizbankExec(HttpServletRequest request, DataMap rMap) throws Exception {
        String[] strQno = request.getParameterValues("qno");
        int bankQuizSize = strQno.length;

        if (bankQuizSize > 0) {
            DataMap bankQuizDataMap = null;

            for (int i = 0; i < bankQuizSize; i++) {
                bankQuizDataMap = new DataMap();
                bankQuizDataMap.putInt("setno", rMap.getInt("setno"));
                bankQuizDataMap.putInt("courseno", rMap.getInt("courseno"));
                bankQuizDataMap.putString("SES_USERID", rMap.getString("SES_USERID"));

                bankQuizDataMap.putInt("qno", ParamUtil.getIntParam(strQno[i], 0));

                insertLeExamSetQuizExamBankData(bankQuizDataMap);

            }
        }
    }

    /**
     * 엑셀저장
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void qExcelExec(HttpServletRequest request, DataMap data) throws Exception {

        String[] strQno = request.getParameterValues("qno");

        String[] qtype = request.getParameterValues("qtype");
        String[] qsubject = request.getParameterValues("qsubject");
        String[] a01 = request.getParameterValues("a01");
        String[] a02 = request.getParameterValues("a02");
        String[] a03 = request.getParameterValues("a03");
        String[] a04 = request.getParameterValues("a04");
        String[] a05 = request.getParameterValues("a05");
        String[] rcode = request.getParameterValues("rcode");
        String[] allot = request.getParameterValues("allot");

        int excelDataSiz = strQno.length;

        if (excelDataSiz > 0) {
            DataMap excelDataMap = null;

            for (int i = 0; i < excelDataSiz; i++) {
                excelDataMap = new DataMap();

                excelDataMap.putInt("qtype", ParamUtil.getIntParam(qtype[i], 0));
                excelDataMap.putString("qsubject", ParamUtil.getStrParam(qsubject[i], ""));
                excelDataMap.putString("a01", ParamUtil.getStrParam(a01[i], ""));
                excelDataMap.putString("a02", ParamUtil.getStrParam(a02[i], ""));
                excelDataMap.putString("a03", ParamUtil.getStrParam(a03[i], ""));
                excelDataMap.putString("a04", ParamUtil.getStrParam(a04[i], ""));
                excelDataMap.putString("a05", ParamUtil.getStrParam(a05[i], ""));
                excelDataMap.putInt("rcode", ParamUtil.getIntParam(rcode[i], 0));
                excelDataMap.putInt("allot", ParamUtil.getIntParam(allot[i], 0));
                excelDataMap.putInt("setno", data.getInt("setno"));
                excelDataMap.putInt("SES_COURSENO", data.getInt("SES_COURSENO"));
                excelDataMap.putString("useyn", "Y");
                insertLeExamSetQuiz(excelDataMap);

            }
        }
    }
}
