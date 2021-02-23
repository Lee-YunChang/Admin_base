package com.webapp.common.service;

import java.util.List;

import com.sangs.support.DataMap;
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

public interface CommonSendMailService {

    /**
     * 메일 보내기(다수건)
     * 
     * @param sendList
     * @return
     * @throws Exception
     */
    List<SendMailVO> sendMailList(List<SendMailVO> sendList) throws Exception;

    /**
     * 메일 보내기(한건)
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    SendMailVO sendMail(SendMailVO vo) throws Exception;
    
    /**
     * mail log
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMailLog(DataMap data) throws Exception;
    
    /**
     * insertMailLogRec
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMailLogRec(DataMap data) throws Exception;
    
    /**
     * getMaxMailSeq
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxMailSeq(DataMap data) throws Exception;
    
    /**
     * getMaxMailSeqRec
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxMailSeqRec(DataMap data) throws Exception;
}
