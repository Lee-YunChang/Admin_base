package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.pattern.IntegerPatternConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.classdesk.service.ClassdeskTutorDiscussService;

/**
 * Description : 클래스데스트 > 강사모드 > 토론
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2016.08.19   황두은           최초작성
 *
 */

@Controller
public class ClassdeskTutorDiscussController {
	
	private Logger log = LogManager.getLogger(this.getClass());
	
	@Resource(name = "classdeskTutorDiscussService")
    private ClassdeskTutorDiscussService classdeskTutorDiscussService;
	
	/**
     * 토론 목록
     * 
     * @param request
     * @param model
     * @param rMap 
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/list.do") 
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {
            List<EduMap> courselistData = classdeskTutorDiscussService.getCourseDiscussList(rMap);
        	request.setAttribute("courselistData", courselistData);
        	int totalCount = 0;
        	if (courselistData != null && courselistData.size() > 0) {
        		totalCount = courselistData.get(0).getInt("TOTALCOUNT");
        	}
        	request.setAttribute("totalCount", totalCount);
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);
        
        return "classdesk/tutor/discuss_list";
    }
    
    /**
     * 토론 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
       
    	 try {
             String qu = rMap.getString("qu");
             if(qu.equals("update")){
            	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussView(rMap));
//                 request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));	
                 request.setAttribute("fileList", classdeskTutorDiscussService.getCourseFileList(rMap));
                 List<EduMap> updateYn = classdeskTutorDiscussService.getGrpNo(rMap);
             	request.setAttribute("updateYn", updateYn.size());
             }

         } catch (Exception e) {
             throw new FrontException(e);
         }

         request.setAttribute("REQUEST_DATA", rMap);
    	 
        return "classdesk/tutor/discuss_form";
    }
    /**
     * 토론 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/form2.do")
    public String form2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
       
    	 try {
             String qu = rMap.getString("qu");
             if(qu.equals("update")){
            	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussView(rMap));
                 request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));	
                 
                 List<EduMap> updateYn = classdeskTutorDiscussService.getGrpNo(rMap);
             	request.setAttribute("updateYn", updateYn.size());
             }

         } catch (Exception e) {
             throw new FrontException(e);
         }

         request.setAttribute("REQUEST_DATA", rMap);
    	 
        return "classdesk/tutor/discuss_form2";
    }
    /**
     * 토론 등록/수정 실행
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 등록/수정/삭제 실행
    
    
    @RequestMapping(value = "/classdesk/tutor/discuss/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	if(rMap.getString("title").length() > 0) {//등록, 수정
        		
        		if(rMap.getString("ordtmAt").length() == 0 ){//상시참여가 아니라면
        			rMap.setString("ordtmAt", "N");
        		}
        		rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
        		classdeskTutorDiscussService.saveBbs(request, rMap);
        	} else {//댓글이 달린 글 수정
        		classdeskTutorDiscussService.updateReplyList(rMap);
        	}
        	
            rMap.putString("rMsg", "등록되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발생했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";    	 
    }    
	/**
	 * 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/classdesk/tutor/discuss/deleteEdDataFileAjax.do")
	public void deleteCmmntyFileAjax(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			classdeskTutorDiscussService.deleteEdDataFile(rMap);
			
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
	  /**
     *  파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/filedown.do")
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
            
            result = filedown.downLoadFile(req, res, classdeskTutorDiscussService.getFileInfo2(rMap));
            

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
     * 토론 상세보기
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussView(rMap));
//            request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));
            request.setAttribute("rcmndCount", classdeskTutorDiscussService.getRcmndCount(rMap));
            request.setAttribute("fileList", classdeskTutorDiscussService.getCourseFileList(rMap));
            
            List<EduMap> updateYn = classdeskTutorDiscussService.getGrpNo(rMap);
        	request.setAttribute("updateYn", updateYn.size());
            
            //세션 아이디를 이용해서 추천반대 교육게시판에 넣을 사용자 일련번호 불러오기
            String unityId = (String) rMap.get("SES_USERID");
            rMap.addString("unityId", unityId);
            
            String unityMberno = classdeskTutorDiscussService.getUnityMberno(unityId);
            rMap.addString("unityMberno", unityMberno);
            
            request.setAttribute("checkRcmnd", classdeskTutorDiscussService.checkRcmnd(rMap));
            
            // 게시물 카운트 
            if (rMap.getString("SES_GRADENO").equals(SangsProperties.getProperty("Globals.userGradeNo_normal"))) {
            	classdeskTutorDiscussService.updateDiscussViewCnt(rMap);
            }

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/discuss_view";
    }
    
    /**
     * 토론 추천/반대 실행
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/rcmnd.do")
    public String rcmnd(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	try {
    		
    		rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
    		
            //세션 아이디를 이용해서 추천반대 교육게시판에 넣을 사용자 일련번호 불러오기
            String unityId = (String) rMap.get("SES_USERID");
            rMap.addString("unityId", unityId);
            
            String unityMberno = classdeskTutorDiscussService.getUnityMberno(unityId);
            rMap.addString("unityMberno", unityMberno);
            
            // 추천/반대 등록
            classdeskTutorDiscussService.insertRcmndInfo(request, rMap);

       	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussView(rMap));
         request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));
         request.setAttribute("rcmndCount", classdeskTutorDiscussService.getRcmndCount(rMap));
         // 게시물 카운트 
         if (rMap.getString("SES_GRADENO").equals(SangsProperties.getProperty("Globals.userGradeNo_normal"))) {
         	classdeskTutorDiscussService.updateDiscussViewCnt(rMap);
         }

         request.setAttribute("checkRcmnd", classdeskTutorDiscussService.checkRcmnd(rMap));
         
        } catch (Exception e) {
        }
    	
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/tutor/discuss_view";   
    }
    
}
