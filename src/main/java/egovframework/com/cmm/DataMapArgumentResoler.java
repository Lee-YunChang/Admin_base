package egovframework.com.cmm;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;

/**
 * Description : reuqest 요청에 따른 parameter DataMap화 및 세션정보 할당
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.04.01  sangs			수정
 *
 */

public class DataMapArgumentResoler implements HandlerMethodArgumentResolver {

    private Logger log = LogManager.getLogger(DataMapArgumentResoler.class);
    
    public DataMapArgumentResoler() {
        // TODO Auto-generated constructor stub
    }

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        // TODO Auto-generated method stub
        return DataMap.class.isAssignableFrom(parameter.getParameterType());
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
            NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        
    	// TODO Auto-generated method stub
    	
        try {
            if (parameter.getParameterType().equals(DataMap.class)) {

                DataMap rMap = new DataMap("REQUEST_DATA");
                String tmpStr = "";

                HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
                
                /*
                String returnUrl = ParamUtil.getStrParam((String)request.getAttribute("returnUrl"),"-");
                if (returnUrl.equals("-")){
	                returnUrl = request.getRequestURI();
	                if (request.getQueryString() != null || "".equals(request.getQueryString())) {
	                    returnUrl += "?" + request.getQueryString();
	                }
                } 
                request.setAttribute("returnUrl", URLDecoder.decode(returnUrl, "UTF-8"));
                */
                
                Enumeration enumeration = request.getParameterNames();
                while (enumeration.hasMoreElements()) {
                    tmpStr = (String)enumeration.nextElement();
                    String as[] = request.getParameterValues(tmpStr);

                    for (int i = 0; i < as.length; i++) {
                        rMap.add(tmpStr, as[i]);
                    }
                }

                rMap.setNullToInitialize(true);

                UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
                // 등록된 세션 datamap 할당
                rMap.setInt("SES_USERNO", userSessionVO.getUserNo());
                rMap.setString("SES_USERID", userSessionVO.getUserId());
                rMap.setString("SES_USERNAME", userSessionVO.getUserName());
                rMap.setInt("SES_GRADENO", userSessionVO.getGradeNum());
                rMap.setString("SES_MOBILE", userSessionVO.getMobile());
                rMap.setString("SES_EMAIL", userSessionVO.getEmail());
                rMap.setString("SES_MBER_REG_GB", userSessionVO.getMberRegGb());
                rMap.setString("SES_STATUS_GB", userSessionVO.getStatusGb());
                // 등록된 강의실 세션 할당
                rMap.setInt("SES_COURSENO", userSessionVO.getCourseNo());
                rMap.setInt("SES_CUSERNO", userSessionVO.getcUserNo());
                rMap.setInt("SES_CSEQNO", userSessionVO.getcSeqNo());
                
                //독립사이트 추가
                rMap.setString("SES_CYBER_BIZNO", userSessionVO.getBizno());
                rMap.setString("SES_CYBER_LAYOUT_BW_TITLE", userSessionVO.getSiteBwTitle());
                rMap.setString("SES_CYBER_LAYOUT_BW_LOGO", userSessionVO.getSiteLogImg());
                rMap.setString("SES_CYBER_LAYOUT_MAIN_IMG", userSessionVO.getSiteMainImg());
                rMap.setString("SES_CYBER_LAYOUT_HOMEPAGE", userSessionVO.getHomePage());
                rMap.setString("SES_CYBER_LAYOUT_SITENAME", userSessionVO.getSiteName());
                rMap.setInt("SES_CYBER_GRADE_NO", userSessionVO.getCyberGradeNum());
                

                return rMap;
            }
        } catch (Exception e) {
        }

        return new Object();
    }
}
