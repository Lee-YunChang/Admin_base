<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "com.sangs.session.UserSessionManager" %>
<%@ page import = "com.sangs.session.UserSessionVO" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "java.util.Enumeration" %>

<h4>session.getId() : <%=session.getId()%></h4>
<%
Enumeration enumeration = session.getAttributeNames();
String tempStr = "";
String Val = "";
while (enumeration.hasMoreElements()) {
	tempStr = (String) enumeration.nextElement();
	Object obj = session.getAttribute(tempStr);
%>
	<br><br> * <%=tempStr %> : <%=obj.toString() %>
	
<%
}
%>