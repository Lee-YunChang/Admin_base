package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.webapp.classdesk.service.ClassdeskTutorExamService;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.classdesk.service.ClassdeskUserExamService;

/**
 * Description : 클래스데스트 > 학생모드 > 시험
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskUserExamController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskUserExamService")
    private ClassdeskUserExamService  classdeskUserExamService;

    @Resource(name = "classdeskTutorExamService")
    private ClassdeskTutorExamService classdeskTutorExamService;

    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService classdeskTutorMainService;

    /**
     * 시험 목록
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            request.setAttribute("listData", classdeskUserExamService.getUserLectExamList(rMap));
            request.setAttribute("rowData", classdeskUserExamService.getOpenTypeInfo(rMap));
            request.setAttribute("progData", classdeskTutorMainService.getProgInfo(rMap));
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/exam_list";
    }

    /**
     * 시험 양식 폼
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/submit_form.do")
    public String submitForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            EduMap examMap = classdeskTutorExamService.getLectExamItem(rMap);
            EduMap userExamCntMap = classdeskUserExamService.getUserLectExamAppCnt(rMap);

            if (userExamCntMap.getInt("EXAM_APP_CNT") == 0) {
                classdeskUserExamService.saveUserExamInfo(examMap, rMap);
            }

            /** 관리자 체점할때도 쓰이기때문에 일반 파라미터로 보냄 */
            rMap.putInt("cUserNo", rMap.getInt("SES_CUSERNO"));

            /*세트/랜덤 구분*/
            if ("R".equals(examMap.getString("PUB_TYPE"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamRdmAppHistList(rMap));
            } else if ("S".equals(examMap.getString("PUB_TYPE"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamSetAppHistList(rMap));
            } else {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamBinderAppHistList(rMap));
            }

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/exam_submit_form";
    }

    /**
     * 실시간 시험저장
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/ajaxSaveRealTmAns.do")
    @ResponseBody
    public void ajaxSaveRealTmAns(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
        Gson gson = new Gson();
        String json = null;

        try {
            out = res.getWriter();
            classdeskUserExamService.saveExamRealTmAns(rMap);

            json = gson.toJson("SUCCESS");
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }

    /**
     * 시험제출
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/submit_exec.do")
    public String submitExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            classdeskUserExamService.submitExec(rMap);

            rMap.putString("rMsg", "시험 제출하였습니다.");
            rMap.putString("rScript", "fnList()");
        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험결과
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/result.do")
    public String result(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            /** 관리자 체점할때도 쓰이기때문에 일반 파라미터로 보냄 */
            rMap.putInt("cUserNo", rMap.getInt("SES_CUSERNO"));

            if ("R".equals(rMap.getString("pubType"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamRdmAppHistList(rMap));
            } else if ("S".equals(rMap.getString("pubType"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamSetAppHistList(rMap));
            } else {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamBinderAppHistList(rMap));
            }
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/exam_result";
    }
}
