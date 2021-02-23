package com.sangs.session;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DateUtil;
import com.webapp.common.service.CommonUserService;

/*
Description :회원세션관련  메니져
Modification Information
수정일         	수정자                   수정내용
-------    	--------    ---------------------------
2013.03.15   송호현		최초생성  
2013.09.12	 송호현 	통합시스템 공통세션영역적용

*/

public class UserSessionManager {
	
	
	private static final String SESSION_KEY = SangsProperties.getProperty("Globals.loginSessionNm");
    private static Logger      log         = LogManager.getLogger(UserSessionManager.class);
	
	/**
	 * SESSION적용 : 관리자, 사이트에서만 사용함
	 * @param req
	 * @param requestMap
	 * @param sm
	 * @return
	 */
	public static UserSessionVO getUserSessionInsert(HttpServletRequest req, CommonUserService commonUserService, int userNo) {
		
		UserSessionVO userSessionVO =  UserSessionManager.getUserSessionVO(req);
		try {

			EduMap eMap = commonUserService.getUserLmsInfo(userNo);
			if (eMap != null) {
				userSessionVO.setIsLogin("Y");
				userSessionVO.setUserNo(eMap.getInt("USERNO"));
				userSessionVO.setUserId(eMap.getString("USERID"));
				userSessionVO.setUserName(eMap.getString("USERNAME"));
				userSessionVO.setEmail(eMap.getString("EMAIL"));
				userSessionVO.setMobile(eMap.getString("MOBILE"));
				userSessionVO.setGradeCode(eMap.getString("MT_GRADE_CODE"));
				userSessionVO.setGradeNum(eMap.getInt("MT_GRADE_NUM"));
				userSessionVO.setGradeName(eMap.getString("MT_GRADE_NAME"));
				userSessionVO.setMberRegGb(eMap.getString("MBER_REG_GB"));
				userSessionVO.setStatusGb(eMap.getString("STATUS_GB"));
				userSessionVO.setLoginResult(UserSessionVO.LOGIN_SUCCESS);

				//세션등록
				UserSessionManager.setUserSessionVO(req, userSessionVO);
				
			}
			
			return userSessionVO;
			
		} catch (Exception ex) {
			
			return userSessionVO;
		}
	}
	
	/**
	 * 개별 SESSION 적용
	 * @param req
	 * @param requestMap
	 * @param sm
	 * @return
	 */
	public static UserSessionVO getUserSessionVO(HttpServletRequest req){
		
		UserSessionVO userSessionVO = null;
		try {
			
			Gson gson = new Gson();
			userSessionVO = gson.fromJson((String) req.getSession().getAttribute(SESSION_KEY), UserSessionVO.class);
			if(userSessionVO == null){
				userSessionVO = new UserSessionVO();
			}
			return userSessionVO;
		
		}catch(Exception ex){
			
			return new UserSessionVO();
		}
	}
	
	
	/**
	 * session VO 등록
	 * @param req
	 * @param userSessionVO
	 */
	public static void setUserSessionVO(HttpServletRequest req, UserSessionVO userSessionVO){
		try {
			userSessionVO.setIpAddr(req.getRemoteAddr());
			userSessionVO.setLastAccDate(DateUtil.getNowDate(DateUtil.DATE_FORMAT_DEFAULT));
			userSessionVO.setLastAccUrl(req.getServerName()+req.getRequestURI());
			Gson gson = new Gson();
			String input = gson.toJson(userSessionVO, UserSessionVO.class);
			req.getSession().setAttribute(SESSION_KEY, input);
		}catch(Exception ex){
			
		}
	}
	
	/**
     * session 삭제
     * @param req
     */
    public static void deleteUserSessionVO(HttpServletRequest req) {
        try {
            //세션초기화
            //req.getSession().setAttribute(SESSION_KEY, null);
            req.getSession().removeAttribute(SESSION_KEY);
            //req.getSession().invalidate();
            

        } catch (Exception ex) {
        	
        }
    }
	
	//별도 세션저장
	public static void setSessionString(HttpServletRequest req, String key, String value) {
		req.getSession().setAttribute(key, value);
	}
	
	//별도 세션조회
	public static String getSessionString(HttpServletRequest req, String key) {
		try {
			return req.getSession().getAttribute(key).toString();
		} catch (Exception ex) {
			return "-";
		}
	}
	
	
}
