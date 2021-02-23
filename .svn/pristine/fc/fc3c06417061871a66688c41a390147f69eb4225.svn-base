package com.sangs.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sangs.support.SangsProperties;
import com.webapp.common.service.CommonAccessLogService;

/**
 * Description : 관리자> 강의실 접근 인터셉터
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------	-----------------------------------
 * 2016.03.28  이진영		수정
 *
 */
public class InterceptorForAdminClassdesk extends HandlerInterceptorAdapter {

    @Resource(name = "commonAccessLogService")
    private CommonAccessLogService commonAccessLogService;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	/** [공통] 접속로그 등록 **/
    	commonAccessLogService.insertAccessLog(request, SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"));
        
        return true;
    }

    /**
     * view로 포워드되기전 처리 
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

}
