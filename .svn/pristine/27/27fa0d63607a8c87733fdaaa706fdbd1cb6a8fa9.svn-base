package com.sangs.session;

import java.util.Enumeration;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sangs.support.SangsProperties;

/**
 * Description : 세션바인딩 리스터(중복로그인제어처리)
 *
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.08.25  wibo				수정
 *
 */

public class SessionManager implements HttpSessionListener, HttpSessionBindingListener {

    private static SessionManager sessionManager;

    private static ConcurrentHashMap<String, HttpSession> loginSessionFrontMap = new ConcurrentHashMap<String, HttpSession>();

    public final static int SESS_RCODE_PASS = 100;
    public final static int SESS_RCODE_DOUBLE = -1;

    protected Log log = LogFactory.getLog(this.getClass());

    public SessionManager() {
        super();
    }



    public static ConcurrentHashMap<String, HttpSession> getLoginSessionFrontMap() {
        return loginSessionFrontMap;
    }



    public static void setLoginSessionFrontMap(
            ConcurrentHashMap<String, HttpSession> loginSessionFrontMap) {
        SessionManager.loginSessionFrontMap = loginSessionFrontMap;
    }



    /**
     * 싱글톤방식 인스턴트
     * @return
     */
    public static synchronized SessionManager getInstance(){
        if (sessionManager == null) {
            sessionManager = new SessionManager();
        }
        return sessionManager;
    }

    public void sessionCreated(HttpSessionEvent event){
        // 필수 구현 메서드
    }

    public void valueBound(HttpSessionBindingEvent event) {
        // 필수 구현 메서드
    }

    public void sessionDestroyed(HttpSessionEvent event) {
        HttpSession session = event.getSession();


        try {
            UserSessionVO userVo = (UserSessionVO)session.getAttribute(SangsProperties.getProperty("Globals.loginSessionNm"));
            loginSessionFrontMap.remove(userVo.getUserId());
        } catch(Exception ex){   }

    }

    public void valueUnbound(HttpSessionBindingEvent event) {
        // 필수 구현 메서드
    }



    public void setLoginSessionFront(HttpServletRequest req, String userId) {
        HttpSession session = req.getSession();
        loginSessionFrontMap.put(userId, session);
    }



    public int executeFrontSessionCheck(HttpServletRequest req) {
        int result = 0;

        if (SangsProperties.getProperty("Globals.frontDupLoginCheckYn").equals("N")) {
            return result;
        }

        try {
            HttpSession reqSession = req.getSession();
            UserSessionVO reqVo = UserSessionManager.getUserSessionVO(req);
            if(reqVo != null) {
                HttpSession mapSession = (HttpSession)loginSessionFrontMap.get(reqVo.getUserId());

                if (mapSession != null && !(reqSession.getId()).equals(mapSession.getId())) {
                    // 세션id가 틀리다면
                    result = SESS_RCODE_DOUBLE;
                    // 세션정보를 제거 한다.
                    UserSessionManager.deleteUserSessionVO(req);
                }
            }
            return result;
        } catch(Exception ex){
            return result;
        }

    }

    public static ConcurrentHashMap<String, HttpSession> getLoginSessionMap() {

        Object key = new Object();

            Enumeration enumeration = loginSessionFrontMap.elements();
            while (enumeration.hasMoreElements()) {

                try {
                    key = enumeration.nextElement();
                    HttpSession session = loginSessionFrontMap.get(key);
                    if (session == null) loginSessionFrontMap.remove(key);
                } catch (Exception ex){
                    loginSessionFrontMap.remove(key);
                }
            }


        return loginSessionFrontMap;
    }

}
