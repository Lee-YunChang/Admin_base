package com.webapp.classdesk.ctrl;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.sangs.util.StringUtil;
import com.webapp.common.service.CommonEmsService;
import com.webapp.common.service.CommonSendMailService;
import com.webapp.common.vo.SendMailVO;

/**
 * Description : 클래스데스트 > 공통 > mail 발송
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskMailProcController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "commonEmsService")
    private CommonEmsService      commonEmsService;

    @Resource(name = "commonSendMailService")
    private CommonSendMailService commonSendMailService;

    /**
     * 메일 폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/common/mail/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            // 템플릿 로드
            String tplUid = SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE");

            List recUserIdList = new ArrayList();

            String receiver[] = null;

            String userId = "";
            String userName = "";
            String email = "";
            String mobile = "";

            String userList = "";

            if (request.getParameterValues("msg_user") != null) {
                int listCnt = request.getParameterValues("msg_user").length;

                for (int i = 0; i < listCnt; i++) {
                    receiver = ParamUtil.getStrParam(request.getParameterValues("msg_user")[i]).split("/");
                    userId = ParamUtil.getStrParam(receiver[0], "-");
                    userName = ParamUtil.getStrParam(receiver[1], "-");
                    email = ParamUtil.getStrParam(receiver[2], "-");
                    mobile = ParamUtil.getStrParam(receiver[3], "-");
                    mobile = StringUtil.replace(mobile, "-", "");

                    userList = userId + "/" + userName + "/" + email;
                    recUserIdList.add(userList);

                    rMap.setInt("listCnt", listCnt);

                    request.setAttribute("listData", recUserIdList);

                }
            }

            //발신번호 세팅
            rMap.setString("sender_userName", SangsProperties.getProperty("Globals.mailSenderAliasName"));
            rMap.setString("sender_mailaddr", SangsProperties.getProperty("Globals.mailSenderMailAddr"));

            request.setAttribute("rowData", commonEmsService.getSyMailTplInfo(tplUid));
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/mail_form";
    }

    /**
     * 메일발송
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/common/mail/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            int itemCnt = request.getParameterValues("receiver_list").length;
            String userHostAddr = getUserHostAddress();
            List<SendMailVO> sendList = new ArrayList<SendMailVO>();

            String receiverAlias = "";
            String content = StringUtil.getContent2(rMap.getString("content2"));

            // 작성자 정보 세팅
            for (int i = 0; i < itemCnt; i++) {

                SendMailVO mailVo = new SendMailVO();

                mailVo.setRecUserid(rMap.getString("receiver_list", i).split("/")[0]);
                mailVo.setRecEmail(rMap.getString("receiver_list", i).split("/")[2]);
                receiverAlias = rMap.getString("receiver_list", i).split("/")[1];

                if (receiverAlias.equals(null) || receiverAlias.equals("") || receiverAlias.equals("-")) {
                    mailVo.setReceiver_alias(rMap.getString("receiver_list", i).split("/")[2]);
                } else {
                    mailVo.setReceiver_alias(receiverAlias);
                }
                mailVo.setRecUsername(rMap.getString("receiver_list", i).split("/")[1]);

                mailVo.setTitle(rMap.getString("subject"));
                mailVo.setContent(content);
                mailVo.setSender(rMap.getString("sender_mailaddr"));
                mailVo.setSender_alias(rMap.getString("sender_userName"));

                mailVo.setTplUid(SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));

                mailVo.setWriterUserid(rMap.getString("SES_USERID"));
                mailVo.setWriterUsername(rMap.getString("SES_USERNAME"));
                mailVo.setWriterIp(userHostAddr);

                sendList.add(mailVo);
            }

            // 메일 발송 호출
            sendList = commonSendMailService.sendMailList(sendList);

            rMap.putString("rMsg", "실패하였습니다.");

            if (sendList != null && sendList.size() > 0) {
                if ("Y".equals(sendList.get(sendList.size() - 1).getSucccyn())) {
                    rMap.putString("rMsg", "발송되었습니다");
                    rMap.putString("rScript", "fnClose()");
                }
            }
        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
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
        	
        } catch (RuntimeException e) {
        	
        } catch (Exception e) {
            
        }

        return userHostAddr;
    }
}
