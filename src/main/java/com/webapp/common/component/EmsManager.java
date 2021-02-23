package com.webapp.common.component;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.Mail;
import com.sangs.util.StringUtil;
import com.webapp.common.mapper.CommonEmsMapper;
import com.webapp.common.service.CommonSendMailService;
import com.webapp.common.service.CommonSendMsgService;
import com.webapp.common.vo.SendMailVO;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : 독려시스템 메일 및 SMS 발송 모듈 
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Component("emsManager")
public class EmsManager {

    protected Logger              log = LogManager.getLogger(this.getClass());

    @Resource(name = "commonEmsMapper")
    private CommonEmsMapper       commonEmsMapper;

    @Resource(name = "commonSendMailService")
    private CommonSendMailService commonSendMailService;

    @Resource(name = "commonSendMsgService")
    private CommonSendMsgService  commonSendMsgService;    
    
    
    /**
     * 템플릿 기반 메일 발송 (단일)
     * @param mailTplMap
     * @param mailVo
     * @param sm
     * @throws Exception
     */
    public void sendMailProc(DataMap mailTplMap, SendMailVO mailVo) throws Exception {
        List<SendMailVO> sendList = new ArrayList<SendMailVO>(); // 메일 발송 관련 Vo  

        // 메일 제목, 메일 내용 추출
        EduMap tplInfoMap = commonEmsMapper.getSyMailTplInfo(mailTplMap.getString("TPL_UID"));


        String content = StringUtil.getContent2(tplInfoMap.getString("CONTENT"));
        content = setReplaceContent(mailTplMap, content); // 내용 치환
        
        mailTplMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_CODE"));
        List<EduMap> tempList = commonEmsMapper.selectMtCodeSub(mailTplMap);
        
        for(int i=0; i < tempList.size(); i++){
        	EduMap tempMap = tempList.get(i);
        	
        	if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDNAME").equals(tempMap.getString("MT_SUB_CODE"))) {
        		mailTplMap.setString("sendName", tempMap.getString("MT_SUB_NAME"));
        	}
        	if(SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SENDADDR").equals(tempMap.getString("MT_SUB_CODE"))) {
        		mailTplMap.setString("sendAddr", tempMap.getString("MT_SUB_NAME"));
        	}
        	
        }
        
        String userHostAddr = getUserHostAddress();
        mailVo.setTitle(tplInfoMap.getString("TITLE")); // 제목
        mailVo.setContent(content); // 내용
        mailVo.setSender(mailTplMap.getString("sendAddr")); // 발송자 메일주소
        mailVo.setSender_alias(mailTplMap.getString("sendName")); // 발송자 이름
        mailVo.setWriterIp(userHostAddr);
        mailVo.setWriterUserid(mailTplMap.getString("SES_USERID"));
        mailVo.setTplUid(mailTplMap.getString("TPL_UID"));
        sendList.add(mailVo); // 리스트객체에 담기
        commonSendMailService.sendMailList(sendList);
        
    }
    
    /**
     * 탬플릿 기반 메일 발송 (단체)
     * @param mailTplMap
     * @param sendMailList
     * @param sm
     * @throws Exception
     */
    public void sendMailProc(DataMap mailTplMap, List<SendMailVO> sendMailList) throws Exception {
    	
        List<SendMailVO> sendList = new ArrayList<SendMailVO>(); // 메일 발송 관련 Vo  
        // 메일 제목, 메일 내용 추출
        EduMap tplInfoMap = commonEmsMapper.getSyMailTplInfo(mailTplMap.getString("TPL_UID"));
        
        String content = StringUtil.getContent2(tplInfoMap.getString("CONTENT")); // 내용 치환
        String userHostAddr = getUserHostAddress();
        
        for (int userIdx = 0; userIdx < sendMailList.size(); userIdx++) {
            SendMailVO mailVo = sendMailList.get(userIdx);
            
            content = setReplaceContent(mailTplMap, content);
            getUserHostAddress();
            
            mailVo.setTitle(tplInfoMap.getString("TITLE")); // 제목
            mailVo.setContent(content); // 내용
            mailVo.setSender(SangsProperties.getProperty("Globals.mailSenderMailAddr")); // 발송자 이름
            mailVo.setSender_alias(SangsProperties.getProperty("Globals.mailSenderAliasName")); // 발송자 메일주소
            mailVo.setWriterIp(userHostAddr);
            mailVo.setTplUid(mailTplMap.getString("TPL_UID"));
            
            // 메일 발송 호출
            sendList.add(mailVo); // 리스트객체에 담기
        }
        
        commonSendMailService.sendMailList(sendList);
    }
    
    public void sendMailProc(String tmplId, List<SendMailVO> sendMailList) throws Exception {
        // TODO Auto-generated method stub

        String sender = SangsProperties.getProperty("Globals.mailSenderMailAddr");
        String senderName = SangsProperties.getProperty("Globals.mailSenderAliasName");
        String userHostAddr = getUserHostAddress();

        List<SendMailVO> sendList = new ArrayList<SendMailVO>(); // 메일 발송 관련 Vo  

        // 메일 제목, 메일 내용 추출
        EduMap tplInfoMap = commonEmsMapper.getSyMailTplInfo(tmplId);

        String title = tplInfoMap.getString("TITLE");
        String content = StringUtil.getContent2(tplInfoMap.getString("CONTENT")); // 내용 치환
        int size = sendMailList.size();

        for (int i = 0; i < size; i++) {
            SendMailVO mailVo = sendMailList.get(i);

            content = setMultiReplaceContent(mailVo.getArrSeq(), content);

            mailVo.setTitle(title); // 제목
            mailVo.setContent(content); // 내용
            mailVo.setSender(sender); // 발송자 이름
            mailVo.setSender_alias(senderName);
            mailVo.setWriterIp(userHostAddr);
            mailVo.setTplUid(tmplId);

            // 메일 발송 호출
            sendList.add(mailVo); // 리스트객체에 담기
        }

        commonSendMailService.sendMailList(sendList);
    }

    /**
       * 탬플릿 기반SMS 발송 (단체)
       * @param msgTplMap
       * @param sendMsgList
       * @param sm
       * @throws Exception
       */
    public void sendMsgProc(DataMap msgTplMap, List<SendMsgVO> sendMsgList) throws Exception {

        List<SendMsgVO> sendList = new ArrayList<SendMsgVO>(); // 메일 발송 관련 Vo  

        // 메일 제목, 메일 내용 추출
        EduMap tplInfoMap = commonEmsMapper.getSySmsTplInfo(msgTplMap.getString("TPL_UID"));

        String content = StringUtil.getContent2(tplInfoMap.getString("CONTENT"));

        for (int userIdx = 0; userIdx < sendMsgList.size(); userIdx++) {
            SendMsgVO msgVo = sendMsgList.get(userIdx);

            content = setReplaceContent(msgTplMap, content); // 내용 치환
            msgVo.setMessage(content); // 내용
            msgVo.setCallback(SangsProperties.getProperty("Globals.UMS_CALLBACK")); // 발송자 이름
            msgVo.setTplUid(msgTplMap.getString("TPL_UID"));
            sendList.add(msgVo); // 리스트객체에 담기
        }

        commonSendMsgService.sendMsgList(sendList);
    }

    /**
     * 탬플릿 기반 SMS 발송 (단일)
     * @param msgTplMap
     * @param msgVo
     * @param sm
     * @throws Exception
     */
    public void sendMsgProc(DataMap msgTplMap, SendMsgVO msgVo) throws Exception {

        List<SendMsgVO> sendList = new ArrayList<SendMsgVO>(); // 메일 발송 관련 Vo  

        // 메일 제목, 메일 내용 추출
        EduMap tplInfoMap = commonEmsMapper.getSySmsTplInfo(msgTplMap.getString("TPL_UID"));

        String content = StringUtil.getContent2(tplInfoMap.getString("CONTENT"));
        content = setReplaceContent(msgTplMap, content); // 내용 치환

        msgVo.setMessage(content); // 내용
        msgVo.setCallback(SangsProperties.getProperty("Globals.UMS_CALLBACK")); // 회신번호         
        msgVo.setTplUid(msgTplMap.getString("TPL_UID"));

        sendList.add(msgVo); // 리스트객체에 담기
        commonSendMsgService.sendMsgList(sendList);

    }

    /**
     * 공통 단일내용 치환 
     * @param mailTplMap
     * @param content
     * @return
     */
    private String setReplaceContent(DataMap repMap, String content) {
        int j = 1;
        while (true) {

            if (!repMap.containsKey("SEQ" + (j))) {
                break;
            }

            content = StringUtil.replaceStr(content, "$SEQ" + (j), repMap.getString("SEQ" + (j)));
            j++;
        }
        return content;
    }

    /**
     * 공통 다중내용 치환
     * @param arrSeq
     * @param content
     * @return
     */
    private String setMultiReplaceContent(String[] arrSeq, String content) {
        if (arrSeq.length > 0) {
            int j = 1;
            
            //for (String seq : arrSeq) {
            for(int i=0; i < arrSeq.length; i++) {
            	String seq = arrSeq[i];
                content = StringUtil.replaceStr(content, "$SEQ" + (j), seq);
                j++;
            }
        }
        return content;
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
     * 템플릿 기반 메일 발송 (단일)
     * @param mailTplMap
     * @param mailVo
     * @param sm
     * @throws Exception
     */
    public void sendMailProc2(DataMap mailTplMap,SendMailVO mailVo) throws Exception {
    	List<SendMailVO> sendList = new ArrayList<SendMailVO>(); // 메일 발송 관련 Vo  

        // 메일 제목, 메일 내용 추출
        EduMap tplInfoMap = commonEmsMapper.getSyMailTplInfo(mailTplMap.getString("TPL_UID"));


        String content = StringUtil.getContent2(tplInfoMap.getString("CONTENT"));
        content = setReplaceContent(mailTplMap, content); // 내용 치환
        
        mailTplMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_CODE"));
        
        String userHostAddr = getUserHostAddress();
        mailVo.setTitle(mailVo.getTitle()); // 제목
        mailVo.setContent(content); // 내용
        mailVo.setSender(mailVo.getSender()); // 발송자 메일주소
        mailVo.setSender_alias(mailVo.getSender_alias()); // 발송자 이름
        mailVo.setWriterIp(userHostAddr);
        mailVo.setWriterUserid(mailTplMap.getString("SES_USERID"));
        mailVo.setTplUid(mailTplMap.getString("TPL_UID"));
        sendList.add(mailVo); // 리스트객체에 담기
        commonSendMailService.sendMailList(sendList);
        
    }
}
