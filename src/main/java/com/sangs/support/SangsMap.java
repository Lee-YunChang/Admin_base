
package com.sangs.support;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sangs.util.SangsUtil;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * Sangs Map 
 * @author soundheaven1
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      	수정자           		수정내용 
 *  -------    --------    		---------------------------
 *   2015.02.23	soundheaven1
 *
 * </pre>
 */

@SuppressWarnings("serial")
public class SangsMap extends EgovMap {
 
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	public String getString(String str) {
		String rtn = "";
		try {
			if(get(str) != null)  
				rtn = String.valueOf(get(str)); 
		 
		} catch (RuntimeException ex) {
			
        } catch(Exception e) {
        	
		}
		return rtn;
	}
	public String getString2(String str) {
		String rtn = "";
		try {
			if(get(str) != null)  
				rtn = SangsUtil.nvl(String.valueOf(get(str)), "");
		 
		} catch (RuntimeException ex) {
			
        	
        } catch(Exception e) {
        	
			
		}
		return rtn;
	}
	
	
	
	public int getInt(String str) {
		return getInt(str, 0);
	}
	
	public int getInt(String str, int defaultValue) {
		int rtn = -1;
		try {
			if(get(str) != null)  
				rtn = Integer.valueOf((get(str)).toString());
			if(rtn < 0) {
				rtn = 0;
			}
		} catch (RuntimeException ex) {
			
        	
        } catch(Exception e) {
        	
			
		}
		return rtn;
	}
	
	public double getDouble(String str) {
		return getDouble(str, 0);
	}
	
	public double getDouble(String str, int defaultValue) {
		double rtn = 0;
		try {
			if(get(str) != null)  
				rtn = Double.valueOf((get(str)).toString());
		} catch (RuntimeException ex) {
			
        	
        } catch(Exception e) {
        	
			
		}
		return rtn;
	}
	
	
 
}
