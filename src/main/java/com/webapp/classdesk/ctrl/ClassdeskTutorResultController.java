package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DateUtil;
import com.sangs.util.DownloadServlet;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.classdesk.service.ClassdeskCommonService;
import com.webapp.classdesk.service.ClassdeskTutorResultService;

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
public class ClassdeskTutorResultController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskCommonService")
    private ClassdeskCommonService      classdeskCommonService;

    @Resource(name = "classdeskTutorResultService")
    private ClassdeskTutorResultService classdeskTutorResultService;

    /**
     * 성적등록 양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_form.do")
    public String resultForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	
        try {
        	rMap.setString("mtCtypeCode",classdeskTutorResultService.getMtCtypeCode(rMap));
        	rMap.setString("openAt", "N");
        	request.setAttribute("courseFileInfo",classdeskTutorResultService.getCourseFileInfo(rMap));
        	
            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));
            request.setAttribute("listData", classdeskTutorResultService.getLeCourseUSerList(rMap));
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/result_form";
    }
    

    /**
     * 파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/classdesk/tutor/result/filedown.do")
    public String eduFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
        	List<EduMap> tmp = classdeskTutorResultService.getCourseFileInfo(rMap);
        	DataMap map = new DataMap();
        	map.add("SAVPATH", tmp.get(0).getString("SAVPATH"));
        	map.add("SAVFILE", tmp.get(0).getString("SAVFILE"));
        	map.add("ORGFILE", tmp.get(0).getString("ORGFILE"));
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
			result = filedown.downLoadFile(req, res, map);

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
	 * 자료실 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/classdesk/tutor/result/deleteFile.do")
	public void deleteFile(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		try {
			List<EduMap> tmp = classdeskTutorResultService.getCourseFileInfo(rMap);
        	DataMap map = new DataMap();
        	map.add("fileId", tmp.get(0).getInt("FILE_ID"));
        	map.add("savePath", tmp.get(0).getString("SAVPATH"));
        	map.add("saveFile", tmp.get(0).getString("SAVFILE"));
			classdeskTutorResultService.deleteFile(map);
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
    
    
    
    /**
     * 성적등록 양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/saveFile.do")
    public String saveFile(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	
        try {
        	
        	List<DataMap> fileList = new ArrayList<DataMap>();

            //1. 파일처리
            if (ServletFileUpload.isMultipartContent(request)) {
                MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
                Iterator<String> iter = mRequest.getFileNames();
                FileUploadUtil futil = new FileUploadUtil();
                DataMap file = null;
                while (iter.hasNext()) {

                    MultipartFile item = mRequest.getFile(iter.next());

                    file = futil.singleFileUpload(item, SangsProperties.getProperty("Globals.addFileRootPath"),SangsProperties.getProperty("Globals.resultFormFilePath"));

                    if (file != null && file.getString("uploadFileSaveName") != null) {
                        fileList.add(file);
                    }
                 }
            }

            //2. 파일DB 처리
            for (DataMap file : fileList) {
                DataMap paramFileMap = new DataMap();
                paramFileMap.set("courseno", rMap.getInt("SES_COURSENO"));
                paramFileMap.set("cseqno", rMap.getInt("SES_CSEQNO"));
                paramFileMap.set("openAt", rMap.getString("openAt"));
                paramFileMap.setString("uploadFileOrgName", file.getString("uploadFileOrgName"));
                paramFileMap.setString("uploadFileSaveName", file.getString("uploadFileSaveName"));
                paramFileMap.setInt("uploadFileSize", Integer.parseInt(file.getString("uploadFileSize")));
                paramFileMap.setString("uploadFileExt", file.getString("uploadFileExt"));
                paramFileMap.setString("uploadFileFulltPath", file.getString("uploadFileFulltPath"));
                classdeskTutorResultService.insertCourseFileInfo(paramFileMap);
            }
            
        	rMap.setString("mtCtypeCode",classdeskTutorResultService.getMtCtypeCode(rMap));
            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));
            request.setAttribute("listData", classdeskTutorResultService.getLeCourseUSerList(rMap));
        } catch (Exception e) {
            throw new FrontException(e);
        }
        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdesk_result_exec";
    }
    /**
     * 성적 다운로드 (엑셀)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_excel.do")
    public String resultExcel(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
        	rMap.setString("noPage", "Y");
            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));
            request.setAttribute("listData", classdeskTutorResultService.getLeCourseUSerList(rMap));
            rMap.setString("noPage", "");
            
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/result_excel";
    }

    /**
     * 수강자별 성적 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_exec.do")
    public String resultExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            classdeskTutorResultService.resultExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_final_exec.do")
    public String resultFinalExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	System.out.println("@@@@"+rMap);
            classdeskTutorResultService.resultFinalExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 상시 성적등록 양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_always_form.do")
    public String resultAlwaysForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));

            rMap.setString("sdate", ParamUtil.getStrParam(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-2)));
            rMap.setString("edate", ParamUtil.getStrParam(rMap.getString("edate"), DateUtil.getNowDate()));

            request.setAttribute("listData", classdeskTutorResultService.getLeCourseAlwaysUSerList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/result_always_form";
    }

    /**
     * 상시 수강자별 성적 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_always_exec.do")
    public String resultAlwaysExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorResultService.resultAlwaysExec(request, rMap, false);

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 상시 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_always_final_exec.do")
    public String resultAlwaysFinalExec(HttpServletRequest request, HttpServletResponse res,
            DataMap rMap) throws FrontException {

        try {

            classdeskTutorResultService.resultAlwaysExec(request, rMap, true);

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
