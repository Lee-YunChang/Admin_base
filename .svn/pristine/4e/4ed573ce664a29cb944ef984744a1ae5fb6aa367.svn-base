package com.webapp.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.admin.mapper.AdminUserMapper;
import com.webapp.admin.service.AdminUserService;

/**
 *
 * Description : User Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 21.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {

    @Resource(name = "adminUserMapper")
    private AdminUserMapper adminUserMapper;

    /**
     * 회원가입 연도 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserRgsdeYear(DataMap data) throws Exception {
        return adminUserMapper.getUserRgsdeYear(data);
    }

    /**
     * 회원정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
    	ParamUtil.setPagingValue(data);
        return adminUserMapper.getUserList(data);
    }

    /**
     * 회원정보 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getUserListCount(DataMap data) throws Exception {
        return adminUserMapper.getUserListCount(data);
    }
    
    /**
     * 총 회원 카운트
     *
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getTotalUserCount(DataMap data) throws Exception{
    	return adminUserMapper.getTotalUserCount(data);
    }
    
    /**
     * 회원 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserInfo(DataMap data) throws Exception {
        return adminUserMapper.getUserInfo(data);
    }

    /**
     * 회원정보 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateUserInfo(DataMap data) throws Exception {
        adminUserMapper.updateUserInfo(data);
    }

    /**
     * 비밀번호 초기화
     *
     * @param data
     * @throws Exception
     */
    public void updatePwdClearInfo(DataMap data) throws Exception {
        adminUserMapper.updatePwdClearInfo(data);
    }

    /**
     * 탈퇴회원정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserCancelList(DataMap data) throws Exception {
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminUserMapper.getUserCancelList(data);
    }

    /**
     * 탈퇴회원정보 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getUserCancelListCount(DataMap data) throws Exception {
        return adminUserMapper.getUserCancelListCount(data);
    }

    /**
     * 기업 정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCompanyList(DataMap data) throws Exception {
        data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminUserMapper.getCompanyList(data);
    }

    /**
     * 기업 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCompanyInfo(DataMap data) throws Exception {
        return adminUserMapper.getCompanyInfo(data);
    }

    /**
     * 기업정보 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertCompanyInfo(DataMap data) throws Exception {
        adminUserMapper.insertCompanyInfo(data);
    }

    /**
     * 기업정보 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertCompanyExcel(SangsMap data) throws Exception {
        adminUserMapper.insertCompanyExcel(data);
    }

    /**
     * 기업정보 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateCompanyInfo(DataMap data) throws Exception {
        adminUserMapper.updateCompanyInfo(data);
    }

    /**
     * 기업 - 회원 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteCompanyEmpInfo(DataMap data) throws Exception {
        adminUserMapper.deleteCompanyEmpInfo(data);
    }

    /**
     * 기업 - 사용자 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteCompanyUserInfo(DataMap data) throws Exception {
        adminUserMapper.deleteCompanyUserInfo(data);
    }

    /**
     * 기업 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteCompanyInfo(DataMap data) throws Exception {
        adminUserMapper.deleteCompanyInfo(data);
    }

    /**
     * 기업담당자 권한 변경
     *
     * @param data
     * @throws Exception
     */
    public void updateMtGradeCodeInfo(DataMap data) throws Exception {
        adminUserMapper.updateMtGradeCodeInfo(data);
    }

    /**
     * 기업담당자 권한 변경
     *
     * @param data
     * @throws Exception
     */
    public void updateMtGradeCodeInfoAfter(DataMap data) throws Exception {
        adminUserMapper.updateMtGradeCodeInfoAfter(data);
    }

    /**
     * 기업 일괄 승인
     *
     * @param data
     * @throws Exception
     */
    public void updateApprovalInfo(DataMap data) throws Exception {
        adminUserMapper.updateApprovalInfo(data);
    }

    /**
     * 관할기관 찾기 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCompanyCodeList(DataMap data) throws Exception {
        data.set("rowCount", "10");
        ParamUtil.setPagingValue(data);
        return adminUserMapper.getCompanyCodeList(data);
    }

    /**
     * 관할기관 찾기 리스트 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getCompanyCodeCount(DataMap data) throws Exception {
        return adminUserMapper.getCompanyCodeCount(data);
    }
    
    /**
     * 회원탈퇴
     *
     * @param data
     * @throws Exception
     */
    public void withdrawUser(DataMap data) throws Exception {
        adminUserMapper.withdrawUser(data);
    }
    
    /**
     * 비회원정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getNmberList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return adminUserMapper.getNmberList(data);
    }
    
    /**
     * 비회원 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getNmberInfo(DataMap data) throws Exception {
        return adminUserMapper.getNmberInfo(data);
    }
    
    /**
     * 비회원정보 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateNmberInfo(DataMap data) throws Exception {
        adminUserMapper.updateNmberInfo(data);
    }
    
    /**
     * 비회원정보 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertNmberInfo(DataMap data) throws Exception {
        adminUserMapper.insertNmberInfo(data);
    }
    
}