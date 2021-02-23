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
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizbinderService;

/**
 * Description : 클래스데스트 > 강사모드 > 바인더 등록
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskQuizBinderController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorExamQuizbinderService")
    private ClassdeskTutorExamQuizbinderService classdeskTutorExamQuizbinderService;

    /**
     * 시험 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbinder/search_list.do")
    public String searchList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            String defultSearch = ParamUtil.getStrParam(rMap.getString("searchMode"), "");
            if (defultSearch.equals("D")) {
                rMap.setString("searchBindYn", "Y"); //기본검색 조건 바인더 사용으로 검색.
            }
            request.setAttribute("courseList", classdeskTutorExamQuizbinderService.getEdCourseList(rMap));

            request.setAttribute("listData", classdeskTutorExamQuizbinderService.getLeExamBinderList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizbinder/search_list";
    }

    /**
     * 덤프 문제 등록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbinder/dump_exec.do")
    public String dumpExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizbinderService.dumpExec(rMap);
            rMap.putString("rMsg", " 임시 저장되었습니다.");
            rMap.putString("rScript", "fnDetail(\\'" + rMap.get("examNo") + "\\')");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 바인더 사용여부 수정
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbinder/bind_status_exec.do")
    public String bindStatusExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizbinderService.updateLeExamBindYn(rMap);
            rMap.putString("rMsg", "수정되었습니다.");
            rMap.putString("rScript", "fnBinderList();");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbinder/q_form.do")
    public String qForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskTutorExamQuizbinderService.getLeExamQuizInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizbinder/binder_q_form";
    }

    /**
     * 바인더  문제 등록 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbinder/q_exec.do")
    public String qExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizbinderService.qExec(request, rMap);

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
