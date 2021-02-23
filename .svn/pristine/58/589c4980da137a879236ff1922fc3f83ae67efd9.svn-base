package com.webapp.admin.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.AdminException;
import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminMainService;

/**
 * 
 * Description : 관리자 메인 관련 컨트롤러 
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Controller
public class AdminMainController {

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminMainService")
    private AdminMainService    adminMainService;

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;
    
    /**
     * 관리자 메인 페이지
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
    // TODO: 관리자 메인 페이지
    @RequestMapping(value = "/admin/main/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws AdminException {

        try {
        	
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	rMap.setString("cancelYn", "N"); //정상회원만 조회
    		rMap.setString("mtPmTypeCode", SangsProperties.getProperty("Globals.mtCode_MT_PM_TYPE_COUR")); 		// 과정  'SFCOUR'
        	rMap.setString("notPayCd", SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_NOTPAY")); // 미입금  'SE2001'
        	rMap.setString("inPayCd", SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_INPAY"));	// 입금완료	'SE2002'
        	rMap.setString("sysGb", SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"));
    		rMap.setString("accessUrl", SangsProperties.getProperty("Globals.frontMainUri")); // 메인페이지 기준
    		
        	// 공지사항
        	rMap.setString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
    		request.setAttribute("noticeList", adminMainService.getBoardList(rMap));
    		
    		/*// 교육소식
        	rMap.setString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteGuide"));
    		request.setAttribute("classGuideList", adminMainService.getBoardList(rMap));*/
        	
    		// 팝업
    		request.setAttribute("popupList", adminMainService.getPopupList(rMap));
    		
    		request.setAttribute("joinInfomap", adminMainService.getJoinInfo(rMap));			// 오늘가입자
        	request.setAttribute("accessInfomap", adminMainService.getAccessTodayInfo(rMap));	// 오늘 방문자
        	//request.setAttribute("companyCnt", adminMainService.getCompanyListCount(rMap)); 	// 업체 승인대기
        	//request.setAttribute("studyUserCnt", adminMainService.getStudyUserCount(rMap)); 	// 현재 수강자수
        	//request.setAttribute("isPassCnt", adminMainService.getCourseIsPassCount(rMap)); 	// 금월수료자
    		

        	//request.setAttribute("lectureList", adminMainService.getLectureList(rMap)); // 특강리스트
        	// 대출의무
        	//rMap.setString("ref1", SangsProperties.getProperty("Globals.mtCode_MT_SC_CODE_REF1"));
        	//request.setAttribute("cpseduCourseList", adminMainService.getCourseList(rMap));
        	//request.setAttribute("cpseduSuryoList", adminMainService.getSuryoCountList(rMap));
        	
        	// 기관별
        	//rMap.setString("ref1", SangsProperties.getProperty("Globals.mtCode_MT_SC_CODE_REF2"));
        	//request.setAttribute("enfsnCourseList", adminMainService.getCourseList(rMap));
        	//request.setAttribute("enfsnSuryoList", adminMainService.getSuryoCountList(rMap));
        	
        	//일반
        	//rMap.setString("ref1", SangsProperties.getProperty("Globals.mtCode_MT_SC_CODE_REF3"));
        	//request.setAttribute("gnrlCourseList", adminMainService.getCourseList(rMap));	
        	//request.setAttribute("gnrlSuryoList", adminMainService.getSuryoCountList(rMap));
        	
        	
        	
        	/*rMap.setString("mtCtypeCode", SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE")); //집합
        	request.setAttribute("offlineCourseList", adminMainService.getOfflineCourseList(rMap));				//수강신청현황(집합)
        	request.setAttribute("offlineSuryoList", adminMainService.getSuryoCountList(rMap));	 				//집합 수료자 카운트 월별 현황 (최근 6개월)
        	
        	rMap.setString("mtCtypeCode", SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")); 	//온라인
        	request.setAttribute("onlineCourseList", adminMainService.getOnlineCourseList(rMap));				//수강신청현황(온라인)
        	request.setAttribute("onlineSuryoList", adminMainService.getSuryoCountList(rMap));	*/				//온라인 수료자 카운트 월별 현황 (최근 6개월)
        	request.setAttribute("accessList", adminMainService.getAccessCountList(rMap)); 	// 접속자 카운트 월별현황
        	
        	
        	
        	request.setAttribute("accessList", adminMainService.getAccessCountList(rMap)); 	// 접속자 카운트 월별현황

        	request.setAttribute("REQUEST_DATA", rMap);
        	
        } catch (Exception e) {
            
            throw new AdminException(e);
        }

        return "admin/main/main";
    }
    
    
    
    
    /**
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO 
    @RequestMapping(value = "/admin/main/chatting.do")
    public String adminChatting(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {
        	
            request.setAttribute("REQUEST_DATA", rMap);
            
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        
        return "admin/main/adminChatting";
    }
    

}