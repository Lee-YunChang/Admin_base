package com.webapp.admin.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
*
* Description : 관리자 시스템관리 mapper
*
* Modification Information
* 수정일           수정자    수정내용
* -----------  --------------- -------
* 2016. 5. 16.  김학규     최초작성
*
*/

@Mapper("adminMtCodeMngrMapper")
public interface AdminMtCodeMngrMapper {

	/**
     * 공통코드 신규등록(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMtCdAscInfo(Map<String, String> params) throws Exception;
    
    /**
     * 공통코드 수정(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateMtCdAscInfo(Map<String, String> params) throws Exception;
    
    /**
     * 공통코드 삭제(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteMtCdAscInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 공통코드 리스트(ASCII)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<Map> cmmnCodeAsciiList(Map<String, String> params) throws Exception;
	
	/**
	 * 공통코드 리스트2(ASCII)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> cmmnCodeAsciiList2(DataMap data) throws Exception;
	
	/**
	 * 공통코드 리스트3(ASCII)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> cmmnCodeAsciiList3(DataMap data) throws Exception;
	
    /**
     * 공통코드 번호(하위코드 확인)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int mtCdDeleteChkCnt(Map<String, String> params) throws Exception;
	
	/**
     * 공통코드 신규등록(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMtCdInfo(Map<String, String> params) throws Exception;
    
    /**
     * 공통코드 수정(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateMtCdInfo(Map<String, String> params) throws Exception;
    
    /**
     * 공통코드 삭제(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteMtCdInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 공통코드 번호(중복확인)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	int cmmnCodeDoubleChk(DataMap data) throws Exception;
	
	/**
	 * 공통코드 리스트(tree)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> cmmnCodeTreeList(DataMap data) throws Exception;
	
	/**
	 * 공통코드 리스트2(tree)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<Map> cmmnCodeTreeList2(Map<String, String> params) throws Exception;
	
	/**
	 * 공통코드 리스트2(tree)(박진만)
	 *
	 * @param data
	 * @return
	 * @throws Exception
	 */
	int cmmnCodeTreeListTotalCnt(Map<String, String> params);
	
	 /**
     * 공통코드 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMtcodeListCount(DataMap data) throws Exception;

    
    /**
     * 공통코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtcodeList(DataMap data) throws Exception;

    /**
     * 공통코드 대분류 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMtcodInfo(DataMap data) throws Exception;

    /**
     * 공통코드 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMtcodeInfo(DataMap data) throws Exception;

    /**
     * 공통코드 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateMtcodeInfo(DataMap data) throws Exception;

    /**
     * 공통코드 상세 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertMtcodeSubInfo(DataMap data) throws Exception;

    /**
     * 공통코드 상세 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateMtcodeSubInfo(DataMap data) throws Exception;

    /**
     * 공통코드 소분류 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtcodeSubList(DataMap data) throws Exception;

    /**
     * 공통코드 소분류 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMtcodeSubInfo(DataMap data) throws Exception;

    /**
     * 공통코드 소분류 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteMtcodeSubInfo(DataMap data) throws Exception;

}
