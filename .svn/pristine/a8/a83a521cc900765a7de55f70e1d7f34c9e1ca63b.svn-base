package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskUserPollMapper;
import com.webapp.classdesk.service.ClassdeskUserPollService;

/**
 * Description : Classdesk UserPoll Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskUserPollService")
public class ClassdeskUserPollServiceImpl implements ClassdeskUserPollService {

    @Resource(name = "classdeskUserPollMapper")
    private ClassdeskUserPollMapper classdeskUserPollMapper;

    /**
     * 클래스데스크 > 학생 > 설문
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollApplyMainList(DataMap data) throws Exception {
        return classdeskUserPollMapper.getPollApplyMainList(data);
    }

    /**
     * 설문 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserPollList(DataMap data) throws Exception {
        return classdeskUserPollMapper.getUserPollList(data);
    }

    /**
     * 강의실 설문 응시내역
     * 
     * @param data
     * @throws Exception
     */
    public void insertPollApply(DataMap data) throws Exception {
        classdeskUserPollMapper.insertPollApply(data);
    }

    /**
     * 강의실 설문 응시답안
     * 
     * @param data
     * @throws Exception
     */
    public void insertPollApplyHist(DataMap data) throws Exception {
        classdeskUserPollMapper.insertPollApplyHist(data);
    }

    /**
     * 설문 실시간 정답
     * 
     * @param data
     * @throws Exception
     */
    public void updatePollRealTmAns(DataMap data) throws Exception {
        //사용자 실시간 정답 저장
    	classdeskUserPollMapper.updatePollRealTmAns(data);
    	//사용자 실시간 응시시간 저장
    	classdeskUserPollMapper.updatePollApply(data);
    }

    /**
     * updatePollApply
     * 
     * @param data
     * @throws Exception
     */
    public void updatePollApply(DataMap data) throws Exception {
        classdeskUserPollMapper.updatePollApply(data);
    }

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollApplyHistList(DataMap data) throws Exception {
        return classdeskUserPollMapper.getPollApplyHistList(data);
    }

    /**
     * 강의실 설문 응시내역 저장
     * 
     * @param data
     * @throws Exception
     */
    public void savePollApply(DataMap data) throws Exception {
        insertPollApply(data);
        insertPollApplyHist(data);
    }
}
