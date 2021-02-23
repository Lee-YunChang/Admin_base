package com.webapp.admin.ctrl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import sun.misc.BASE64Decoder;

import com.sangs.util.AES256Util;
import com.sangs.util.SangsCryptUtil;
import com.sangs.session.UserSessionManager;
import com.sangs.support.AdminException;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.webapp.admin.service.AdminLoginService;
import com.webapp.common.service.CommonUserService;

/**
 * 
 * Description : 관리자 로그인 관련 컨트롤러
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 3. 29.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Controller
public class AdminLoginController {

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminLoginService")
    private AdminLoginService    adminLoginService;
    
    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;
    
    /**
     * 관리자 로그인 페이지
     * 
     * @date	: 2016. 3. 29.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param req
     * @param res
     * @param rMap
     * @return
     * @throws Exception 
     */
    // TODO: 로그인 페이지
    @RequestMapping(value = "/admin/common/login.do")
    public String main(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	KeyPairGenerator generator;
    	
    	generator = KeyPairGenerator.getInstance("RSA");
        generator.initialize(2048);

        KeyPair keyPair = generator.genKeyPair();
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");

        PublicKey publicKey = keyPair.getPublic();
        PrivateKey privateKey = keyPair.getPrivate();

        HttpSession session = req.getSession();
        // 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
        session.setAttribute("__rsaPrivateKey__", privateKey);

        // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
        RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

        String publicKeyModulus = publicSpec.getModulus().toString(16);
        String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
        req.setAttribute("publicKeyModulus", publicKeyModulus);
        req.setAttribute("publicKeyExponent", publicKeyExponent);
    	
    	
    	String returnUrl = "";
    	String clientIp = req.getHeader("X-FORWARDED-FOR");
        if (clientIp == null || clientIp.length() == 0) {
            clientIp = req.getRemoteAddr();
        }
        String accsMtCode = SangsProperties.getProperty("Globals.mtCode_MT_ACCESS_IP_CODE");
        rMap.setString("accsMtCode", accsMtCode);
        rMap.setString("clientIp", clientIp);
        
        List<EduMap> accessIpList = commonUserService.getAccessIpList(rMap);
        if(accessIpList.size() > 0) { // 접근 가능한 ip일 경우
        	returnUrl = "admin/cmmn/login";
        }
        else {
        	ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");	
			modelAndView.addObject("msg", "접근 권한이 없습니다.");
			modelAndView.addObject("url", "http://edu.kinfa.or.kr");	
			throw new ModelAndViewDefiningException(modelAndView); 
        }
        
        return returnUrl;
    }
    
    
    /**
     * 로그인 실행
     * 
     * @date	: 2016. 3. 29.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param req
     * @param res
     * @param rMap
     * @return
     * @throws AdminException
     */
    // TODO: 로그인 실행
    @RequestMapping(value = "/admin/common/loginExec.do")
    private String loginExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws AdminException {
    	
    	HttpSession session = req.getSession();
    	
    	BASE64Decoder base64Decoder = new BASE64Decoder();
        try {
        	
        	 String securedUserId = req.getParameter("securedUserId");
             String securedPassword = req.getParameter("securedPassword");

             PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
             session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
             if (privateKey == null) {
                 throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
             }
             
             
             String user_Id = decryptRsa(privateKey, securedUserId);
             String pass_word = decryptRsa(privateKey, securedPassword);
             
             
        	int resultCode = 0; 
        	String msg = "";    	
        	String returnUrl = rMap.getString("returnURL");
           
            int gradeNo =  Integer.parseInt( SangsProperties.getProperty("Globals.userGradeNo_superAdmin") );

            securedUserId = user_Id;
            securedPassword = pass_word;
 
            // 기존소스 - 디코딩 빼는 작업 -> javascript 단에서 인코딩 안함
            String userId = new String(base64Decoder.decodeBuffer(securedUserId.trim()));   
//            String infoPass = new String(base64Decoder.decodeBuffer(securedPassword.toString().trim()));
            String infoPass =securedPassword.toString().trim();
            
            
            rMap.setString("userId", userId);
        	EduMap map = commonUserService.getLoginUserInfo(rMap);
            
//        	if(map != null && SangsCryptUtil.isMatch(infoPass, map.getString("PWD")) ) {
        	if(map != null && SangsCryptUtil.isMatch(infoPass, map.getString("PWD")) ) {
        		
	            if (map.getInt("GRADECODE") == gradeNo) {
	        	 
					//세션에 저장. 
	            	UserSessionManager.getUserSessionInsert(req, commonUserService, map.getInt("USERNO"));
	            	
	            	//세션아이디, 마지막 로그인 날짜시간 업데이트
	            	rMap.setString("loginSessionId", req.getSession().getId());
	            	rMap.setInt("loginUserNo", map.getInt("USERNO"));
	            	adminLoginService.updateLoginInfo(rMap);
	            	commonUserService.insertMbrLoginLog(req, "ADM", "S", "로그인실행");
	            	//msg = "인증이 성공되었습니다.";
	            	returnUrl = "/admin/main/main.do?cmmnRootMenuCode=ADM000";
		        
		        } else {
		        	commonUserService.insertMbrLoginLog(req, "ADM", "F", "로그인실패");
		        	resultCode = -1;
		        	returnUrl = "/admin/common/login.do";
		        	msg = "회원의 접근권한이 부족합니다.";
		        } 
	            
	        } else {
 	        	commonUserService.insertMbrLoginLog(req, "ADM", "F", "로그인실패");
 	        	resultCode = -2;
	        	returnUrl = "/admin/common/login.do";
	        	msg = "아이디 또는 비밀번호가 틀렸습니다.";
	        }
        	
            req.setAttribute("returnUrl",returnUrl);
            req.setAttribute("resultCode",resultCode);
            req.setAttribute("msg",msg);

        } catch (Exception e) {
            throw new AdminException(e);
        }

        return "admin/cmmn/login_exec";
    }
    
    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의
        return decryptedValue;
    }
    
    /**
     * 16진 문자열을 byte 배열로 변환한다.
     *
     * @param hex
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
    /**
     * 로그아웃
     * 
     * @date	: 2016. 3. 29.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param req
     * @param res
     * @param rMap
     * @return
     * @throws Exception 
     */
    // TODO: 로그아웃
    @RequestMapping(value = "/admin/common/logout.do")
    private String logout(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {

    	String returnUrl = "";

    	String clientIp = req.getHeader("X-FORWARDED-FOR");
        if (clientIp == null || clientIp.length() == 0) {
            clientIp = req.getRemoteAddr();
        }
        String accsMtCode = SangsProperties.getProperty("Globals.mtCode_MT_ACCESS_IP_CODE");
        rMap.setString("accsMtCode", accsMtCode);
        rMap.setString("clientIp", clientIp);
        
        commonUserService.insertMbrLoginLog(req, "ADM", "O", "로그아웃");
        
        List<EduMap> accessIpList = commonUserService.getAccessIpList(rMap);
        if(accessIpList.size() > 0) {
        	
        	/** 세션 정보를 삭제한다. */
            UserSessionManager.deleteUserSessionVO(req);
            req.setAttribute("REQUEST_DATA", rMap);
            
        	returnUrl = "redirect:/admin/common/login.do";
        }
        else {
        	ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");	
			modelAndView.addObject("msg", "접근 권한이 없습니다.");
			modelAndView.addObject("url", "http://edu.kinfa.or.kr");	
			throw new ModelAndViewDefiningException(modelAndView); 
        }

        return returnUrl;
    }
}