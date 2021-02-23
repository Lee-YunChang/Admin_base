package com.webapp.classdesk.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sangs.util.StringUtil;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskBoardMapper;
import com.webapp.classdesk.service.ClassdeskCommonService;

/**
 * Description : 클래스데스트 파일 뷰어
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskFileController {

    private Logger                 log = LogManager.getLogger(ClassdeskFileController.class);

    @Resource(name = "classdeskCommonService")
    private ClassdeskCommonService classdeskCommonService;

    @Resource(name = "classdeskBoardMapper")
    private ClassdeskBoardMapper   classdeskBoardMapper;

    /**
     * 파일 뷰어
     * 
     * @param request
     * @param res
     * @param rMap
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/fileview.do")
    @ResponseBody
    public void fileView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        String targetTable = ParamUtil.getStrParam(rMap.getString("type"), "");
        String targetFile = ParamUtil.getStrParam(rMap.getString("targetFile"), "");

        String tname = ""; // 테이블 네임

        // 파라미터 정보로 테이블 네이밍 세팅. 
        if (targetTable.equals("S")) {
            tname = SangsProperties.getProperty("Globals.T_SETQUIZ");
        } else if (targetTable.equals("B")) {
            tname = SangsProperties.getProperty("Globals.T_BINDERQUIZ");
        } else if (targetTable.equals("R")) {
            tname = SangsProperties.getProperty("Globals.T_BANK_QUIZ");
        }

        rMap.setString("tname", tname);
        rMap.setString("targetFile", targetFile);


        InputStream in = null;
        OutputStream os = null;
        File file = null;

        try {
            EduMap map = classdeskCommonService.getQuizFileInfo(rMap);

            String savePath = "";
            String filename = "";//실제 올라간 파일 이름

            if (map.getString("FILE_PATH").equals(null) || map.getString("FILE_PATH").equals("") || map.getString(targetFile).equals(null) || map.getString(targetFile).equals("")) {
                savePath = "/upload";
                filename = "img_error.gif"; //실제 올라간 파일 이름.
            } else {
                // 에러이미지 호출. 

                savePath = map.getString("FILE_PATH");
                filename = map.getString(targetFile);
            }

            String path = savePath;//경로
            String up_filepath = path;

            up_filepath = up_filepath == null ? "" : up_filepath;
            up_filepath = "" + up_filepath;

            String up_filename = filename;
            up_filename = up_filename == null ? "" : up_filename;


            int idx = filename.indexOf(".");
            String mt = filename.substring(idx + 1);

            try {
            	up_filename = StringUtil.getContentReplace(up_filename);
            	
            	String eUp_filepath = up_filepath;
            	String eSeparator = File.separator;
            	String eUp_filename = up_filename;
                file = new File(eUp_filepath + eSeparator, eUp_filename);

                if (!file.exists()) {
                    file = new File(eUp_filepath, eUp_filename);
                }

                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
            } catch (RuntimeException e) {
            } catch (Exception e) {
            }

            res.reset();

            String temp = "";

            //플래쉬일 경우와 .gif, .jpg일 경우 구분해줌
            if (mt.toUpperCase().equals("SWF")) {
                temp = "application/x-shockwave-flash";
            } else {
                temp = "image/" + mt;
            }

            res.setContentType("" + temp + ";charset=euc-kr");
            os = res.getOutputStream();
            byte b[] = new byte[(int)file.length()];

            int leng = 0;

            while ((leng = in.read(b)) > 0) {
                os.write(b, 0, leng);
            }
        } catch (Exception e) {
            throw new FrontException(e);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                }
            }
            if (os != null) {
                try {
                    os.close();
                } catch (Exception e) {
                }
            }
        }
    }

    /**
     * 파일 다운
     * 
     * @param request
     * @param res
     * @param rMap
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/filedown.do")
    @ResponseBody
    public void fileDown(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {
            String fileType = rMap.getString("downType");

            if ("".equals(fileType)) {
                DownloadServlet filedown = new DownloadServlet();
                filedown.downLoadFile(request, res, classdeskBoardMapper.getFileInfo(ParamUtil.getIntParam(request.getParameter("fileno"))));
            } else {
                downLoadFile(request, res, rMap);
            }
        } catch (Exception e) {
            throw new FrontException(e);
        }
    }

    public void downLoadFile(HttpServletRequest request, HttpServletResponse response,
            DataMap requestMap) throws ServletException, IOException {

        try {

            DownloadServlet filedown = new DownloadServlet();

            String filename = "";
            String pathUrl = "";
            String orgfilename = "";

            DataMap infoMap = new DataMap();
            
            infoMap.set("downType", requestMap.getString("downType").replaceAll("\n",""));
            infoMap.set("downNo", requestMap.getString("downNo").replaceAll("\n",""));
            infoMap.set("reportno", requestMap.getString("reportNo").replaceAll("\n",""));
            infoMap.set("cuserNo", requestMap.getString("cUserNo").replaceAll("\n",""));


            if (requestMap.getString("downType").equals("R")) {

                EduMap map = classdeskCommonService.getLeReportFileList(infoMap).get(0);

                filename = map.getString("SAVFILE");
                pathUrl = map.getString("SAVPATH");
                orgfilename = map.getString("ORGFILE");

            } else if (requestMap.getString("downType").equals("A")) {

                EduMap map = classdeskCommonService.getLeReportApplyFileList(infoMap).get(0);

                filename = map.getString("SAVFILE");
                pathUrl = map.getString("SAVPATH");
                orgfilename = map.getString("ORGFILE");

            } else if (requestMap.getString("downType").equals("E")) { // 시험 > 세트 > 문제일괄등록 파일

                filename = "exam_quiz_sample.xls";
                pathUrl = SangsProperties.getProperty("Globals.downFileServerPath");
                orgfilename = "exam_quiz_sample.xls";

            }

            filename = StringUtil.getContentReplace(filename);
            String ePathUrl = pathUrl;
            String eFileName = filename.replaceAll("\n","");
            java.io.File file = new java.io.File(ePathUrl, eFileName);
            filedown.setHeader(response, file, orgfilename.replaceAll("\r","").replaceAll("\n",""));
            filedown.transport(new FileInputStream(file), response.getOutputStream());

        } catch (Exception e) {
        }
    }
}
