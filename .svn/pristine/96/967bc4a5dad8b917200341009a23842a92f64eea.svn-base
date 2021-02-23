package com.webapp.classdesk.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizbankMapper;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizbankService;

/**
 * Description : Classdesk TutorExamQuizbank Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorExamQuizbankService")
public class ClassdeskTutorExamQuizbankServiceImpl implements ClassdeskTutorExamQuizbankService {

    @Resource(name = "classdeskTutorExamQuizbankMapper")
    private ClassdeskTutorExamQuizbankMapper classdeskTutorExamQuizbankMapper;
    
    protected Logger log = LogManager.getLogger(this.getClass());

    /**
     * getEdExamQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEdExamQuizList(DataMap data) throws Exception {
        return classdeskTutorExamQuizbankMapper.getEdExamQuizList(data);
    }
    
    /**
     * getEdExamQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeExamQuizList(DataMap data) throws Exception {
        return classdeskTutorExamQuizbankMapper.getLeExamQuizList(data);
    }

    /**
     * getAllCourseQuizList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAllCourseQuizList(DataMap data) throws Exception {
        return classdeskTutorExamQuizbankMapper.getAllCourseQuizList(data);
    }
    
    /**
     * getEdExamQuizInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdExamQuizInfo(DataMap data) throws Exception {
        return classdeskTutorExamQuizbankMapper.getEdExamQuizInfo(data);
    }
    
    /**
     * getLeExamQuizInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeExamQuizInfo(DataMap data) throws Exception {
        return classdeskTutorExamQuizbankMapper.getLeExamQuizInfo(data);
    }

    /**
     * 문제 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deletetEdExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizbankMapper.deletetEdExamQuiz(data);
    }

    /**
     * updateEdExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    public void updateEdExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizbankMapper.updateEdExamQuiz(data);
    }

    /**
     * insertEdExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    public void insertEdExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizbankMapper.insertEdExamQuiz(data);
    }

    /**
     * 문제은행 저장 / 삭제
     * 
     * @param request
     * @param data
     * @param saveType
     * @throws Exception
     */
    public void qExec(HttpServletRequest request, DataMap data, String saveType) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {
            // 파일 업로드
            FileUploadUtil uploadUtil = new FileUploadUtil();
            request.setAttribute("UPLOAD_DIR", request.getParameter("UPLOAD_DIR"));
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }

        int qno = data.getInt("qNo", 0);
        int fileCnt = data.getInt("UPLOAD_FILE_CNT"); //파일 개수 Cnt

        String uploadFieldName = "";
        String uploadFileSaveName = "";
        String uploadFileFulltPath = "";
        
        EduMap delData ;
        if(data.containsKey("qu") && data.getString("qu").equals("insert")){
        	delData = classdeskTutorExamQuizbankMapper.getEdExamQuizInfo(data);
        }else{
        	delData = classdeskTutorExamQuizbankMapper.getLeExamQuizInfo(data);
        }

        // 파일삭제 체크
        String delQsubjectFile = ParamUtil.getStrParam(data.getString("delQsubjectFile"), "");
        String delA01File = ParamUtil.getStrParam(data.getString("delA01File"), "");
        String delA02File = ParamUtil.getStrParam(data.getString("delA02File"), "");
        String delA03File = ParamUtil.getStrParam(data.getString("delA03File"), "");
        String delA04File = ParamUtil.getStrParam(data.getString("delA04File"), "");
        String delA05File = ParamUtil.getStrParam(data.getString("delA05File"), "");

        // 문제이미지 삭제
        if (!"".equals(delQsubjectFile)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("QSUBJECT_FILE"));
                data.setString("qsubjectFile", "");

            } catch (FileNotFoundException e) {
            	log.debug("error = " + e);
            }

            // 지문 01 이미지 삭제
        }
        if (!"".equals(delA01File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A01_FILE"));
                data.setString("a01File", "");

            } catch (FileNotFoundException e) {
            	log.debug("error = " + e);
            }

            // 지문 02 이미지 삭제
        }
        if (!"".equals(delA02File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A02_FILE"));
                data.setString("a02File", "");

            } catch (FileNotFoundException e) {
            	log.debug("error = " + e);
            }

            // 지문 03 이미지 삭제  
        }
        if (!"".equals(delA03File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A03_FILE"));
                data.setString("a03File", "");
            } catch (FileNotFoundException e) {
            	log.debug("error = " + e);
            }

            // 지문 04 이미지 삭제
        }
        if (!"".equals(delA04File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A04_FILE"));
                data.setString("a04File", "");
            } catch (FileNotFoundException e) {
            	log.debug("error = " + e);
            }

            // 지문 05 이미지 삭제
        }
        
        if (!"".equals(delA05File)) {
            try {
                FileUtil.deleteFile(delData.getString("FILE_PATH") + File.separator + delData.getString("A05_FILE"));
                data.setString("a05File", "");
            } catch (FileNotFoundException e) {
            	log.debug("error = " + e);
            }
        }

        if ("D".equals(saveType)) {
        	if(data.containsKey("qu") && data.getString("qu").equals("insert")){
        		classdeskTutorExamQuizbankMapper.deletetEdExamQuiz(data);
            }else{
            	classdeskTutorExamQuizbankMapper.deletetLeExamQuiz(data);
            }
            data.putString("rMsg", "삭제되었습니다.");
            data.putString("rScript", "fnQuizList()");

        } else {

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
            	
            	if(data.containsKey("qu") && data.getString("qu").equals("insert")){
            		classdeskTutorExamQuizbankMapper.updateEdExamQuiz(data);
                }else{
                	classdeskTutorExamQuizbankMapper.updateLeExamQuiz(data);
                }
                
                data.putString("rMsg", "수정되었습니다.");
                data.putString("rScript", "fnReload()");

                // 등록
            } else {
            	
            	if(data.containsKey("qu") && data.getString("qu").equals("insert")){
            		classdeskTutorExamQuizbankMapper.insertEdExamQuiz(data);
                }else{
                	classdeskTutorExamQuizbankMapper.insertLeExamQuiz(data);
                }
            	
                data.putString("rMsg", "등록되었습니다.");
                data.putString("rScript", "fnReload()");
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
                excelDataMap.putInt("secNo", data.getInt("secNo"));
                excelDataMap.putInt("SES_COURSENO", data.getInt("SES_COURSENO"));
                excelDataMap.putString("useyn", "Y");
                insertEdExamQuiz(excelDataMap);

            }
        }
    }
}
