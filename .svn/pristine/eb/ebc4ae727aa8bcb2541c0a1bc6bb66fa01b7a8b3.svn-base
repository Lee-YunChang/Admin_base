package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.webapp.classdesk.service.ClassdeskProgService;
import com.webapp.classdesk.service.ClassdeskTutorProgressService;
import com.webapp.classdesk.service.ClassdeskTutorResultService;
import com.webapp.common.mapper.CommonAccessLogMapper;

/**
 * Description : 클래스데스트 진도처리
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskProgController {

    @Resource(name = "classdeskTutorProgressService")
    private ClassdeskTutorProgressService classdeskTutorProgressService;
    
    @Resource(name = "classdeskTutorResultService")
    private ClassdeskTutorResultService classdeskTutorResultService;
    
    @Resource(name = "classdeskProgService")
    private ClassdeskProgService          classdeskProgService;
    
    @Resource(name = "commonAccessLogMapper")
    private CommonAccessLogMapper commonAccessLogMapper;
    
    /**
     * 진도처리
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/online/prog.do")
    public String prog(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
 	
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "세션이 만료되어 자동 로그아웃되었습니다. 다시 로그인 하여 주시기 바랍니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
    	
        String subcmd = rMap.getString("subcmd");
        String returnUrl = null;
        if ("start".equals(subcmd)) {
            try {
                request.setAttribute("rowData", classdeskTutorProgressService.getConurlInfo(rMap));
                request.setAttribute("treeData", classdeskProgService.getEdCourseTreeInfo(rMap));
                request.setAttribute("treeHistData", classdeskProgService.getLeCourseTreeHistInfo(rMap));
            } catch (Exception e) {
                throw new FrontException(e);
            }

            returnUrl = "classdesk/online/start";
        } else if ("prog_exec".equals(subcmd)) {
            try {
            	EduMap eduInfo = classdeskProgService.getEduseqYnInfo(rMap);
            	
            	// 콘텐츠 접속 로그 추가
    			UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
    			rMap.setString("sysGb", "WWW");
    			rMap.setString("accesUrl", "/classdesk/online/prog.do?courseno="+rMap.getString("courseno")+"&cseqno="+rMap.getString("cseqno")+"&cuserno="+rMap.getString("cuserNo"));
    			rMap.setString("accesUserId", userVo.getUserId());
    			rMap.setString("accesIp", request.getRemoteAddr());
            	commonAccessLogMapper.insertAccessLogInfo(rMap);
            	
            	//수료자가 아니라면 진도체크 실행
            	String compCode = eduInfo.getString("COMPCODE");
            	if("".equals(compCode) || "-".equals(compCode)){

            		progExec(request, rMap, res);
            		
            		 //[상시과정] 진도체크후 다시 조회해서 컨텐츠를 다 들었을경우 수료처리
            		 EduMap tempInfo = classdeskProgService.getEduseqYnInfo(rMap);
            		 if("Y".equals(tempInfo.getString("END_PROGRESS"))){
            			 
            			 Map<String, Object> hashMap = new HashMap<String, Object>();

                         hashMap.put("P_COURSENO", rMap.getInt("SES_COURSENO"));
                         hashMap.put("P_CSEQNO", rMap.getInt("cseqno"));
                         hashMap.put("P_CUSERNO", rMap.getInt("SES_CUSERNO"));
                         hashMap.put("R_RESULT", "");
                         //수료처리
                         
                         classdeskTutorResultService.cuserCompExec(hashMap);  
            		 }
            	}
               
            } catch (Exception e) {
                throw new FrontException(e);
            }
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return returnUrl;
    }

    /**
     * 진도처리 (onload, unload)
     * 
     * @param req
     * @param requestMap
     * @param res
     * @throws Exception
     */
    private void progExec(HttpServletRequest req, DataMap requestMap, HttpServletResponse res) throws Exception {

        String result = classdeskProgService.progExec(requestMap);

        // json 데이터 세팅
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        //Gson gson = new Gson();
        //String json = null;

        //json = gson.toJson(result);

        out.write("fnSucces" + "(\'" + result + "\');");
        out.flush();
        out.close();
    }
}
