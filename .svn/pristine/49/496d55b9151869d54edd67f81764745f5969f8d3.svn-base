package com.webapp.classdesk.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.classdesk.service.ClassdeskUserProgressService;

@Controller
public class ClassdeskUserProgressController {

    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService    classdeskTutorMainService;

    @Resource(name = "classdeskUserProgressService")
    private ClassdeskUserProgressService classdeskUserProgressService;

    /**
     * 온라인학습
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/progress/treeList.do")
    public String treeList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        //
        try {
            request.setAttribute("listData", classdeskUserProgressService.getEdCourseTreeList(rMap));
            
            request.setAttribute("rowData", classdeskUserProgressService.getEduseqYnInfo(rMap));
            request.setAttribute("progData", classdeskTutorMainService.getProgInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/progress_tree_list";
    }

}
