package com.webapp.admin.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 
 * Description : Main Mapper
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Mapper("adminMainMapper")
public interface AdminMainMapper {

	/**
     * 공지사항 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardList(DataMap data) throws Exception;
    
    /**
     * 팝업 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPopupList(DataMap data) throws Exception;
    
    
	/**
     * 가입자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getJoinInfo(DataMap data) throws Exception;
    

	/**
     * 방문자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getAccessTodayInfo(DataMap data) throws Exception;
    
    /**
     * 업체 승인대기
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCompanyListCount(DataMap data) throws Exception;
    
    /**
     * 현재 수강자수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getStudyUserCount(DataMap data) throws Exception;
    

    /**
     * 금월수료자수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCourseIsPassCount(DataMap data) throws Exception;
    
    /**
     * 수강신청현황(집합)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOfflineCourseList(DataMap data) throws Exception;
    
    /**
     * 수강신청현황(온라인)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlineCourseList(DataMap data) throws Exception;
    
    /**
     * 카운트 월별 현황 (최근 6개월)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSuryoCountList(DataMap data) throws Exception;
    
    /**
     * 접속자 카운트 월별현황
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getAccessCountList(DataMap data) throws Exception;
    
    /**
     * 특강목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureList(DataMap data) throws Exception;
    
    /**
     * 대출의무 수강현황
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseList(DataMap data) throws Exception;
}
