package com.webapp.admin.ctrl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.EgovFileUploadUtil;
import com.sangs.util.EgovFormBasedFileVo;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminExcelSmsService;

/**
 *
 * Description : 관리시스템 시스템 관련 컨트롤러
 *
 * Modification Information
 * 수정일           수정자                            수정내용
 * -----------  -----------------------------  -------
 * 2016. 3. 29.  이진영, sweetjy09@sangs.co.kr     최초작성
 *
 */
@Controller
public class SmsPlusController {

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminExcelSmsService")
    private AdminExcelSmsService    adminExcelSmsService;
    
    /**
     * 시스템관리 > 공통코드 리스트
     *
     * 수정일  : 2016. 5. 16.
     * 수정자  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 리스트
    @RequestMapping(value = "/admin/sms/smsList.do")
    public String smsList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            rMap.setString("useYn", ParamUtil.getStrParam(rMap.getString("useYn"), "Y"));

            int totalCnt = adminExcelSmsService.getExcelSmsListCount(rMap);
            
            List<EduMap> map = adminExcelSmsService.getExcelSmsList(rMap);

            request.setAttribute("LIST_DATA",map);
            request.setAttribute("totalCnt",totalCnt);

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "/admin/smsplus/smsplus_list";

    }
    
    /**
     * sms추가개발 엑셀등록 폼
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: sms추가개발 엑셀등록 폼
    @RequestMapping(value = "/admin/sms/smsPlusExcelForm.do")
    public String smsPlusExcelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        return "admin/smsplus/smsplus_excel_form";
    }
    
    /**
     * SMS 엑셀등록 실행
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: SMS 엑셀등록 실행
    @RequestMapping(value = "/admin/sms/smsPlusExcelExec.do")
    public String smsPlusExcelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        //DataMap fileBox = (DataMap)rMap.get("UPLOAD_FILE");
        //String filePath = fileBox.getString("uploadFileFulltPath") + File.separator + fileBox.getString("uploadFileSaveName");
        String attFilePath = SangsProperties.getProperty("Globals.addFileRootPath")+"/sms";
        EgovFormBasedFileVo rtnFileVo = excelUploadPrc(request, attFilePath);
        
        /*엑셀 입력 정보 설정 생성일:2018-04-23 박강희*/
        rMap.set("fileSize", rtnFileVo.getSize());
        rMap.set("fileType", rtnFileVo.getFileName().substring(rtnFileVo.getFileName().lastIndexOf(".") + 1, rtnFileVo.getFileName().length()));
        rMap.set("fileOrgName", rtnFileVo.getFileName());
        rMap.set("fileSavName", rtnFileVo.getPhysicalName());
        rMap.set("filePath", attFilePath);
        
        ArrayList<SangsMap> excelList = SangsUtil.loadExcelList(attFilePath + File.separator + rtnFileVo.getPhysicalName(), 1, 60);
        try {
        		adminExcelSmsService.insertExcelSmsUpload(rMap);
                int num = excelList.size();
                int excelSize = excelList.size();
                
                //엑셀 유효성 체크 시작
                for(int i = 0 ; i < excelList.size() ; i++) {
                	SangsMap map = excelList.get(i);
                    
                    map.put("recHp", SangsUtil.nvl(map.get("col0")).trim());	//수신번호
                    map.put("sendUserId", 	SangsUtil.nvl(map.get("col1")).trim());	//발신자
                    map.put("summary", SangsUtil.nvl(map.get("col2")).trim());	//콘텐츠
                    String summary = SangsUtil.nvl(map.get("col2")).trim(); 
                    if( summary.getBytes().length < 90){
                    	map.put("tranType", 4);	//교육희망시간1
                    } else {
                    	map.put("tranType", 6);	//교육희망시간1
                    }
                    
                    //===========================================2018-04-30로그 부분 추가=============================
                    //내부 로그 남기고 실제 외부 SMS 테이블에 저장 시켜놔야함
                    String smsbodyVal = StringEscapeUtils.unescapeHtml(map.getString("summary"));
                	smsbodyVal = smsbodyVal.replace("&apos;","'");
                	smsbodyVal = smsbodyVal.replace("&lt;","<");
                	smsbodyVal = smsbodyVal.replace("&gt;",">"); 
                	smsbodyVal = java.net.URLDecoder.decode(smsbodyVal, "UTF-8"); 
                	
                	rMap.setString("smsbody", smsbodyVal); 
                	rMap.setInt("status", 1);
                    
                    String userInfo = "";
        			int msgCnt = 1;
                    
                    int seq = adminCommonService.getMaxSmsSeq(rMap);
        			rMap.setInt("seq", seq);
        			rMap.setString("recUserName", "");
        			rMap.setString("recUserId", "");
        			rMap.setString("recHp", (String)map.get("recHp"));
        			adminCommonService.insertSmsLog(rMap);
        			
        			userInfo = rMap.getString("recUserName") +"^"+rMap.getString("recHp");//유저name + ^(구분자) + 수신자 번호 를 통한 실제 SMS 반영 DB데이터 생성 
        			rMap.setInt("msgCnt", msgCnt);
            		rMap.setString("userInfo", userInfo);
            		
            		if(rMap.getInt("tranType") == 6){//mms라면
        				adminCommonService.insertMmsData(rMap);
        			} else if(rMap.getInt("tranType") == 4){ //sms라면
        				adminCommonService.insertSmsData(rMap);
        			}
            		//===========================================================================================
            		
                    //map.put("SES_USERNO", rMap.get("SES_USERNO"));
                    //adminLectureService.insertSpecilLectureExcel(map);
                }


        } catch (Exception ex){
        }

        return "admin/user/user_company_excel_exec";
    }
    
    /**
     * 엑셀 업로드
     * @param data
     * @return
     * @throws Exception
     */
     private EgovFormBasedFileVo excelUploadPrc(HttpServletRequest req, String attFilePath)  throws Exception {
         try {
             List<EgovFormBasedFileVo> fileList = null;
             EgovFormBasedFileVo fileVo = null;
             
             if (ServletFileUpload.isMultipartContent(req)) {
                 fileList = EgovFileUploadUtil.uploadFiles(req, attFilePath);
             }
             if(fileList != null && fileList.size() > 0) {
                 fileVo = fileList.get(0);
             }
             return fileVo;
         } catch(Exception e) {

             
             throw new FrontException();
         }
     }
     
     /**
      * SMS엑셀 파일다운로드
      * @param url
      * @param msg
      * @param model
      * @return
      * @throws Exception
      */
     @RequestMapping(value = "/admin/sms/excelFileDown.do")
     public String eduFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

         DownloadServlet filedown = new DownloadServlet();
         boolean result;

         try {
             
             if(rMap.containsKey("sampleDown")){
                 req.setAttribute("REQUEST_DATA", rMap);
                 return "/common/file_down";
             }

             rMap.setString("fileId", req.getParameter("fileId"));
             
			result = filedown.downLoadFile(req, res, adminExcelSmsService.getExcelFileInfo(rMap));

             if (result) {
                 return null;
             } else {
                 return "/common/cmmn_error";
             }

         } catch (Exception e) {
         	return "common/cmmn_error";
         }
     }
}
