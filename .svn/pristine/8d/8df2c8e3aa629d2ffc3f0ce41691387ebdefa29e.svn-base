package com.webapp.admin.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 
 * Description : 관리자  Common Mapper
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Mapper("adminCommonMapper")
public interface AdminCommonMapper {
	
	/**
     * 대분류 메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCmmnRootMenuList(DataMap data) throws Exception;
    
    /**
     * 소분류 메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCmmnSubMenuList(DataMap data) throws Exception;
    
    
	/**
     * 선택된 대분류 메뉴 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCmmnRootMenuInfo(DataMap data) throws Exception;
    

	/**
     * 선택된 메뉴 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCurrentMenuInfo(DataMap data) throws Exception;
    
    /**
     * 권한코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtSubCodeList(DataMap data) throws Exception;
    
    /**
     * 과정구분
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtScCodeList(DataMap data) throws Exception;
    
    /**
     * 강의형태 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtNormalCtypeList(DataMap data) throws Exception;
    
    /**
     * 메일 템플릿 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEmEmailTplInfo(DataMap data) throws Exception;
    
    /**
     * 발송자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSyEmailSenderInfo(DataMap data) throws Exception;

    /**
     * 발송자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSyEmailSenderInfo2(DataMap data) throws Exception;
    
    /**
     * sms 기본문구조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    String getEmSmsTplInfo(DataMap data) throws Exception;
    
    
    /**
     * CALLBACK번호 조회 및 설정
     *
     * @param data
     * @return
     * @throws Exception
     */
    String getSySmsCallbackInfo(DataMap data) throws Exception;
    
    /**
     * 목록 호출
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLeCourseUserList(DataMap data) throws Exception;

    /**
     * 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCheckedReceiverList(DataMap data) throws Exception;
    /**
     * 우편번호 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPostcodeList(DataMap data) throws Exception;
    
    /**
     * 설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSurveyList(DataMap data) throws Exception; 
    
    
    /**
     * 과정명, 발송인원
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCourseInfo(DataMap data) throws Exception;
    
    /**
     * sms seq(log)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxSmsSeq(DataMap data) throws Exception;
    
    /**
     * mms seq
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxMmsSeq(DataMap data) throws Exception;
    
    /**
     * sms log
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertSmsLog(DataMap data) throws Exception;
 
    /**
     * sms data 
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertSmsData(DataMap data) throws Exception;
    
    /**
     * mms data 
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMmsData(DataMap data) throws Exception;
    
    
    /**
     * sms수신자 정보조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getRecList(DataMap data) throws Exception;
    
    /**
     * 위원회관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureFile(DataMap data) throws Exception;
    
    /**
     * sms템플릿 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSMSTamplate(DataMap data) throws Exception;
    
    /**
     * 유저 리스트 엑셀 등록
     *
     * @param data
     * @throws Exception
     */
    void insertuserListExcel(SangsMap data) throws Exception;
    
    /**
     * 지점 코드 
     *
     * @param data
     * @throws Exception
     */
    String selectmtOfficeCode(String data) throws Exception;
    
    /**
     * 회원 번호 최대값 
     *
     * @param data
     * @throws Exception
     */
    int getMaxMberNo(SangsMap data) throws Exception;
    
    /**
     * 비회원 리스트 엑셀 등록
     *
     * @param data
     * @throws Exception
     */
    void insertnmberListExcel(SangsMap data) throws Exception;
    
    /**
     * 특강 파일 리스트 출력
     * 
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorFile(DataMap data) throws Exception;
}