package com.webapp.classdesk.ctrl;

import java.util.ArrayList;
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
import com.webapp.common.service.CommonSendMsgService;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : 클래스데스트 > 공통 > sms 발송
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskSmsProcController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "commonEmsService")
    private CommonEmsService     commonEmsService;

    @Resource(name = "commonSendMsgService")
    private CommonSendMsgService commonSendMsgService;

    /**
     * SMS 폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/common/sms/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            //발신번호 세팅
            rMap.setString("callback", SangsProperties.getProperty("Globals.UMS_CALLBACK"));

            // 템플릿 로드
            String tplUid = SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE");

            List recUserIdList = new ArrayList();

            String receiver[] = null;

            String userId = "";
            String userName = "";
            //String email = "";
            String mobile = "";

            String userList = "";
            if (request.getParameterValues("msg_user") != null) {

                int listCnt = request.getParameterValues("msg_user").length;

                for (int i = 0; i < listCnt; i++) {
                    receiver = ParamUtil.getStrParam(request.getParameterValues("msg_user")[i]).split("/");
                    userId = ParamUtil.getStrParam(receiver[0], "-");
                    userName = ParamUtil.getStrParam(receiver[1], "-");
                    //email = ParamUtil.getStrParam(receiver[2], "-");
                    mobile = ParamUtil.getStrParam(receiver[3], "-");
                    mobile = StringUtil.replace(mobile, "-", "");

                    userList = userId + "/" + userName + "/" + mobile;
                    recUserIdList.add(userList);

                    rMap.setInt("listCnt", listCnt);
                    request.setAttribute("listData", recUserIdList);
                }
            }

            //발신번호 세팅
            rMap.setString("sender_userName", SangsProperties.getProperty("Globals.sms.senderName"));
            rMap.setString("sender_mailaddr", SangsProperties.getProperty("Globals.sms.callback"));

            request.setAttribute("rowData", commonEmsService.getSySmsTplInfo(tplUid));
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "admin/cmmn/sms_form";
    }

    /**
     * SMS발송
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/common/sms/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            // 예약발송여부
            int isreserve = rMap.getString("isreserve").length();

            String reserveDate = ParamUtil.getStrParam(rMap.getString("set_senddate"), "");
            String reserveHour = "";
            String reserveMinute = "";

            // 예약발송이 아닐경우 예약 발송 관련 내용을 초기화
            if (isreserve < 1) {
                rMap.setString("isreserve", "N");
                reserveDate = "";
            } else {
                rMap.setString("isreserve", "Y");
                reserveDate = StringUtil.replace(reserveDate, "-", "");
                reserveHour = ParamUtil.getStrParam(rMap.getString("m_hour"), "");
                reserveMinute = ParamUtil.getStrParam(rMap.getString("m_min"), "");
            }

            int itemCnt = request.getParameterValues("receiver_list").length; // 수신자 

            List<SendMsgVO> sendList = new ArrayList<SendMsgVO>();

            for (int i = 0; i < itemCnt; i++) {

                SendMsgVO msgVo = new SendMsgVO();
                msgVo.setRecUserid(request.getParameterValues("receiver_list")[i].split("/")[0]); // 받는사람 아이디
                msgVo.setRecUsername(request.getParameterValues("receiver_list")[i].split("/")[1]); // 받는사람 이름
                msgVo.setRcvphns(request.getParameterValues("receiver_list")[i].split("/")[2]); // 받는사람 핸드폰 번호 

                msgVo.setCallback(ParamUtil.getStrParam(rMap.getString("callback"), SangsProperties.getProperty("Globals.sms.callback"))); // 발신번호
                msgVo.setMessage(ParamUtil.getStrParam(rMap.getString("smsbody"), "")); // 내용

                msgVo.setReserveDate(reserveDate);
                msgVo.setReserveHour(reserveHour);
                msgVo.setReserveMinute(reserveMinute);
                msgVo.setIsreserve(rMap.getString("isreserve"));
                msgVo.setSendUserid(rMap.getString("SES_USERID"));
                msgVo.setTplUid(SangsProperties.getProperty("Globals.TPLUID_ADMIN_TEMPLATE"));

                sendList.add(msgVo);
            }

            // 메일 발송 호출
            sendList = commonSendMsgService.sendMsgList(sendList);

            rMap.putString("rMsg", "실패하였습니다.");

            if (sendList != null && sendList.size() > 0) {
                if ("Y".equals(sendList.get(sendList.size() - 1).getSucccyn())) {
                    rMap.putString("rMsg", "발송되었습니다.");
                    rMap.putString("rScript", "self.close();");
                }
            }

        } catch (Exception e) {
            rMap.putString("rMsg", "실패하였습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
