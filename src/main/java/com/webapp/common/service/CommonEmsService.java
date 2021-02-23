package com.webapp.common.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.common.vo.SendMailVO;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : Common Ems Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

public interface CommonEmsService {
    
    /**
     * 메일 템플릿 조회
     * 
     * @param TPL_UID
     * @return
     * @throws Exception
     */
    EduMap getSyMailTplInfo(String TPL_UID) throws Exception;

    /**
     * SMS 템플릿 조회
     * 
     * @param tplUid
     * @return
     * @throws Exception
     */
    EduMap getSySmsTplInfo(String tplUid) throws Exception;

    /**
     * MMS 발송 등록
     * 
     * @param sendMsgVO
     * @throws Exception
     */
    void insertEmTranMms(SendMsgVO sendMsgVO) throws Exception;

    /**
     * SMS 발송 등록
     * 
     * @param sendMsgVO
     * @throws Exception
     */
    void insertEmTran(SendMsgVO sendMsgVO) throws Exception;

    /**
     * SMS발생로그등록
     * 
     * @param sendMsgVO
     * @throws Exception
     */
    void insertSySmsLog(SendMsgVO sendMsgVO) throws Exception;

    /**
     * getMsgBatchLogCnt
     * 
     * @param nowDate
     * @return
     * @throws Exception
     */
    int getMsgBatchLogCnt(String nowDate) throws Exception;

    /**
     * getMsgBatchLeCourseUserList
     * 
     * @param str
     * @return
     * @throws Exception
     */
    List<EduMap> getMsgBatchLeCourseUserList(String str) throws Exception;

    /**
     * insertMsgBatchLog
     * 
     * @param data
     * @throws Exception
     */
    void insertMsgBatchLog(DataMap data) throws Exception;

    /**
     * 메일 발송순번
     * 
     */
    int getSyMailLogMailSeqMaxInfo() throws Exception;

    /**
     * 메일발송로그
     * 
     * @param sendMailVO
     * @throws Exception
     */
    void insertSyMailLog(SendMailVO sendMailVO) throws Exception;

    /**
     * 메일발송로그
     * 
     * @param sendMailVO
     * @throws Exception
     */
    void insertSyMailLogRec(SendMailVO sendMailVO) throws Exception;
}
