package com.sangs.interceptor;

import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sangs.session.SessionManager;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.SangsProperties;
import com.webapp.common.service.CommonAccessLogService;

/**
 * Description : 아카데미 인터셉터
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------	-----------------------------------
 * 2016.03.29 	이진영	최초작성
 *
 */
public class InterceptorForAdmin extends HandlerInterceptorAdapter {

	private static Logger log = LogManager.getLogger(UserSessionManager.class);

    @Resource(name = "commonAccessLogService")
    private CommonAccessLogService commonAccessLogService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	/** [공통] 접속로그 등록 **/
    	commonAccessLogService.insertAccessLog(request, SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"));
        
    	// 중복로그인체크
		SessionManager sessionManager = SessionManager.getInstance();
		if(sessionManager != null ) {
			int sessionResult = sessionManager.executeFrontSessionCheck(request);
			if (sessionResult == SessionManager.SESS_RCODE_DOUBLE) {
				ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");	
				modelAndView.addObject("msg", "중복로그인으로 자동 로그아웃되었습니다");
				modelAndView.addObject("url", "/admin/common/login.do");	
				throw new ModelAndViewDefiningException(modelAndView); 
	
			}
		}		
		
        return true;
    }

    
    /**
     * view로 포워드되기전 처리 
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

}
