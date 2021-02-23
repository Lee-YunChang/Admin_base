<%@ page import="java.io.File" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%
		String fileName = request.getParameter("filename"); 	// course_exam_sample.xls
		
		String filePath = request.getParameter("filepath"); 	// edu-data/download;
		String realFilePath = request.getParameter("realFilePath"); // /home/sangs/webapp/EDU_DATA/upload/temp
		
		 if (request.getAttribute("fileInfo") != null) {
			Map<String, String> fileInfo = (Map<String, String>) request.getAttribute("fileInfo");
			fileName = fileInfo.get("filename");
			realFilePath = fileInfo.get("realFilePath");
		}
		
		if (realFilePath != null && !"".equals(realFilePath)) {
			realFilePath = realFilePath + "\\" + fileName;
			
		} else {
			
			/* ServletContext context = getServletContext();
			String realFolder = context.getRealPath(filePath);
			realFilePath = realFolder + "\\" + fileName; */
			realFilePath = SangsProperties.getProperty("Globals.downFileRootPath")+"/"+fileName;
		} 
		
		                
		  
		
		FileInputStream is = null;
		ServletOutputStream sos = null;
		out.clear();
		out = pageContext.pushBody();
		
		try {
			
			
			File file = new File(realFilePath);
			
			byte b[] = new byte[4096];
			
			response.reset();
			response.setContentType("application/octet-stream");
			
			String Encoding = fileName;
			//Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
			response.setHeader("Content-Disposition", "attatchment; filename = " + Encoding);
			
			is = new FileInputStream(realFilePath);
			sos = response.getOutputStream();
			
			int numRead;
			while((numRead = is.read(b,0,b.length)) != -1) {
		sos.write(b,0,numRead);
			}

			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
		if (sos != null ) { sos.flush(); sos.close(); }
		if (is != null) is.close();
			} catch (Exception ex) {}
			
		}
	%>	
