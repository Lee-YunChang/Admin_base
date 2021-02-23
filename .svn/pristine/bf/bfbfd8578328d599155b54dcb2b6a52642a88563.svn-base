package com.webapp.common.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.webapp.common.mapper.CommonAccessLogMapper;
import com.webapp.common.service.CommonAccessLogService;

/**
 * Description : Common AccessLog Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("commonAccessLogService")
public class CommonAccessLogServiceImpl implements CommonAccessLogService {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "commonAccessLogMapper")
    private CommonAccessLogMapper commonAccessLogMapper;
    
    protected static final int MAXSIZE = 5; //최대 입력개수 정의
	protected ArrayList<String> _urlList;
    
    /**
	 * 접속로그 등록
	 * @param req
	 * @param sysGb
	 * @throws Exception
	 */
	
	public CommonAccessLogServiceImpl() {
		_urlList = new ArrayList<String>();
	}
	
    public void insertAccessLog (HttpServletRequest req, String sysGb) throws Exception {
    	
    	DataMap data = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		try {

			data.add("sysGb", sysGb);
			data.add("accesIp", req.getRemoteAddr());
			data.add("accesUserId", userVo.getUserId());
			
			String url = req.getRequestURI();
			int len;
			synchronized(_urlList) {
				_urlList.add(url);
				if(_urlList.size()>MAXSIZE) //입력개수를 초과한 경우
					_urlList.remove(0); //리스트를 제거함
					len = _urlList.size();
			}
			
			data.add("accesUrl", url);
			if(url.equals("/admin/main/main.do")){
				commonAccessLogMapper.insertAccessLogInfo(data);
			}
			int rowCnt = commonAccessLogMapper.getAccesLogStatsCount(data);
			if (rowCnt == 0) {
				commonAccessLogMapper.insertAccessLogStatsInfo(data);
			} else {
				commonAccessLogMapper.updateAccessLogStatsInfo(data);
			}
			
			
		} catch (RuntimeException e) {
        } catch (Exception ex){
		}
		
    }
	
	
}
