package com.webapp.admin.ctrl;

import java.util.ArrayList;
import java.util.List;
 


import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 


import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
@ServerEndpoint(value="/websocket/chat/echo.do" )
public class WebSocketChatController {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChatController.class);
    
    
    public WebSocketChatController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    
    @RequestMapping(value="/chat.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("chat");
        return mav;
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        	
        try {
            final Basic basic=session.getBasicRemote();
//            basic.sendText("관리자에게 문의해주시기 바랍니다.");
            
            
            
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
        
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self,String message) {
        try {
        
            for(Session session : WebSocketChatController.sessionList) {
                if(!self.getId().equals(session.getId())) {
//                    session.getBasicRemote().sendText(message.split(",")[1]+" : "+message);
                    session.getBasicRemote().sendText(message);
                }
            }
            
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    @OnMessage
    public void onMessage(String message,Session session) {
    	logger.info(message);
        logger.info("Message From "+message.split(",")[1] + ": "+message.split(",")[0]);
        String[] messageSplit = message.split(",");
        String sender = null;        	
        String msg = null;
        String recipient = null;

        try {
        	
        	for(int i = 0; i < messageSplit.length; i++) {
        		sender = messageSplit[1];
        		msg = messageSplit[0];
        	}
        	
        	if(msg.contains("script")) {
        		msg = "스크립트는 사용불가능합니다.";
        	}
        	
            final Basic basic=session.getBasicRemote();
            basic.sendText(sender + " : " + msg);
//            System.out.println(" :::: 보내는이 :::: " + sender + ":::: 내용 :::: " + msg);
            
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        
        recipient = sender + " : " + msg;
        sendAllSessionToMessage(session, recipient);
        
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}

