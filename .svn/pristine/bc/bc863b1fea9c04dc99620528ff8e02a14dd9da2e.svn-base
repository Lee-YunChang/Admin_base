package com.webapp.admin.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.admin.mapper.AdminCommonMapper;
import com.webapp.admin.service.AdminCommonService;

/**
 *
 * Description : Login Service Impl
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Service("adminCommonService")
public class AdminCommonServiceImpl implements AdminCommonService {

    @Resource(name = "adminCommonMapper")
    private AdminCommonMapper adminCommonMapper;

    /**
     * 대분류메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCmmnRootMenuList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminCommonMapper.getCmmnRootMenuList(data);
    }

    /**
     * 소분류메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCmmnSubMenuList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminCommonMapper.getCmmnSubMenuList(data);
    }


    /**
     * 선택된 대분류 메뉴정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCmmnRootMenuInfo(DataMap data) throws Exception {
        return adminCommonMapper.getCmmnRootMenuInfo(data);
    }

    /**
     * 선택된 메뉴정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCurrentMenuInfo(DataMap data) throws Exception {
        return adminCommonMapper.getCurrentMenuInfo(data);
    }

    /**
     * 권한코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMtSubCodeList(DataMap data) throws Exception {
        //ParamUtil.setPagingValue(data);
        return adminCommonMapper.getMtSubCodeList(data);
    }
    
    
    public Map<String, List<EduMap>> getMtSubCodeList(String[] mtCodes, DataMap data) throws Exception {
		Map<String, List<EduMap>> result =  new HashMap<String, List<EduMap>>();
		
		for(String key : mtCodes){
			data.setString("mtCode", key);
			result.put(key, adminCommonMapper.getMtSubCodeList(data));
		}
		
		return result;
	}
	
    
    
    /**
     * 과정분류 코드
     *
     * @param data
     * @return
     * @throws Exception
     */    
	public List<EduMap> getMtScCodeList(DataMap data) throws Exception {
		return adminCommonMapper.getMtScCodeList(data);
	}

    /**
     * 강의형태 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMtNormalCtypeList(DataMap data) throws Exception {
        return adminCommonMapper.getMtNormalCtypeList(data);
    }

    /**
     * 메일 템플릿 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEmEmailTplInfo(DataMap data) throws Exception {
        return adminCommonMapper.getEmEmailTplInfo(data);
    }

    /**
     * 발송자 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSyEmailSenderInfo(DataMap data) throws Exception {
        return adminCommonMapper.getSyEmailSenderInfo(data);
    }

    /**
     * 발송자 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSyEmailSenderInfo2(DataMap data) throws Exception {
        return adminCommonMapper.getSyEmailSenderInfo2(data);
    }

    /**
     * sms 기본문구조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public String getEmSmsTplInfo(DataMap data) throws Exception {
        return adminCommonMapper.getEmSmsTplInfo(data);
    }


    /**
     * CALLBACK번호 조회 및 설정
     *
     * @param data
     * @return
     * @throws Exception
     */
    public String getSySmsCallbackInfo(DataMap data) throws Exception {
        return adminCommonMapper.getSySmsCallbackInfo(data);
    }
    
    /**
     * 목록 호출
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeCourseUserList(DataMap data) throws Exception {
        return adminCommonMapper.getLeCourseUserList(data);
    }
    /**
     * 목록 호출
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCheckedReceiverList(DataMap data) throws Exception {
        return adminCommonMapper.getCheckedReceiverList(data);
    }
    /**
     * 우편번호 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPostcodeList(DataMap data) throws Exception {
        return adminCommonMapper.getPostcodeList(data);
    }
    /**
     * 설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSurveyList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return adminCommonMapper.getSurveyList(data);
    }
    
    /**
     * 과정명, 발송인원
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCourseInfo(DataMap data) throws Exception {
        return adminCommonMapper.getCourseInfo(data);
    }
    
    /**
     * sms seq(log)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxSmsSeq(DataMap data) throws Exception {
        return adminCommonMapper.getMaxSmsSeq(data);
    }
    
    /**
     * mms seq
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxMmsSeq(DataMap data) throws Exception {
        return adminCommonMapper.getMaxMmsSeq(data);
    }
    /**
     * sms log
     *
     * @param data
     * @throws Exception
     */
    public void insertSmsLog(DataMap data) throws Exception {
    	adminCommonMapper.insertSmsLog(data);
    }
    /**
     * sms data
     *
     * @param data
     * @throws Exception
     */
    public void insertSmsData(DataMap data) throws Exception {
    	adminCommonMapper.insertSmsData(data);
    }
    
    /**
     * mms data 
     *
     * @param data
     * @throws Exception
     */
    public void insertMmsData(DataMap data) throws Exception {
    	adminCommonMapper.insertMmsData(data);
    }
    /**
     * sms수신자 정보조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getRecList(DataMap data) throws Exception {
        return adminCommonMapper.getRecList(data);
    }
    
    /**
     * 위원회관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteLectureFile(DataMap data) throws Exception {
    	
    	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
    	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
    	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
    	adminCommonMapper.deleteLectureFile(data);
    }
    
    
    /**
     * sms템플릿 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSMSTamplate(DataMap data) throws Exception {
        return adminCommonMapper.getSMSTamplate(data);
    }
    
    /**
	 * 특강 엑셀 업로드 실행
	 * @param rMap
	 * @throws Exception
	 */
	public void insertuserListExcel(SangsMap data) throws Exception{
		adminCommonMapper.insertuserListExcel(data);
	}
	
	/**
	 * 비회원 리스트 엑셀 업로드 실행
	 * @param rMap
	 * @throws Exception
	 */
	public String selectmtOfficeCode(String data) throws Exception{
		return adminCommonMapper.selectmtOfficeCode(data);
	}
	
	/**
     * 회원 번호 최대값 
     *
     * @param data
     * @throws Exception
     */
    public int getMaxMberNo(SangsMap data) throws Exception{
    	return adminCommonMapper.getMaxMberNo(data);
    }
    
    /**
	 * 비회원 리스트 엑셀 업로드 실행
	 * @param rMap
	 * @throws Exception
	 */
	public void insertnmberListExcel(SangsMap data) throws Exception{
		adminCommonMapper.insertnmberListExcel(data);
	}
	
	/**
    * 특강 파일 리스트 출력
    * 
    * @param mtCode
    * @return
    * @throws Exception
    */
   public List<EduMap> getTutorFile(DataMap data) throws Exception{
	   return adminCommonMapper.getTutorFile(data);
   }
}