package com.webapp.classdesk.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.webapp.classdesk.service.ClassdeskTutorReportService;

/**
 * Description : 클래스데스트 > 강사모드 > 과제
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskTutorReportController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorReportService")
    private ClassdeskTutorReportService classdeskTutorReportService;

    /**
     * 과제 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            request.setAttribute("listData", classdeskTutorReportService.getReportList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/report_list";
    }

    /**
     * 과제 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("evalSum", classdeskTutorReportService.getReportEvalSummary(rMap));
            request.setAttribute("rowData", classdeskTutorReportService.getReportItem(rMap));
            request.setAttribute("evalData", classdeskTutorReportService.getEvalReportInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/report_form";
    }

    /**
     * 과제 등록 / 수정
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorReportService.execReportApply(request, rMap, "CU");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 과제 삭제
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/delExec.do")
    public String delExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorReportService.execReportApply(request, rMap, "D");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 과제 제출자 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/user_list.do")
    public String userList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            request.setAttribute("userListData", classdeskTutorReportService.getReportApplyList(rMap));
            request.setAttribute("rowData", classdeskTutorReportService.getReportItem(rMap));
            request.setAttribute("evalData", classdeskTutorReportService.getEvalReportInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/report_user_list";
    }

    /**
     * (팝업)과제 평가 양식 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/eval_form.do")
    public String evalForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskTutorReportService.getReportApplyInfo(rMap));
            request.setAttribute("reportData", classdeskTutorReportService.getReportItem(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/report_eval_form";
    }

    /**
     * (팝업)과제 평가 양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/eval_exec.do")
    public String evalExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorReportService.updateUserReportEval(rMap);

            rMap.putString("rMsg", "평가 반영되었습니다.");
            rMap.putString("rScript", "window.close();  opener.window.document.location.reload()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 최종평가 반영
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/report/eval_final_exec.do")
    public String evalFinalExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
            classdeskTutorReportService.execReportEvalFinal(rMap);

            rMap.putString("rMsg", "평가 반영되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
