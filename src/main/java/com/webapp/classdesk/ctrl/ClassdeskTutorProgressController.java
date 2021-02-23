package com.webapp.classdesk.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.webapp.classdesk.service.ClassdeskTutorProgressService;

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
public class ClassdeskTutorProgressController {

    @Resource(name = "classdeskTutorProgressService")
    private ClassdeskTutorProgressService classdeskTutorProgressService;

    /**
     * 신청양식
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/progress/tree_list.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskTutorProgressService.getEdCourseTreeList(rMap));
            request.setAttribute("rowData", classdeskTutorProgressService.getConurlInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/progress_tree_list";
    }
}
