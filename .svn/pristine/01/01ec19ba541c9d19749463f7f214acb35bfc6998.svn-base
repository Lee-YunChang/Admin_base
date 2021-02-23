package com.webapp.common.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.common.mapper.CommonEmsMapper;
import com.webapp.common.service.CommonSendMsgService;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : Common SMS Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("commonSendMsgService")
public class CommonSendMsgServiceImpl implements CommonSendMsgService {

    @Resource(name = "commonEmsMapper")
    private CommonEmsMapper commonEmsMapper;

    private String          callback = SangsProperties.getProperty("Globals.sms.callback");

    private Logger          log      = LogManager.getLogger(CommonSendMsgServiceImpl.class);

    /**
     * SMS 보내기 (다건)
     * 
     * @param sendList
     * @return
     * @throws Exception
     */
    public List<SendMsgVO> sendMsgList(List<SendMsgVO> sendList) throws Exception {
        try {
            /*************** SEND EXEC   ***********************/
            for (int i = 0; i < sendList.size(); i++) {
                SendMsgVO vo = sendList.get(i);
                sendMsg(vo);
            }
        } catch (Exception ex) {
        }

        return sendList;
    }

    /**
     * SMS 보내기 (한건)
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public SendMsgVO sendMsg(SendMsgVO vo) throws Exception {
        try {
            String rcvphns = vo.getRcvphns().replaceAll("%5EM", "");
            vo.setRcvphns(rcvphns);

            String msg = vo.getMessage();
            msg.replaceAll("&lt;", "<");
            msg.replaceAll("&gt;", ">");
            vo.setMessage(msg);

            callback = ParamUtil.getStrParam(vo.getCallback(), callback);
            vo.setCallback(callback);

            // 예약일자 존재시 발송 
            if (vo.getIsreserve().equals("Y")) {
                String reserveHour = ParamUtil.getStrParam(vo.getReserveHour(), "00");
                String reserveMinute = ParamUtil.getStrParam(vo.getReserveMinute(), "00");
                vo.setReserveHour(reserveHour);
                vo.setReserveMinute(reserveMinute);
            }


            vo.setTranType("4");
            if (msg.getBytes().length > 80) {
                // LMS 정보 세팅
                vo.setTranType("6");
                commonEmsMapper.insertEmTranMms(vo);
            }

            // 메세지 전송
            commonEmsMapper.insertEmTran(vo);

            // 메세지 로그 등록
            commonEmsMapper.insertSySmsLog(vo);

            vo.setSucccyn("Y");
        } catch (Exception e) {
            vo.setSucccyn("N");
        }

        return vo;
    }
}
