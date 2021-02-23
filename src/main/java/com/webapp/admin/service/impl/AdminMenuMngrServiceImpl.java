package com.webapp.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.admin.mapper.AdminMenuMngrMapper;
import com.webapp.admin.service.AdminMenuMngrService;

/**
 *
 * Description : User Service Impl
 *
 * Modification Information
 * 수정일			 수정자	수정내용
 * -----------	-------------  -------
 * 2016. X. XX.	 XXX 	최초작성
 *
 */
@Service("adminMenuMngrService")
public class AdminMenuMngrServiceImpl implements AdminMenuMngrService {

    @Resource(name = "adminMenuMngrMapper")
    private AdminMenuMngrMapper adminMenuMngrMapper;

    /**
     * 루트 메뉴 리스트 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getRootMenuList(DataMap data) throws Exception {
        return adminMenuMngrMapper.getRootMenuList(data);
    }

    /**
     * 루트 메뉴 리스트 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSubMenuList(DataMap data) throws Exception {
        return adminMenuMngrMapper.getSubMenuList(data);
    }

    /**
     * 메뉴정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMenuInfo(DataMap data) throws Exception {
        return adminMenuMngrMapper.getMenuInfo(data);
    }

    /**
     * 메뉴정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPMenuInfo(DataMap data) throws Exception {
        return adminMenuMngrMapper.getPMenuInfo(data);
    }

    /**
     * 메뉴 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertMenuInfo(DataMap data) throws Exception {
        adminMenuMngrMapper.insertMenuInfo(data);
    }

    /**
     * 메뉴 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateMenuInfo(DataMap data) throws Exception {
        adminMenuMngrMapper.updateMenuInfo(data);
    }

    /**
     * 메뉴 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteMenuInfo(DataMap data) throws Exception {
        adminMenuMngrMapper.deleteMenuInfo(data);
    }

    /**
     * [메뉴권한]  대메뉴목록조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getGradeRootMenuList(DataMap data) throws Exception {
        return adminMenuMngrMapper.getGradeRootMenuList(data);
    }

    /**
     * [메뉴권한]  서버메뉴목록조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getGradeSubMenuList(DataMap data) throws Exception {
        return adminMenuMngrMapper.getGradeSubMenuList(data);
    }

    /**
     * [메뉴권한] 사용자 권한목록조회 : 권한등록관련 사용용도
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getGradeList(DataMap data) throws Exception {
        return adminMenuMngrMapper.getGradeList(data);
    }

    /**
     * [메뉴권한]  메뉴코드 저정여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getGradeMenuCount(DataMap data) throws Exception {
        return adminMenuMngrMapper.getGradeMenuCount(data);
    }

    /**
     * [메뉴권한]  등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertGradeMenuInfo(DataMap data) throws Exception {
        adminMenuMngrMapper.insertGradeMenuInfo(data);
    }

    /**
     * [메뉴권한]  수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateGradeMenuInfo(DataMap data) throws Exception {
        adminMenuMngrMapper.updateGradeMenuInfo(data);
    }



}