package com.webapp.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.admin.mapper.AdminLoginMapper;
import com.webapp.admin.service.AdminLoginService;

/**
 * 
 * Description : Login Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 21.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService { 

    @Resource(name = "adminLoginMapper")
    private AdminLoginMapper adminLoginMapper;

    
    /**
     * 대분류메뉴 리스트 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCmmnRootMenuList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminLoginMapper.getCmmnRootMenuList(data);
    }
    
    /**
     * 소분류메뉴 리스트 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
   public List<EduMap> getCmmnSubMenuList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminLoginMapper.getCmmnSubMenuList(data);
    }
    
    
    /**
     * 선택된 대분류 메뉴정보 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCmmnRootMenuInfo(DataMap data) throws Exception {
        return adminLoginMapper.getCmmnRootMenuInfo(data);
    }
    
    /**
     * 선택된 메뉴정보 - 안쓰는것같음
     *
     * @param data
     * @return
     * @throws Exception
     */
   public EduMap getCurrentMenuInfo(DataMap data) throws Exception {
        return adminLoginMapper.getCurrentMenuInfo(data);
    }
    
    /**
     * 로그인 세션 저장
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateLoginInfo(DataMap data) throws Exception {
        adminLoginMapper.updateLoginInfo(data);
    }

}
