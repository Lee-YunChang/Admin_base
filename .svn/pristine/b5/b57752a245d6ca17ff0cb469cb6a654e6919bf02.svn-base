package com.webapp.admin.ctrl;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.FrontException;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.EgovFileUploadUtil;
import com.sangs.util.EgovFormBasedFileVo;
import com.sangs.util.Mail;
import com.sangs.util.ParamUtil;
import com.sangs.util.RandomUtil;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.admin.mapper.AdminBoardMapper;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.classdesk.service.ClassdeskTutorResultService;
import com.webapp.common.component.EmsManager;
import com.webapp.common.service.CommonSendMailService;
import com.webapp.common.service.CommonSendMsgService;
import com.webapp.common.vo.SendMailVO;

/**
 * 
 * Description : 관리자 공통 관련 컨트롤러
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Controller
public class AdminCommonController {
	
	private Session         session = null;
	
    private Logger log = LogManager.getLogger(this.getClass());
    
    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "commonSendMailService")
    private CommonSendMailService commonSendMailService;
    

    @Resource(name = "commonSendMsgService")
    private CommonSendMsgService  commonSendMsgService;
    
    @Resource(name = "adminBoardMapper")
    private AdminBoardMapper     adminBoardMapper;
    
    @Resource(name = "classdeskTutorResultService")
    private ClassdeskTutorResultService classdeskTutorResultService;
    
    @Resource(name = "emsManager")
    private EmsManager emsManager;

    /**
     * 메일발송 폼
     * 
     * @date	: 2016. 5. 31.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일발송 폼
    @RequestMapping(value = "/admin/common/mailForm.do")
    public String mailForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메일탬플릿조회
        	rMap.setString("tplUid", SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));
        	request.setAttribute("emailTplMap",  adminCommonService.getEmEmailTplInfo(rMap));
         	
         	// 발송자정보 조회
         	List tempList = adminCommonService.getSyEmailSenderInfo(rMap);
         	
         	String[] emailInfo = request.getParameterValues("msg_user");
         	request.setAttribute("emailInfo", emailInfo);
         	
         	//메일주소조회
//        	request.setAttribute("emailInfo",  adminCommonService.getEmEmailTplInfo(rMap));
         	
        	if(tempList.size()>0){
        		for(int i=0; i<tempList.size(); i++){
        			EduMap tempMap = (EduMap)tempList.get(i);
        			if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDNAME").equals(tempMap.getString("MT_SUB_CODE"))){
        				rMap.setString("sendName", tempMap.getString("MT_SUB_NAME"));
        			}
        			else if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDADDR").equals(tempMap.getString("MT_SUB_CODE"))){
        				rMap.setString("sendAddr", tempMap.getString("MT_SUB_NAME"));
        			}
        		}
        		
        	}
        	rMap.setString("writerIp", request.getRemoteAddr());
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/mail_form";
    }
    
    /**
     * 메일발송 폼(과정관리 > 과정운영관리 > 진행관리)
     * 
     * @date	: 2016.10.12
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일발송 폼
    @RequestMapping(value = "/admin/common/mailForm2.do")
    public String mailForm2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메일탬플릿조회
        	rMap.setString("tplUid", SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));
        	request.setAttribute("emailTplMap",  adminCommonService.getEmEmailTplInfo(rMap));
         	
         	// 발송자정보 조회
         	List tempList = adminCommonService.getSyEmailSenderInfo(rMap);
        
         	if(rMap.getString("chkMtCtypeCode").equals("DAAA01")){
         		rMap.setString("targetYn","Y");
         	}
         	//메일주소조회
        	request.setAttribute("emailInfo",  adminCommonService.getLeCourseUserList(rMap));
         	
         	
        	if(tempList.size()>0){
        		for(int i=0; i<tempList.size(); i++){
        			EduMap tempMap = (EduMap)tempList.get(i);
        			if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDNAME").equals(tempMap.getString("MT_SUB_CODE"))){
        				rMap.setString("sendName", tempMap.getString("MT_SUB_NAME"));
        			}
        			else if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDADDR").equals(tempMap.getString("MT_SUB_CODE"))){
        				rMap.setString("sendAddr", tempMap.getString("MT_SUB_NAME"));
        			}
        		}
        		
        	}
        	rMap.setString("writerIp", request.getRemoteAddr());
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/mail_form2";
    }
    
    /**
     * 메일발송 폼
     * 
     * @date	: 2016. 5. 31.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일발송 폼
    @RequestMapping(value = "/admin/common/mailForm3.do")
    public String mailForm3(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메일탬플릿조회
        	rMap.setString("tplUid", SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));
        	request.setAttribute("emailTplMap",  adminCommonService.getEmEmailTplInfo(rMap));
         	
         	// 발송자정보 조회
         	List tempList = adminCommonService.getSyEmailSenderInfo(rMap);
         	if(rMap.getString("usernoArr").length() > 0){
        		String[] usernoArr = rMap.getString("usernoArr").split("[,]");
        		rMap.set("usernoArr", usernoArr);
        		if(usernoArr.length > 0) {
        			request.setAttribute("emailInfo",  adminCommonService.getSyEmailSenderInfo2(rMap));
        		}
        	}
         	//메일주소조회
        	
         	
        	if(tempList.size()>0){
        		for(int i=0; i<tempList.size(); i++){
        			EduMap tempMap = (EduMap)tempList.get(i);
        			if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDNAME").equals(tempMap.getString("MT_SUB_CODE"))){
        				rMap.setString("sendName", tempMap.getString("MT_SUB_NAME"));
        			}
        			else if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDADDR").equals(tempMap.getString("MT_SUB_CODE"))){
        				rMap.setString("sendAddr", tempMap.getString("MT_SUB_NAME"));
        			}
        		}
        		
        	}
        	rMap.setString("writerIp", request.getRemoteAddr());
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/mail_form3";
    }
    
    /**
     * 메일발송 - 회원관리
     * 
     * @date	: 2016. 5. 31.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일발송 - 회원관리
    @RequestMapping(value = "/admin/common/mailExec.do")
    public String mailExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

    	/* 메일 로그 등록 */
  		int seq = commonSendMailService.getMaxMailSeq(rMap);
  		rMap.setInt("seq", seq); 
  		commonSendMailService.insertMailLog(rMap);
  		
  		/* 메일 로그 상세 등록 */
  		String[] receiver_list = request.getParameterValues("receiver_list"); // 메일 팝업창의 수신자 목록
  		
  		ArrayList<String> syMailLogRecList = new  ArrayList<String>(); 
  		for(int i = 0 ; i < receiver_list.length ; i++) {  
  			syMailLogRecList.add(receiver_list[i].trim()); 
  		}
  		
  		String usernoArr = request.getParameter("usernoArr");
     	String[] userno = usernoArr.split(","); 
  		for(int j = 0 ; j < receiver_list.length ; j++) { // 메일 팝업창의 수신자 목록
			for(int i = 0 ; i < userno.length ; i++) {//목록에서 선택한 수신자 목록
				rMap.setString("usernoArr", userno[i]);
				rMap.setString("onlyMailGrp", "Y");
				EduMap checkedReceiverList = adminCommonService.getCheckedReceiverList(rMap);
				if(checkedReceiverList != null){//이메일 정보가 있다면
					String email = (String) checkedReceiverList.get("EMAIL");
					if(receiver_list[j].trim().equals(email.trim())) {
						int recSeq = commonSendMailService.getMaxMailSeqRec(rMap);
						rMap.setInt("recSeq", recSeq); 
						rMap.setString("userName",(String) checkedReceiverList.get("MBERNM"));
						rMap.setString("userId",(String) checkedReceiverList.get("UNITY_ID"));
						rMap.setString("email",receiver_list[j].trim());
						syMailLogRecList.remove(receiver_list[j].trim()); // 메일 팝업창의 수신자 목록에서 과정 등록한 학생 목록 제거(팝업창에 직접 입력한 이메일만 남음)
						commonSendMailService.insertMailLogRec(rMap);
					}
				} 
				 
			}
  		}
  		
  		for(int i = 0 ; i < syMailLogRecList.size() ; i++) {  // 팝업창에 직접 입력한 이메일 
  			int recSeq = commonSendMailService.getMaxMailSeqRec(rMap);
			rMap.setInt("recSeq", recSeq); 
			rMap.setString("userName","");
			rMap.setString("userId","");
  			rMap.setString("email", syMailLogRecList.get(i));
  			commonSendMailService.insertMailLogRec(rMap);
  		}
       
  		/* 메일 보내기 */
  		int successCnt = 0;
  		int failCnt = 0;
  		if(receiver_list.length > 0) {
  			
		     
  			for(int j=0;j<receiver_list.length;j++) {
  				
  				res.setContentType("text/html; charset=utf-8");
  				PrintWriter out = res.getWriter();
  				Gson gson = new Gson();
  				String json = null;
  				
  				Properties p = new Properties();
  				p.put("mail.smtp.user", SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // Google계정@gmail.com으로 설정
  				p.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
  				p.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
  				p.put("mail.smtp.starttls.enable","true");
  				p.put( "mail.smtp.auth", "true");
  				
  				p.put("mail.smtp.debug", "true");
  				
  				try {
  					
  					rMap.setString("receive_email",receiver_list[j]);
  					
  					SendMailVO mailVo = new SendMailVO();
  			        mailVo.setRecEmail(rMap.getString("receive_email"));
  			        mailVo.setReceiver_alias("수신자");
  			        mailVo.setRecUserid(rMap.getString("userId"));
  			        mailVo.setRecUsername(rMap.getString("userName"));
  			        
  			        String userHostAddr = getUserHostAddress();
	  		        mailVo.setTitle(rMap.getString("subject")); // 제목
	  		        mailVo.setContent(rMap.getString("content")); // 내용
	  		        mailVo.setSender("sendmail@kinfa.or.kr"); // 발송자 메일주소
	  		        mailVo.setSender_alias("서민금융진흥원"); // 발송자 이름
	  		        mailVo.setWriterIp(userHostAddr);
	  		        mailVo.setWriterUserid("admin");
	  		        
	  		        List<SendMailVO> sendList = new ArrayList<SendMailVO>(); // 메일 발송 관련 Vo  
	  		      
	  		        sendList.add(mailVo); // 리스트객체에 담기
	  		        
		  		      for (int i = 0; i < sendList.size(); i++) {
	
		                  SendMailVO vo = sendList.get(i);
	
		                  mailSend(vo);
		  		      }
			        
  					rMap.setString("receive_email",receiver_list[j]);
  	                
  					String from_mail = SangsProperties.getProperty("Globals.mail");
  					String from_user = SangsProperties.getProperty("Globals.mail.username");
  					
  					Mail mail = new Mail();
  					mail.setFrom(from_mail,from_user);
  					mail.setSubject(rMap.getString("subject"));//메일 제목
  					mail.setHtmlContent(rMap.getString("content"));//메일 내용
  					mail.setRecipient(receiver_list[j].trim()); //수신자 메일 주소
  					
  					Multipart mp = new MimeMultipart();
  			        MimeBodyPart mbp1 = new MimeBodyPart();
  			        mbp1.setContent(StringUtil.getContent2(rMap.getString("content")), "text/html;charset=utf-8");
  			        mp.addBodyPart(mbp1);
  			        
  			        if (ServletFileUpload.isMultipartContent(request)) {
  			            FileUploadUtil uploadUtil = new FileUploadUtil();
  			            String path = request.getParameter("UPLOAD_DIR").toString();
  			            request.setAttribute("UPLOAD_DIR", path);
  			            if(rMap.getString("increaseFileSize").equals("Y")) {
  			            	int ADDFILE_MAXSIZE = 1024 * 1024 * 1000;
  			            	rMap.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), ADDFILE_MAXSIZE));
  			            } else {
  			            	rMap.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
  			            }
  			        }
  					
  			        
  			        int fileCnt = rMap.getInt("UPLOAD_FILE_CNT");    		
  			        for (int i = 0; i < fileCnt; i++) {
  			            DataMap fileMap = (DataMap)rMap.get("UPLOAD_FILE");
  	  			        String filename = fileMap.get("uploadFileFulltPath", i).toString()+ "/" +fileMap.get("uploadFileSaveName", i).toString();
  	  			        
  	  			        if(filename != null){
  	  			            if(fileSizeCheck(filename)){
  	  			                MimeBodyPart mbp2 = new MimeBodyPart();
  	  			                FileDataSource fds = new FileDataSource(filename);
  	  			                mbp2.setDataHandler(new DataHandler(fds));
  	  			                mbp2.setFileName(MimeUtility.encodeText(fileMap.get("uploadFileOrgName", i).toString(), "UTF-8", "B"));
  	  			                mp.addBodyPart(mbp2);
  	  			            }else{
  	  			                throw new Exception("파일 전송 최대 사이즈를 초과하였습니다.");
  	  			            }
  	  			        }
  			        }
  			        
  			        if(fileCnt == 0){
  			        	String str3=rMap.getString("content").replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
  			        	mailVo.setContent(str3); // 내용
  			        	DataMap mailTplMap = new DataMap();
  			        	mailTplMap.putString("SEQ1", mailVo.getContent());//내용
  			        	mailTplMap.set("TPL_UID", "3");
  	  		            emsManager.sendMailProc2(mailTplMap, mailVo);
  	  					
  	  					rMap.setString("success_flag", "Y");
  	  					request.setAttribute("REQUEST_DATA", rMap);
  			        } else if(fileCnt > 0){
  			        	// 1. 운영서버에서 발송---------------------------------
  			        	mail.setContent(mp); 
	  		      		mail.send();
  			        }
  			        // 2. 테스트서버에서 발송 ---------------------------------
  			        /*Authenticator auth = new SMTPAuthenticator();
  			        Properties p = new Properties();
			        p.put("mail.smtp.user", "hde1026@gmail.com");
			        p.put("mail.smtp.host", "smtp.gmail.com");
	  		      	p.put("mail.smtp.port", "587");
	  		      	p.put("mail.smtp.starttls.enable","true");
	  		      	p.put("mail.smtp.auth", "true");
	  		      	p.put("mail.smtp.debug", "true");
	  		      	p.put("mail.smtp.socketFactory.port", "587"); 
	  		      	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	  		      	p.put("mail.smtp.socketFactory.fallback", "false");
  			        
	  		      	Session session = Session.getInstance(p, auth);
  			        session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
  			        MimeMessage msg = new MimeMessage(session);
  			        
	  		      	Address fromAddr = new InternetAddress("rnehdfla12@gmail.com"); // 보내는 사람의 메일주소
	                msg.setFrom(fromAddr);
	                Address toAddr = new InternetAddress(receiver_list[j]);  // 받는 사람의 메일주소
	                msg.addRecipient(Message.RecipientType.TO, toAddr); 
	                
	                msg.setSubject(rMap.getString("subject"));
	                msg.setContent(mp);
	                Transport.send(msg);*/
	                
	  		      	// 끝 ---------------------------------
	  			      
  					rMap.setString("success_flag", "Y");
  					request.setAttribute("REQUEST_DATA", rMap);
  					
  				} catch (Exception e) {
  						rMap.setString("success_flag", "N");
  						rMap.setString("fail_content", e.getMessage());
  						
  				}	
  				
  				String success_flag = (String) rMap.getString("success_flag");
  				
  				if ("Y".equals(success_flag)) {
  				  successCnt++;
  				} else {
  				  failCnt++;
  				}
  			}
  		}
  		
		return "admin/cmmn/mail_exec";
    }
    
    private static class SMTPAuthenticator extends javax.mail.Authenticator {
    	  public PasswordAuthentication getPasswordAuthentication() {
    	   return new PasswordAuthentication("email", "password"); // Google id, pwd, 주의) @gmail.com 은 제외하세요
    	  }
    } 

    
    // 파일 사이즈 용량 체크
	protected boolean fileSizeCheck(String filename) {
		if (new File(filename).length() > (1024 * 1024 * 2.5)) {
			return false;
	    }
	    return true;
	}
	
    /**
     * 메일발송  - 과정관리
     * 
     * @date	: 2016.10.24
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 메일발송 - 과정관리
    @RequestMapping(value = "/admin/common/mailExec2.do")
    public String mailExec2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        
    	/* 메일 로그 등록 */
  		int seq = commonSendMailService.getMaxMailSeq(rMap);
  		rMap.setInt("seq", seq); 
  		commonSendMailService.insertMailLog(rMap);
  		
  		/* 메일 로그 상세 등록 */
  		String[] receiver_list = request.getParameterValues("receiver_list"); // 메일 팝업창의 수신자 목록
  		
  		ArrayList<String> syMailLogRecList = new  ArrayList<String>(); 
  		for(int i = 0 ; i < receiver_list.length ; i++) {  
  			syMailLogRecList.add(receiver_list[i].trim()); 
  		}
  		
  		rMap.setString("onlyMailGrp", "Y");
  		List<EduMap> leCourseUserList = adminCommonService.getLeCourseUserList(rMap); //과정에 등록한 학생 목록
  		
  		for(int i = 0 ; i < receiver_list.length ; i++) { // 메일 팝업창의 수신자 목록
  			
  			for(int j = 0 ; j < leCourseUserList.size() ; j ++ ) { //과정에 등록한 학생 목록
  				String email = (String) leCourseUserList.get(j).get("EMAIL");
  				if(receiver_list[i].trim().equals(email.trim())) {
  					int recSeq = commonSendMailService.getMaxMailSeqRec(rMap);
  					rMap.setInt("recSeq", recSeq); 
  					rMap.setString("userName",(String) leCourseUserList.get(j).get("USERNAME"));
  					rMap.setString("userId",(String) leCourseUserList.get(j).get("USERID"));
  					rMap.setString("email",receiver_list[i].trim());
  					syMailLogRecList.remove(receiver_list[i].trim()); // 메일 팝업창의 수신자 목록에서 과정 등록한 학생 목록 제거(팝업창에 직접 입력한 이메일만 남음)
  					commonSendMailService.insertMailLogRec(rMap);
  				}
  			}
  		}
  		
  		for(int i = 0 ; i < syMailLogRecList.size() ; i++) {  // 팝업창에 직접 입력한 이메일 
  			int recSeq = commonSendMailService.getMaxMailSeqRec(rMap);
			rMap.setInt("recSeq", recSeq); 
			rMap.setString("userName","");
			rMap.setString("userId","");
  			rMap.setString("email", syMailLogRecList.get(i));
  			commonSendMailService.insertMailLogRec(rMap);
  		}

  		/* 메일 보내기 */
  		int successCnt = 0;
  		int failCnt = 0;
  		if(receiver_list.length > 0) { 
  			for(int j=0;j<receiver_list.length;j++) {
  				try {
  					rMap.setString("receive_email",receiver_list[j]);
  					
  				            Properties props = System.getProperties();
  				            String smtpAuth = SangsProperties.getProperty("Globals.mail.smtp.auth");
  				            Authenticator auth = null;

  				            props.put("mail.transport.protocol", SangsProperties.getProperty("Globals.mail.transport.protocol"));// 프로토콜 설정
  				            props.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
  				            props.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));// SMTP 서비스 포트 설정
  				            /*
  				            props.put("mail.smtp.starttls.enable", SangsProperties.getProperty("Globals.mail.smtp.starttls.enable"));
  				            props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
  				            */
  				            props.setProperty("mail.smtp.auth", smtpAuth);
  				            props.put("mail.debug", "true");

  				            /*if ("true".equals(smtpAuth)) {
  				                auth = new Authenticator() {//계정name과 password 입력

  				                    String user = SangsProperties.getProperty("Globals.mail.smtp.auth.user");
  				                    String passWord = SangsProperties.getProperty("Globals.mail.smtp.auth.pass");

  				                    protected PasswordAuthentication getPasswordAuthentication() {
  				                        return new PasswordAuthentication(user, passWord);
  				                    }
  				                };
  				            }*/

  				            this.session = Session.getDefaultInstance(props, auth);
  					
  					// 실제메일 서버에 적용
  					String from_mail = SangsProperties.getProperty("Globals.mail");
  					String from_user = SangsProperties.getProperty("Globals.mail.username");
  					Mail mail = new Mail();
  					mail.setFrom(from_mail,from_user);
  					mail.setSubject(rMap.getString("subject"));//메일 제목
  					mail.setHtmlContent(rMap.getString("content"));//메일 내용
  					mail.setRecipient(receiver_list[j].trim()); //수신자 메일 주소
  					
  					Multipart mp = new MimeMultipart();
  			        MimeBodyPart mbp1 = new MimeBodyPart();
  			        mbp1.setContent(StringUtil.getContent2(rMap.getString("content")), "text/html;charset=utf-8");
//  			        mbp1.setContent(StringUtil.getContent2(rMap.getString("content")), "text/html");
  			        mp.addBodyPart(mbp1);
  			        
  			        if (ServletFileUpload.isMultipartContent(request)) {
  			            FileUploadUtil uploadUtil = new FileUploadUtil();
  			            String path = request.getParameter("UPLOAD_DIR").toString();
  			            request.setAttribute("UPLOAD_DIR", path);
  			            if(rMap.getString("increaseFileSize").equals("Y")) {
  			            	int ADDFILE_MAXSIZE = 1024 * 1024 * 1000;
  			            	rMap.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), ADDFILE_MAXSIZE));
  			            } else {
  			            	rMap.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
  			            }
  			        }
  					
  			        int fileCnt = rMap.getInt("UPLOAD_FILE_CNT");    		        
  			        for (int i = 0; i < fileCnt; i++) {
  			            DataMap fileMap = (DataMap)rMap.get("UPLOAD_FILE");
  	  			        String filename = fileMap.get("uploadFileFulltPath", i).toString()+ "/" +fileMap.get("uploadFileSaveName", i).toString();
  	  			        if(filename != null){
  	  			            if(fileSizeCheck(filename)){
  	  			                MimeBodyPart mbp2 = new MimeBodyPart();
  	  			                FileDataSource fds = new FileDataSource(filename);
  	  			                mbp2.setDataHandler(new DataHandler(fds));
  	  			                mbp2.setFileName(MimeUtility.encodeText(fileMap.get("uploadFileOrgName", i).toString(), "UTF-8", "B"));
  	  			                mp.addBodyPart(mbp2);
  	  			            }else{
  	  			                throw new Exception("파일 전송 최대 사이즈를 초과하였습니다.");
  	  			            }
  	  			        }
  			        }

  			        // 1. 운영서버에서 발송---------------------------------
		            mail.setContent(mp); 
	  		      	mail.send();

  			        // 2. 테스트서버에서 발송 ---------------------------------
  			        /*Authenticator auth = new SMTPAuthenticator();
  			        Properties p = new Properties();
			        p.put("mail.smtp.user", "hde1026@gmail.com");
			        p.put("mail.smtp.host", "smtp.gmail.com");
	  		      	p.put("mail.smtp.port", "465");
	  		      	p.put("mail.smtp.starttls.enable","true");
	  		      	p.put("mail.smtp.auth", "true");
	  		      	p.put("mail.smtp.debug", "true");
	  		      	p.put("mail.smtp.socketFactory.port", "465"); 
	  		      	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	  		      	p.put("mail.smtp.socketFactory.fallback", "false");
  			        
	  		      	Session session = Session.getInstance(p, auth);
  			        session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
  			        MimeMessage msg = new MimeMessage(session);
  			        
	  		      	Address fromAddr = new InternetAddress("rnehdfla12@gmail.com"); // 보내는 사람의 메일주소
	                msg.setFrom(fromAddr);
	                Address toAddr = new InternetAddress(receiver_list[j]);  // 받는 사람의 메일주소
	                msg.addRecipient(Message.RecipientType.TO, toAddr); 
	                
	                msg.setSubject(rMap.getString("subject"));
	                msg.setContent(mp);
	                Transport.send(msg);*/
	                
	  		      	// 끝 ---------------------------------
	  			      
  					rMap.setString("success_flag", "Y");
  					request.setAttribute("REQUEST_DATA", rMap);
  					
  				} catch (Exception e) {
  						rMap.setString("success_flag", "N");
  						rMap.setString("fail_content", e.getMessage());
  						
  				}	    		
  				String success_flag = (String) rMap.getString("success_flag");
  				if ("Y".equals(success_flag)) {
  				  successCnt++;
  				} else {
  				  failCnt++;
  				}
  			}//end of for
  		}//end of if
  		
  		return "admin/cmmn/mail_exec";
  		}

    /**
     * sms 발송 폼
     * 
     * @date	: 2016. 5. 31.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: sms 발송 폼
    @RequestMapping(value = "/admin/common/smsForm.do")
    public String smsForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

        	// 기본문구 조회
         	rMap.setString("tplUid", SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));
         	rMap.setString("tplContent", adminCommonService.getEmSmsTplInfo(rMap));
         	
         	// CALLBACK번호 조회 및 설정
         	rMap.setString("callback", adminCommonService.getSySmsCallbackInfo(rMap));
         	//수신자 정보 가져오기
         	String usernoArr = request.getParameter("usernoArr");
     		if(usernoArr != null){
     			String[] userno = usernoArr.split(","); 
     			String useridList = "";
     			for(int i = 0 ; i < userno.length ; i++) {
     				if(!("").equals(useridList)) {
     					useridList = useridList + "," + userno[i];
     				} else if(("").equals(useridList)) {
     					useridList = userno[i];
     				}
     			}
     			rMap.setString("useridList", useridList);
     		}
         	
     		String moblphonArr = request.getParameter("moblphonArr");
        	if(moblphonArr!=null){
        		String[]  moblphon = moblphonArr.split(",");
        		String moblphonList = "";
        		for(int i = 0 ; i < moblphon.length ; i++) {
        			if(!("").equals(moblphonList)) {
        				moblphonList = moblphonList + "," + moblphon[i];
        			} else if(("").equals(moblphonList)) {
        				moblphonList = moblphon[i];
        			}
        		}
        		rMap.setString("moblphonList", moblphonList);
        	}
         	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
            rMap.setString("SES_USERID", userSessionVO.getUserId());
            rMap.setString("SES_USERNAME", userSessionVO.getUserName());

            // 템플릿 리스트
            request.setAttribute("tamplateList", adminCommonService.getSMSTamplate(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/sms_form";
    }
    /**
     * sms 발송 폼(과정관리 > 과정운영관리 > 진행관리)
     * 
     * @date	: 2016. 10.12
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: sms 발송 폼
    @RequestMapping(value = "/admin/common/smsForm2.do")
    public String smsForm2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 기본문구 조회
         	rMap.setString("tplUid", SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));
         	rMap.setString("tplContent", adminCommonService.getEmSmsTplInfo(rMap));
         	
         	// CALLBACK번호 조회 및 설정
         	rMap.setString("callback", adminCommonService.getSySmsCallbackInfo(rMap));
         	
         	//과정명, 발송인원
         	request.setAttribute("courseInfo", adminCommonService.getCourseInfo(rMap));
         	
         	EduMap onOff = adminCommonService.getCourseInfo(rMap);
         	if(onOff.getString("MT_CTYPE_CODE").equals(SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE"))){//집합 과정이라면
         		rMap.setString("targetYn", "Y");
         	}
         	
         	//수신자 정보 가져오기
         	request.setAttribute("mobileInfo", adminCommonService.getLeCourseUserList(rMap));
    		
         	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
            rMap.setString("SES_USERID", userSessionVO.getUserId());
            rMap.setString("SES_USERNAME", userSessionVO.getUserName());
            
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/sms_form2";
    }
    /**
     * sms 발송 폼(과정관리 > 과정운영관리 > 진행관리(설문))
     * 
     * @date	: 2016. 10.12
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: sms 발송 폼
    @RequestMapping(value = "/admin/common/smsForm3.do")
    public String smsForm3(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 기본문구 조회
         	rMap.setString("tplUid", SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));
         	rMap.setString("tplContent", adminCommonService.getEmSmsTplInfo(rMap));
         	
         	// CALLBACK번호 조회 및 설정
         	rMap.setString("callback", adminCommonService.getSySmsCallbackInfo(rMap));
         	
         	//설문
         	request.setAttribute("resultList", adminCommonService.getSurveyList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
    		//과정명, 발송인원
    		request.setAttribute("courseInfo", adminCommonService.getCourseInfo(rMap));
    		
         	//수신자 정보 가져오기
         	request.setAttribute("mobileInfo", adminCommonService.getLeCourseUserList(rMap));

         	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
            rMap.setString("SES_USERID", userSessionVO.getUserId());
            rMap.setString("SES_USERNAME", userSessionVO.getUserName());
            
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/sms_form3";
    }
    
    /**
     * sms발송 (과정관리>과정운영관리>진행관리)
     * 
     * @date	: 2016.10.12
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: sms 발송 
    @RequestMapping(value = "/admin/common/smsExec2.do")
    public String smsExec2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	String smsbodyVal = StringEscapeUtils.unescapeHtml(rMap.getString("smsbody"));
        	smsbodyVal = smsbodyVal.replace("&apos;","'");
        	smsbodyVal = smsbodyVal.replace("&lt;","<");
        	smsbodyVal = smsbodyVal.replace("&gt;",">"); 
        	smsbodyVal = java.net.URLDecoder.decode(smsbodyVal, "UTF-8"); 
        	
        	rMap.setString("smsbody", smsbodyVal); 
        	rMap.setInt("status", 1);
        	
        	// sms log 등록 
        	if(rMap.getInt("smsType")==3){//설문sms발송
        		String[] recUserName = request.getParameterValues("recUserName");//이름 배열
        		String[] recUserId = request.getParameterValues("recUserId");//아이디 배열
        		String[] recHp = request.getParameterValues("recHp");//번호 배열
        		
        		for(int j=0;j<recUserName.length;j++) {
        			String userInfo = "";
        			int msgCnt = 1;
        			
        			int seq = adminCommonService.getMaxSmsSeq(rMap);
        			rMap.setInt("seq", seq);
        			rMap.setString("recUserName", recUserName[j]);
        			rMap.setString("recUserId", recUserId[j]);
        			rMap.setString("recHp", recHp[j]);
        			adminCommonService.insertSmsLog(rMap);
        			
        			userInfo = recUserName[j] +"^"+recHp[j];
        			rMap.setInt("msgCnt", msgCnt);
            		rMap.setString("userInfo", userInfo);
            		
            		if(rMap.getInt("tranType") == 6){//mms라면
        				adminCommonService.insertMmsData(rMap);
        			} else if(rMap.getInt("tranType") == 4){ //sms라면
        				adminCommonService.insertSmsData(rMap);
        			}
        		}
        	} else if(rMap.getInt("smsType")==2) {//진행관리 sms발송 
        		String recList = request.getParameter("recList");//수신번호리스트
            	String[] receiverAlias = recList.split(",");

            	for(int i = 0 ; i < receiverAlias.length ; i++) {
            			String userInfo = "";
            			int msgCnt = 1;
            			
            			int seq = adminCommonService.getMaxSmsSeq(rMap);
            			rMap.setInt("seq", seq);//로그용 SEQ

            			int mmsSeq = adminCommonService.getMaxMmsSeq(rMap);
            			rMap.setInt("mmsSeq", mmsSeq);//mms저장용 seq
            			rMap.setString("unityId", receiverAlias[i].toString());
            			
            			if(!rMap.getString("unityId").equals("")){ 
            				EduMap recListMap =  adminCommonService.getRecList(rMap);//회원 정보 조회
                			
                			if(recListMap != null) { //기존 수강생에게 발송
	        					String str = recListMap.getString("MOBLPHON");
	        					String newStr = str.replace("-", "");
	        					rMap.setString("recUserName", recListMap.getString("MBERNM"));//수신자이름
	        					rMap.setString("recUserId",recListMap.getString("UNITY_ID"));//수신자아이디
	        					rMap.setString("recHp", newStr);//수신자전화번호
	        					
	        					userInfo += recListMap.getString("MBERNM")+"^"+newStr;
	        					rMap.setInt("msgCnt", msgCnt);
	        					rMap.setString("userInfo", userInfo);
	        					
	        					adminCommonService.insertSmsLog(rMap);
	        					
	        					if(rMap.getInt("tranType") == 6){//mms라면
	                				adminCommonService.insertMmsData(rMap);
	                			} else if(rMap.getInt("tranType") == 4){ //sms라면
	                				adminCommonService.insertSmsData(rMap);
	                			}
	        					
	            			} else { //팝업창에서 입력한 번호로 전송(아이디, 이름정보 없음)
	            				rMap.setString("recUserName", "");//수신자이름
	            				rMap.setString("recUserId", "");//수신자아이디
	            				rMap.setString("recHp", receiverAlias[i]);//수신자전화번호
	            				
	            				userInfo += "NONAME"+"^"+receiverAlias[i];
	            				rMap.setInt("msgCnt", msgCnt);
	            				rMap.setString("userInfo", userInfo);
	            				
	            				adminCommonService.insertSmsLog(rMap);
	            				
	            				if(rMap.getInt("tranType") == 6){//mms라면
	                				adminCommonService.insertMmsData(rMap);
	                			} else if(rMap.getInt("tranType") == 4){ //sms라면
	                				adminCommonService.insertSmsData(rMap);
	                			}
	            				
	            			}
            			}
            		}
        	} else if(rMap.getInt("smsType")==1) {//회원관리, 클래스데스크 > 성적 
        		String recList = request.getParameter("recList");//수신번호리스트
            	String[] receiverAlias = recList.split(",");
            	for(int i = 0 ; i < receiverAlias.length ; i++) {
            			String userInfo = "";
            			int msgCnt = 1;
            			
            			int seq = adminCommonService.getMaxSmsSeq(rMap);
            			rMap.setInt("seq", seq);//로그용 SEQ
            			
            			int mmsSeq = adminCommonService.getMaxMmsSeq(rMap);
            			rMap.setInt("mmsSeq", mmsSeq);//mms저장용 seq
            			
            			rMap.setString("unityMberno", receiverAlias[i].toString());
            			if(!rMap.getString("unityMberno").equals("")){
            				
            				EduMap recListMap =  adminCommonService.getRecList(rMap);//회원 정보 조회
            				
            				if(recListMap != null) { //기존 수강생에게 발송
            					
	            				String str = recListMap.getString("MOBLPHON");
	            				String newStr = str.replace("-", "");
	            				rMap.setString("recUserName", recListMap.getString("MBERNM"));//수신자이름
	                			rMap.setString("recUserId",recListMap.getString("UNITY_ID"));//수신자아이디
	                			
	                			rMap.setString("recHp", newStr);//수신자전화번호
	                			userInfo += recListMap.getString("MBERNM") +"^"+newStr;
	                			rMap.setInt("msgCnt", msgCnt);
	                			rMap.setString("userInfo", userInfo);
	                			
	                			adminCommonService.insertSmsLog(rMap);
	                			
	                			if(rMap.getInt("tranType") == 6){//mms라면
	                				adminCommonService.insertMmsData(rMap);
	                			} else if(rMap.getInt("tranType") == 4){ //sms라면
	                				adminCommonService.insertSmsData(rMap);
	                			}
	                			
            				} else { //기존 수강생이 아닌 팝업창에서 입력한 번호로 전송(아이디, 이름정보 없음)
	            				
            					rMap.setString("recUserName", "");//수신자이름
	                			rMap.setString("recUserId", "");//수신자아이디
	            				rMap.setString("recHp", receiverAlias[i]);//수신자전화번호
	            				
	            				userInfo +="NONAME"+"^"+receiverAlias[i];
	            				rMap.setInt("msgCnt", msgCnt);
	            				rMap.setString("userInfo", userInfo);
	            				
	            				adminCommonService.insertSmsLog(rMap);
	            				
	            				if(rMap.getInt("tranType") == 6){//mms라면
	                				adminCommonService.insertMmsData(rMap);
	                			} else if(rMap.getInt("tranType") == 4){ //sms라면
	                				adminCommonService.insertSmsData(rMap);
	                			}
	            			}
            			}
            		}
        	}
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/cmmn/sms_exec";
    }
    
    /**
     * 파일 다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/filedown.do")
    public String filedown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {

        DownloadServlet filedown = new DownloadServlet();
        boolean result = false;

        try {
            //rMap.setString("filename", "../6BAE7B3F1CBB415FBE6A15D65DB18BE7.xls");
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
            //상위경로 진입 방지
            
            if(rMap.containsKey("sampleDown")){
                req.setAttribute("REQUEST_DATA", rMap);
                return "/common/file_down";
            }

            if (rMap.containsKey("urlDown")) { // 자료실. 파일다운로드
                result = filedown.urlDownLoadFile(req, res);
            } else if (rMap.containsKey("bbsDown")) { // 게시판. 파일 다운로드
                result = filedown.bbsDownLoadFile(req, res);
            } else if (rMap.containsKey("lecturedown")) { // 게시판. 파일 다운로드
                result = filedown.bbsDownLoadFile(req, res);
                if(rMap.containsKey("bbsNo") && rMap.containsKey("nttNo")){
            		if(!rMap.getString("bbsNo").equals(null) && !rMap.getString("nttNo").equals(null)){
            			//adminTutorCmmntyService.updateCmmntySubFileCount(rMap);
                	}
            	}
            }else if(rMap.containsKey("cmmntydown")){
            	//result = filedown.downLoadFile(req, res, adminTutorCmmntyMapper.getFileInfo(ParamUtil.getIntParam(req.getParameter("fileNo"))));
            }else{
//                result = filedown.downLoadFile(req, res, adminBoardMapper.getFileInfo(ParamUtil.getIntParam(req.getParameter("fileno"))));
            }

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) {
            // TODO: handle exception
            return "common/cmmn_error";
        }
    }
    
    /**
     * 공통 콤보파일 ajax
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    // TODO: 공통 콤보파일 ajax
    @RequestMapping(value = "/admin/common/ajaxCategory.do")
	public String ajaxCategory(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
		try{
			
			List<EduMap> resultList = adminCommonService.getMtSubCodeList(rMap);
			request.setAttribute("resultList", resultList);
		}
		catch (Exception e) {
			
		}
		
		request.setAttribute("REQUEST_DATA", rMap);
		return "admin/cmmn/ajaxComboCategory";
	}
    
    /**
     * 우편번호
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    // TODO: 우편번호
    @RequestMapping(value = "/admin/common/postEtc.do")
	public String postEtc(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

		request.setAttribute("REQUEST_DATA", rMap);
		return "admin/cmmn/post_pop";
	}
    
    /**
     * 우편번호 찾기 실행
     * @param params
     * @param req
     * @param res
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/getPostAjax.do")
    public void getPost(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {

    	String currentPage = req.getParameter("currentPage");
		String countPerPage = req.getParameter("countPerPage");
		String newZipcodeUrl = SangsProperties.getProperty("Globals.newZipcodeUrl");
		String confmKey = URLEncoder.encode(SangsProperties.getProperty("Globals.confmKey"), "UTF-8"); // 인증키
 		String srchText = URLEncoder.encode(req.getParameter("srchText"), "UTF-8"); // 검색
 		
		String apiUrl = newZipcodeUrl
				+ "?currentPage="+currentPage 
				+ "&countPerPage="+countPerPage
				+ "&keyword="+srchText
				+ "&confmKey="+confmKey;
		/*String apiUrl = "http://idea.epeople.go.kr/shareApi/getZoneCodeList.do"
				+ "?share_key=6c65f9568b2f4e4b9d2876dae9356882"
				+ "&gubun=2"
				+ "&zone_cd=10";*/
		
		URL url = new URL(apiUrl);
    	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;
    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);	
    	}
    	 
    	br.close();
    	res.setCharacterEncoding("UTF-8");
		res.setContentType("text/xml");
		res.getWriter().write(sb.toString()); 
    }
    
    /**
     * 메시지를 alert 뿌리고 url에 해당하는 페이지로 이동한다.
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/common/msgForward.do")
    public String msgForward(HttpServletRequest req, DataMap rMap) throws FrontException {

        req.setAttribute("msg", (String)req.getAttribute("msg"));
        req.setAttribute("url", (String)req.getAttribute("url"));
        return "/common/msg_forward";
    }
    
    /**
     * 유저 리스트 엑셀 등록 폼
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 특강 엑셀등록 폼
    @RequestMapping(value = "/admin/user/userListExcelForm.do")
    public String companyExcelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        return "admin/user/user_List_excel_form";
    }
    
    /**
     * 엑셀 업로드
     * @param data
     * @return
     * @throws Exception
     */
     private EgovFormBasedFileVo excelUploadPrc(HttpServletRequest req, String attFilePath)  throws Exception {
         try {
             List<EgovFormBasedFileVo> fileList = null;
             EgovFormBasedFileVo fileVo = null;
             
             if (ServletFileUpload.isMultipartContent(req)) {
                 fileList = EgovFileUploadUtil.uploadFiles(req, attFilePath);
             }
             if(fileList != null && fileList.size() > 0) {
                 fileVo = fileList.get(0);
             }
             return fileVo;
         } catch(Exception e) {

             
             throw new FrontException();
         }
     }

    /**
     * 유저 리스트 엑셀등록 실행
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 특강 엑셀등록 실행
    @RequestMapping(value = "/admin/user/userListExcelExec.do")
    public String userListExcelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        //DataMap fileBox = (DataMap)rMap.get("UPLOAD_FILE");
        //String filePath = fileBox.getString("uploadFileFulltPath") + File.separator + fileBox.getString("uploadFileSaveName");
        String attFilePath = SangsProperties.getProperty("Globals.addFileRootPath");
        EgovFormBasedFileVo rtnFileVo = excelUploadPrc(request, attFilePath);
        ArrayList<SangsMap> excelList = SangsUtil.loadExcelList(attFilePath + File.separator + rtnFileVo.getPhysicalName(), 1, 10);
        try {
                int num = excelList.size();
                int excelSize = excelList.size();

                //엑셀 유효성 체크 시작
                for(int i = 0 ; i < excelList.size() ; i++) {
                    SangsMap map = excelList.get(i);
                    
                    if(map.get("col1").equals("미소금융근무자")){	//회원분류코드
                    	map.put("mtJobkindCode", "AA3000");	
                    } else if (map.get("col1").equals("대출이용자")){
                    	map.put("mtJobkindCode", "AA2000");
                    } else if (map.get("col1").equals("일반학습자")){
                    	map.put("mtJobkindCode", "AA1000");
                    } else if (map.get("col1").equals("강사")){
                    	map.put("mtJobkindCode", "AA5000");
                    } else if (map.get("col1").equals("하위관리자")){
                    	map.put("mtJobkindCode", "AA9998");
                    } else if (map.get("col1").equals("관리자")){
                    	map.put("mtJobkindCode", "AA9999");
                    } 
                    map.put("unityId", map.get("col2"));	//아이디
                    map.put("mberNm", 	map.get("col3"));	//이름
                    map.put("email", 	map.get("col4"));	//이메일
                    map.put("rgsde", map.get("col5"));	//가입일시
                    map.put("tutorAt", map.get("col6"));	//강사여부
                    map.put("secsnAt", "N");	//탈퇴여부
                    
                    adminCommonService.insertuserListExcel(map);
                }


        } catch (Exception ex){
        }

        return "admin/user/user_company_excel_exec";
    }
    
    /**
     * 비회원 리스트 엑셀 등록 폼
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 특강 엑셀등록 폼
    @RequestMapping(value = "/admin/user/nmberListExcelForm.do")
    public String nmberListExcelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        return "admin/user/nmber_List_excel_form";
    }
    
    /**
     * 비회원 리스트 엑셀등록 실행
     *
     * @date	: 2016. 3. 29.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 특강 엑셀등록 실행
    @RequestMapping(value = "/admin/user/nmberListExcelExec.do")
    public String nmberListExcelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        //DataMap fileBox = (DataMap)rMap.get("UPLOAD_FILE");
        //String filePath = fileBox.getString("uploadFileFulltPath") + File.separator + fileBox.getString("uploadFileSaveName");
        String attFilePath = SangsProperties.getProperty("Globals.addFileRootPath");
        EgovFormBasedFileVo rtnFileVo = excelUploadPrc(request, attFilePath);
        ArrayList<SangsMap> excelList = SangsUtil.loadExcelList(attFilePath + File.separator + rtnFileVo.getPhysicalName(), 1, 10);
        try {
                int num = excelList.size();
                int excelSize = excelList.size();

                //엑셀 유효성 체크 시작
                for(int i = 0 ; i < excelList.size() ; i++) {
                    SangsMap map = excelList.get(i);
                    
                    if(map.get("col1").equals("3")){ //회원분류코드 1:일반2:대출3:학습4:강사5:관리
                    	map.put("mtJobkindCode", "AA3000");	
                    } else if (map.get("col1").equals("2")){
                    	map.put("mtJobkindCode", "AA2000");
                    } else if (map.get("col1").equals("1")){
                    	map.put("mtJobkindCode", "AA1000");
                    } else if (map.get("col1").equals("5")){
                    	map.put("mtJobkindCode", "AA5000");
                    } else if (map.get("col1").equals("9")){
                    	map.put("mtJobkindCode", "AA9999");
                    } 
                    
                    String mtOfficeCode = (String)map.get("col2");
                    map.put("mtOfficeCode", adminCommonService.selectmtOfficeCode(mtOfficeCode));	//지점코드
                    
                    map.put("mberNm", map.get("col3"));	//이름
                    
                    if(map.get("col4").equals("1")){	//성별 1:남자 2:여자
                    	map.put("sex", "M");	
                    } else if (map.get("col4").equals("2")){
                    	map.put("sex", "F");
                    }
                    
                    map.put("mobilphon", 	map.get("col5"));	//핸드폰 번호
                    map.put("brthdy", map.get("col6"));	//생년월일
                    map.put("regdate", map.get("col7"));	//가입일시
                    map.put("secsnAt", "N");	//탈퇴여부
                    map.put("unityMberno", adminCommonService.getMaxMberNo(map));
                    map.put("SES_USERNO", rMap.get("SES_USERNO"));
                    
                    adminCommonService.insertnmberListExcel(map);
                }


        } catch (Exception ex){
        }

        return "admin/user/user_company_excel_exec";
    }
    
    private String getUserHostAddress() {
        String userHostAddr = "";
        try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
                NetworkInterface intf = en.nextElement();
                for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
                    InetAddress inetAddress = enumIpAddr.nextElement();
                    if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress() && inetAddress.isSiteLocalAddress()) {
                        userHostAddr = inetAddress.getHostAddress().toString();
                    }
                }
            }

        } catch (SocketException e) {
        }

        return userHostAddr;
    }
    
    /**
     * 메일발송
     *
     * @param session
     * @param ov
     * @return
     */
    public SendMailVO mailSend(SendMailVO vo) {
        try {
            InternetAddress receiver = null;
            receiver = new InternetAddress(vo.getRecEmail());
            MimeMessage msg = new MimeMessage(session);
            // 보내는 사람
            msg.setFrom(new InternetAddress(vo.getSender(), vo.getSender_alias(),"UTF-8"));
            // 받는사람
            msg.setRecipient(Message.RecipientType.TO, receiver);
            // 메일 제목
            msg.setSubject(vo.getTitle(), "UTF-8");
            // 보내는 날짜
            msg.setSentDate(new Date());
            // 메일 내용
            msg.setText(vo.getContent(), "UTF-8", "html");
            msg.setHeader("Content-Type", "text/html; charset=utf-8");
            //msg.setHeader("X-Mailer", "edailyedu");
            //msg.setHeader("X-Mailer", "lms");
            // 메일 전송
            Transport.send(msg);

            vo.setRecyn("Y");
            vo.setSucccyn("Y");
        } catch (Exception e) { log.debug(e.getMessage());

            vo.setRecyn("N");
            vo.setSucccyn("N");

            return vo;
        }

        return vo;
    }
    
    /**
	 * 자료실 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/common/deleteFile.do")
	public void deleteFile(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		try {
			List<EduMap> tmp = classdeskTutorResultService.getCourseFileInfo(rMap);
        	DataMap map = new DataMap();
        	map.add("fileId", tmp.get(0).getInt("FILE_ID"));
        	map.add("savePath", tmp.get(0).getString("SAVPATH"));
        	map.add("saveFile", tmp.get(0).getString("SAVFILE"));
			classdeskTutorResultService.deleteFile(map);
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 * 자료실 자막 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/common/deleteTxtFile.do")
	public void deleteTxtFile(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		try {
			List<EduMap> tmp = classdeskTutorResultService.getCourseTxtFileInfo(rMap);
        	DataMap map = new DataMap();
        	map.add("fileId", tmp.get(0).getInt("FILE_ID"));
        	map.add("savePath", tmp.get(0).getString("SAVPATH"));
        	map.add("saveFile", tmp.get(0).getString("SAVFILE"));
			classdeskTutorResultService.deleteFile(map);
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
     * 파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/classdesk/filedown.do")
    public String eduFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
        	List<EduMap> tmp = classdeskTutorResultService.getCourseFileInfo(rMap);
        	DataMap map = new DataMap();
        	map.add("SAVPATH", tmp.get(0).getString("SAVPATH"));
        	map.add("SAVFILE", tmp.get(0).getString("SAVFILE"));
        	map.add("ORGFILE", tmp.get(0).getString("ORGFILE"));
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
			result = filedown.downLoadFile(req, res, map);

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) {
        	return "common/cmmn_error";
        }
    }
    
    /**
     * 자막파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/classdesk/filedownTxt.do")
    public String eduFiledownTxt(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
        	List<EduMap> tmp = classdeskTutorResultService.getCourseTxtFileInfo(rMap);
        	DataMap map = new DataMap();
        	map.add("SAVPATH", tmp.get(0).getString("SAVPATH"));
        	map.add("SAVFILE", tmp.get(0).getString("SAVFILE"));
        	map.add("ORGFILE", tmp.get(0).getString("ORGFILE"));
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
			result = filedown.downLoadFile(req, res, map);

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) {
        	return "common/cmmn_error";
        }
    }
    
    /**
     * 회원 가입 이메일 중복체크 및 인증이메일 발송 (ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mailExec22.do")
    public String searchEmail(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	/* 메일 로그 등록 */
  		int seq = commonSendMailService.getMaxMailSeq(rMap);
  		rMap.setInt("seq", seq); 
  		commonSendMailService.insertMailLog(rMap);
  		
  		/* 메일 로그 상세 등록 */
  		String[] receiver_list = request.getParameterValues("receiver_list"); // 메일 팝업창의 수신자 목록
  		
  		ArrayList<String> syMailLogRecList = new  ArrayList<String>(); 
  		for(int i = 0 ; i < receiver_list.length ; i++) {  
  			syMailLogRecList.add(receiver_list[i].trim()); 
  		}
  		
  		String usernoArr = request.getParameter("usernoArr");
     	String[] userno = usernoArr.split(","); 
  		for(int j = 0 ; j < receiver_list.length ; j++) { // 메일 팝업창의 수신자 목록
			for(int i = 0 ; i < userno.length ; i++) {//목록에서 선택한 수신자 목록
				rMap.setString("usernoArr", userno[i]);
				rMap.setString("onlyMailGrp", "Y");
				EduMap checkedReceiverList = adminCommonService.getCheckedReceiverList(rMap);
				if(checkedReceiverList != null){//이메일 정보가 있다면
					String email = (String) checkedReceiverList.get("EMAIL");
					if(receiver_list[j].trim().equals(email.trim())) {
						int recSeq = commonSendMailService.getMaxMailSeqRec(rMap);
						rMap.setInt("recSeq", recSeq); 
						rMap.setString("userName",(String) checkedReceiverList.get("MBERNM"));
						rMap.setString("userId",(String) checkedReceiverList.get("UNITY_ID"));
						rMap.setString("email",receiver_list[j].trim());
						syMailLogRecList.remove(receiver_list[j].trim()); // 메일 팝업창의 수신자 목록에서 과정 등록한 학생 목록 제거(팝업창에 직접 입력한 이메일만 남음)
						commonSendMailService.insertMailLogRec(rMap);
					}
				} 
				 
			}
  		}
  		
  		for(int i = 0 ; i < syMailLogRecList.size() ; i++) {  // 팝업창에 직접 입력한 이메일 
  			int recSeq = commonSendMailService.getMaxMailSeqRec(rMap);
			rMap.setInt("recSeq", recSeq); 
			rMap.setString("userName","");
			rMap.setString("userId","");
  			rMap.setString("email", syMailLogRecList.get(i));
  			commonSendMailService.insertMailLogRec(rMap);
  		}
          
  		/* 메일 보내기 */
  		int successCnt = 0;
  		int failCnt = 0;
  		if(receiver_list.length > 0) {
  		   
		     
  			for(int j=0;j<receiver_list.length;j++) {
  				
  				res.setContentType("text/html; charset=utf-8");
  		        PrintWriter out = res.getWriter();
  		        Gson gson = new Gson();
  		        String json = null;

  		        Properties p = new Properties();
  		        p.put("mail.smtp.user", SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // Google계정@gmail.com으로 설정
  		        p.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
  		        p.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
  		        p.put("mail.smtp.starttls.enable","true");
  		        p.put( "mail.smtp.auth", "true");
  		       
  		        p.put("mail.smtp.debug", "true");
  		        
  		        try {
  		        	DataMap mailTplMap = new DataMap();
  		        	
  		        	System.out.println("@@@@@@@"+rMap);
  		        	
  		        	SendMailVO mailVo = new SendMailVO();
  		            mailVo.setRecEmail(rMap.getString("receiver_list"));
  		            mailVo.setReceiver_alias(rMap.getString("박강희"));
  		            mailVo.setRecUserid(rMap.getString("newprove"));
  		            mailVo.setRecUsername(rMap.getString("박강희"));
  		            
  		            emsManager.sendMailProc(mailTplMap, mailVo);
  					
	  			      
  					rMap.setString("success_flag", "Y");
  					request.setAttribute("REQUEST_DATA", rMap);
  					
  				} catch (Exception e) {
  						rMap.setString("success_flag", "N");
  						rMap.setString("fail_content", e.getMessage());
  						
  				}	
  				
  				String success_flag = (String) rMap.getString("success_flag");
  				
  				if ("Y".equals(success_flag)) {
  				  successCnt++;
  				} else {
  				  failCnt++;
  				}
  			}
  		}
		return "admin/cmmn/mail_exec";
    }
    
}