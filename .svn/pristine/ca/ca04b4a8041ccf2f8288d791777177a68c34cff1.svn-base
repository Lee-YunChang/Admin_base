package com.webapp.common.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.Aes_128;
import com.webapp.common.mapper.CommonEmsMapper;
import com.webapp.common.service.CommonSendMailService;
import com.webapp.common.vo.SendMailVO;

/**
 * Description : Common Mail Service
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("commonSendMailService")
public class CommonSendMailServiceImpl implements CommonSendMailService {

    @Resource(name = "commonEmsMapper")
    private CommonEmsMapper commonEmsMapper;

    private Session         session = null;

    private Logger          log     = LogManager.getLogger(this.getClass());

    public CommonSendMailServiceImpl() {
        try {
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
        } catch (Exception e) {
        }
    }

    /**
     * 메일 보내기(다수건)
     *
     * @param sendList
     * @return
     * @throws Exception
     */
    public List<SendMailVO> sendMailList(List<SendMailVO> sendList) throws Exception {
        boolean isSend = true;

        try {

            int count = 0;

            for (int i = 0; i < sendList.size(); i++) {

                SendMailVO vo = sendList.get(i);

                if (isSend) {
                    mailSend(vo);

                    if (count == 0) { // 메일 로그
                        commonEmsMapper.insertSyMailLog(vo);
                    }

                    commonEmsMapper.insertSyMailLogRec(vo);

                    count++;
                }

            }
        } catch (RuntimeException e) {
        } catch (Exception ex) {
        }

        return sendList;
    }

    /**
     * 메일 보내기(한건)
     *
     * @param vo
     * @return
     * @throws Exception
     */
    public SendMailVO sendMail(SendMailVO vo) throws Exception {
        mailSend(vo);

        try {
            // 메일 로그 등록
            commonEmsMapper.insertSyMailLog(vo);
            commonEmsMapper.insertSyMailLogRec(vo);
        } catch (Exception e) {
        }

        return vo;
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
        } catch (Exception e) {

            vo.setRecyn("N");
            vo.setSucccyn("N");

            return vo;
        }

        return vo;
    }
    
    
    /**
     * mail log
     *
     * @param data
     * @throws Exception
     */
    public void insertMailLog(DataMap data) throws Exception {
    	commonEmsMapper.insertMailLog(data);
    }
    
    /**
     * insertMailLogRec
     *
     * @param data
     * @throws Exception
     */
    public void insertMailLogRec(DataMap data) throws Exception {
    	commonEmsMapper.insertMailLogRec(data);
    }
    
    /**
     * getMaxMailSeq
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxMailSeq(DataMap data) throws Exception {
        return commonEmsMapper.getMaxMailSeq(data);
    }
    
    /**
     * getMaxMailSeqRec
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxMailSeqRec(DataMap data) throws Exception {
        return commonEmsMapper.getMaxMailSeqRec(data);
    }
}
