package com.webapp.admin.ctrl;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.misc.BASE64Decoder;

import com.google.gson.Gson;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
//import com.sangs.support.UserTransLogManager;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.AES256Util;
import com.sangs.util.DateUtil;
import com.sangs.util.EgovFileUploadUtil;
import com.sangs.util.EgovFormBasedFileVo;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminMtCodeMngrService;
import com.webapp.admin.service.AdminSysLogService;
import com.webapp.admin.service.AdminUserService;

/**
 *
 * Description : 관리시스템 사용자 관련 컨트롤러
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Controller
public class AdminUserController {

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminUserService")
    private AdminUserService    adminUserService;

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminSysLogService")
    private AdminSysLogService    adminSysLogService;

    @Resource(name = "adminMtCodeMngrService")
    private AdminMtCodeMngrService    adminMtCodeMngrService;

    /**
     * 회원관리 리스트
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 회원관리 리스트
    @RequestMapping(value = "/admin/user/userList.do")
    public String userList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            String sdate = rMap.getString("sdate");
            String edate = rMap.getString("edate");
            if(("").equals(sdate)){
            	sdate = "2017-06-01";
            	// sdate = DateUtil.getMonthAgoDate(0);
            }
            if(("").equals(edate)){
                //edate = DateUtil.getMonthAgoDate(3);
            	edate = DateUtil.getMonthAgoDate(0);
            }
            rMap.setString("sdate", sdate);
            rMap.setString("edate", edate);

            String mtCode = "";
            //회원권한 코드
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("userGradeList", adminCommonService.getMtSubCodeList(rMap));
            
            //정상회원만 조회
            rMap.set("cancelYn", "N");

            request.setAttribute("selectYYYY", adminUserService.getUserRgsdeYear(rMap));
            String month = rMap.getString("month");
            //if(month.equals("")) month = String.valueOf(DateUtil.getMonth());
            if(!month.equals("") && month.length() == 1) {
                month = "0" + month;
            }
            rMap.set("month", month);

            //회원정보리스트
            if(rMap.get("mtGradeCode").equals(SangsProperties.getProperty("Globals.mtGradeTutorCode"))){
        		rMap.set("tutorYn", "Y");
        	}
            request.setAttribute("resultList",  adminUserService.getUserList(rMap));
            request.setAttribute("totalUserCount", adminUserService.getTotalUserCount(rMap));
            request.setAttribute("totalCount", adminUserService.getUserListCount(rMap));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }
        if("EXCEL".equals(rMap.getString("listType"))){
        	//조회,처리내역 등록
        	String transSummary = "> 업무내용 : 회원정보다운";
        	String transProgNm = "회원관리 > 회원정보다운";

        	adminSysLogService.insertMbrTransLog(
        	request,
        	SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"), 	// 시스템 구분
        	SangsProperties.getProperty("Globals.MBR_TRANS_GB_PRINT"), 	// 업무처리 구분
        	transSummary, 	// 처리업무 상세내용
        	transProgNm	// 프로그램명
        	);
        	
        	return "admin/user/user_list_excel";
            
        }else
            return "admin/user/user_list";
    }
    
    /**
     * 회원 상세
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 회원 상세
    @RequestMapping(value = "/admin/user/userForm.do")
    public String userForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	
        	//조회 내역 등록

        	String transSummary = "> 업무내용 : 회원정보조회";
        	String transProgNm = "회원관리 > 회원정보조회";

        	adminSysLogService.insertMbrTransLog(
        	request,
        	SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"), 	// 시스템 구분
        	SangsProperties.getProperty("Globals.MBR_TRANS_GB_SELECT"), 	// 업무처리 구분
        	transSummary, 	// 처리업무 상세내용
        	transProgNm	// 프로그램명
        	);
        	
            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            String mtCode = "";

            // 회원분류
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("userGradeList", adminCommonService.getMtSubCodeList(rMap)); // 회원분류
            request.setAttribute("userInfo",  adminUserService.getUserInfo(rMap));

            // 비밀번호 초기화
            mtCode= SangsProperties.getProperty("Globals.mtCode_MT_PWD_CLEAR_CODE");
            rMap.setString("mtCode", mtCode);

            List list = adminCommonService.getMtSubCodeList(rMap);
            String newPwd =  "";
            for(int i=0; i<list.size(); i++){
                EduMap mtInfo = (EduMap)list.get(i);
                if (mtInfo.getString("USEYN").equals("Y")) {
                    newPwd = mtInfo.getString("MT_SUB_NAME");
                }
            }
            rMap.setString("newPwd", newPwd);

            mtCode= SangsProperties.getProperty("Globals.mtCode_MT_TUTOR_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("mtTutorCode", adminCommonService.getMtSubCodeList(rMap)); // 회원분류
            
            
            // 강사 위촉이력
            rMap.setString("userno", rMap.getString("userNo"));
            //request.setAttribute("entList", adminTutorService.getTutorEntRstList(rMap));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_form";
    }

    /**
     * 기관/단체 검색 팝업
     *
     * @date	: 2016. 11. 01.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 기관/단체 검색 팝업
    @RequestMapping(value = "/admin/user/companySearchList.do")
    public String companySearchList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	
            rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_OFFICE_CODE"));
            rMap.setInt("rowCount", 20);
        
            request.setAttribute("resultList",  adminUserService.getCompanyCodeList(rMap));
            request.setAttribute("resultCount", adminUserService.getCompanyCodeCount(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            throw new Exception(e);
        }
        return "admin/user/company_search_pop";
    }

    /**
     * 회원 정보 수정
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 회원 정보 수정
    @RequestMapping(value = "/admin/user/userExec.do")
    public String userExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try { 
        	/*if(rMap.getString("tutorAt").equals("Y")){
        		//강사
        		rMap.setString("userno", rMap.getString("userNo"));
        		
        		//List<EduMap> entList = adminTutorService.getTutorEntRstList(rMap); // 강사로 등록된 정보가 있는지
        		if(entList.size() > 0) {//강사이력이 있다면 update
        			
        			String orgMtTutorCode = entList.get(0).getString("MT_TUTOR_CODE");
        			rMap.setString("orgMtTutorCode", orgMtTutorCode);
        			//adminTutorService.updateTutor(rMap);
        		}
        		else {
        			//강사이력이 없다면 insert
        			//adminTutorService.insertTutor(rMap);	
        		}
        		
        	} else {//미강사라면 delete
        		adminTutorService.deleteTutor(rMap);
        	}*/
            adminUserService.updateUserInfo(rMap);			// 회원정보 수정

            /** ------------------ 개인정보 처리로그 관련 업무 수행 ----------------------- */
            //조회,처리내역 등록
            String transSummary = "> 업무내용 : 회원정보수정처리";
            String transProgNm = "회원관리 > 회원정보수정처리";

            adminSysLogService.insertMbrTransLog(
                    request,
                    SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"), 	// 시스템 구분
                    SangsProperties.getProperty("Globals.MBR_TRANS_GB_UPDATE"), 	// 업무처리 구분
                    transSummary, 	// 처리업무 상세내용
                    transProgNm		// 프로그램명
                    );

            // 권한변경로그 등록
            if (!rMap.getString("mtGradeCode").equals("")) {
                adminSysLogService.insertMbrGradeLog (
                        request,
                        SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"),
                        rMap.getInt("userNo"),
                        rMap.getString("userId"),
                        rMap.getString("mbernm"),
                        rMap.getString("mtGradeCode"),
                        "회원권한변경"
                );
            }
            
            request.setAttribute("titleMode", "수정");
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_exec";
    }

    /**
     * 비밀번호 초기화
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @throws Exception
     */
    // TODO: 비밀번호 초기화
    @RequestMapping(value = "/admin/user/userPwdClear.do")
    public void userPwdClear(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {

            //사용자 비밀번호 변경
            String mtCode= SangsProperties.getProperty("Globals.mtCode_MT_PWD_CLEAR_CODE");
            rMap.setString("mtCode", mtCode );
            /*List list = adminCommonService.getMtSubCodeList(rMap);

            String newPwd =  "";
            for(int i=0; i<list.size(); i++){

                EduMap mtInfo = (EduMap)list.get(i);
                if (mtInfo.getString("USEYN").equals("Y")) {
                    newPwd = mtInfo.getString("MT_SUB_NAME");
                }
            }*/
            
            // 취약점으로 인해서 임시 주석 20190503
            /*BASE64Decoder base64Decoder = new BASE64Decoder();
            String securedPassword = request.getParameter("securedPassword");
            String infoPass = new String(base64Decoder.decodeBuffer(securedPassword.toString().trim())); 
        	
            if (!"".equals(infoPass)) {
                rMap.setString("newUnityPassword", SangsCryptUtil.crypt(infoPass));*/
            
        	rMap.setString("newUnityPassword", SangsCryptUtil.crypt("1234"));
            adminUserService.updatePwdClearInfo(rMap);
//            }
            json = gson.toJson(String.valueOf("OK"));

        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }

    /**
     * 탈퇴회원관리 리스트
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 탈퇴회원관리 리스트
    @RequestMapping(value = "/admin/user/userCancelList.do")
    public String userCancelList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            String mtCode = "";
            //회원권한 코드
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("userGradeList", adminCommonService.getMtSubCodeList(rMap));

            //탈퇴회원
            rMap.setString("cancelYn", "Y");
            
            //탈퇴 회원정보리스트
            request.setAttribute("resultList",  adminUserService.getUserCancelList(rMap));
            request.setAttribute("totalCount", adminUserService.getUserCancelListCount(rMap));

            //공통코드관리 > 회원탈퇴사유코드(PC)
            rMap.setString("mtCode", "PC");
            request.setAttribute("LIST_DATA", adminMtCodeMngrService.getMtcodeSubList(rMap));
            
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_cancel_list";
    }


    /**
     * 기업정보관리 리스트
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 기업정보관리 리스트
    @RequestMapping(value = "/admin/user/companyList.do")
    public String companyList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            //해당 기업의 기업담당자 정보도 가져옴
            String mtGradeCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE_ENTRPRS");
            rMap.setString("mtGradeCode", mtGradeCode);

            request.setAttribute("resultList", adminUserService.getCompanyList(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        if("EXCEL".equals(rMap.getString("listType")))
            return "admin/user/user_company_list_excel";
        else
            return "admin/user/user_company_list";
    }

    /**
     * 기업정보 등록 폼
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 기업정보 등록 폼
    @RequestMapping(value = "/admin/user/companyForm.do")
    public String companyForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);


            EduMap comInfo = null;
            if(!("").equals(rMap.getString("comno"))){
                comInfo = adminUserService.getCompanyInfo(rMap);

                if(comInfo.getString("EMP_EMAIL") != null && comInfo.getString("EMP_EMAIL").length() > 1){
                    comInfo.put("EMP_EMAIL1", comInfo.getString("EMP_EMAIL").split("@")[0]);
                    if(comInfo.getString("EMP_EMAIL").split("@").length == 2){
                        comInfo.put("EMP_EMAIL2", comInfo.getString("EMP_EMAIL").split("@")[1]);
                    }
                }
            }

            request.setAttribute("comInfo", comInfo);
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_company_form";
    }

    /**
     * 기업정보 등록/수정 실행
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 기업정보 등록/수정 실행
    @RequestMapping(value = "/admin/user/companyExec.do")
    public String companyExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
            rMap.setString("userid", request.getSession().getId());
            rMap.setString("usernm", userSessionVO.getUserName());

            String qu = rMap.getString("qu");

            // 기업정보 등록/수정/삭제
            if(qu.equals("insert")){
                adminUserService.insertCompanyInfo(rMap);
            }
            else if(qu.equals("update")){
                adminUserService.updateCompanyInfo(rMap);
            }
            else if(qu.equals("delete")){
                //adminUserService.deleteCompanyUserInfo(rMap);
                adminUserService.deleteCompanyInfo(rMap);
            }

            String mtGradeCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE_ENTRPRS");
            rMap.setString("mtGradeCode", mtGradeCode);

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_company_exec";
    }

    /**
     * 소속회원정보 팝업
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 소속회원정보 팝업
    @RequestMapping(value = "/admin/user/companyUserSearchList.do")
    public String companyUserSearchList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
            rMap.setInt("rowCount", 10);
            request.setAttribute("resultList", adminUserService.getUserList(rMap));
            request.setAttribute("totalCount", adminUserService.getUserListCount(rMap));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_company_search_pop";
    }

    /**
     * 선택기업 일괄승인 -사용 안하는것 같음
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @throws Exception
     */
    // TODO: 선택기업 일괄승인
    @RequestMapping(value = "/admin/user/companyApproval.do")
    public void companyApproval(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        String resultMsg = "";
        String chk = rMap.getString("chk");

        try {
            String[] chkArr = chk.split(",");
            for(int i=0; i < chkArr.length; i++){

                rMap.setString("comno", chkArr[i]);
                rMap.setString("statusGb", "Y");
                adminUserService.updateApprovalInfo(rMap);
            }
            resultMsg = "true";

        }catch(Exception e){
            resultMsg = "false";
        }

        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        out.println(resultMsg);
        out.flush();
        out.close();
    }

    /**
     * 신규기업 엑셀등록 폼
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 신규기업 엑셀등록 폼
    @RequestMapping(value = "/admin/user/companyExcelForm.do")
    public String companyExcelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        return "admin/user/user_company_excel_form";
    }

    /**
     * 엑셀 업로드
     * @param data
     * @return
     * @throws Exception
     */
     private EgovFormBasedFileVo excelUploadPrc(HttpServletRequest req, String attFilePath)  throws Exception {
         try {
             List<EgovFormBasedFileVo> fileList = null;
             EgovFormBasedFileVo fileVo = null;

             if (ServletFileUpload.isMultipartContent(req)) {
                 fileList = EgovFileUploadUtil.uploadFiles(req, attFilePath);
             }
             if(fileList != null && fileList.size() > 0) {
                 fileVo = fileList.get(0);
             }
             return fileVo;
         } catch(Exception e) {

             
             throw new FrontException();
         }
     }

    /**
     * 신규기업 엑셀등록 실행
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 신규기업 엑셀등록 실행
    @RequestMapping(value = "/admin/user/companyExcelExec.do")
    public String companyExcelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        //DataMap fileBox = (DataMap)rMap.get("UPLOAD_FILE");
        //String filePath = fileBox.getString("uploadFileFulltPath") + File.separator + fileBox.getString("uploadFileSaveName");
        String attFilePath = SangsProperties.getProperty("Globals.addFileRootPath");

        EgovFormBasedFileVo rtnFileVo = excelUploadPrc(request, attFilePath);
        ArrayList<SangsMap> excelList = SangsUtil.loadExcelList(attFilePath + File.separator + rtnFileVo.getPhysicalName(), 1, 10);

        try {

                int num = excelList.size();
                int excelSize = excelList.size();

                //엑셀 유효성 체크 시작
                for(int i = 0 ; i < excelList.size() ; i++) {

                    SangsMap map = excelList.get(i);

                    map.put("comname", 	map.get("col0"));	//사업자명
                    map.put("comRegGb", map.get("col1"));	//소속구분
                    map.put("bizno", 	map.get("col2"));	//사업자번호
                    map.put("ceo", 		map.get("col3"));	//대표자명
                    map.put("zip", 		map.get("col4"));	//우편번호
                    map.put("addr01", 	map.get("col5"));	//주소01
                    map.put("addr02", 	map.get("col6"));	//주소02
                    map.put("tel", 		map.get("col7"));	//전화번호
                    map.put("fax", 		map.get("col8"));	//팩스번호
                    map.put("statusGb", 	"Y");	//승인상태

                    map.put("num", (num-i));

                    adminUserService.insertCompanyExcel(map);
                }


        } catch (Exception ex){
        }

        return "admin/user/user_company_excel_exec";
    }


    /**
     * 탈퇴회원 교육이력
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 탈퇴회원 교육이력
    @RequestMapping(value = "/admin/user/userStudyList.do")
    public String userStudyList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        request.setAttribute("REQUEST_DATA", rMap);

        return "admin/user/user_study_list";
    }
    
    /**
     * 회원운영관리 리스트
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 회원관리 리스트
    @RequestMapping(value = "/admin/user/userMngList.do")
    public String userMngList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	//검색 날짜 디폴트(현재 날짜로부터 일 년 전 ~ 현재날짜)
        	/*String loginDateSdate = "";
            String loginDateEdate = "";
            if(("").equals(loginDateSdate)){
            	loginDateSdate = DateUtil.getMonthAgoDate(-12);
            }
            if(("").equals(loginDateEdate)){
            	loginDateEdate = DateUtil.getNowDate();
            }
            rMap.setString("loginDateSdate", loginDateSdate);
            rMap.setString("loginDateEdate", loginDateEdate);
            
            String secsnMailYnSdate = "";
            String secsnMailYnEdate = "";
            if(("").equals(secsnMailYnSdate)){
            	secsnMailYnSdate = DateUtil.getMonthAgoDate(-12);
            }
            if(("").equals(secsnMailYnEdate)){
            	secsnMailYnEdate = DateUtil.getNowDate();
            }
            rMap.setString("secsnMailYnSdate", secsnMailYnSdate);
            rMap.setString("secsnMailYnEdate", secsnMailYnEdate);*/

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            String mtCode = "";
            //회원권한 코드
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("userGradeList", adminCommonService.getMtSubCodeList(rMap));

            //정상회원만 조회
            rMap.set("cancelYn", "N");

            request.setAttribute("selectYYYY", adminUserService.getUserRgsdeYear(rMap));
            String month = rMap.getString("month");
            //if(month.equals("")) month = String.valueOf(DateUtil.getMonth());
            if(!month.equals("") && month.length() == 1) {
                month = "0" + month;
            }
            rMap.set("month", month);

            //회원정보리스트
            String mtGradeEntrprsCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE_ENTRPRS");
            rMap.setString("mtGradeEntrprsCode", mtGradeEntrprsCode);
            rMap.setInt("rowCount", 20);
            
            request.setAttribute("resultList",  adminUserService.getUserList(rMap));
            request.setAttribute("totalCount", adminUserService.getUserListCount(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_mng_list";
    }

	/**
	 * 회원탈퇴
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/user/withdrawAjax.do")
	public void withdrawAjax(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		try {
			
			adminUserService.withdrawUser(rMap);
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
     * 비회원관리 리스트
     *
     * @date	: 2017. 6. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 비회원관리 리스트
    @RequestMapping(value = "/admin/user/nmberList.do")
    public String nmberList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            String sdate = rMap.getString("sdate");
            String edate = rMap.getString("edate");
            if(("").equals(sdate)){
            	sdate = "2017-06-01";
            	// sdate = DateUtil.getMonthAgoDate(0);
            }
            if(("").equals(edate)){
                //edate = DateUtil.getMonthAgoDate(3);
            	edate = DateUtil.getMonthAgoDate(0);
            }
            rMap.setString("sdate", sdate);
            rMap.setString("edate", edate);

            String mtCode = "";
            //회원권한 코드
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("userGradeList", adminCommonService.getMtSubCodeList(rMap));

            //정상회원만 조회
            rMap.set("cancelYn", "N");

            request.setAttribute("selectYYYY", adminUserService.getUserRgsdeYear(rMap));
            String month = rMap.getString("month");
            //if(month.equals("")) month = String.valueOf(DateUtil.getMonth());
            if(!month.equals("") && month.length() == 1) {
                month = "0" + month;
            }
            rMap.set("month", month);

            // 비회원정보리스트
            request.setAttribute("resultList",  adminUserService.getNmberList(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }
        if("EXCEL".equals(rMap.getString("listType")))
            return "admin/user/nmber_list_excel";
        else
            return "admin/user/nmber_list";
    }
	
    /**
     * 비회원 상세
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 비회원 상세
    @RequestMapping(value = "/admin/user/nmberForm.do")
    public String nmberForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            String mtCode = "";

            // 회원분류
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("userGradeList", adminCommonService.getMtSubCodeList(rMap)); // 회원분류
            request.setAttribute("userInfo",  adminUserService.getNmberInfo(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/nmber_form";
    }

    /**
     * 비회원 정보 수정
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 비회원 정보 수정
    @RequestMapping(value = "/admin/user/nmberExec.do")
    public String nmberExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try { 
        	
        	String transSummary = "";
            String transProgNm = "";
            		
        	// 비회원정보 등록/수정
        	if(!("").equals(rMap.getString("userNo")) ) {
                adminUserService.updateNmberInfo(rMap);
                
                //조회,처리내역 등록
                transSummary = "> 업무내용 : 비회원정보수정처리";
                transProgNm = "회원관리 > 비회원정보수정처리";
                request.setAttribute("titleMode", "수정");

        	}
        	else {
        		adminUserService.insertNmberInfo(rMap);
        		
        		//조회,처리내역 등록
                transSummary = "> 업무내용 : 비회원정보등록처리";
                transProgNm = "회원관리 > 비회원정보등록처리";
                request.setAttribute("titleMode", "등록");

        	}

            /** ------------------ 개인정보 처리로그 관련 업무 수행 ----------------------- */
            adminSysLogService.insertMbrTransLog(
                    request,
                    SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"), 	// 시스템 구분
                    SangsProperties.getProperty("Globals.MBR_TRANS_GB_UPDATE"), 	// 업무처리 구분
                    transSummary, 	// 처리업무 상세내용
                    transProgNm		// 프로그램명
                    );

            // 권한변경로그 등록
            if (!rMap.getString("mtGradeCode").equals("") && !("").equals(rMap.getString("userNo"))) {
                adminSysLogService.insertMbrGradeLog (
                        request,
                        SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ADMIN"),
                        rMap.getInt("userNo"),
                        "",
                        rMap.getString("mbernm"),
                        rMap.getString("mtGradeCode"),
                        "비회원권한변경"
                );
            }
            
            
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/user/user_exec";
    }

}