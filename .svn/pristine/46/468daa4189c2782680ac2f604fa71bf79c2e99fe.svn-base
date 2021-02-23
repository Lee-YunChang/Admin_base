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
import com.webapp.admin.mapper.AdminSmsmanMapper;
import com.webapp.admin.service.AdminSmsmanService;

/**
 * 
 * Description : Smsman Service Impl 
 *
 * Modification Information
 * 수정일			 수정자						수정내용
 * -----------	-----------------------------  -------
 * 2016. 6. 9.	 조남훈, epsvkfo@sangs.co.kr 	최초작성
 *
 */
@Service("adminSmsmanService")
public class AdminSmsmanServiceImpl implements AdminSmsmanService { 

    @Resource(name = "adminSmsmanMapper")
    private AdminSmsmanMapper adminSmsmanMapper;
    

    /**
     * SMS 템플릿 관리 목록 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSySmsTplList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return adminSmsmanMapper.getSySmsTplList(data);
    }
    
    /**
     * SMS 템플릿관리 팝업 (등록/수정 폼)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSySmsTplInfo(DataMap data) throws Exception {
        return adminSmsmanMapper.getSySmsTplInfo(data);
    }
    
    /**
     * SMS 템플릿관리 목록 MAX TPLNO 추출
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getSySmsTplTplnoMaxInfo(DataMap data) throws Exception {
        return adminSmsmanMapper.getSySmsTplTplnoMaxInfo(data);
    }
    
    /**
     * SMS 템플릿관리 (등록 실행)
     *
     * @param data
     * @throws Exception
     */
    public void insertSySmsTplInfo(DataMap data) throws Exception {
        adminSmsmanMapper.insertSySmsTplInfo(data);
    }
	
	/**
     * SMS 템플릿관리 (수정 실행)
     *
     * @param data
     * @throws Exception
     */
    public void updateSySmsTplInfo(DataMap data) throws Exception {
        adminSmsmanMapper.updateSySmsTplInfo(data);
    }
	
	/**
     * SMS 템플릿관리 (삭제 실행)
     *
     * @param data
     * @throws Exception
     */
    public void smsDeleteExec(DataMap data) throws Exception {
        adminSmsmanMapper.smsDeleteExec(data);
    }
    
    /**
     * SMS 발송목록관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSySmsLogList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminSmsmanMapper.getSySmsLogList(data);
    }
    
    /**
     * SMS 발송목록관리 상세보기 팝업
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSySmsLogInfo(DataMap data) throws Exception {
        return adminSmsmanMapper.getSySmsLogInfo(data);
    }

}