package com.webapp.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;

/**
 *
 * Description : 관리자 접속로그 관련 Service
 *
 * Modification Information
 * 수정일           수정자    수정내용
 * -----------  --------------- -------
 * 2016. 6. 13.  김학          최초작성
 *
 */
public interface AdminSysLogService {

    /**
     * 인증로그 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMbrLoginLogList(DataMap data) throws Exception;

    /**
    * 개인정보 처리 로그 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
    public EduMap getMbrTransLogList(DataMap data) throws Exception;


    /**
    * 권한변경로그 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
    public EduMap getMbrGradeLogList(DataMap data) throws Exception;


    /**
    * 접속로그 목록 (그룹별)
    *
    * @param data
    * @return
    * @throws Exception
    */
    public EduMap getAccessLogGroupList(DataMap data) throws Exception;

     /**
     * 접속로그 목록 (그룹별)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getAccessLogList(DataMap data) throws Exception;
    
    /**
     * 접속로그 삭제 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getAccessLogYearList(DataMap data) throws Exception;
	
	/**
     * 접속로그 삭제 (실행)
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteAccessLogYear(DataMap data) throws Exception;

	
	
	/**
	 * 개인정보 처리 로그 
	 * @param req
	 * @param sm
	 * @param sysGb		: 시스템구분 : WWW, ADM
	 * @param transGb	: 처리구분 : C(등록), R(조회), U(수정), D(삭제), P(출력)
	 * @param summary	: 세부처리내용 기술
	 * @param progNm	: 프로그램명 : 회원관리 > 조회
	 * @throws Exception
	 */
	public void insertMbrTransLog (HttpServletRequest req, String sysGb,String transGb,String summary,String progNm) throws Exception;
	
	
	/**
	 * 회원권한변경 로그 등록 
	 * @throws Exception
	 */
	public void insertMbrGradeLog (HttpServletRequest req, String sysGb,int userNo, String userId
			, String userName, String userGradeCode,String summary) throws Exception;
	
}
