package com.webapp.classdesk.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskUserReportMapper;
import com.webapp.classdesk.service.ClassdeskUserReportService;

/**
 * Description : Classdesk UserReport Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskUserReportService")
public class ClassdeskUserReportServiceImpl implements ClassdeskUserReportService {

    @Resource(name = "classdeskUserReportMapper")
    private ClassdeskUserReportMapper classdeskUserReportMapper;

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserReportList(DataMap data) throws Exception {
        return classdeskUserReportMapper.getUserReportList(data);
    }

    /**
     * 과제 제출 등록(임시/완료)
     * 
     * @param data
     * @throws Exception
     */
    public void insertReportApply(DataMap data) throws Exception {
        classdeskUserReportMapper.insertReportApply(data);
    }

    /**
     * 과제 제출 수정(임시/완료)
     * 
     * @param data
     * @throws Exception
     */
    public void updateReportApply(DataMap data) throws Exception {
        classdeskUserReportMapper.updateReportApply(data);
    }

    /**
     * 과제 제출 저장(임시/완료)
     * 
     * @param data
     * @throws Exception
     */
    public void saveReportApply(HttpServletRequest request, DataMap data) throws Exception {
        FileUploadUtil uploadUtil = new FileUploadUtil();
        data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));

        /* 파일 삭제 필요 */
        if (data.containsKey("UPLOAD_FILE")) {
            if (data.getInt("UPLOAD_FILE_CNT") > 0) {
                DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
                String popFileNm = fileMap.get("uploadFieldName").toString();

                if (!popFileNm.equals("popFile")) {
                    String delFilePath = ParamUtil.getObjParam(data.get("filePath"), "");
                    String delFileSave = ParamUtil.getObjParam(data.get("file01Save"), "");
                    // 선택한 파일이 있다면 기존 파일 삭제
                    if (!"".equals(delFilePath)) {
                        FileUtil.deleteFile(delFilePath + File.separator + delFileSave);
                    }

                    data.setString("filePath", fileMap.get("uploadFileFulltPath").toString());
                    data.setString("file01Org", fileMap.get("uploadFileOrgName").toString());
                    data.setString("file01Save", fileMap.get("uploadFileSaveName").toString());
                }
            }
        }

        // 저장 
        if (data.containsKey("cUserNo") && ParamUtil.getIntParam(data.getString("cUserNo"), 0) > 0) {
            updateReportApply(data);
        } else {
            insertReportApply(data);
        }
    }

}
