package com.webapp.admin.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.admin.mapper.AdminExcelSmsMapper;
import com.webapp.admin.service.AdminExcelSmsService;

/**
 * 
 * Description : 특강관리 Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 21.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminExcelSmsService")
public class AdminExcelSmsServiceImpl implements AdminExcelSmsService { 

	private Logger log = LogManager.getLogger(AdminBoardServiceImpl.class);
	
    @Resource(name = "adminExcelSmsMapper")
    private AdminExcelSmsMapper adminExcelSmsMapper;
    
    
	@Override
	public void insertExcelSmsUpload(DataMap rMap) throws Exception {
		// TODO Auto-generated method stub
		adminExcelSmsMapper.insertExcelSmsUpload(rMap);
	}
	
	/**
     * 엑셀 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
	@Override
    public int getExcelSmsListCount(DataMap data) throws Exception{
		return adminExcelSmsMapper.getExcelSmsListCount(data);
	}
    
    /**
     * 엑셀 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	@Override
    public List<EduMap> getExcelSmsList(DataMap data) throws Exception{
		data.setInt("rowCount", 20);
    	ParamUtil.setPagingValue(data);
		return adminExcelSmsMapper.getExcelSmsList(data);
	}
	
	/**
     * 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
	@Override
	public EduMap getExcelFileInfo(DataMap data) throws Exception{
		return adminExcelSmsMapper.getExcelFileInfo(data);
	}
	
}