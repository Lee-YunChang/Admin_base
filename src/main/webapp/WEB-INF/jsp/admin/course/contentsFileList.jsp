<%
/*********************************************************
system 	: 온라인교제
title	: 차시콘텐츠 목록조회
사용jar	: commons-fileupload-1.2.jar, commons-io-1.3.1.jar
**********************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sangs.support.ContentFileManager" %>

<%
	String contentsRootPath = request.getParameter("contentsRootPath");
	String filePath = request.getParameter("filePath"); 
	String treeFilePath = request.getParameter("treeFilePath"); 
	
	
	ContentFileManager contentFileManager = new ContentFileManager();
	List<EduMap> fileList = new ArrayList<EduMap>(); 
	fileList = contentFileManager.fileList(contentsRootPath +"/"+treeFilePath, fileList, "");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title>contents</title>
<meta content="text/html; charset=utf-8" http-equiv="content-type">
<link rel="stylesheet" href="/admin/common/jqtree/jquery.treeview.css" />
<link rel="stylesheet" href="/admin/common/jqtree/screen.css" />
<script src="/admin/common/jqtree/lib/jquery.js" type="text/javascript"></script>
<script src="/admin/common/jqtree/lib/jquery.cookie.js" type="text/javascript"></script>
<script src="/admin/common/jqtree/jquery.treeview.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#browser").treeview({
		toggle: function() {
			console.log("%s was toggled.", $(this).find(">span").text());
		}
	});
});
</script>

</head>
<body>

<ul id="browser" class="filetree treeview-famfamfam">
	<li>
	<span class="folder"><%=StringUtil.getContent(treeFilePath)%></span>
	<ul>
	<%
	String path = "";
	List rootFileList = new ArrayList();
	for (int i=0; i<fileList.size(); i++) {
		EduMap map = fileList.get(i);
		
		if (map.getString("PATH").equals("")) {
			EduMap rootFileMap = new EduMap();
			rootFileMap.put("NAME", map.getString("NAME"));
			rootFileMap.put("PATH", map.getString("PATH"));
			rootFileMap.put("SIZE", map.getInt("SIZE"));
			rootFileMap.put("DT", map.get("DT"));
			rootFileList.add(rootFileMap);
		}
		
		
		
		if (!map.getString("PATH").equals("")) {
			
			if (!path.equals(map.getString("PATH")) && !path.equals("")) out.print("</ul></li>");
			if (!path.equals(map.getString("PATH"))) out.print("<li class='closed'><span class='folder'>"+map.getString("PATH")+"</span><ul>");
	%>
	
					<table width="100%" border="0">
						<tr>
							<td width="*"> 
								<span class="file">
								<a href="<%=StringUtil.getContent(filePath)%>/<%=StringUtil.getContent(treeFilePath)%>/<%=StringUtil.getContent(map.getString("PATH")) %>/<%=StringUtil.getContent(map.getString("NAME")) %>" target="_blank"><%=StringUtil.getContent(map.getString("NAME")) %></a>
								</span> 
							</td>
							<td width="100" align="right"><%=NumberFormatUtil.toString(map.getInt("SIZE"))%> KB</td> 
							<td width="180" align="center"><%=StringUtil.getContent(map.getString("DT"))%></td>
						</tr>
					</table>

	<%
			path = map.getString("PATH");
		}
	}
	%>
	</ul></li>
	
		<%
		
		for (int i=0; i<rootFileList.size(); i++) {
			EduMap map = (EduMap)rootFileList.get(i);
		%>
		
			<table width="100%" border="0">
				<tr>
					<td width="*"> 
						<span class="file">
						<a href="<%=StringUtil.getContent(filePath)%>/<%=StringUtil.getContent(treeFilePath)%>/<%=StringUtil.getContent(map.getString("PATH")) %>/<%=StringUtil.getContent(map.getString("NAME")) %>" target="_blank"><%=StringUtil.getContent(map.getString("NAME")) %></a>
						</span> 
					</td>
					<td width="100" align="right"><%=NumberFormatUtil.toString(map.getInt("SIZE"))%> KB</td> 
					<td width="180" align="center"><%=StringUtil.getContent(map.getString("DT"))%></td>
				</tr>
			</table>
		<%}%>

	
	</ul>
	</li>
</ul>
</body>
</html>