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
 * 관리자 XXX 관련 컨트롤러
 * Description :
 *
 * Modification Information
 * 수정일           수정자  수정내용
 * -----------  ------------  -------
 * 2016. X. XX.  XXX,   최초작성
 *
 */
@Controller
public class AdminTempController {

private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    //@Resource(name = "adminBoardService")
    //private AdminBoardService    adminBoardService;

    /**
     * XXX XXX
     *
     * @date    : 2016. XX. XX.
     * @author  : WRITER NAME,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/temp/tempList.do")
    public String tempList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            /*
            List typeList = adminBoardService.getBoardCategoryList(rMap);
            request.setAttribute("typeList", typeList);
            request.setAttribute("resultList", adminBoardService.getBoardList(rMap));
            request.setAttribute("topBoardList", adminBoardService.getTopBoardList(rMap));

            EduMap titleMap = new EduMap();
            if(typeList.size() > 0){
                titleMap = (EduMap)typeList.get(0);
            }
            request.setAttribute("titleMap", titleMap);
            request.setAttribute("REQUEST_DATA", rMap);
            */
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_list";
    }

    /**
     * XXXXX 등록폼
     *
     * @date    : 2016. XX. XX.
     * @author  : 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: XXXXX
    @RequestMapping(value = "/admin/temp/tempForm.do")
    public String tempForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            /*
            request.setAttribute("VIEW_DATA",adminBoardService.getYearScheduleView(rMap));
            request.setAttribute("REQUEST_DATA", rMap);
            */
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_year_schedule_form";
    }

    /**
     * XXXXX 등록 실행
     *
     * @date    : 2016. XX. XX.
     * @author  : XXX
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: XXXXX
    @RequestMapping(value = "/admin/site/tempExec.do")
    public String tempExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            /*
            String qu = rMap.getString("qu");

            if(qu.equals("insert")){
                int bbsNo = adminBoardService.selectYearScheduleMaxBbsNo(rMap);

                rMap.putInt("bbsNo" , bbsNo);
                adminBoardService.insertYearSchedule(rMap);

            } else if(qu.equals("update")) {
                //수정부분
                adminBoardService.updateYearSchedule(rMap);
            }
            request.setAttribute("REQUEST_DATA", rMap);
            */
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_year_schedule_exec";
    }
}