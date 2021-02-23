package com.webapp.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sangs.support.SangsProperties;
import com.sangs.util.Aes_128;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;

/**
 * Description : 이메일 발송 유틸
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.04.01	wibo
 *
 */

public class EmailUtil {

	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 메일발송(템플릿 파일로 발송)
	 * @param toAddress
	 * @param subjectLine
	 * @param mailContent
	 * @param templateFileName
	 * @return
	 * @throws Exception
	 */
	public String sendEmail(String toAddress,  String emailTitle, Map<String, String> msgMap, String templateFileName, String senderAddress) {
		return sendEmail(toAddress, emailTitle, msgMap, templateFileName);
	}
	public String sendEmail(String toAddress, String emailTitle, Map<String, String> msgMap, String templateFileName) {
		ArrayList<String> address = new ArrayList<String>();
		address.add(toAddress);
		return sendEmail(address, emailTitle, msgMap, templateFileName); 
	}
	
	
	public String sendEmail(ArrayList<String> toAddressList, String emailTitle, Map<String, String> msgMap, String templateFileName) {
		return sendEmail(toAddressList, emailTitle, msgMap, templateFileName, "");
	}
	public String sendEmail(ArrayList<String> toAddressList, String emailTitle, Map<String, String> msgMap, String templateFileName, String senderAddress) { 
		String errMsg = "";
		try {
			
			String mailContent = this.getMailContent(msgMap, templateFileName);
			
			// 발송자 가 안넘어오면 시스템의 발송자 
			if(SangsUtil.isEmpty(senderAddress))
				senderAddress = SangsProperties.getProperty("Globals.emailSenderAddress");	//메일 발송시 보내는 사람 메일주소
			
			if(mailContent.equals("ERROR")) {
				errMsg = "메일 템플릿이 존재하지 않습니다.";
			} else {
				// 메일발송 처리
				boolean flag = this.sendEmailExec(toAddressList, emailTitle, mailContent, senderAddress);
				if(!flag) 
					errMsg = "발송 처리중에러가 발생하였습니다.";
			}
		
			
		} catch(Exception e) {
			
			errMsg = "처리중에러가 발생하였습니다.";
		}  
		return errMsg;
	} 
	

	
	/**
	 * 메일발송 수행
	 * @param toAddress
	 * @param subjectLine
	 * @param mailContent
	 * @return
	 * @throws Exception
	 */
	private boolean sendEmailExec(ArrayList<String> toAddressList, String emailTitle, String mailContent, String senderAddress) throws Exception {
		boolean flag = true;
		try {
			
	 
			
			
			
			
			 
			
			if(SangsProperties.getProperty("Globals.systemType").equals("real")){  //real 일때 만 메일 발송 
				//TODO 메일 발송 처리 
				
				//#####################메일발송 테스트는 서버구축후 테스트 진흥원에서 테스를 해봐야됨.
				
				//boolean debug = false;
				//String SMTP_HOST_NAME = SangsProperties.getProperty("Globals.emailSmtpHost");                // Properties 설정
				String emailSenderName = SangsProperties.getProperty("Globals.emailSenderName");                // Properties 설정
				
				//java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
				
				//Properties props = new Properties();
				//props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
				//props.put("mail.transport.protocol", "smtp");        
				//props.put("mail.smtp.starttls.enable","true");        
				//props.put("mail.smtp.host", "smtp.gmail.com");        
				//props.put("mail.smtp.auth", "true");          
				//props.put("mail.smtp.port", "587");
				//props.put("mail.smtp.port", "465");// gmail SMTP 서비스 포트 설정
				
				Properties props = System.getProperties();
	            props.put("mail.transport.protocol", "smtp");// 프로토콜 설정
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "465");// gmail SMTP 서비스 포트 설정
	            props.put("mail.smtp.starttls.enable","true"); //gmail 인증용
	            props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	            props.put("mail.smtp.auth", "true");// SMTP 인증을 설정
	            
				Authenticator auth = new Authenticator(){//계정name과 password 입력
					String user = SangsProperties.getProperty("Globals.mail.smtp.auth.user");
					String userKey = Aes_128.encrypt(user);
                	String passWord = SangsProperties.getProperty("Globals.mail.smtp.auth.pass");
                	String passWordKey = Aes_128.encrypt(passWord);

                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(userKey, passWordKey);
                    }
	            };
	            
				Session session = Session.getDefaultInstance(props, auth);          
				//session.setDebug(debug);          // create a message  
				for (int i = 0; i < toAddressList.size(); i++) {
					//MimeMessage msg = new MimeMessage(session);          // set the from and to address
					//msg.setFrom(new InternetAddress(senderAddress));// 보내는 사람
					//msg.setSubject(emailTitle); 	// 메일 제목
					//msg.setText(mailContent, "UTF-8", "html"); //내용
					//msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddressList.get(i)));//받는사람
					//Transport.send(msg);
					InternetAddress receiver = null;
					receiver = new InternetAddress(toAddressList.get(i));
					Message msg = new MimeMessage(session);
					 msg.setFrom(new InternetAddress(senderAddress, emailSenderName));
					 msg.setRecipient(Message.RecipientType.TO, receiver);
					 msg.setSubject(emailTitle);
					 msg.setSentDate(new Date());
	                 msg.setText(mailContent);
	                 msg.setHeader("Content-Type", "text/html; charset=utf-8");
	                    msg.setHeader("X-Mailer", "edailyedu");
	                    // 메일 전송
	                 Transport.send(msg);
				}
				
			} else {
			}
		
			  
		} catch(Exception e) {
			flag = false;
		}
		return flag;
	}
	
	 

	/**
	 * 메일 콘텐츠 얻기 
	 * @param toAddress
	 * @param subjectLine
	 * @param mailContent
	 * @param templateFileName
	 * @return
	 * @throws Exception
	 */
	public String getMailContent(Map<String, String> msgMap, String templateFileName) throws Exception { 
		
		BufferedReader in = null;
		String mailContent="";
		try {
				// 메일 템플릿 파일
				//임시용 2015-03-19 - 김학규
				templateFileName = "temple.html";
				
				templateFileName = StringUtil.getContentReplace(templateFileName);
				String templFullPath = SangsProperties.getProperty("Globals.emailBasePath")  + templateFileName;
				String eTemplFullPath = templFullPath;
				
				File templeteFile = new File(eTemplFullPath); 
				StringBuffer sb = new StringBuffer();
				
				if(templeteFile.isFile()) {
					 	
					in = new BufferedReader(new FileReader(templeteFile));
					
					String str = "";
					
					while((str = in.readLine()) != null) {	
						sb.append(str).append("\n");
					}
					
					mailContent = sb.toString();
					//######  TEST 용 
					msgMap.put("#IMG_BASE_URL#", SangsProperties.getProperty("Globals.domain"));
					msgMap.put("#MAIN_LINK#",SangsProperties.getProperty("Globals.domain")+"/front/main/main.do");//메인
					//###### TEST 용
					
					
					Iterator<?> it = msgMap.entrySet().iterator();
					while(it.hasNext()){
						Entry<?,?> ent = (Entry<?,?>)it.next();
						String key = (String)ent.getKey();
						String value = (String)ent.getValue();
						
						
						mailContent = SangsUtil.replaceAll(mailContent, key, value);
					}	 
					
					
			 
				} else {
					mailContent = "ERROR";
				}
				
				
			} catch (RuntimeException e) {
				throw e;
	        } catch(Exception e) {
				throw e;
			} finally {
				if(in != null)
					try {in.close(); } catch(Exception ex) { }
	 		}
			
		return mailContent;
	}
	
	
	
	 
	

	
}
