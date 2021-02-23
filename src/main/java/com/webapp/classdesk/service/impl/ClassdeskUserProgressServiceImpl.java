package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskUserProgressMapper;
import com.webapp.classdesk.service.ClassdeskUserProgressService;

/**
 * Description : Classdesk UserProgress Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskUserProgressService")
public class ClassdeskUserProgressServiceImpl implements ClassdeskUserProgressService {

    @Resource(name = "classdeskUserProgressMapper")
    private ClassdeskUserProgressMapper classdeskUserProgressMapper;

    /**
     * getEdCourseTreeList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEdCourseTreeList(DataMap data) throws Exception {
        return classdeskUserProgressMapper.getEdCourseTreeList(data);
    }

    /**
     * getEduseqYnInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEduseqYnInfo(DataMap data) throws Exception {
        return classdeskUserProgressMapper.getEduseqYnInfo(data);
    }
}
