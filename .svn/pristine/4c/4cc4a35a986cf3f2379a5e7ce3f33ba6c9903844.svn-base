package com.webapp.classdesk.ctrl;

import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsCryptUtil;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 클래스데스트 > 로그인
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskLoginController {

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;

    private Logger                   log = LogManager.getLogger(this.getClass());
    
    /**
     * 로그인 폼
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/cmmn/login.do")
    public String login(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/login_form";
    }

   /**
     * 로그인 실행
     * 
     * @param req
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/cmmn/loginExec.do")
    public String loginExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	
    	
        try {
        	//UserSessionVO userSessionVO = null;
            String returnURL = ParamUtil.getStrParam(rMap.getString("returnUrl"), "/classdesk/main/main.do");
            EduMap map = commonUserService.getLoginUserInfo(rMap);
            String infoPass = rMap.getString("pwd");

            if (map != null && SangsCryptUtil.isMatch(infoPass, map.getString("PWD"))) {

            	//세션에 저장. 
            	//userSessionVO = UserSessionManager.getUserSessionInsert(req, commonUserService, map.getInt("USERNO"));
            	UserSessionManager.getUserSessionInsert(req, commonUserService, map.getInt("USERNO"));

                if (returnURL.length() == 0 || returnURL == null) {
                    returnURL = "/classdesk/main/main.do";
                }

                String decodeUrl = URLDecoder.decode(returnURL, "UTF-8");

                rMap.setString("returnURL", decodeUrl);


            } else {

                rMap.setString("msg", "아이디 또는 비밀번호를 다시 확인하세요.");
                rMap.setString("returnURL", "/classdesk/cmmn/login.do");
            }
        } catch (Exception e) {
            throw new FrontException(e);
        }

        req.setAttribute("REQUEST_DATA", rMap);

        return "forward:/classdesk/cmmn/loginResult.do";
    }

    /**
     * 로그인 결과
     * 
     * @param req
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/cmmn/loginResult.do")
    public String loginResult(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

         //인터셉터를 실행하기 위해서 

        return "classdesk/cmmn/login_exec";
    }
}
