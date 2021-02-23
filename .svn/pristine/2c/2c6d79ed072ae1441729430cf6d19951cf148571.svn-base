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
import com.sangs.support.EduMap;
import com.sangs.util.DateUtil;
import com.sangs.util.SangsUtil;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminSysLogService;

/**
 * 관리자 접속로그 관련 컨트롤러
 * Description :
 *
 * Modification Information
 * 수정일           수정자  수정내용
 * -----------  ------------  -------
 * 2016. X. XX.  XXX,   최초작성
 *
 */
@Controller
public class AdminSysLogController {

private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminSysLogService")
    private AdminSysLogService    adminSysLogService;

    /**
     * 인증로그 리스트
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
    // TODO: 인증로그 리스트
    @RequestMapping(value = "/admin/sysman/admlogConList.do")
    public String admlogConList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            rMap.add("sdate", SangsUtil.nvl(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-1)));
            rMap.add("edate", SangsUtil.nvl(rMap.getString("edate"), DateUtil.getNowDate()));


            EduMap map = adminSysLogService.getMbrLoginLogList(rMap);

            request.setAttribute("LIST_DATA",map.get("resultList"));
            request.setAttribute("total", map.get("total"));

            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }


        if("EXCEL".equals(rMap.getString("listType"))){
            return "admin/log_mngr/admlog_con_excel";
        } else {
            return "admin/log_mngr/admlog_con_list";
        }
    }

    /**
     * 개인정보 처리 로그 리스트
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
    // TODO: 개인정보 처리 로그 리스트
    @RequestMapping(value = "/admin/sysman/admlogTransList.do")
    public String admlogTransList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            // 기본 데이터 세팅 1개월 전부터 현재일까지
            rMap.add("sdate", SangsUtil.nvl(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-1)));
            rMap.add("edate", SangsUtil.nvl(rMap.getString("edate"), DateUtil.getNowDate()));

            EduMap map = adminSysLogService.getMbrTransLogList(rMap);

            request.setAttribute("LIST_DATA",map.get("resultList"));
            request.setAttribute("total", map.get("total"));



        } catch (Exception e) {
            
            throw new Exception(e);
        }

        if("EXCEL".equals(rMap.getString("listType"))){
            return "admin/log_mngr/admlog_trans_excel";
        } else {
            return "admin/log_mngr/admlog_trans_list";
        }
    }

    /**
     * 권한변경로그 리스트
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
    // TODO: 인증로그 리스트
    @RequestMapping(value = "/admin/sysman/admlogGradeList.do")
    public String admlogGradeList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            // 기본 데이터 세팅 1개월 전부터 현재일까지
            rMap.add("sdate", SangsUtil.nvl(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-1)));
            rMap.add("edate", SangsUtil.nvl(rMap.getString("edate"), DateUtil.getNowDate()));

            EduMap map = adminSysLogService.getMbrGradeLogList(rMap);

            request.setAttribute("LIST_DATA",map.get("resultList"));
            request.setAttribute("total", map.get("total"));


        } catch (Exception e) {
            
            throw new Exception(e);
        }

        if("EXCEL".equals(rMap.getString("listType"))){
            return "admin/log_mngr/admlog_grade_excel";
        } else {
            return "admin/log_mngr/admlog_grade_list";
        }

    }

    /**
     * 접속로그 리스트
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
    // TODO: 접속로그 리스트
    @RequestMapping(value = "/admin/sysman/accesslog.do")
    public String accesslog(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            // 기본 데이터 세팅 6개월 전부터 현재일까지
            rMap.add("sdate", SangsUtil.nvl(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-1)));
            rMap.add("edate", SangsUtil.nvl(rMap.getString("edate"), DateUtil.getNowDate()));

            // 사용자별 그룹화하여 조회 여부
            EduMap map = new EduMap();
            if (rMap.getString("isGroupList").equals("Y")) {
                map = (EduMap) adminSysLogService.getAccessLogGroupList(rMap);
            } else {
                map = (EduMap) adminSysLogService.getAccessLogList(rMap);
            }

            request.setAttribute("LIST_DATA",map.get("resultList"));
            request.setAttribute("total", map.get("total"));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/log_mngr/accesslog_list";
    }
    
    /**
     * 접속로그 삭제 팝업
     *
     * @date    : 2016. 6. 13.
     * @author  : 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 접속로그 삭제 팝업
    @RequestMapping(value = "/admin/sysman/accesslogDelForm.do")
    public String accesslogDelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

          //저장된 년도별 접속 로그 조회(카운트)
            request.setAttribute("LIST_DATA", adminSysLogService.getAccessLogYearList(rMap));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/log_mngr/accesslog_del_form";
    }
    
    
    /**
     * 접속로그 삭제 실행
     *
     * @date    : 2016. 6. 13.
     * @author  : 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 접속로그 삭제 실행
    @RequestMapping(value = "/admin/sysman/accesslogDelExec.do")
    public String accesslogDelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            int cnt = request.getParameterValues("accesYear").length;
        	
        	DataMap map = new DataMap();
        	map.add("accesYear", 0);
        	for(int i=0; i<cnt; i++){
        		if(!request.getParameterValues("accesYear")[i].equals("")) {
	        		map.set("accesYear", request.getParameterValues("accesYear")[i]);
	        		adminSysLogService.deleteAccessLogYear(map);
        		}
        	}
            

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/log_mngr/accesslog_del_exec";
    }

}