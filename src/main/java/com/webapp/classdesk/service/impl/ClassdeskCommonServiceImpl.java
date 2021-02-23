package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.webapp.classdesk.mapper.ClassdeskCommonMapper;
import com.webapp.classdesk.service.ClassdeskCommonService;

/**
 * Description : Classdesk Common Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskCommonService")
public class ClassdeskCommonServiceImpl implements ClassdeskCommonService {

    @Resource(name = "classdeskCommonMapper")
    private ClassdeskCommonMapper classdeskCommonMapper;

    /**
     * getLeReportFileList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeReportFileList(DataMap data) throws Exception {
        return classdeskCommonMapper.getLeReportFileList(data);
    }

    /**
     * getLeReportApplyFileList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeReportApplyFileList(DataMap data) throws Exception {
        return classdeskCommonMapper.getLeReportApplyFileList(data);
    }

    /**
     * getCuserNo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCuserNo(DataMap data) throws Exception {
        return classdeskCommonMapper.getCuserNo(data);
    }

    /**
     * getMailRecInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMailRecInfo(DataMap data) throws Exception {
        return classdeskCommonMapper.getMailRecInfo(data);
    }

    /**
     * getEdCourseSeqInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdCourseSeqInfo(DataMap data) throws Exception {
        return classdeskCommonMapper.getEdCourseSeqInfo(data);
    }

    /**
     * getQuizFileInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getQuizFileInfo(DataMap data) throws Exception {
    	String tname = data.getString("tname");
    	
    	if (tname.equals("LMS_LE_EXAM_SQUIZ")) {

            return classdeskCommonMapper.getQuizFileInfo1(data);
	    } else if (tname.equals("LMS_LE_EXAM_QUIZ")) {

	        return classdeskCommonMapper.getQuizFileInfo2(data);
	    } else if (tname.equals("LMS_ED_EXAM_QUIZ")) {

	        return classdeskCommonMapper.getQuizFileInfo3(data);
	    }
	    else {
	    	return null;
	    }
        
    }
}
