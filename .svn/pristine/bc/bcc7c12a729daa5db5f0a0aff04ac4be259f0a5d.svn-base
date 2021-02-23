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
import com.webapp.classdesk.mapper.ClassdeskTutorExamMapper;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizbinderMapper;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizbinderService;

/**
 * Description : Classdesk TutorExamQuizbinder Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorExamQuizbinderService")
public class ClassdeskTutorExamQuizbinderServiceImpl implements ClassdeskTutorExamQuizbinderService {

    @Resource(name = "classdeskTutorExamQuizbinderMapper")
    private ClassdeskTutorExamQuizbinderMapper classdeskTutorExamQuizbinderMapper;

    @Resource(name = "classdeskTutorExamMapper")
    private ClassdeskTutorExamMapper           classdeskTutorExamMapper;
    
    protected Logger log = LogManager.getLogger(this.getClass());

    /**
     * 바인더 리스트 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeExamBinderList(DataMap data) throws Exception {
        return classdeskTutorExamQuizbinderMapper.getLeExamBinderList(data);
    }

    /**
     * 문제 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeExamQuizList(DataMap data) throws Exception {
        return classdeskTutorExamQuizbinderMapper.getLeExamQuizList(data);
    }

    /**
     * getSetTotalAllotInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSetTotalAllotInfo(DataMap data) throws Exception {
        return classdeskTutorExamQuizbinderMapper.getSetTotalAllotInfo(data);
    }

    /**
     * 퀴즈 문제 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeExamQuizInfo(DataMap data) throws Exception {
        return classdeskTutorExamQuizbinderMapper.getLeExamQuizInfo(data);
    }

    /**
     * 바인더 시험 문제 수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getLeExamQuizTotal(DataMap data) throws Exception {
        return classdeskTutorExamQuizbinderMapper.getLeExamQuizTotal(data);
    }

    /**
     * 바인더 시험 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeExamQuizDump(DataMap data) throws Exception {
        classdeskTutorExamQuizbinderMapper.insertLeExamQuizDump(data);
    }

    /**
     * 저정된 시험지 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deletetLeExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizbinderMapper.deletetLeExamQuiz(data);
    }

    /**
     * deletetLeExamQuizSeq
     * 
     * @param data
     * @throws Exception
     */
    public void deletetLeExamQuizSeq(DataMap data) throws Exception {
        classdeskTutorExamQuizbinderMapper.deletetLeExamQuizSeq(data);
    }

    /**
     * updateLeExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizbinderMapper.updateLeExamQuiz(data);
    }

    /**
     * insertLeExamQuiz
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeExamQuiz(DataMap data) throws Exception {
        classdeskTutorExamQuizbinderMapper.insertLeExamQuiz(data);
    }

    /**
     * 최종평가
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeExamBindYn(DataMap data) throws Exception {
        classdeskTutorExamQuizbinderMapper.updateLeExamBindYn(data);
    }

    /**
     * 과정목록 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEdCourseList(DataMap data) throws Exception {
        return classdeskTutorExamQuizbinderMapper.getEdCourseList(data);
    }

    /**
     * 바인더  문제 등록 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void qExec(HttpServletRequest request, DataMap data) throws Exception {

        // 파일 업로드
        FileUploadUtil uploadUtil = new FileUploadUtil();
        data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));

        int qno = data.getInt("qno", 0);
        int fileCnt = data.getInt("UPLOAD_FILE_CNT"); //파일 개수 Cnt

        EduMap delData = getLeExamQuizInfo(data);

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
            updateLeExamQuiz(data);
            data.putString("rMsg", "수정되었습니다.");
            data.putString("rScript", "fnReload(\\'" + data.get("examNo") + "\\')");

            // 등록
        } else {
            insertLeExamQuiz(data);
            data.putString("rMsg", "등록되었습니다.");
            data.putString("rScript", "fnReload(\\'" + data.get("examNo") + "\\')");
        }
    }

    /**
     * 덤프 문제 등록
     * 
     * @param data
     * @throws Exception
     */
    public void dumpExec(DataMap data) throws Exception {
        int examNo = ParamUtil.getIntParam(data.getString("examNo"), 0);

        /* 시험 MAX NO*/
        if (!data.containsKey("examNo") || examNo == 0) {
            EduMap map = classdeskTutorExamMapper.getMaxLeExamSeqNo(data);
            data.putInt("examNo", map.getInt("SEQ_EXAM_MAX_NO"));
        }

        // 시험 정보 저장. / 수정
        classdeskTutorExamMapper.insertLectExam(data);

        // 기존 등록된 문제 삭제. 
        classdeskTutorExamQuizbinderMapper.deletetLeExamQuiz(data);

        // 등록 문제수 
        //int cnt = classdeskTutorExamQuizbinderMapper.getLeExamQuizTotal(data);

        // 문제 등록. 
        classdeskTutorExamQuizbinderMapper.insertLeExamQuizDump(data);
    }
}
