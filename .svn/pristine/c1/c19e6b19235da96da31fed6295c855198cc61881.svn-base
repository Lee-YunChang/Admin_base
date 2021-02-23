package com.webapp.admin.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 *
 * Description : 관리자 시스템관리 Service
 *
 * Modification Information
 * 수정일           수정자    수정내용
 * -----------  --------------- -------
 * 2016. 5. 31.  김학규     최초작성
 *
 */
public interface AdminBbsCateMngrService {

    /**
     * 게시판 카테고리 코드 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardCategoryInfo(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 생성
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertBoardCategory(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateBoardCategory(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int deleteBoardCategory(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardSubCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세 정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardSubCategoryInfo(DataMap data) throws Exception;

    /**
     * 게시판 카테고리 상세 정보 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertBoardSubCategory(DataMap data) throws Exception;

    public int getMaxBcateno(DataMap data) throws Exception;
    /**
     * 게시판 카테고리 상세 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteBoardSubCategory(DataMap data) throws Exception;

}
