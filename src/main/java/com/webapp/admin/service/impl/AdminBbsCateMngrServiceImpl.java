package com.webapp.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.admin.mapper.AdminBbsCateMngrMapper;
import com.webapp.admin.service.AdminBbsCateMngrService;

/**
 *
 * Description : User Service Impl
 *
 * Modification Information
 * 수정일           수정자    수정내용
 * -----------  -------------  -------
 * 2016. 5. 31.  김학규    최초작성
 *
 */
@Service("adminBbsCateMngrService")
public class AdminBbsCateMngrServiceImpl implements AdminBbsCateMngrService {

    @Resource(name = "adminBbsCateMngrMapper")
    private AdminBbsCateMngrMapper adminBbsCateMngrMapper;

    /**
     * 게시판코드 카테고리 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardCategoryList(DataMap data) throws Exception {
        return adminBbsCateMngrMapper.getBoardCategoryList(data);
    }


    /**
     * 게시판코드 카테고리 상세정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardCategoryInfo(DataMap data) throws Exception {
        return adminBbsCateMngrMapper.getBoardCategoryInfo(data);
    }

    /**
     * 게시판코드 카테고리 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertBoardCategory(DataMap data) throws Exception {
        adminBbsCateMngrMapper.insertBoardCategory(data);
    }

    /**
     * 게시판코드 카테고리 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateBoardCategory(DataMap data) throws Exception {
        adminBbsCateMngrMapper.updateBoardCategory(data);
    }

    /**
     * 게시판코드 카테고리 삭제
     *
     * @param data
     * @throws Exception
     */
    public int deleteBoardCategory(DataMap data) throws Exception {
        try{

             int cnt =adminBbsCateMngrMapper.getSubCategoryCnt(data);

             if(cnt < 1){
                 adminBbsCateMngrMapper.deleteBoardCategory(data);
             }

         return cnt;


        }catch(Exception e){
            return 1;
        }

    }

    /**
     * 게시판코드 카테고리 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardSubCategoryList(DataMap data) throws Exception {
        return adminBbsCateMngrMapper.getBoardSubCategoryList(data);
    }

    /**
     * 게시판코드 카테고리 상세 정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardSubCategoryInfo(DataMap data) throws Exception {
        return adminBbsCateMngrMapper.getBoardSubCategoryInfo(data);
    }

    /**
     * 게시판코드 카테고리 상세 정보 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertBoardSubCategory(DataMap data) throws Exception {
        adminBbsCateMngrMapper.insertBoardSubCategory(data);
    }

    public int getMaxBcateno(DataMap data) throws Exception {
    	return adminBbsCateMngrMapper.getMaxBcateno(data);
    }
    /**
     * 게시판코드 카테고리 상세 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteBoardSubCategory(DataMap data) throws Exception {
        adminBbsCateMngrMapper.deleteBoardSubCategory(data);
    }





}