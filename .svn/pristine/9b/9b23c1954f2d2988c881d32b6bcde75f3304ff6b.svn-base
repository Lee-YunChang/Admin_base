package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskTutorMainMapper;
import com.webapp.classdesk.service.ClassdeskTutorMainService;

/**
 * Description : Classdesk TutorMain Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorMainService")
public class ClassdeskTutorMainServiceImpl implements ClassdeskTutorMainService {

    @Resource(name = "classdeskTutorMainMapper")
    private ClassdeskTutorMainMapper classdeskTutorMainMapper;

    /**
     * 사용자 CLASSDESK 접근권한
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCourseUSerCount(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseUSerCount(data);
    }

    /**
     * 클래스데스크 공통 헤더 타이틀 및 메뉴 제어
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCourseMainController(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseMainController(data);
    }

    /**
     * 메인  강사 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCourseMainTchInfo(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseMainTchInfo(data);
    }

    /**
     * 수강생정보(상시운영시 데이터 추출용)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCuserInfo(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCuserInfo(data);
    }

    /**
     * 진도
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCourseMainprogress(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseMainprogress(data);
    }

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseMainReportList(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseMainReportList(data);
    }

    /**
     * 설문
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseMainPollList(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseMainPollList(data);
    }

    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseMainLectExamList(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getCourseMainLectExamList(data);
    }

    /**
     * getProgInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getProgInfo(DataMap data) throws Exception {
        return classdeskTutorMainMapper.getProgInfo(data);
    }
    
    public List<EduMap> getCourseTreeList(DataMap data) throws Exception {
    	return classdeskTutorMainMapper.getCourseTreeList(data);
    }
}
