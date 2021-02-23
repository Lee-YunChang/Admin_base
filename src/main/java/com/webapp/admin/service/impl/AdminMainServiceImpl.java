package com.webapp.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.admin.mapper.AdminMainMapper;
import com.webapp.admin.service.AdminMainService;

/**
 * 
 * Description :  Main Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 21.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminMainService")
public class AdminMainServiceImpl implements AdminMainService { 

    @Resource(name = "adminMainMapper")
    private AdminMainMapper adminMainMapper;

    
    /**
     * 공지사항 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getBoardList(data);
    }
    
    /**
     * 팝업 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPopupList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getPopupList(data);
    }
    
    
    /**
     * 가입자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getJoinInfo(DataMap data) throws Exception {
        return adminMainMapper.getJoinInfo(data);
    }
    
    /**
     * 방문자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getAccessTodayInfo(DataMap data) throws Exception {
        return adminMainMapper.getAccessTodayInfo(data);
    }
    
    /**
     * 업체 승인대기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getCompanyListCount(DataMap data) throws Exception {
        return adminMainMapper.getCompanyListCount(data);
    }
    
    /**
     * 현재 수강자수
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getStudyUserCount(DataMap data) throws Exception {
        return adminMainMapper.getStudyUserCount(data);
    }
    

    /**
     * 금월수료자수
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getCourseIsPassCount(DataMap data) throws Exception {
        return adminMainMapper.getCourseIsPassCount(data);
    }
    
    /**
     * 수강신청현황(집합)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOfflineCourseList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getOfflineCourseList(data);
    }
    
    /**
     * 수강신청현황(온라인)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOnlineCourseList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getOnlineCourseList(data);
    }
    
    /**
     * 온라인 수료자 카운트 월별 현황 (최근 6개월)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSuryoCountList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getSuryoCountList(data);
    }
    
    /**
     * 접속자 카운트 월별현황
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessCountList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getAccessCountList(data);
    }

    /**
     * 특강목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectureList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminMainMapper.getLectureList(data);
    }
    
    /**
     * 수강현황
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseList(DataMap data) throws Exception {
        return adminMainMapper.getCourseList(data);
    }
    
}
