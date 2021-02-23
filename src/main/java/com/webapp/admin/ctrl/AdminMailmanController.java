package com.webapp.admin.ctrl;

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
import com.sangs.util.DateUtil;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.admin.service.AdminMailmanService;
import com.webapp.admin.service.AdminCommonService;

/**
 * 관리자 메일관리 관련 컨트롤러
 * Description :
 *
 * Modification Information
 * 수정일			 수정자  	수정내용
 * -----------	------------  	-------
 * 2016. 6. 9.	 	조남훈,  	최초작성
 *
 */
@Controller
public class AdminMailmanController {

private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminMailmanService")
    private AdminMailmanService    adminMailmanService;

    /**
     * 메일 템플릿관리 목록 조회
     *
     * @date	: 2016. 06. 09.
     * @author	: 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일 템플릿관리 목록 조회
    @RequestMapping(value = "/admin/sysman/mailmanTplList.do")
    public String mailmanTplList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	
            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
        	List<EduMap> map = adminMailmanService.getSyMailTplList(rMap);
        	request.setAttribute("LIST_DATA", map);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/mailman_tpl_list";
    }
    
    /**
     * 메일 템플릿관리 (등록/수정 폼)
     *
     * @date	: 2016. 06. 09.
     * @author	: 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일 템플릿관리 (등록/수정 폼)
    @RequestMapping(value = "/admin/sysman/mailman.do")
    public String mailman(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

        	// 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
        	request.setAttribute("mapInfo", adminMailmanService.getSyMailTplInfo(rMap));
        	request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/mailman_tpl_form";
    }
    /**
     * 메일 템플릿관리 삭제
     *
     * @date	: 2016. 06. 09.
     * @author	: 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일 템플릿관리 삭제
    @RequestMapping(value = "/admin/sysman/mailDeleteExec.do")
    public String mailDeleteExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

        	// 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            adminMailmanService.mailDeleteExec(rMap);
            
        	request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/mailman_tpl_exec";
    }
    
    /**
     * 메일 템플릿관리 (등록/수정 실행)
     *
     * @date	: 2016. 06. 09.
     * @author	: 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일 템플릿관리 (등록/수정 실행)
    @RequestMapping(value = "/admin/sysman/mailmanTplExec.do")
    public String mailmanTplExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

        	// 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            // 탬플릿코드
        	int tplno = SangsUtil.getNumbering2(rMap.getInt("tplno"));
        	
        	//리턴 페이지 설정을 위한 세팅
        	//alert 메세지
        	String msg="";  
         	//등록
          	if(tplno==0){
          		try{
      				// 등록시 템플릿 코드 발급
          			tplno = adminMailmanService.getSyMailTplTplnoMaxInfo(rMap);
                    rMap.setInt("tplno" , tplno);
                    adminMailmanService.insertSyMailTplInfo(rMap);
                    
      	   			//파일등록(추후)
       	   			msg="등록하였습니다.";
           		}catch (Exception e) { 
       	   			msg="등록에 실패하였습니다. 코드값이 중복되는지 확인해주세요.";
           		}
           	}else{
          		try{
          	   		adminMailmanService.updateSyMailTplInfo(rMap);
    	   			msg="수정하였습니다.";
    	   	   	}catch(Exception e){
        	   		msg="수정에 실패하였습니다. 다시 시도해주세요.";
       	   		}
      	   	}
          	
          	rMap.setString("msg", msg);
         	rMap.setInt("tplno", tplno); 
          	request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/mailman_tpl_exec";
    }
    
    /**
     * 메일 발송목록관리 리스트
     *
     * @date	: 2016. 06. 09.
     * @author	: 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일 발송목록관리 리스트
    @RequestMapping(value = "/admin/sysman/mailmanLogList.do")
    public String mailmanLogList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

        	// 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            // 기본 데이터 세팅 3개월 전부터 현재일까지
            rMap.add("sdate", ParamUtil.getStrParam(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-3)));
            rMap.add("edate", ParamUtil.getStrParam(rMap.getString("edate"), DateUtil.getNowDate()));

//        	request.setAttribute("LIST_DATA", adminMailmanService.getSyMailLogList(rMap)); 
        
        	List<EduMap> LIST_DATA =  adminMailmanService.getSyMailLogList(rMap);
        	request.setAttribute("LIST_DATA", LIST_DATA);
        	int totalCount = 0 ;
        	if (LIST_DATA != null && LIST_DATA.size() > 0) {
        		totalCount =  LIST_DATA.get(0).getInt("TOTALCOUNT");
        	}
        	request.setAttribute("totalCount", totalCount);
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/mailman_log_list";
    }
    
    
    /**
     * 메일 발송목록관리 상세
     *
     * @date	: 2016. 06. 09.
     * @author	: 조남훈,
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일 발송목록관리 상세
    @RequestMapping(value = "/admin/sysman/mailmanLogView.do")
    public String mailmanLogView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

        	// 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            
            request.setAttribute("VIEW_DATA", adminMailmanService.getSyMailLogInfo(rMap)); 
            request.setAttribute("REQUEST_DATA", rMap);
            
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/sysman/mailman_log_view";
    }


}