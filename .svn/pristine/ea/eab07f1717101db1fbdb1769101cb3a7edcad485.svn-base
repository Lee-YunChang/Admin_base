package com.webapp.admin.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsMap;

/**
 *
 * Description : User Service
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
public interface AdminUserService {

    /**
     * 회원가입 연도 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserRgsdeYear(DataMap data) throws Exception;

    /**
     * 회원정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserList(DataMap data) throws Exception;

    /**
     * 회원정보 카운트
     *
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getUserListCount(DataMap data) throws Exception;
    
    /**
     * 총 회원 카운트
     *
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getTotalUserCount(DataMap data) throws Exception;
    
    /**
     * 회원 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserInfo(DataMap data) throws Exception;

    /**
     * 회원정보 수정
     *
     * @param data
     * @throws Exception
     */
    void updateUserInfo(DataMap data) throws Exception;

    /**
     * 비밀번호 초기화
     *
     * @param data
     * @throws Exception
     */
    void updatePwdClearInfo(DataMap data) throws Exception;

    /**
     * 탈퇴회원정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserCancelList(DataMap data) throws Exception;

    /**
     * 탈퇴회원정보 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getUserCancelListCount(DataMap data) throws Exception;

    /**
     * 기업정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCompanyList(DataMap data) throws Exception;

    /**
     * 기업정보 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCompanyInfo(DataMap data) throws Exception;


    /**
     * 기업정보 등록
     *
     * @param data
     * @throws Exception
     */
    void insertCompanyExcel(SangsMap data) throws Exception;

    /**
     * 기업정보 등록
     *
     * @param data
     * @throws Exception
     */
    void insertCompanyInfo(DataMap data) throws Exception;

    /**
     * 기업정보 수정
     *
     * @param data
     * @throws Exception
     */
    void updateCompanyInfo(DataMap data) throws Exception;

    /**
     * 기업정보 삭제 - 사용안하는것같음
     *
     * @param data
     * @throws Exception
     */
    void deleteCompanyEmpInfo(DataMap data) throws Exception;
    void deleteCompanyUserInfo(DataMap data) throws Exception;
    void deleteCompanyInfo(DataMap data) throws Exception;

    /**
     * 기업담당자 권한변경 - 사용안하는것같음
     *
     * @param data
     * @throws Exception
     */
    void updateMtGradeCodeInfo(DataMap data) throws Exception;
    void updateMtGradeCodeInfoAfter(DataMap data) throws Exception;

    /**
     * 기업 일괄 승인 - 사용 안하는것 같음
     *
     * @param data
     * @throws Exception
     */
    void updateApprovalInfo(DataMap data) throws Exception;

    /**
     * 관할기관 찾기 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCompanyCodeList(DataMap data) throws Exception;

    /**
     * 관할기관 찾기 리스트 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCompanyCodeCount(DataMap data) throws Exception;
    
    /**
     * 회원탈퇴
     *
     * @param data
     * @throws Exception
     */
    void withdrawUser(DataMap data) throws Exception;
    
    /**
     * 비회원정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getNmberList(DataMap data) throws Exception;
    
    /**
     * 회원 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getNmberInfo(DataMap data) throws Exception;

    /**
     * 비회원정보 수정
     *
     * @param data
     * @throws Exception
     */
    void updateNmberInfo(DataMap data) throws Exception;
    
    /**
     * 비회원정보 등록
     *
     * @param data
     * @throws Exception
     */
    void insertNmberInfo(DataMap data) throws Exception;
    
    
}