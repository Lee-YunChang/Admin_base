package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskTutorProgressMapper;
import com.webapp.classdesk.service.ClassdeskTutorProgressService;

/**
 * Description : Classdesk TutorProgress Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorProgressService")
public class ClassdeskTutorProgressServiceImpl implements ClassdeskTutorProgressService {

    @Resource(name = "classdeskTutorProgressMapper")
    private ClassdeskTutorProgressMapper classdeskTutorProgressMapper;

    /**
     * getEdCourseTreeList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEdCourseTreeList(DataMap data) throws Exception {
        return classdeskTutorProgressMapper.getEdCourseTreeList(data);
    }

    /**
     * getConurlInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getConurlInfo(DataMap data) throws Exception {
        return classdeskTutorProgressMapper.getConurlInfo(data);
    }
}
