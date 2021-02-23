package com.sangs.support;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * HTTP, HTTPS 세션 공유
 * 
 * @author kss
 *
 */

public class HttpsRequestWrapper extends HttpServletRequestWrapper {

    private HttpServletResponse response = null;
    private final String JSESSIONID = "JSESSIONID";


    public HttpsRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public HttpSession getSession() {
        HttpSession session = super.getSession();
        processSessionCookie(session);
        return session;

    }

    public HttpSession getSession(boolean create) {
        HttpSession session = super.getSession(create);
        processSessionCookie(session);
        return session;
    }

    private void processSessionCookie(HttpSession session) {
        if (session == null || response == null) {
            return;
        }

        Object cookieOverWritten = getAttribute("COOKIE_OVERWRITTEN_FLAG");

        if (cookieOverWritten == null && isSecure() && isRequestedSessionIdFromCookie() && session.isNew()) {
        	String acctID = session.getId();
        	//계정 유효성 점검
        	if(acctID == null || "".equals(acctID)) return;
        	String filtered_ID = acctID.replaceAll("\r", "");
            Cookie cookie = new Cookie(JSESSIONID, filtered_ID);
            cookie.setMaxAge(-1);
            String contextPath = getContextPath();

            if (contextPath != null && contextPath.length() > 0) {
                cookie.setPath(contextPath);
            } else {
                cookie.setPath("/");
            }
            cookie.setSecure(true);
            response.addCookie(cookie);
            setAttribute("COOKIE_OVERWRITTEN_FLAG", "true");
        }
    }
}
