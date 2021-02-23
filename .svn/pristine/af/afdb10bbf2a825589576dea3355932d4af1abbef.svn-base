package com.webapp.admin.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 *
 * Description : 접속로그관리 Mapper
 *
 * Modification Information
 * 수정일			 수정자	수정내용
 * -----------	-------------  -------
 * 2016. 6. 13.	 김학규 	최초작성
 *
 */
@Mapper("adminSysLogMapper")
public interface AdminSysLogMapper {

    /**
     * 인증로그 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMbrLoginLogList(DataMap data) throws Exception;

    /**
     * 인증로그 리스트(count)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMbrLoginLogListCount(DataMap data) throws Exception;


    /**
    * 개인정보 처리 로그 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
    public List<EduMap> getMbrTransLogList(DataMap data) throws Exception;

    /**
     * 개인정보 처리 로그 리스트 (count)
     *
     * @param data
     * @return
     * @throws Exception
     */
     public int getMbrTransLogListCount(DataMap data) throws Exception;


    /**
    * 권한변경로그 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
    public List<EduMap> getMbrGradeLogList(DataMap data) throws Exception;

    /**
     * 권한변경로그 리스트 *
     *
     * @param data
     * @return
     * @throws Exception
     */
     public int getMbrGradeLogListCount(DataMap data) throws Exception;


    /**
    * 접속로그 목록 (그룹별)
    *
    * @param data
    * @return
    * @throws Exception
    */
    public List<EduMap> getAccessLogGroupList(DataMap data) throws Exception;
    
    /**
     * 접속로그 목록 (그룹별, Count)  *
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getAccessLogGroupListCount(DataMap data) throws Exception;

     /**
     * 접속로그 목록 *
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessLogList(DataMap data) throws Exception;
    
    /**
     * 접속로그 목록 (Count) *
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getAccessLogListCount(DataMap data) throws Exception;

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
	 * @param data
     * @return
     * @throws Exception
	 */
	public void insertMbrTransLog(DataMap data) throws Exception;
	
	/**
	 * 회원권한변경 로그 등록 
	 * @param data
     * @return
     * @throws Exception
	 */
	public void insertMbrGradeLog(DataMap data) throws Exception;
	
}