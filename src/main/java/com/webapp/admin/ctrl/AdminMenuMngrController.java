package com.webapp.admin.ctrl;

import java.util.ArrayList;
import java.util.List;

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
import com.sangs.support.SangsProperties;
import com.sangs.util.SangsUtil;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminMenuMngrService;

/**
 * 관리자 메뉴관리 관련 컨트롤러
 * Description :
 *
 * Modification Information
 * 수정일           수정자  수정내용
 * -----------  ------------  -------
 * 2016. 6. 10.  김학규,   최초작성
 *
 */
@Controller
public class AdminMenuMngrController {

private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminMenuMngrService")
    private AdminMenuMngrService    adminMenuMngrService;

    /**
     * 메뉴관리 목록 조회
     *
     * @date    : 2016. 06. 10.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/sysman/menumngList.do")
    public String menumngList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            rMap.setString("sysGb", SangsUtil.nvl(rMap.getString("sysGb"), SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN")));
            rMap.setString("useState", SangsUtil.nvl(rMap.getString("useState"), "Y"));

            List menuList = new ArrayList();

            List rootMenuList = adminMenuMngrService.getRootMenuList(rMap);
            for (int i=0; i<rootMenuList.size(); i++) {
                EduMap rootMenuMap = (EduMap)rootMenuList.get(i);

                rMap.setString("rootMenuCode", rootMenuMap.getString("MENU_CODE"));
              
                List subMenuList = adminMenuMngrService.getSubMenuList(rMap);
                menuList.add(rootMenuMap);
                for (int k=0; k<subMenuList.size(); k++){
                    menuList.add(subMenuList.get(k));
                }
            }


            request.setAttribute("REQUEST_DATA", rMap);
            request.setAttribute("LIST_DATA", menuList);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/menu_mngr/menu_mngr_list";
    }

    /**
     * 메뉴관리 등록/수정 팝업
     *
     * @date    : 2016. 06. 10.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/sysman/menumngFormPop.do")
    public String menumngFormPop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            if (rMap.getString("mode").equals("insert")) {
                EduMap map = new EduMap();

                //메뉴정보 조회
                EduMap pMap = adminMenuMngrService.getPMenuInfo(rMap);

                if(pMap !=null){
                    map.put("MENU_DIV", SangsUtil.getNumbering2(pMap.getInt("MENU_DIV"))+1);
                    map.put("ORDR", SangsUtil.getNumbering2(pMap.getInt("MAX_ORDR"))+1);
                }

                request.setAttribute("REQUEST_DATA", rMap);
                request.setAttribute("VIEW_DATA",map);

            } else {
                //상위 메뉴정보 조회
                request.setAttribute("VIEW_DATA",adminMenuMngrService.getMenuInfo(rMap));
                request.setAttribute("REQUEST_DATA", rMap);
            }


        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/menu_mngr/menu_mngr_info_pop";
    }

    /**
     * 메뉴관리 등록/수정 실행
     *
     * @date    : 2016. 06. 10.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/sysman/menumngFormExec.do")
    public String menumngFormExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            if (rMap.getString("mode").equals("insert")){
                adminMenuMngrService.insertMenuInfo(rMap);
            } else {
                adminMenuMngrService.updateMenuInfo(rMap);
            }
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/menu_mngr/menu_mngr_exec";
    }

    /**
     * 메뉴관리 삭제실행
     *
     * @date    : 2016. 06. 13.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/sysman/menumngDelExec.do")
    public String menumngDelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
            adminMenuMngrService.deleteMenuInfo(rMap);
            rMap.setString("returnUrl", "delete");
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/menu_mngr/menu_mngr_exec";
    }


    /**
     * 메뉴권한 관리 등록/수정
     *
     * @date    : 2016. 06. 13.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/sysman/menumngGradeForm.do")
    public String menumngGradeForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            rMap.setString("sysGb", SangsUtil.nvl(rMap.getString("sysGb"), SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN")));

            if (!rMap.getString("gradeCode").equals("")) {

                List menuList = new ArrayList();
                List rootMenuList = adminMenuMngrService.getGradeRootMenuList(rMap);

                for (int i=0; i<rootMenuList.size(); i++) {
                    EduMap rootMenuMap = (EduMap)rootMenuList.get(i);
                    rMap.setString("rootMenuCode", rootMenuMap.getString("MENU_CODE"));
                    List subMenuList = adminMenuMngrService.getGradeSubMenuList(rMap);

                    menuList.add(rootMenuMap);
                    for (int k=0; k<subMenuList.size(); k++){
                        menuList.add(subMenuList.get(k));
                    }
                }


                for(int i=0; i<menuList.size(); i ++){
                    EduMap menuMap = (EduMap)menuList.get(i);


                }


                // 권한부여된 메뉴 목록조회
                request.setAttribute("MENU_LIST_DATA", menuList);

            } else {

                request.setAttribute("MENU_LIST_DATA", new ArrayList());

            }




            // 권한목록 조회
            request.setAttribute("GRADE_LIST_DATA", adminMenuMngrService.getGradeList(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/menu_mngr/menu_grade_form";
    }

    /**
     * 메뉴권한 관리 등록/수정 실행
     *
     * @date    : 2016. 06. 13.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: METHOD KOR NAME
    @RequestMapping(value = "/admin/sysman/menumngGradeExec.do")
    public String menumngGradeExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            // 권한부여 실행
            int cnt = request.getParameterValues("menuCode").length;
            DataMap map = new DataMap();
            map.add("gradeCode", rMap.getString("gradeCode"));
            map.add("sysGb", rMap.getString("sysGb"));
            map.add("menuCode", "");
            map.add("useYn", "");

            for (int i=0; i<cnt; i++) {

                map.set("menuCode", SangsUtil.nvl(request.getParameterValues("menuCode")[i]));
                map.set("useYn", SangsUtil.nvl(request.getParameterValues("useYn")[i],"N"));
                
                int menuCnt = adminMenuMngrService.getGradeMenuCount(map);

                if (menuCnt > 0) {
                    adminMenuMngrService.updateGradeMenuInfo(map);
                } else {
                    adminMenuMngrService.insertGradeMenuInfo(map);
                }

            }

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/menu_mngr/menu_grade_exec";
    }







}