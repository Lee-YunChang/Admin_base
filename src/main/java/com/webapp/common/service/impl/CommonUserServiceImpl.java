package com.webapp.common.service.impl;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.common.mapper.CommonUserMapper;
import com.webapp.common.service.CommonUserService;

/**
 * Description : Common User Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("commonUserService")
public class CommonUserServiceImpl implements CommonUserService {

	private static Logger      log         = LogManager.getLogger(UserSessionManager.class);
	 
    @Resource(name = "commonUserMapper")
    private CommonUserMapper commonUserMapper;

    /**
     * 회원정보(통합회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    public EduMap getUserInfo(int userNo) throws Exception {
        return commonUserMapper.getUserInfo(userNo);
    }

    /**
     * 회원정보(LMS회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    public EduMap getUserLmsInfo(int userNo) throws Exception {
        return commonUserMapper.getUserLmsInfo(userNo);
    }

    /**
     * 로그인 사용자 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLoginUserInfo(DataMap data) throws Exception {
        return commonUserMapper.getLoginUserInfo(data);
    }
    
    /**
     * 공통 > 개인정보조회이력관리 
     * @param req
     * @param sysGb
     * @param transGb
     * @param summary
     * @param progNm
     * @throws Exception
     */
    public void insertMbrTransLog(HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary,
    		String progNm
    		) throws Exception {
    	
    	DataMap data = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		try {
			
			data.setString("sysGb", sysGb);
			data.setInt("transUserNo", userVo.getUserNo());
			data.setString("transUserId", userVo.getUserId());
			data.setString("transUserName", userVo.getUserName());
			data.setString("transIp", req.getRemoteAddr());
			data.setString("transGb", transGb);
			data.setString("summary", summary + "\n>세부정보 :  "+getRequesParameters(req)); 
			data.setString("progId", req.getRequestURI());
			data.setString("progNm", progNm);
			
			commonUserMapper.insertMbrTransLog(data);
			
		} catch (RuntimeException e) {
        	
        } catch (Exception ex){
		} 
    }
    
    /**
     * 공통 > 로그인이력관리
     * @param req
     * @param sysGb
     * @param transGb
     * @param summary
     * @throws Exception
     */
    public void insertMbrLoginLog(
    		HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary
    		) throws Exception {
    	
    	DataMap data = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		try {
			
			data.setString("sysGb", sysGb);
			data.setInt("transUserNo", userVo.getUserNo());
			data.setString("transUserId", userVo.getUserId());
			data.setString("transUserName", userVo.getUserName());
			data.setString("transIp", req.getRemoteAddr());
			data.setString("transGb", transGb);
			data.setString("summary", summary + "\n>세부정보 :  "+getRequesParameters(req)); 
			
			commonUserMapper.insertMbrLoginLog(data);
			
		} catch (RuntimeException e) {
        	
        } catch (Exception ex){
			
		}
    	
    }
    
    
    /**
     * 공통 > 로그인 5회 실패 > 로그인 제한
     * @param req
     * @param data
     * @throws Exception
     */
    public void updateLoginFailCntInfo(DataMap data) throws Exception {

		try {
			// 사용자테이블 로그인 실패 횟수 업데이트
			commonUserMapper.updateLoginFailCntInfo(data);
			
		} catch (Exception ex){
			
		}
    	
    }
    
    /**
     * 공통 > 로그인 성공 (실패횟수 0으로 초기화)
     * @param req
     * @param data
     * @throws Exception
     */
    public void updateLoginSuccessInfo(DataMap data) throws Exception {

		try {
			commonUserMapper.updateLoginSuccessInfo(data);
			
		} catch (RuntimeException e) {
        	
        } catch (Exception ex){
			
		}
    	
    }
    /**
     * 회원 승인
     * @param req
     * @param data
     * @throws Exception
     */
    public void updateRegAtYesInfo(DataMap data) throws Exception {

		try {
			commonUserMapper.updateRegAtYesInfo(data);
			
		} catch (Exception ex){
			
		}
    	
    }
    /**
     * 공통 > 로그인 실패횟수
     * @param req
     * @param data
     * @throws Exception
     */
    public EduMap selectLoginFailCntInfo(DataMap data) throws Exception {
        return commonUserMapper.selectLoginFailCntInfo(data);
    }
    
    /**
	 *  request 파라메터 스트링변환
	 * @param dataMap
	 * @return
	 */
	private String getRequesParameters(HttpServletRequest req) {
		
		String result = "";
		try {
			
			@SuppressWarnings("rawtypes")
			Enumeration enums = req.getParameterNames();
			String key = "";
			String value[] = null;
			
			while (enums.hasMoreElements()){
				key = (String)enums.nextElement();
				value = req.getParameterValues(key);

				for(int i=0; i<value.length; i++){
					
					if (result.getBytes().length < 4000) {
						if (result.getBytes().length > 500) {
							result += key +"=<LONG DATA>&";
						} else {
							result += key +"="+value[i]+"&";
						}
					}
					
				}
			}

		} catch(Exception ex){
			
		}
		return result;
	}
	
	/**
     * 로그인 세션아이디 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLoginSessionInfo(DataMap data) throws Exception {
        return commonUserMapper.getLoginSessionInfo(data);
    }
    
    /**
     * 접근 ip 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getAccessIpList(DataMap data) throws Exception {
        return commonUserMapper.getAccessIpList(data);
    }
    
    
    
}
