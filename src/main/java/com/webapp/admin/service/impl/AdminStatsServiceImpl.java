package com.webapp.admin.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.admin.mapper.AdminStatsMapper;
import com.webapp.admin.service.AdminStatsService;

/**
 * 
 * Description : 관리자 게시판 Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminStatsService")
public class AdminStatsServiceImpl implements AdminStatsService { 

	private Logger log = LogManager.getLogger(AdminStatsServiceImpl.class);
	
    @Resource(name = "adminStatsMapper")
    private AdminStatsMapper adminStatsMapper;
   
    /**
     * 통계 년도
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getInsertPayYear(DataMap data) throws Exception {
        return adminStatsMapper.getInsertPayYear(data);
    }
    /**
     * 통계 월
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getInsertPayMonth(DataMap data) throws Exception {
        return adminStatsMapper.getInsertPayMonth(data);
    }
    
    /**
     * 교육실적통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseUserStats(DataMap data) throws Exception {
        return adminStatsMapper.getCourseUserStats(data);
    }
    
    /**
     * 교육신청통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseApplyStats(DataMap data) throws Exception {
        return adminStatsMapper.getCourseApplyStats(data);
    }
    
    /**
     * 교육신청통계 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCmmnCourseList(DataMap data) throws Exception {
        return adminStatsMapper.getCmmnCourseList(data);
    }
    
    /**
     * 접속통계 > 연도별 콤보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessLogYearForCombo(DataMap data) throws Exception {
        return adminStatsMapper.getAccessLogYearForCombo(data);
    }
    
    /**
     * 접속통계 > 월별 데이터
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessLogMonth(DataMap data) throws Exception {
        return adminStatsMapper.getAccessLogMonth(data);
    }
    
    /**
     * 접속통계 > 일별 데이터
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessLogDay(DataMap data) throws Exception {
        return adminStatsMapper.getAccessLogDay(data);
    }
    
    /**
     * 업체가입통계 > 관할기관별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCompanyOrgStats(DataMap data) throws Exception {
        return adminStatsMapper.getCompanyOrgStats(data);
    }
    
    /**
     * 업체가입통계 > 지역별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCompanyStats(DataMap data) throws Exception {
        return adminStatsMapper.getCompanyStats(data);
    }
    
    /**
     * 지역별 회원가입통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserAreaStats(DataMap data) throws Exception {
        return adminStatsMapper.getUserAreaStats(data);
    }
    
    /**
     * 사업장별 수료통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> selectCompStats(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminStatsMapper.selectCompStats(data);
    }
    
    /**
     * 사업장별 수료통계 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectCompStatsInfo(DataMap data) throws Exception {
        return adminStatsMapper.selectCompStatsInfo(data);
    }
    
    /**
     * 집합과정 신청 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> selectCompJibCourseList(DataMap data) throws Exception {
        return adminStatsMapper.selectCompJibCourseList(data);
    }
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOnlineList(DataMap data) throws Exception {
        return adminStatsMapper.getOnlineList(data);
    }
    
    /**
     * 집합교육운영현황
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOfflineList(DataMap data) throws Exception {
        return adminStatsMapper.getOfflineList(data);
    }
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOnlineDetailList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminStatsMapper.getOnlineDetailList(data);
    }
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTotalCourseUserStats(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminStatsMapper.getTotalCourseUserStats(data);
    }
    
    /**
     * 종합통계 > 년도별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTotalCourseStats(DataMap data) throws Exception{
    	return adminStatsMapper.getTotalCourseStats(data);
    }
    
    /**
     * 종합통계 > 년도별 카테고리1
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTotalCourseCateStats1(DataMap data) throws Exception{
    	return adminStatsMapper.getTotalCourseCateStats1(data);
    }
    
    /**
     * 종합통계 > 년도별 카테고리2
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTotalCourseCateStats2(DataMap data) throws Exception{
    	return adminStatsMapper.getTotalCourseCateStats2(data);
    }
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getTotalCourseUserStats2(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminStatsMapper.getTotalCourseUserStats2(data);
    }
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getTotalCourseUserStats3(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminStatsMapper.getTotalCourseUserStats3(data);
    }

    
    /** 방문교육통계 -  대상자*/
    public List<Map<String, Object>> getLectureUserStats(DataMap data) throws Exception {
    	return adminStatsMapper.getLectureUserStats(data);
	}
    
    /**방문교육통계 - 강사별*/
    public int getLectureTutorStatsCnt(DataMap data)throws Exception{
    	return adminStatsMapper.getLectureTutorStatsCnt(data);
    }
    
    /**방문교육통계 - 강사별*/
    public List<Map<String,Object>> getLectureTutorStats(DataMap data)throws Exception{
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
    	List<Map<String,Object>> lectureTutorInfo = adminStatsMapper.getLectureTutorStats(data);
    	for(int i=0;i<lectureTutorInfo.size();i++){
    		String mtLctreCode = (String) lectureTutorInfo.get(i).get("MT_LCTRE_CODE");
        	String mtLctreName2 = "";
        	String[] mtLctreName = mtLctreCode.split(",");
        	
        	for(int i2=0;i2<mtLctreName.length;i2++){
	        	if(i2 == 0){
	        		//mtLctreName2 = adminLectureMapper.getMtLctreName(mtLctreName[0]);
	        	}else{
	        		//mtLctreName2 = mtLctreName2 +','+adminLectureMapper.getMtLctreName(mtLctreName[i2]);
	        	}
	        }
        	lectureTutorInfo.get(i).put("mtLctreName", mtLctreName2);
        	
    	}
		return lectureTutorInfo;
	}
    
    /** 방문교육통계 -  강사구분*/
    public List<Map<String, Object>> getLectureTeacherStats(DataMap data) throws Exception {
    	return adminStatsMapper.getLectureTeacherStats(data);
	}
    
    /**방문교육통계 - 강사월별*/
	public int getLectureTutorMonthStatsCnt(DataMap data)throws Exception{
		return adminStatsMapper.getLectureTutorMonthStatsCnt(data);
	}
	
	/**방문교육통계 - 강사월별*/
	public List<Map<String,Object>> getLectureTutorMonthStats(DataMap data)throws Exception{
		data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
		return adminStatsMapper.getLectureTutorMonthStats(data);
	}
	
	/**
     * 종합수료통계 
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getTotalCompCourseStats(DataMap data) throws Exception{
		return adminStatsMapper.getTotalCompCourseStats(data);
	}
	/**
     * 종합수료통계-햇살론 
     *
     * @param data
     * @return
     * @throws Exception
     */
	public int getLonCompCnt1(DataMap data) throws Exception{
    	return adminStatsMapper.getLonCompCnt1(data);
    }
    /**
     * 종합수료통계-미소금융 
     *
     * @param data
     * @return
     * @throws Exception
     */
	public int getLonCompCnt2(DataMap data) throws Exception{
    	return adminStatsMapper.getLonCompCnt2(data);
    }
}