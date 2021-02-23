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
 * 2016. X. XX.	 XXX 	최초작성
 *
 */
@Mapper("adminMenuMngrMapper")
public interface AdminMenuMngrMapper {

    /**
     * 루트 메뉴 리스트 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getRootMenuList(DataMap data) throws Exception;

    /**
     * 서브 메뉴 리스트 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSubMenuList(DataMap data) throws Exception;

    /**
     * 메뉴정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMenuInfo(DataMap data) throws Exception;

    /**
     * 메뉴정보 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPMenuInfo(DataMap data) throws Exception;

    /**
     * 메뉴등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertMenuInfo(DataMap data) throws Exception;

    /**
     * 메뉴수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateMenuInfo(DataMap data) throws Exception;


    /**
     * 메뉴삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteMenuInfo(DataMap data) throws Exception;

    /**
     * [메뉴권한]  대메뉴목록조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getGradeRootMenuList(DataMap data) throws Exception;

    /**
     * [메뉴권한]  서버메뉴목록조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getGradeSubMenuList(DataMap data) throws Exception;

    /**
     * [메뉴권한] 사용자 권한목록조회 : 권한등록관련 사용용도
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getGradeList(DataMap data) throws Exception;

    /**
     * [메뉴권한]  메뉴코드 저정여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getGradeMenuCount(DataMap data) throws Exception;

    /**
    * [메뉴권한]  등록
    *
    * @param data
    * @return
    * @throws Exception
    */
   public void insertGradeMenuInfo(DataMap data) throws Exception;

   /**
   * [메뉴권한]  수정
   *
   * @param data
   * @return
   * @throws Exception
   */
  public void updateGradeMenuInfo(DataMap data) throws Exception;


}