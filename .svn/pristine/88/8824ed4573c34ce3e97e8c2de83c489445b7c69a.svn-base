package com.webapp.classdesk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskUserResultMapper;
import com.webapp.classdesk.service.ClassdeskUserResultService;

/**
 * Description : Classdesk UserResult Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskUserResultService")
public class ClassdeskUserResultServiceImpl implements ClassdeskUserResultService {

    @Resource(name = "classdeskUserResultMapper")
    private ClassdeskUserResultMapper classdeskUserResultMapper;

    /**
     * getLeCourseUserResultInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeCourseUserResultInfo(DataMap data) throws Exception {
        return classdeskUserResultMapper.getLeCourseUserResultInfo(data);
    }
}
