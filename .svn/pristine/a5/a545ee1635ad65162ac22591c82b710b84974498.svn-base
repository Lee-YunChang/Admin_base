package com.webapp.admin.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.admin.mapper.AdminMailmanMapper;
import com.webapp.admin.service.AdminMailmanService;

/**
 * 
 * Description : Mailman Service Impl 
 *
 * Modification Information
 * 수정일			 수정자						수정내용
 * -----------	-----------------------------  -------
 * 2016. 6. 9.	 조남훈, epsvkfo@sangs.co.kr 	최초작성
 *
 */
@Service("adminMailmanService")
public class AdminMailmanServiceImpl implements AdminMailmanService { 

    @Resource(name = "adminMailmanMapper")
    private AdminMailmanMapper adminMailmanMapper;
    

    /**
     * 메일 템플릿 관리 목록 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSyMailTplList(DataMap data) throws Exception {
    	//data.setInt("rowCount", 20);
    	data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
        return adminMailmanMapper.getSyMailTplList(data);
    }
    
    /**
     * 메일 템플릿관리 (등록/수정 폼)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSyMailTplInfo(DataMap data) throws Exception {
        return adminMailmanMapper.getSyMailTplInfo(data);
    }
    
    /**
     * 메일 템플릿관리 목록 MAX TPLNO 추출
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getSyMailTplTplnoMaxInfo(DataMap data) throws Exception {
        return adminMailmanMapper.getSyMailTplTplnoMaxInfo(data);
    }
    
    /**
     * 메일 템플릿관리 (등록 실행)
     *
     * @param data
     * @throws Exception
     */
    public void insertSyMailTplInfo(DataMap data) throws Exception {
        adminMailmanMapper.insertSyMailTplInfo(data);
    }
	
	/**
     * 메일 템플릿관리 (수정 실행)
     *
     * @param data
     * @throws Exception
     */
    public void updateSyMailTplInfo(DataMap data) throws Exception {
        adminMailmanMapper.updateSyMailTplInfo(data);
    }
    
	/**
     * 메일 템플릿관리 (삭제 실행)
     *
     * @param data
     * @throws Exception
     */
    public void mailDeleteExec(DataMap data) throws Exception {
        adminMailmanMapper.mailDeleteExec(data);
    }
    
    /**
     * 메일 발송목록관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSyMailLogList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminMailmanMapper.getSyMailLogList(data);
    }
    
    /**
     * 메일 발송목록관리 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSyMailLogInfo(DataMap data) throws Exception {
        return adminMailmanMapper.getSyMailLogInfo(data);
    }

}