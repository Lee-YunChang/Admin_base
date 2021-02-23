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
import com.webapp.classdesk.service.ClassdeskUserPollService;

/**
 * Description : 클래스데스트 > 학생모드 > 설문
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskUserPollController {

    private Logger                   log = LogManager.getLogger(ClassdeskUserPollController.class);

    @Resource(name = "classdeskUserPollService")
    private ClassdeskUserPollService classdeskUserPollService;

    /**
     * 설문목록
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            // TODO Auto-generated method stub
            //수강생이 설문 제출했는지 여부
            rMap.putString("userSubmitYn", "Y");
            EduMap eduMap = classdeskUserPollService.getPollApplyMainList(rMap).get(0);


            //제출한 상태
            if (eduMap.getInt("CNT") > 0) {
                rMap.putString("resultUrl", "/classdesk/user/poll/view.do");

                //제출하지 않은상태 
            } else {

                //설문이 등록 되어있는지 여부
                rMap.putString("userSubmitYn", "");
                EduMap eduMap2 = classdeskUserPollService.getPollApplyMainList(rMap).get(0);

                // 설문이 존재하는 경우에만 실행
                if (eduMap2.getInt("POLLCNT") > 0) {
                    //최초 설문 등록
                    if (eduMap2.getInt("CNT") == 0) {
                        classdeskUserPollService.savePollApply(rMap);
                    }
                }

                rMap.putString("resultUrl", "/classdesk/user/poll/form.do");
            }
        } catch (Exception e) {
            
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_list";
    }

    /**
     * 설문참여
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
        	EduMap COMMON_DATA = (EduMap) request.getAttribute("COMMON_DATA");
        	
        	// 설문 상시 / 기간 노출
        	rMap.setString("openType", COMMON_DATA.getString("OPENTYPE"));
            request.setAttribute("listData", classdeskUserPollService.getUserPollList(rMap));

        } catch (Exception e) {
            
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/poll_form";
    }

    /**
     * 설문view
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskUserPollService.getPollApplyHistList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/poll_view";
    }

    /**
     * 설문view
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/ajaxSaveRealTmAns.do")
    @ResponseBody
    public void ajaxSaveRealTmAns(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
        Gson gson = new Gson();
        String json = null;

        try {

            out = res.getWriter();
            //사용자 실시간 정답 저장
            classdeskUserPollService.updatePollRealTmAns(rMap);
            json = gson.toJson("SUCCESS");

        } catch (Exception e) {
            
            json = gson.toJson("FAIL");
        } finally {
            if (out != null) {
                out.print(json);
                out.flush();
                out.close();
            }
        }
    }

    /**
     * 설문 임시저장/ 설문개시
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskUserPollService.updatePollApply(rMap);

            rMap.putString("rMsg", "설문이 저장되었습니다.");
            rMap.putString("rScript", "location.href = '/classdesk/main.do';");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
