package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.classdesk.service.ClassdeskBoardService;

/**
 * Description : 클래스데스트 > 학생모드 > 게시판
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskBbsController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskBoardService")
    private ClassdeskBoardService classdeskBoardService;

    /**
     * 공지사항
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            request.setAttribute("courselistData", classdeskBoardService.getCourseBbsList(rMap));
            
    		List<EduMap> resultList = classdeskBoardService.getCourseBbsList(rMap);
        	request.setAttribute("resultList", resultList);
        	
        	int totalCount = 0;
        	if (resultList != null && resultList.size() > 0) {
        		totalCount = totalCount + resultList.get(0).getInt("TOTALCOUNT");
        	}
        	request.setAttribute("totalCount", totalCount);

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/bbs/bbs_list";
    }

    /**
     * 등록/수정 양식
     * 
     * @param request
     * @param res
     * @param rMap
     * @return 
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            request.setAttribute("rowData", classdeskBoardService.getBoardView(rMap));
//            request.setAttribute("listData", classdeskBoardService.getFileList(rMap));
            request.setAttribute("fileList", classdeskBoardService.getCourseFileList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/bbs/bbs_form";
    }
	/**
	 * 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/classdesk/bbs/deleteEdDataFileAjax.do")
	public void deleteEdDataFileAjax(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			classdeskBoardService.deleteEdDataFile(rMap);
			
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
    /**
     * 상세보기 양식
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskBoardService.getBoardView(rMap));
            request.setAttribute("listData", classdeskBoardService.getFileList(rMap));
            request.setAttribute("fileList", classdeskBoardService.getCourseFileList(rMap));
            
            // 게시물 카운트 
            if (rMap.getString("SES_GRADENO").equals(SangsProperties.getProperty("Globals.userGradeNo_normal"))) {
                classdeskBoardService.updateBoardViewCnt(rMap);
            }

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/bbs/bbs_view";
    }
    /**
     *  파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/classdesk/bbs/filedown.do")
    public String eduFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
            //rMap.setString("filename", "../6BAE7B3F1CBB415FBE6A15D65DB18BE7.xls");
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
            //상위경로 진입 방지

            if(rMap.containsKey("sampleDown")){
                req.setAttribute("REQUEST_DATA", rMap);
                return "/common/file_down";
            }

            rMap.setString("fileId", req.getParameter("fileId"));
            rMap.setString("bbsNo", req.getParameter("bbsNo"));
            rMap.setString("fileSeq", req.getParameter("fileSeq"));
            
            result = filedown.downLoadFile(req, res, classdeskBoardService.getFileInfo2(rMap));
            

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) {
            return "common/cmmn_error";
        }
    }
    /**
     * 등록, 수정실행
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */ 
    @RequestMapping(value = "/classdesk/bbs/exec.do" )
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            // 특수문자 치환 (insert)
            rMap.setString("title", StringUtil.setContent(rMap.getString("title")));

            //int bbsNo = ParamUtil.getIntParam(rMap.getString("bbsNo"), 0);
            //int fileCnt = rMap.getInt("UPLOAD_FILE_CNT"); //파일 개수 Cnt
            classdeskBoardService.saveBbs(request, rMap);

            rMap.putString("rMsg", "등록되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 삭제 실행
     * 
     * @param request
     * @param res
     * @param rMap
     * @return 
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/del_exec.do")
    public String delExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskBoardService.deleteBoardInfo(rMap);

            rMap.putString("rMsg", "삭제되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
