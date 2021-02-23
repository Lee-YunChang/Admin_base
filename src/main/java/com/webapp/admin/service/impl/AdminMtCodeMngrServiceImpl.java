package com.webapp.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.admin.mapper.AdminMtCodeMngrMapper;
import com.webapp.admin.service.AdminMtCodeMngrService;

/**
*
* Description : 관리자 시스템관리 Service 상세
*
* Modification Information
* 수정일           수정자    수정내용
* -----------  --------------- -------
* 2016. 5. 16.  김학규     최초작성
*
*/

@Service("adminMtCodeMngrService")
public class AdminMtCodeMngrServiceImpl implements AdminMtCodeMngrService {

    @Resource(name = "adminMtCodeMngrMapper")
    private AdminMtCodeMngrMapper adminMtCodeMngrMapper;

    /**
     * 공통코드 신규등록(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertMtCdAscInfo(Map<String, String> params) throws Exception {
    	adminMtCodeMngrMapper.insertMtCdAscInfo(params);
    }
    
    /**
     * 공통코드 수정(박진만)
     *
     * @param params
     * @return
     * @throws Exception
     */
    public void updateMtCdAscInfo(Map<String, String> params) throws Exception {
    	adminMtCodeMngrMapper.updateMtCdAscInfo(params);
    }
    
    /**
     * 공통코드 삭제(박진만)
     *
     * @param params
     * @return
     * @throws Exception
     */
    public void deleteMtCdAscInfo(Map<String, String> params) throws Exception {
    	adminMtCodeMngrMapper.deleteMtCdAscInfo(params);
    }
    
    /**
     * 공통코드 리스트(ASCII)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<Map> cmmnCodeAsciiList(Map<String, String> params) throws Exception {
    	return adminMtCodeMngrMapper.cmmnCodeAsciiList(params);
    }
    
    /**
     * 공통코드 리스트2(ASCII)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> cmmnCodeAsciiList2(DataMap data) throws Exception {
    	return adminMtCodeMngrMapper.cmmnCodeAsciiList2(data);
    }
    
    /**
     * 공통코드 리스트3(ASCII)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> cmmnCodeAsciiList3(DataMap data) throws Exception {
    	return adminMtCodeMngrMapper.cmmnCodeAsciiList3(data);
    }
    
    /**
     * 공통코드 번호(하위코드 확인)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int mtCdDeleteChkCnt(Map<String, String> params) throws Exception {
    	return adminMtCodeMngrMapper.mtCdDeleteChkCnt(params);
    }
    
    /**
     * 공통코드 신규등록(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertMtCdInfo(Map<String, String> params) throws Exception {
    	adminMtCodeMngrMapper.insertMtCdInfo(params);
    }
    
    /**
     * 공통코드 수정(박진만)
     *
     * @param params
     * @return
     * @throws Exception
     */
    public void updateMtCdInfo(Map<String, String> params) throws Exception {
    	adminMtCodeMngrMapper.updateMtCdInfo(params);
    }
    
    /**
     * 공통코드 삭제(박진만)
     *
     * @param params
     * @return
     * @throws Exception
     */
    public void deleteMtCdInfo(Map<String, String> params) throws Exception {
    	adminMtCodeMngrMapper.deleteMtCdInfo(params);
    }
    
    /**
     * 공통코드 번호(중복확인)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int cmmnCodeDoubleChk(DataMap data) throws Exception {
    	return adminMtCodeMngrMapper.cmmnCodeDoubleChk(data);
    }
    
    /**
     * 공통코드 리스트(tree)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> cmmnCodeTreeList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
    	ParamUtil.setPagingValue(data);
    	return adminMtCodeMngrMapper.cmmnCodeTreeList(data);
    }
    
    /**
     * 공통코드 리스트2(tree)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<Map> cmmnCodeTreeList2(Map<String, String> params) throws Exception {
    	return adminMtCodeMngrMapper.cmmnCodeTreeList2(params);
    }
    
    /**
     * 공통코드 리스트2(tree)(박진만)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int cmmnCodeTreeListTotalCnt(Map<String, String> params) throws Exception {
    	return adminMtCodeMngrMapper.cmmnCodeTreeListTotalCnt(params);
    }
    
    /**
     * 공통코드 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMtcodeListCount(DataMap data) throws Exception {
        return adminMtCodeMngrMapper.getMtcodeListCount(data);
    }

    
    /**
     * 공통코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMtcodeList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
    	ParamUtil.setPagingValue(data);
        return adminMtCodeMngrMapper.getMtcodeList(data);
    }

    /**
     * 공통코드 대분류 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMtcodInfo(DataMap data) throws Exception {
        return adminMtCodeMngrMapper.getMtcodInfo(data);
    }

    /**
     * 공통코드 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertMtcodeInfo(DataMap data) throws Exception {
        adminMtCodeMngrMapper.insertMtcodeInfo(data);
    }

    /**
     * 공통코드 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateMtcodeInfo(DataMap data) throws Exception {
        adminMtCodeMngrMapper.updateMtcodeInfo(data);
    }

    /**
     * 공통코드 상세 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertMtcodeSubInfo(DataMap data) throws Exception {
        adminMtCodeMngrMapper.insertMtcodeSubInfo(data);
    }

    /**
     * 공통코드 상세 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateMtcodeSubInfo(DataMap data) throws Exception {
        adminMtCodeMngrMapper.updateMtcodeSubInfo(data);
    }



    /**
     * 공통코드 소분류 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMtcodeSubList(DataMap data) throws Exception {
        return adminMtCodeMngrMapper.getMtcodeSubList(data);
    }

    /**
     * 공통코드 소분류 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMtcodeSubInfo(DataMap data) throws Exception {
        return adminMtCodeMngrMapper.getMtcodeSubInfo(data);
    }

    /**
     * 공통코드 소분류 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteMtcodeSubInfo(DataMap data) throws Exception {
        adminMtCodeMngrMapper.deleteMtcodeSubInfo(data);
    }



}
