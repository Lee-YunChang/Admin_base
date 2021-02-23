package com.webapp.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.common.mapper.CommonEmsMapper;
import com.webapp.common.service.CommonEmsService;
import com.webapp.common.vo.SendMailVO;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : Common User Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("commonEmsService")
public class CommonEmsServiceImpl implements CommonEmsService {

    @Resource(name = "commonEmsMapper")
    private CommonEmsMapper commonEmsMapper;
    
    /**
     * 메일 템플릿 조회
     * 
     * @param TPL_UID
     * @return
     * @throws Exception
     */
    public EduMap getSyMailTplInfo(String TPL_UID) throws Exception {
        return commonEmsMapper.getSyMailTplInfo(TPL_UID);
    }

    /**
     * SMS 템플릿 조회
     * 
     * @param tplUid
     * @return
     * @throws Exception
     */
    public EduMap getSySmsTplInfo(String tplUid) throws Exception {
        return commonEmsMapper.getSySmsTplInfo(tplUid);
    }

    /**
     * MMS 발송 등록
     * 
     * @param sendMsgVO
     * @throws Exception
     */
    public void insertEmTranMms(SendMsgVO sendMsgVO) throws Exception {
        commonEmsMapper.insertEmTranMms(sendMsgVO);
    }

    /**
     * SMS 발송 등록
     * 
     * @param sendMsgVO
     * @throws Exception
     */
    public void insertEmTran(SendMsgVO sendMsgVO) throws Exception {
        commonEmsMapper.insertEmTran(sendMsgVO);
    }

    /**
     * SMS발생로그등록
     * 
     * @param sendMsgVO
     * @throws Exception
     */
    public void insertSySmsLog(SendMsgVO sendMsgVO) throws Exception {
        commonEmsMapper.insertSySmsLog(sendMsgVO);
    }

    /**
     * getMsgBatchLogCnt
     * 
     * @param nowDate
     * @return
     * @throws Exception
     */
    public int getMsgBatchLogCnt(String nowDate) throws Exception {
        return commonEmsMapper.getMsgBatchLogCnt(nowDate);
    }

    /**
     * getMsgBatchLeCourseUserList
     * 
     * @param str
     * @return
     * @throws Exception
     */
    public List<EduMap> getMsgBatchLeCourseUserList(String str) throws Exception {
        return commonEmsMapper.getMsgBatchLeCourseUserList(str);
    }

    /**
     * insertMsgBatchLog
     * 
     * @param data
     * @throws Exception
     */
    public void insertMsgBatchLog(DataMap data) throws Exception {
        commonEmsMapper.insertMsgBatchLog(data);
    }

    /**
     * 메일 발송순번
     * 
     */
    public int getSyMailLogMailSeqMaxInfo() throws Exception {
        return commonEmsMapper.getSyMailLogMailSeqMaxInfo();
    }

    /**
     * 메일발송로그
     * 
     * @param sendMailVO
     * @throws Exception
     */
    public void insertSyMailLog(SendMailVO sendMailVO) throws Exception {
        commonEmsMapper.insertSyMailLog(sendMailVO);
    }

    /**
     * 메일발송로그
     * 
     * @param sendMailVO
     * @throws Exception
     */
    public void insertSyMailLogRec(SendMailVO sendMailVO) throws Exception {
        commonEmsMapper.insertSyMailLogRec(sendMailVO);
    }
}
