package com.sangs.interceptor;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;

/**
 * Description : 인증확인 인터셉터
 * 
 * 모듈별 인터셉터 수행전 처리됨
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------	-----------------------------------
 * 2016.03.28  이진영		수정
 *
 */
public class InterceptorForAuth extends HandlerInterceptorAdapter {

	private static final Logger log = LogManager.getLogger(InterceptorForAuth.class);
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	
    	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
    	
    	if (!userSessionVO.getIsLogin().equals("Y") || userSessionVO.getUserNo() == 0) {
    		
    		String returnUrl = request.getRequestURI();
           
            if (request.getQueryString() != null || "".equals(request.getQueryString())) {
                returnUrl += "?" + request.getQueryString();
            }
            
    		// 로그인 양식 페이지 설정
            String loginPath = "/admin/";
            if (returnUrl.indexOf("/academy/") > 0) loginPath = "/academy/";
            else if (returnUrl.indexOf("/cyber/") > 0) loginPath = "/cyber/";
            else if (returnUrl.indexOf("/classdesk/") > 0) loginPath = "/classdesk/";
            else if (returnUrl.indexOf("/admin/") > 0) loginPath = "/admin/";

            // 리턴주소 설정
            //if (request.getRequestURI().equals(loginPath+"common/login.do")) returnUrl = loginPath+"/index.html";
            
            request.setAttribute("url", loginPath+"common/login.do?returnUrl="+URLDecoder.decode(returnUrl, "UTF-8"));
            request.setAttribute("returnUrl", URLDecoder.decode(returnUrl, "UTF-8"));
            request.setAttribute("msg", "로그인후 이용할 수 있습니다.");
            ModelAndView modelAndView = new ModelAndView("forward:/admin/common/login.do");
            throw new ModelAndViewDefiningException(modelAndView); 
        }

        return true;
    }

    /**
     * view로 포워드되기전 처리 
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	
    }
}
