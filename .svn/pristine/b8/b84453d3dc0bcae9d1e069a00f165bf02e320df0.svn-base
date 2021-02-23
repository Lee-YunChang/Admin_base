/*
 * PACKAGE NAME     :  com.simba.common.lib
 * PROGRAM NAME     :  DownloadServlet.java
 * VERSION          :  V1.00
 * DESCRIPTION      :  파일 다운로드파일
 * DESIGNER NAME    :  조형범
 * DEVELOPER NAME   :  조형범
 * CREATE DATE      :  2005-10-24 5:44오후
 */
package com.sangs.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.ss.formula.functions.Replace;

import com.sangs.util.StringUtil;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;

//import java.net.URLEncoder;
/**
 * File 다운로드를 위한 서블릿.
 *
 *
 */

public class DownloadServlet extends HttpServlet {

    private static final long   serialVersionUID = 1L;

    protected Log               log              = LogFactory.getLog(this.getClass());
    /** 다운로드 버퍼 크기 */
    //private static final int    BUFFER_SIZE      = 8192;                              // 8kb

    /** 문자 인코딩 */
    //private static final String CHARSET          = "euc-kr";

    public boolean downLoadFile(HttpServletRequest request, HttpServletResponse response, EduMap map) throws ServletException, IOException {

        try {
            String filename = "";
            String pathUrl = "";
            String orgfilename = "";
            filename = map.getString("SAVFILE");
            //상위경로 진입 방지
            filename = SangsUtil.replaceAll(filename, "../", "");

            pathUrl = map.getString("SAVPATH");
            //pathUrl = LmsDefine.EDUBBS_FILE_PATH;
            orgfilename = map.getString("ORGFILE");
            java.io.File file = new java.io.File(pathUrl, filename);

            setHeader(response, file, orgfilename);
            transport(new FileInputStream(file), response.getOutputStream());

            return true;

        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Method setHeader.
     * @param response
     * @param file
     */
    public void setHeader(HttpServletResponse response, File file, String orgfile) {
        try {
            String mime = null; //getServletContext().getMimeType(file.toString());
            if (mime == null) mime = "application/octet-stream";
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(orgfile, "utf-8") + ";");
            response.setHeader("Content-Length", "" + file.length());
        } catch (Exception e) {

        }

    }

    public boolean urlDownLoadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = java.net.URLDecoder.decode(request.getParameter("filename"), "utf-8");
        //상위경로 진입 방지
        filename = SangsUtil.replaceAll(filename, "../", "");
        String pathUrl = SangsProperties.getProperty("Globals.downFileServerPath") + "/" + request.getParameter("downDir");

        String filepathname = pathUrl + request.getParameter("downDir");
        filename = StringUtil.getContentReplace(filename);
        if (filepathname.equalsIgnoreCase("..") || filename.equalsIgnoreCase("/")) {


            return false;

        } else {
            try {
                String ePathUrl = pathUrl;
                String eFileName = filename;
                java.io.File file = new java.io.File(ePathUrl, eFileName);

                if (file.exists()) {
                    setHeader2(request, response, file);
                    transport(new FileInputStream(file), response.getOutputStream());

                    return true;
                } else {
                    return false;
                }

            } catch (Exception ex) {
                return false;
            }

        }
    }

    public boolean serverDownLoadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String filename = java.net.URLDecoder.decode(request.getParameter("filename"), "utf-8");
        //상위경로 진입 방지
        filename = SangsUtil.replaceAll(filename, "../", "");
        String pathUrl = SangsProperties.getProperty("Globals.CDNURL") + "/" + request.getParameter("downDir");

        String filepathname = pathUrl + request.getParameter("downDir");

        if (filepathname.equalsIgnoreCase("..") || filename.equalsIgnoreCase("/")) {


            return false;

        } else {

            try {

                URL url = new URL(pathUrl + "/" + filename);


                URLConnection conn = null;
                conn = url.openConnection();


                setHeader2(request, response, filename, conn);
                transport2(conn.getInputStream(), response.getOutputStream());

                return true;

            } catch (Exception ex) {
                return false;
            }

        }
    }

    public boolean bbsDownLoadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathUrl = "";
        String filename = java.net.URLDecoder.decode(request.getParameter("filename"), "utf-8");
        
        //상위경로 진입 방지
        filename = SangsUtil.replaceAll(filename, "../", "");
       
        String fileType = ParamUtil.getStrParam(request.getParameter("ftype"));
      
        if (fileType.equals("AS-IS")) {
            pathUrl = SangsProperties.getProperty("Globals.downFileRootPath_ASIS");
        } else {
            pathUrl = SangsProperties.getProperty("Globals.addFileRootPath") + "/" + request.getParameter("downDir");
        }
        
        String filepathname = pathUrl;
        filename = StringUtil.getContentReplace(filename);
        if (filepathname.equalsIgnoreCase("..") || filename.equalsIgnoreCase("/")) {

        	
            return false;

        } else {

            try {
                String ePathUrl = pathUrl;
                String eFileName = filename;
                java.io.File file = new java.io.File(ePathUrl, eFileName);
                
                if (file.exists()) {
                    setHeader2(request, response, file);
                    transport(new FileInputStream(file), response.getOutputStream());

                    return true;
                } else {
                    return false;
                }

            } catch (Exception ex) {
                return false;
            }

        }
    }

    /**
     * Method setHeader.
     * @param response
     * @param file
     * @throws UnsupportedEncodingException
     */
    public void setHeader2(HttpServletRequest request, HttpServletResponse response, File file) throws UnsupportedEncodingException {

        String browser = getBrowser(request);

        String resultName = "";

        try {
            // Explorer
            if (browser.indexOf("MSIE") != -1) {
                resultName = java.net.URLEncoder.encode(file.getName(), "UTF-8").replaceAll("\\+", "%20"); // new String(file.getName().getBytes(CHARSET), "8859_1");
            }
            // Opera
            else if (browser.indexOf("Opera") != -1) {
                resultName = new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
            }
            // Chrome
            else if (browser.indexOf("Chrome") != -1) {
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < file.getName().length(); i++) {
                    char c = file.getName().charAt(i);
                    if (c > '~') {
                        sb.append(URLEncoder.encode("" + c, "UTF-8"));
                    } else {
                        sb.append(c);
                    }
                }
                resultName = sb.toString();

            }
            // Safari
            else if (browser.indexOf("Safari") != -1) {
                resultName = new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
            }
            // FireFox
            else if (browser.indexOf("Firefox") != -1) {
                resultName = "\"" + new String(file.getName().getBytes("EUC-KR"), "8859-1") + "\"";
            }
            // Other
            else {
                resultName = new String(file.getName().getBytes("EUC-KR"), "ISO-8859-1");
            }
        } catch (Exception ex) {
            resultName = file.getName();
        }

        String mime = request.getSession().getServletContext().getMimeType(file.getName());
        if (mime == null || mime.length() == 0) {
            mime = "application/octet-stream;";
        }

        response.setContentType(mime);
        response.setHeader("Content-Transfer-Encoding", "binary");

        response.setHeader("Content-Disposition", "attachment; filename=" + resultName.replaceAll("\\+", "\\ ") + ";");

        if (file.length() > 0) {
            response.setHeader("Content-Length", "" + file.length());
        }
    }

    /**
     * Method transport.
     * @param in
     * @param out
     * @throws IOException
     */
    public void transport(InputStream in, OutputStream out) throws IOException {

        BufferedInputStream bin = null;
        BufferedOutputStream bos = null;

        try {
            bin = new BufferedInputStream(in);
            bos = new BufferedOutputStream(out);

            byte[] buf = new byte[5 * 1024]; //buffer size 5K.
            int read = 0;
            while ((read = bin.read(buf)) != -1) {
                bos.write(buf, 0, read);
            }
        }catch(Exception e){
        }finally {
            bos.close();
            bin.close();
        }
    }

    public String koreanToUni(String Unicode) {
        String result = null;

        try {
            if (Unicode == null) {
                return null;
            }
            result = new String(Unicode.getBytes("KSC5601"), "8859_1");
        } catch (java.io.UnsupportedEncodingException e) {

        }
        return result;
    }

    /**
    * @brief  브라우저 판별 메서드
    * @author 이경재(kjlee0118@hyosung.com)
    * @param  request
    * @return
    */
    public static String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        } else if (header.indexOf("Safari") > -1) {
            return "Safari";
        } else {
            return "Firefox";
        }

    }

    private void setHeader2(HttpServletRequest request, HttpServletResponse response,
            String filename, URLConnection conn) throws UnsupportedEncodingException {

        String browser = getBrowser(request);

        String resultName = "";

        try {
            // Explorer
            if (browser.indexOf("MSIE") != -1) {
                resultName = java.net.URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20"); // new String(file.getName().getBytes(CHARSET), "8859_1");
            }
            // Opera
            else if (browser.indexOf("Opera") != -1) {
                resultName = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
            // Chrome
            else if (browser.indexOf("Chrome") != -1) {
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < filename.length(); i++) {
                    char c = filename.charAt(i);
                    if (c > '~') {
                        sb.append(URLEncoder.encode("" + c, "UTF-8"));
                    } else {
                        sb.append(c);
                    }
                }
                resultName = sb.toString();

            }
            // Safari
            else if (browser.indexOf("Safari") != -1) {
                resultName = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
            // FireFox
            else if (browser.indexOf("Firefox") != -1) {
                resultName = "\"" + new String(filename.getBytes("EUC-KR"), "8859-1") + "\"";
            }
            // Other
            else {
                resultName = new String(filename.getBytes("EUC-KR"), "ISO-8859-1");
            }
        } catch (Exception ex) {
            resultName = filename;
        }

        String mime = request.getSession().getServletContext().getMimeType(filename);
        if (mime == null || mime.length() == 0) {
            mime = "application/octet-stream;";
        }

        response.setContentType(mime);
        response.setHeader("Content-Transfer-Encoding", "binary");

        response.setHeader("Content-Disposition", "attachment; filename=" + resultName.replaceAll("\\+", "\\ ") + ";");

        if (conn.getContentLength() > 0) {
            response.setHeader("Content-Length", "" + conn.getContentLength());
        }
    }

    /**
     * Method transport.
     * @param in
     * @param out
     * @throws IOException
     */
    private void transport2(InputStream in, OutputStream out) throws IOException {

        BufferedInputStream bin = null;
        BufferedOutputStream bos = null;

        try {
            bin = new BufferedInputStream(in);
            bos = new BufferedOutputStream(out);

            byte[] buf = new byte[5 * 1024]; //buffer size 5K.
            int read = 0;
            while ((read = bin.read(buf)) != -1) {
                bos.write(buf, 0, read);
            }
        } catch (Exception ex) {
        } finally {
            bos.close();
            bin.close();
        }
    }

    /* 엑셀다운(문제은행양식,설문양식) */
    public boolean downLoadFile(HttpServletRequest req, HttpServletResponse res, DataMap map) {
         try {
                String filename = "";
                String pathUrl = "";
                String orgfilename = "";
 
                filename = map.getString("SAVFILE");
                //상위경로 진입 방지
                filename = SangsUtil.replaceAll(filename, "../", "");

                pathUrl = map.getString("SAVPATH");
                pathUrl = SangsUtil.replaceAll(pathUrl, "\\", "/"); 
                //pathUrl = LmsDefine.EDUBBS_FILE_PATH;
                orgfilename = map.getString("ORGFILE");
                java.io.File file = new java.io.File(pathUrl, filename);

                setHeader(res, file, orgfilename);
                transport(new FileInputStream(file), res.getOutputStream());

                return true;

            } catch (Exception e) {
                return false;
            }
    }

}
