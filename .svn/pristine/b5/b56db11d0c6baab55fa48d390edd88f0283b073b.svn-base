package com.webapp.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.admin.mapper.AdminTempMapper;
import com.webapp.admin.service.AdminTempService;

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
@Service("adminTempService")
public class AdminTempServiceImpl implements AdminTempService {

    @Resource(name = "adminTempMapper")
    private AdminTempMapper adminTempMapper;

    /**
     * 회원가입 연도 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTempList(DataMap data) throws Exception {
        return adminTempMapper.getTempList(data);
    }


    /**
     * 회원 상세정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getTempInfo(DataMap data) throws Exception {
        return adminTempMapper.getTempInfo(data);
    }

    /**
     * 회원정보 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateTempInfo(DataMap data) throws Exception {
        adminTempMapper.updateTempInfo(data);
    }



    /**
     * 기업정보 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertTempInfo(DataMap data) throws Exception {
        adminTempMapper.insertTempInfo(data);
    }



    /**
     * 기업 - 회원 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteTempInfo(DataMap data) throws Exception {
        adminTempMapper.deleteTempInfo(data);
    }



}