package com.webapp.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Common User Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

public interface CommonUserService {

    /**
     * 회원정보(통합회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    EduMap getUserInfo(int userNo) throws Exception;

    /**
     * 회원정보(LMS회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    EduMap getUserLmsInfo(int userNo) throws Exception;

    /**
     * 로그인 사용자 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLoginUserInfo(DataMap data) throws Exception;
    
    /**
     * 공통 > 개인정보조회이력관리  
     * 
     * @param data
     * @throws Exception
     */
    void insertMbrTransLog(HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary,
    		String progNm
    		) throws Exception;
    
    /**
     * 공통 > 로그인이력관리
     * 
     * @param data
     * @throws Exception
     */
    void insertMbrLoginLog(
    		HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary
    		) throws Exception;
    
    /**
     * 공통 > 로그인 실패 카운트
     * 
     * @param data
     * @throws Exception
     */
    EduMap selectLoginFailCntInfo(DataMap data) throws Exception;
    
    
    /**
     * 공통 > 로그인 5회 실패 > 로그인 제한
     * 
     * @param data
     * @throws Exception
     */
    void updateLoginFailCntInfo(DataMap data) throws Exception;
    /**
     * 공통 > 로그인 성공 (실패횟수 0으로 초기화)
     * 
     * @param data
     * @throws Exception
     */
    void updateLoginSuccessInfo(DataMap data) throws Exception;
    /**
     * 공통 > 회원 승인 변경
     * 
     * @param data
     * @throws Exception
     */
    void updateRegAtYesInfo(DataMap data) throws Exception;
    
    /**
     * 로그인 세션아이디 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLoginSessionInfo(DataMap data) throws Exception;
    
    /**
     * 접근 ip 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getAccessIpList(DataMap data) throws Exception;
    

}
