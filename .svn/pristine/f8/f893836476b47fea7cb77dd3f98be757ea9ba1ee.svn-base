package com.webapp.admin.ctrl;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.sangs.util.ParamUtil;
import com.webapp.admin.service.AdminBbsCateMngrService;
import com.webapp.admin.service.AdminCommonService;

/**
 * 관리자 게시판 코드 관리 컨트롤러
 * Description :
 *
 * Modification Information
 * 수정일			 수정자  수정내용
 * -----------	------------  -------
 * 2016. 5. 31.	 김학규,  	최초작성
 *
 */
@Controller
public class AdminBbsCateMngrController {

private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminBbsCateMngrService")
    private AdminBbsCateMngrService    adminBbsCateMngrService;

    /**
     * 게시판 카테고리 관리 목록 조회
     *
     * @date	: 2016. 05. 31.
     * @author	: 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 목록 조회
    @RequestMapping(value = "/admin/sysman/bbscateList.do")
    public String bbsCateList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            
            request.setAttribute("isUse", ParamUtil.getStrParam(rMap.getString("ISUSE"), ""));
            
            request.setAttribute("LIST_DATA", adminBbsCateMngrService.getBoardCategoryList(rMap));

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_list";
    }

    /**
     * 게시판 카테고리 관리 등록
     *
     * @date    : 2016. 05. 31.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 등록
    @RequestMapping(value = "/admin/sysman/bbscateForm.do")
    public String bbsCateForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            // 대분류 데이터
            if(rMap.getString("bCateNo") != null && rMap.getString("qu") != null ){
                request.setAttribute("VIEW_DATA", adminBbsCateMngrService.getBoardCategoryInfo(rMap));
            }
            
            // 등록구분이 없다면 대분류로 default 설정
            rMap.setString("mode", ParamUtil.getStrParam(rMap.getString("mode"), "bbs"));

            // 등록유형이 없다면 insert default 설정
            rMap.setString("qu", ParamUtil.getStrParam(rMap.getString("qu"), "insert"));

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_form";
    }

    /**
     * 게시판 카테고리 관리 등록 실행
     *
     * @date    : 2016. 05. 31.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 등록 실행
    @RequestMapping(value = "/admin/sysman/bbscateFormExec.do")
    public String bbsCateFormExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            String qu = rMap.getString("qu");

            // 모드명 대분류 : mt
            String mode = rMap.getString("mode");

            //리턴 페이지 설정을 위한 세팅

            // alert 메세지
            String msg="";
            String nextSubcmd="list"; // 실행후 이동 화면 정의

            rMap.setString("bbsType", ParamUtil.getStrParam(rMap.getString("bbsType"), ""));
            rMap.setString("isPop", ParamUtil.getStrParam(rMap.getString("isPop"), ""));
            
            // 대분류 등록/수정
            if(mode.equals("bbs")){
                //등록
                if(qu.equals("insert")){
                    try{
                        adminBbsCateMngrService.insertBoardCategory(rMap);
                        qu="";
                        msg="등록하였습니다.";

                    }catch (Exception e) {
                        qu="";
                        msg="등록에 실패하였습니다. 게시판명이 중복되는지 확인해주세요.";
                        nextSubcmd="list";
                    }
                }
                // 수정
                else if(qu.equals("update")){
                    try{
                        adminBbsCateMngrService.updateBoardCategory(rMap);
                        qu="update";
                        msg="수정하였습니다.";


                    }catch(Exception e){
                        msg="수정에 실패하였습니다. 다시 시도해주세요.";
                        nextSubcmd="list";
                    }
                }
            }

            request.setAttribute("returnUrl", "/admin/sysman/bbscateList.do");
            request.setAttribute("msg", msg);
            request.setAttribute("qu", qu);
            request.setAttribute("mode", mode);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_exec";
    }

    /**
     * 게시판 카테고리 관리 상세 목록 조회
     *
     * @date    : 2016. 06. 01.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 목록 조회
    @RequestMapping(value = "/admin/sysman/bbscateSubList.do")
    public String bbscateSubList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            if(!("").equals(rMap.getString("pbCateNo"))){
                rMap.setString("bCateNo", rMap.getString("pbCateNo"));
            }

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            request.setAttribute("isUse", ParamUtil.getStrParam(rMap.getString("ISUSE"), ""));
            request.setAttribute("LIST_DATA", adminBbsCateMngrService.getBoardSubCategoryList(rMap));
            request.setAttribute("VIEW_DATA", adminBbsCateMngrService.getBoardCategoryInfo(rMap));
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_sub_list";
    }

    /**
     * 게시판 카테고리 관리 상세 정보 조회
     *
     * @date    : 2016. 06. 01.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 목록 조회
    @RequestMapping(value = "/admin/sysman/bbscateSubFormPop.do")
    public String bbscateSubFormPop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            
            request.setAttribute("VIEW_DATA", adminBbsCateMngrService.getBoardSubCategoryInfo(rMap));
            request.setAttribute("REQUEST_DATA", rMap);
            
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_sub_form";
    }

    /**
     * 게시판 카테고리 관리 상세 정보 등록/수정
     *
     * @date    : 2016. 06. 01.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 목록 조회
    @RequestMapping(value = "/admin/sysman/bbscateSubFormPopExec.do")
    public String bbscateSubFormPopExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            String qu = rMap.getString("qu");

            // 모드명 대분류 : bbs
            String mode = rMap.getString("mode");
            
            
            //리턴 페이지 설정을 위한 세팅
            // alert 메세지
            String msg="";
            if(mode.equals("bbs")){
                //등록
                if(qu.equals("insert")){
                    try{
                    	int maxBcateno = adminBbsCateMngrService.getMaxBcateno(rMap);
                    	rMap.add("maxBcateno", maxBcateno);
                        adminBbsCateMngrService.insertBoardSubCategory(rMap);
                        qu="";
                        msg="등록하였습니다.";
                    }catch (Exception e) {
                        qu="";
                        msg="등록에 실패하였습니다. 게시판명이 중복되는지 확인해주세요.";
                    }
                }
                // 수정
                
                else if(qu.equals("update")){
                    try{
                        adminBbsCateMngrService.updateBoardCategory(rMap);
                        qu="update";
                        msg="수정하였습니다.";



                    }catch(Exception e){
                        msg="수정에 실패하였습니다. 다시 시도해주세요.";
                    }
                }
            }
            request.setAttribute("returnUrl", "/admin/sysman/bbscateSubList.do");
            request.setAttribute("pbCateNo", "");
            request.setAttribute("bCateNo", rMap.getString("rootCateNo"));
            request.setAttribute("js", "opener.parent.windowClose()");
            request.setAttribute("msg", msg);
            request.setAttribute("qu", qu);
            request.setAttribute("mode", mode);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_exec";
    }




    /**
     * 게시판 카테고리 관리 상세 삭제
     *
     * @date    : 2016. 06. 01.
     * @author  : 김학규,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 카테고리 관리 목록 조회
    @RequestMapping(value = "/admin/sysman/bbscateSubDelete.do")
    public String bbscateSubDelete(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            String mode = rMap.getString("mode");
            String msg="";
            if(mode.equals("bbs")){
                try{
                    adminBbsCateMngrService.deleteBoardSubCategory(rMap);
                    msg="삭제되었습니다.";
                }catch(Exception e){
                    msg="삭제중 에러가 발생하였습니다. 다시 시도해주세요.";
                }
            }
            request.setAttribute("returnUrl", "/admin/sysman/bbscateSubList.do");

            request.setAttribute("bCateNo", rMap.getString("pbCateNo"));
            request.setAttribute("msg", msg);
            request.setAttribute("mode", mode);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/bbs_category_exec";
    }


    /**
     * 게시판 카테고리 삭제 (ajax)
     * @param req
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/admin/sysman/bbscateDelete.do")
    public void bbscateDelete(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {

            int checkStat = 0;

            checkStat = adminBbsCateMngrService.deleteBoardCategory(rMap);

            json = gson.toJson(String.valueOf(checkStat));
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }




}