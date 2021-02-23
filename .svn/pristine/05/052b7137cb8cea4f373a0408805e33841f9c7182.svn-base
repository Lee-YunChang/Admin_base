package com.sangs.support;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import egovframework.com.cmm.EgovWebUtil;

/**
 * 프로퍼티 클래스
 * @author neardeok-work
 *
 */
public class SangsProperties {
	
	// 현 클래스의 물리적 경로중 tipa 패키지 전까지의 경로
    private static final String RELATIVE_PATH_PREFIX 
    	 = SangsProperties.class.getResource("").getPath().substring(0, SangsProperties.class.getResource("").getPath().lastIndexOf("/com/"));
    
    // globals.properties 파일의 총경로
    private static final String GLOBALS_PROPERTIES_FILE
	    = RELATIVE_PATH_PREFIX + System.getProperty("file.separator") + "sangs" + System.getProperty("file.separator") + "props" + System.getProperty("file.separator") + "globals.properties";
 

    private static Properties props = null;
    
    /**
     * global.properties 의 프로퍼티에서 해당 key 에 대한 값을 반환합니다.
     * @param key
     * @return
     */
    public static String getProperty(String key) {
    	
    	String rtnVal = "";
    	
    	if(props == null) {
    		try {
    			// 프로퍼티를 로드 한적이 없는경우 프로포티를 로드 합니다.
    			props = loadProperties();
    		} catch(Exception e) {
    		}
    	}
    	
    	if(props.containsKey(key)) 
    		rtnVal = props.getProperty(key).trim();
    	
    	return rtnVal;
    }
    /**
     * 프로퍼티 리로드
     */
    public static void properyReload() {
    	try {
	    	//props = null;
	    	props = loadProperties();
    	} catch(Exception e) {
		}
    }
    public static ArrayList<SangsMap> getPropertiyList() {
    	ArrayList<SangsMap> list = new ArrayList<SangsMap>();
    	
    	Enumeration<Object> eu = props.keys();
		while(eu.hasMoreElements()) {
			String key = (String)eu.nextElement();
			SangsMap map = new SangsMap();
			map.put("key", key);
			map.put("value", props.getProperty(key).trim());
			list.add(map);
		}
    	return list;
    }
    
	
	public static Properties loadProperties() throws Exception {
		 
		Properties props = new Properties();
		FileInputStream fis = null;
		try {
			
			fis = new FileInputStream(EgovWebUtil.filePathBlackList(GLOBALS_PROPERTIES_FILE));
			props.load(new java.io.BufferedInputStream(fis));
			
		} catch(Exception e){
			throw e;
		} finally {
			try {
				if (fis != null) fis.close();
			} catch (Exception ex) {
			}

		}
		return props;
	}
	
}
