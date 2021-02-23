package com.webapp.admin.service;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * 
 * Description : Stats Service
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
public interface AdminStatsService {

	/**
     * 통계 년도
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getInsertPayYear(DataMap data) throws Exception;
    

	/**
     * 통계 월
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getInsertPayMonth(DataMap data) throws Exception;
    


	/**
     * 실적통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseUserStats(DataMap data) throws Exception;
    
    /**
     * 교육신청통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseApplyStats(DataMap data) throws Exception;
    
    /**
     * 교육신청통계 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCmmnCourseList(DataMap data) throws Exception;
    
    /**
     * 접속통계 > 데이터가 있는 연도별 콤보
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getAccessLogYearForCombo(DataMap data) throws Exception;
    
    /**
     * 접속통계 > 월별 데이터
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getAccessLogMonth(DataMap data) throws Exception;
    
    /**
     * 접속통계 > 일별 데이터
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getAccessLogDay(DataMap data) throws Exception;
    
    /**
     * 업체가입통계 > 관할기관별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCompanyOrgStats(DataMap data) throws Exception;
    
    /**
     * 업체가입통계 > 지역별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCompanyStats(DataMap data) throws Exception;
    
    /**
     * 지역별회원가입통계
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserAreaStats(DataMap data) throws Exception;
    
    /**
     * 사업장별 수료통계 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectCompStats(DataMap data) throws Exception;
    
    /**
     * 사업장별 수료통계 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectCompStatsInfo(DataMap data) throws Exception;
    
    /**
     * 집합과정 신청 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectCompJibCourseList(DataMap data) throws Exception;
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlineList(DataMap data) throws Exception;
    
    /**
     * 집합교육운영현황
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOfflineList(DataMap data) throws Exception;
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlineDetailList(DataMap data) throws Exception;
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTotalCourseUserStats(DataMap data) throws Exception;
    
    /**
     * 종합통계 > 년도별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTotalCourseStats(DataMap data) throws Exception;
    
    /**
     * 종합통계 > 년도별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTotalCourseCateStats1(DataMap data) throws Exception;
    
    /**
     * 종합통계 > 년도별
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTotalCourseCateStats2(DataMap data) throws Exception;
    
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTotalCourseUserStats2(DataMap data) throws Exception;
    /**
     * 사이버교육운영현황 > 월별
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTotalCourseUserStats3(DataMap data) throws Exception;

    /**방문교육통계 - 강사별*/
	int getLectureTutorStatsCnt(DataMap rMap)throws Exception;
    /**방문교육통계 - 강사별*/
	List<Map<String,Object>> getLectureTutorStats(DataMap rMap)throws Exception;
    
    /**방문교육통계 - 교육대상&교육희망주제*/
	List<Map<String,Object>> getLectureUserStats(DataMap rMap)throws Exception;

	/**방문교육통계 - 강사구분*/
	List<Map<String,Object>> getLectureTeacherStats(DataMap rMap) throws Exception;
	
	/**방문교육통계 - 강사월별*/
	int getLectureTutorMonthStatsCnt(DataMap rMap)throws Exception;
	
	/**방문교육통계 - 강사월별*/
	List<Map<String,Object>> getLectureTutorMonthStats(DataMap rMap)throws Exception;
	
	/**
     * 종합수료통계 
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTotalCompCourseStats(DataMap data) throws Exception;
    /**
     * 종합수료통계-햇살론 
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getLonCompCnt1(DataMap data) throws Exception;
    /**
     * 종합수료통계-미소금융 
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getLonCompCnt2(DataMap data) throws Exception;
}