package com.webapp.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;

/**
 * 
 * Description : 관리자 게시판 Service
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 21.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
public interface AdminBoardService {
	
	/**
     * 게시판 카테고리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardCategoryInfo(DataMap data) throws Exception;
    
    /**
     * 게시판 공지사항 top 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTopBoardList(DataMap data) throws Exception;
    
	/**
     * 게시판 리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getBbsListCount(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardList(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getContentsList(DataMap data) throws Exception;

    /**
     * 게시글 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardView(DataMap data) throws Exception;
 
    /**
     * 팝업 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPopupList(DataMap data) throws Exception;
    
    /**
     * 팝업 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPopupView(DataMap data) throws Exception;
    
    /**
     * 팝업 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertPopupInfo(DataMap data) throws Exception;
    
    /**
     * 팝업 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updatePopupInfo(DataMap data) throws Exception;
    
    /**
     * 팝업 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deletePopupInfo(DataMap data) throws Exception;
    
    /**
     * 조회수 증가
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateBoardViewCnt(DataMap data) throws Exception;
    
    /**
     * 파일리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(DataMap data) throws Exception;
    
    /**
     * 파일리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getDataFileList(DataMap data) throws Exception;
    /**
     * 파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertFileInfo(DataMap data) throws Exception;
    
    /**
     * 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;
    
    /**
     * 게시글 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertBoardInfo(HttpServletRequest request,DataMap data) throws Exception;
    /**
     * 게시글 파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertEdDataFile(HttpServletRequest request , DataMap data)throws Exception;
    /**
     * 자료실 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteEdDataFile(DataMap data) throws Exception;
    /**
     * 파일 bbsno 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateFileBbsno(HttpServletRequest request , DataMap data) throws Exception;

    /**
     * 게시글 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateBoardInfo(HttpServletRequest request,DataMap data) throws Exception;
    
    /**
     * 게시글 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteBoardInfo(DataMap data) throws Exception;
    
    /**
     * 게시글 최대번호
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxBoardNo(DataMap data) throws Exception;
    
    /**
     * 상시설문 게시글 최대번호
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxSurveyNo(DataMap data) throws Exception;
    
    /**
     * 상시설문 질문 최대번호
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxQuizNo(DataMap data) throws Exception;
    
    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(DataMap data) throws Exception;
    
    /**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo2(DataMap data) throws Exception;
    
    /**
     * 상시설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSurveyList(DataMap data) throws Exception; 
    
    /**
     * 온라인교육 개인별 통계 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOnlinePersonStatsListCnt(DataMap data) throws Exception;
    
    /**
     * 온라인교육 개인별 통계 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlinePersonStatsList(DataMap data) throws Exception;
    
    /**
     * 온라인교육 통계 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOnlineStatsListCnt(DataMap data) throws Exception;
    
    /**
     * 온라인교육 통계 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlineStatsList(DataMap data) throws Exception;
    
    /**
     * 온라인교육 통계
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlineStatsDetail(DataMap data) throws Exception;
    
    /**
     * 배너 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBannerList(DataMap data) throws Exception; 
    
    /**
     * 공개여부 Y 개수 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getUseAtCnt(DataMap data) throws Exception; 
    
    /**
     * 배너 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBannerView(DataMap data) throws Exception;
    
    /**
     * 배너 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertBannerInfo(HttpServletRequest request,DataMap data) throws Exception;
    
    /**
     * 배너 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateBannerInfo(HttpServletRequest request,DataMap data) throws Exception;
    
    /**
     * 배너 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteBannerInfo(DataMap data) throws Exception;
    
    /**
     * 배너 최대번호
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxBannerNo(DataMap data) throws Exception;
    

	/**
     * 강사 커뮤니티 댓글 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	void tutorBoardReplyDelete(DataMap data) throws Exception;
	
	/**
     * 강사커뮤니티 댓글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<Map<String,Object>> getTutorBoardAjaxList(DataMap data) throws Exception;
	
	/**
     * 강사 커뮤니티 댓글 입력
     *
     * @param data
     * @return
     * @throws Exception
     */
	void tutorBoardReplySubmit(DataMap data) throws Exception;
	
	/**
     * 강사 커뮤니티 답글 입력
     *
     * @param data
     * @return
     * @throws Exception
     */
	void tutorBoardCmtReplySubmit(DataMap data) throws Exception;
	
	void insertCounselUserInfo(HttpServletRequest request,DataMap data) throws Exception;
    
    void updateCounselUserInfo(HttpServletRequest request,DataMap data) throws Exception;
    
    /**
     * 게시판 카테고리 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCounselUserInfo(DataMap data) throws Exception;
}