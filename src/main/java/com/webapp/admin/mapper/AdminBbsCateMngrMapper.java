package com.webapp.admin.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 *
 * Description : User Mapper
 *
 * Modification Information
 * 수정일			 수정자	수정내용
 * -----------	-------------  -------
 * 2016. 5. 31.	 김학규 	최초작성
 *
 */
@Mapper("adminBbsCateMngrMapper")
public interface AdminBbsCateMngrMapper {

    /**
     * 게시판 카테고리 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardCategoryInfo(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 등록
     *
     * @param data
     * @throws Exception
     */
    void insertBoardCategory(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 수정
     *
     * @param data
     * @throws Exception
     */
    void updateBoardCategory(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 count
     *
     * @param data
     * @throws Exception
     */
    int getSubCategoryCnt(DataMap data) throws Exception;



    /**
     * 게시판 카테고리 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteBoardCategory(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardSubCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세 정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardSubCategoryInfo(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세 정보 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertBoardSubCategory(DataMap data) throws Exception;

    int getMaxBcateno(DataMap data) throws Exception;
    
    /**
     * 게시판 카테고리 상세 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteBoardSubCategory(DataMap data) throws Exception;





}