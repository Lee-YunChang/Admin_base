package com.webapp.admin.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.webapp.admin.service.AdminCommonService;

/**
 * 관리자 시스템관리 관련 컨트롤러
 * Description :
 *
 * Modification Information
 * 수정일           수정자  수정내용
 * -----------  ------------  -------
 * 2016. 6. 13.  김학규,   최초작성
 *
 */
@Controller
public class AdminSysInfoController {

private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    /**
     * 실시간 Heap 메모리
     *
     * @date    : 2016. 6. 13.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 실시간 Heap 메모리
    @RequestMapping(value = "/admin/sysman/sysinfo01.do")
    public String sysinfo01(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/sysinfo_01";
    }

    /**
     * 실시간접속세션
     *
     * @date    : 2016. 6. 13.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 실시간접속세션
    @RequestMapping(value = "/admin/sysman/sysinfo02.do")
    public String sysinfo02(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/sysinfo_02";
    }

    /**
     *
     * 시스템정보
     * @date    : 2016. 6. 13.
     * @author  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템정보
    @RequestMapping(value = "/admin/sysman/sysinfo03.do")
    public String sysinfo03(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);


        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/sysinfo_03";
    }
}