package com.webapp.admin.service.impl;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.admin.mapper.AdminSysLogMapper;
import com.webapp.admin.service.AdminSysLogService;

/**
 *
 * Description : 관리자 접속로그 관련  Service Impl
 *
 * Modification Information
 * 수정일			 수정자	수정내용
 * -----------	-------------  -------
 * 2016. 6. 13.	 김학규 	최초작성
 *
 */
@Service("adminSysLogService")
public class AdminSysLogServiceImpl implements AdminSysLogService {

    @Resource(name = "adminSysLogMapper")
    private AdminSysLogMapper adminSysLogMapper;
    
	private Log log = LogFactory.getLog(this.getClass());

    /**
     * 인증로그 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMbrLoginLogList(DataMap data) throws Exception{

        EduMap resultMap = new EduMap();
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        List<EduMap> resultList = adminSysLogMapper.getMbrLoginLogList(data);
        int resultListCount = adminSysLogMapper.getMbrLoginLogListCount(data);


        String ipAddr = "";
        String ipAddr1 = "";
        String ipAddr2 = "";

        for(int i=0;i<resultList.size(); i++){
            EduMap map = resultList.get(i);

            ipAddr = map.getString("TRANS_IP");
            ipAddr1 = ipAddr.substring(0,8);
            ipAddr2 = ipAddr.substring(8,ipAddr.length());

            ipAddr2 = ipAddr2.replaceAll("[\\d]", "*");
            ipAddr = ipAddr1 + ipAddr2;

            map.put("ipAddr", ipAddr);
        }

        resultMap.put("resultList", resultList);
        resultMap.put("total", resultListCount);
        return resultMap;
    }

    /**
    * 개인정보 처리 로그 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
    public EduMap getMbrTransLogList(DataMap data) throws Exception{

        EduMap resultMap = new EduMap();
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        List<EduMap> resultList = adminSysLogMapper.getMbrTransLogList(data);
        int resultListCount = adminSysLogMapper.getMbrTransLogListCount(data);


        String ipAddr = "";
        String ipAddr1 = "";
        String ipAddr2 = "";

        for(int i=0;i<resultList.size(); i++){
            EduMap map = resultList.get(i);

            ipAddr = map.getString("TRANS_IP");
            ipAddr1 = ipAddr.substring(0,8);
            ipAddr2 = ipAddr.substring(8,ipAddr.length());

            ipAddr2 = ipAddr2.replaceAll("[\\d]", "*");
            ipAddr = ipAddr1 + ipAddr2;

            map.put("ipAddr", ipAddr);
        }

        resultMap.put("resultList", resultList);
        resultMap.put("total", resultListCount);

        return resultMap;
    }

    /**
    * 권한변경로그 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
    public EduMap getMbrGradeLogList(DataMap data) throws Exception{

        EduMap resultMap = new EduMap();
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        List<EduMap> resultList = adminSysLogMapper.getMbrGradeLogList(data);
        int resultListCount = adminSysLogMapper.getMbrGradeLogListCount(data);


        String ipAddr = "";
        String ipAddr1 = "";
        String ipAddr2 = "";

        for(int i=0;i<resultList.size(); i++){
            EduMap map = resultList.get(i);

            ipAddr = map.getString("TRANS_IP");
            ipAddr1 = ipAddr.substring(0,8);
            ipAddr2 = ipAddr.substring(8,ipAddr.length());

            ipAddr2 = ipAddr2.replaceAll("[\\d]", "*");
            ipAddr = ipAddr1 + ipAddr2;

            map.put("ipAddr", ipAddr);
        }

        resultMap.put("resultList", resultList);
        resultMap.put("total", resultListCount);


        return resultMap;
    }

    /**
    * 접속로그 목록 (그룹별)
    *
    * @param data
    * @return
    * @throws Exception
    */
    public EduMap getAccessLogGroupList(DataMap data) throws Exception{
    	
    	EduMap resultMap = new EduMap();
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        
        List<EduMap> resultList = adminSysLogMapper.getAccessLogGroupList(data);
        int resultListCount = adminSysLogMapper.getAccessLogGroupListCount(data);
        
        
        
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@"+resultListCount);
        
        
        
        String ipAddr = "";
        String ipAddr1 = "";
        String ipAddr2 = "";

        for(int i=0;i<resultList.size(); i++){
            EduMap map = resultList.get(i);

            ipAddr = map.getString("ACCES_IP");
            ipAddr1 = ipAddr.substring(0,8);
            ipAddr2 = ipAddr.substring(8,ipAddr.length());

            ipAddr2 = ipAddr2.replaceAll("[\\d]", "*");
            ipAddr = ipAddr1 + ipAddr2;

            map.put("ipAddr", ipAddr);


        }

        resultMap.put("resultList", resultList);
        resultMap.put("total", resultListCount);
        return resultMap;
    }
     /**
     * 접속로그 목록 (일반)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getAccessLogList(DataMap data) throws Exception{
    	
    	EduMap resultMap = new EduMap();
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        
        List<EduMap> resultList = adminSysLogMapper.getAccessLogList(data);
        int resultListCount = adminSysLogMapper.getAccessLogListCount(data);

        String ipAddr = "";
        String ipAddr1 = "";
        String ipAddr2 = "";

        for(int i=0;i<resultList.size(); i++){
            EduMap map = resultList.get(i);

            ipAddr = map.getString("ACCES_IP");
            ipAddr1 = ipAddr.substring(0,8);
            ipAddr2 = ipAddr.substring(8,ipAddr.length());

            ipAddr2 = ipAddr2.replaceAll("[\\d]", "*");
            ipAddr = ipAddr1 + ipAddr2;

            map.put("ipAddr", ipAddr);


        }

        resultMap.put("resultList", resultList);
        resultMap.put("total", resultListCount);
        return resultMap;
        
    }
    
    /**
     * 접속로그 삭제 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessLogYearList(DataMap data) throws Exception {
        return adminSysLogMapper.getAccessLogYearList(data);
    }
    
    /**
     * 접속로그 삭제 (실행)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteAccessLogYear(DataMap data) throws Exception {
        adminSysLogMapper.deleteAccessLogYear(data);
    }


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
	public void insertMbrTransLog (
			HttpServletRequest req,
			String sysGb,
			String transGb,
			String summary,
			String progNm
			) throws Exception {
		
		DataMap map = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		map.putString("sysGb", sysGb);
		map.putInt("transUserNo", userVo.getUserNo());
		map.putString("transUserId", userVo.getUserId());
		map.putString("transUserName", userVo.getUserName());
		map.putString("transIp", req.getRemoteAddr());
		map.putString("transGb", transGb);
		map.putString("summary", summary + "\n>세부정보 :  " + getRequesParameters(req)); 
		map.putString("progId", req.getRequestURI());
		map.putString("progNm", progNm);
		
		adminSysLogMapper.insertMbrTransLog(map);

	}
	
	/**
	 * 회원권한변경 로그 등록 
	 * @throws Exception
	 */
	public void insertMbrGradeLog (
			HttpServletRequest req,
			String sysGb,
			int userNo, String userId, String userName, String userGradeCode,
			String summary
			) throws Exception {
		
		DataMap map = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);
		
		try {
			
			map.putString("sysGb", sysGb);
			map.putInt("userNo", userNo);
			map.putString("userId", userId);
			map.putString("userName", userName);
			map.putString("userGradeCode", userGradeCode);
			
			map.putInt("transUserNo", userVo.getUserNo());
			map.putString("transUserId", userVo.getUserId());
			map.putString("transUserName", userVo.getUserName());
			map.putString("transIp", req.getRemoteAddr());
			map.putString("summary", summary);

			adminSysLogMapper.insertMbrGradeLog(map);
			
		} catch (Exception ex){
		}
		
	}
	
	/**
	 *  request 파라메터 스트링변환
	 * @param dataMap
	 * @return
	 */
	public String getRequesParameters(HttpServletRequest req) {
		
		String result = "";
		try {
			
			@SuppressWarnings("rawtypes")
			Enumeration enums = req.getParameterNames();
			String key = null;
			String value[] = null;
			
			while (enums.hasMoreElements()){
				key = (String)enums.nextElement();
				value = req.getParameterValues(key);

				for(int i=0; i<value.length; i++){
					
					if (result.getBytes().length < 4000) {
						if (result.getBytes().length > 500) {
							result += key +"=<LONG DATA>&";
						} else {
							result += key +"="+value[i]+"&";
						}
					}
					
				}
			}

		} catch(Exception ex){
		}
		return result;
	}
}