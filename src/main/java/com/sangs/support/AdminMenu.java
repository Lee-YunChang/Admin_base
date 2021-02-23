package com.sangs.support;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.webapp.admin.mapper.AdminMainMapper;
import com.webapp.admin.service.AdminMainService;
import com.webapp.common.service.CommonAccessLogService;
import com.webapp.admin.service.AdminCommonService;
import com.sangs.support.AdminException;

/**
 * Admin Menu 클래스
 * 
 * @author 이진영
 */
public class AdminMenu {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
  
    public UserSessionVO userSessionVO;
    
    public AdminMenu(HttpServletRequest request, HttpServletResponse res, DataMap rMap, AdminCommonService adminCommonService) throws Exception {
    	adminMenuExec(request, res, rMap, adminCommonService);
	}
    
    public void adminMenuExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap, AdminCommonService adminCommonService) throws Exception {

    	/** 포어팅할 객체명 정의 */
	    String requestPath = "";
	    String requestURI = "";
	    
		try {
			
		    String contextPath = request.getContextPath();
		    requestURI = request.getRequestURI();
		
		    /**  requestURI에서 콘텍스트 부분을 제거한다. */
		    String contextURI = null;
		    if (contextPath.compareTo("") != 0) {
		        contextURI = requestURI.substring(contextPath.length());
		    } else {
		        contextURI = requestURI;
		    }
		
		    /** .do 를 제거한 주소 */
		    if(contextURI.length() > 0) {
		        requestPath = contextURI.substring(0, contextURI.indexOf(".do"));
		    }
		
		    String subPath = requestPath.substring(0, requestPath.lastIndexOf("/"));
		    
		    if(subPath != null) {
		        int startNo = subPath.lastIndexOf("/")+1;
		        int endNo = subPath.length();
		        subPath = subPath.substring(startNo, endNo);
		    }
		    rMap.setString("subPath", subPath);
		
		    String sysCode = requestPath.substring(requestPath.lastIndexOf("/")+1, requestPath.length());
		    rMap.setString("sysCode", sysCode);
		
		    /** 세션할당 **/
		    userSessionVO =  UserSessionManager.getUserSessionVO(request);		    
		    UserSessionManager.setUserSessionVO(request, userSessionVO);
		
		    /** 메뉴조회관련 **/
		    rMap.setString("menuGradeCode", userSessionVO.getGradeCode());
		    
		    String cmmnRootMenuCode = rMap.getString("cmmnRootMenuCode");
		    String cmmnSessionRootMenuCode = UserSessionManager.getSessionString(request, "SES_ROOT_MENU_CODE");
		    if (!cmmnRootMenuCode.equals("") &&  !cmmnRootMenuCode.equals(cmmnSessionRootMenuCode))  {
		        UserSessionManager.setSessionString(request, "SES_ROOT_MENU_CODE", cmmnRootMenuCode);
		    } else  {
		        rMap.setString("cmmnRootMenuCode", cmmnSessionRootMenuCode);
		    }
		
		    String cmmnSubMenuCode = rMap.getString("cmmnSubMenuCode");
		    String cmmnSessionsSubMenuCode = UserSessionManager.getSessionString(request, "SES_SUB_MENU_CODE");
		    
		    if ( !cmmnSubMenuCode.equals("") &&  !cmmnSubMenuCode.equals(cmmnSessionsSubMenuCode))  {
		        UserSessionManager.setSessionString(request, "SES_SUB_MENU_CODE", cmmnSubMenuCode);
		    } else  {
		        rMap.setString("cmmnSubMenuCode", cmmnSessionsSubMenuCode);
		    }
		    
		    // 대분류메뉴조회
		    request.setAttribute("cmmnRootMenuList", adminCommonService.getCmmnRootMenuList(rMap));
		
		    // 소분류메뉴조회
		    request.setAttribute("cmmnSubMenuList", adminCommonService.getCmmnSubMenuList(rMap));
		
		    // 선택된 대분류 메뉴정보
		    request.setAttribute("cmmnRootMenuMap", adminCommonService.getCmmnRootMenuInfo(rMap));
		
		    
		    String menuDepth1 = "";
			String menuDepth2 = "";
			String menuDepth3 = "";

			// 선택된 메뉴 정보
			EduMap cmmnCurrentMenuMap = adminCommonService.getCurrentMenuInfo(rMap);
		    request.setAttribute("cmmnCurrentMenuMap", cmmnCurrentMenuMap);
		    
			if(cmmnCurrentMenuMap != null) {
				menuDepth1 = cmmnCurrentMenuMap.getString("P_MENU_CODE");
				menuDepth2 = cmmnCurrentMenuMap.getString("MENU_CODE");
				menuDepth3 = cmmnCurrentMenuMap.getString("SUB_CODE");	
			}
			request.setAttribute("menuDepth1", menuDepth1);
			request.setAttribute("menuDepth2", menuDepth2);
			request.setAttribute("menuDepth3", menuDepth3);
		    
		    UserSessionVO headerUserSessionVo = UserSessionManager.getUserSessionVO(request);
		    request.setAttribute("headerUserSessionVo", headerUserSessionVo);
		    request.setAttribute("REQUEST_DATA", rMap);
		    
    	} catch (Exception e) {
            throw new Exception(e);
    	}
	}
}
