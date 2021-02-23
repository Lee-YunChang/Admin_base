 <%--
	Description : 파일다운로드
	Modification Information
	수정일         수정자            수정내용
	-------    	--------    ---------------------------
	2014.09.01   soundheaven1			최초생성 
--%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%@ page import="org.springframework.util.FileCopyUtils" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.sangs.util.SangsUtil" %>
<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
  

<%@ page import="com.sangs.support.SangsProperties" %>
<%

	Log log = LogFactory.getLog(this.getClass());	
	String msg = "";
	
	try {
		Map params = (Map)request.getAttribute("REQUEST_DATA");
		String globarsName = "Globals.downFileRootPath";
		String encYn = "";		// 암호화 여부 
		String filepath = "";
		String stordFilePath = "";

		String filename = params.get("filename").toString();
		String orgfilename = params.get("orgfilename").toString();
		
		if(params.get("downType") == null || "".equals((String)params.get("downType")) || "att".equals((String)params.get("downType")) ) { 
			// 일반적인 첨부 파일 경로 일경우
			stordFilePath = SangsProperties.getProperty(globarsName) + filepath + "/";
			
			
		} else  if( "sd".equals(params.get("downType")))  { 
			// sample download 일때
			stordFilePath = SangsProperties.getProperty("Globals.downFileRootPath")+"/";
		} else  if( "md".equals(params.get("downType")))  {
			stordFilePath = request.getSession().getServletContext().getRealPath("/") + "manual_down/";
			
		}
		
		stordFilePath = stordFilePath.replace("&","");
		filename = filename.replace("&","");
		File uFile = new File(SangsUtil.removeJumpDir(stordFilePath), SangsUtil.removeJumpFileName(filename)); 
	 
		int fSize = (int)uFile.length();

		if (fSize > 0) {
			
			String mimetype = "application/x-msdownload";
		
			//response.setBufferSize(fSize);	// OutOfMemeory 발생
			response.setContentType(mimetype);
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
			setDisposition(orgfilename, request, response);
			response.setContentLength(fSize);
		 
			BufferedInputStream in = null;
			BufferedOutputStream bout = null;
			
		
			out.clear();
			out=pageContext.pushBody();
			
			try {
			    in = new BufferedInputStream(new FileInputStream(uFile));
			    bout = new BufferedOutputStream(response.getOutputStream());
			    FileCopyUtils.copy(in, bout);
			    bout.flush();
			} catch (Exception ex) {
				System.err.printf("IOException Occured");
			    // 다음 Exception 무시 처리
			    // Connection reset by peer: socket write error
			    //log.error(ex.getMessage());
			} finally {
			    if (in != null) {
					try {
					    in.close();
					} catch (Exception ignore) {
						System.err.printf("IOException Occured");
						//log.error(ignore.getMessage());
					}
			    }
			    if (bout != null) {
					try {
					    bout.close();
					} catch (Exception ignore) {
						System.err.printf("IOException Occured");
						//log.error(ignore.getMessage());
					}
			    }
			}
			
		} else {
			// 파일이 존재 안함
			msg = "파일이 존재 하지 않습니다.";
			
		}

	} catch(Exception ex) {
		log.error(ex.getMessage());
		msg = "파일이 존재 하지 않습니다.2";
	}
%>




<%!
   /**
     * 브라우저 구분 얻기.
     * 
     * @param request
     * @return
     */
    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
    
    /**
     * Disposition 지정하기.
     * 
     * @param filename
     * @param request
     * @param response
     * @throws Exception
     */
    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);
		
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		
		if(filename != null) {
			if (browser.equals("MSIE")) {
			    encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Firefox")) {
			    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
			    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
			    StringBuffer sb = new StringBuffer();
			    for (int i = 0; i < filename.length(); i++) {
					char c = filename.charAt(i);
					if (c > '~') {
					    sb.append(URLEncoder.encode("" + c, "UTF-8"));
					} else {
					    sb.append(c);
					}
			    }
			    encodedFilename = sb.toString();
			} else {
			    throw new IOException("Not supported browser");
			}
		}		
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
	
		if ("Opera".equals(browser)){
		    response.setContentType("application/octet-stream;charset=UTF-8");
		}
    }
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="Ko" lang="Ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File down load</title>
<script language="javascript" type="text/javascript">
	if('<%=msg%>' != '') {
		alert('<%=msg%>');
	}
</script>
</head>
<body>
</body>
</html>
  