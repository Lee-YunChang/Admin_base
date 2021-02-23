package com.sangs.util;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sangs.support.SangsProperties;
public class MailUtil {
  
 
  /**
   * Send Email
   * @param str
   * @return
   * @throws UnsupportedEncodingException 
   */
  public static boolean sendEmail(Map<String, Object> map) throws AddressException, MessagingException, UnsupportedEncodingException{
     
    //Properties 설정
      Properties props = new Properties();
        props.setProperty("mail.transport.protocol", SangsProperties.getProperty("Globals.mail.transport.protocol")); // 프로토콜 설정
        props.setProperty("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host")); // 메일서버 host 설정
        props.setProperty("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port")); // 메일서버 port 설정
        //gmail 에서는 tls 가 필수가 아니므로 안해도 된다.
        props.put("mail.smtp.starttls.enable", SangsProperties.getProperty("Globals.mail.smtp.starttls.enable"));
        
        //gmail 에서 인증때 사용함으로 필수로 해주자.
        props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        
        //props.put("mail.smtp.user",from);
        props.put("mail.smtp.auth",  SangsProperties.getProperty("Globals.mail.smtp.auth")); // SMTP 인증 설정

       /*
        * SMTP 인증이 필요한 경우 반드시 Properties 에 SMTP 인증을 사용한다고 설정해야 한다.
        * 그렇지 않으면 인증을 시도조차 하지 않는다.
        * 그리고 Authenticator 클래스를 상속받은 SMTPAuthenticator 클래스를 생성한다.
        * getPasswordAuthentication()메소드만 override하면 된다.
        * 
        * */
        
        
        Authenticator auth = new SMTPAuthenticator((String)map.get("auth_id"),(String)map.get("auth_pw"));
        
        Session mailSession = Session.getDefaultInstance(props, auth);
        mailSession.setDebug(true);
        
        //create a message
        MimeMessage message = new MimeMessage(mailSession);
    
        
        
        try {
          message.setFrom(new InternetAddress((String)map.get("fromUser"), "인권교육센터 담당자"));
          //message.setFrom(new InternetAddress((String)map.get("fromUser"), MimeUtility.encodeText((String)map.get("auth_name"), "euc-kr", "B")));
          //message.setFrom(new InternetAddress(fromUser , MimeUtility.encodeText("aaaaaaaa", "UTF-8", "B")));
    
          message.addRecipient(Message.RecipientType.TO,new InternetAddress((String)map.get("toUser")));//받는사람
          
          message.setSubject((String)map.get("subject"));//제목설정
          message.setText((String)map.get("content"));//내용설정
          message.setSentDate(new Date());
          Transport.send(message);
        } catch (AddressException e) {
      
      return false;
    } catch (MessagingException e) {
      // TODO Auto-generated catch block
      
      return false;
    }//보내는사람
    return true;
    }   
  
}
