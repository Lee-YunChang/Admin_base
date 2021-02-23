package com.sangs.util.tags;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/*import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;*/

public class Options extends SimpleTagSupport {
	
	private static final String FORMAT = "<option value=\"%s\" %s>%s</option>";
	
	private Map<String, String> items;
	
	private String selected;
	
	private boolean isHideFirst = false;
	
	public void doTag() throws JspException, IOException {
		
		if (items == null) {
			return;
		}
		
		StringBuilder sb = new StringBuilder();
		
		//Set<Entry<String, String>> entries = items.entrySet();
		java.util.Iterator<Entry<String, String>> iter = items.entrySet().iterator();
		
		int i = 0;
		String selectedAttribute = ""; /** 반복문 밖에서 변수 선언 */
		
		//for (Entry<String, String> entry : entries) {
		while (iter.hasNext()) {	
			if (!(this.getIsHideFirst() && i == 0)) {
			
				selectedAttribute = "";
				
				Map.Entry entry = (Map.Entry)iter.next();
				
				if (getSelected().equals(entry.getKey())) {
					selectedAttribute = " selected=\"selected\"";
				}
				
				sb.append(String.format(FORMAT, entry.getKey(), selectedAttribute, entry.getValue()));
			
			}
			
			i++;
			
		}

		JspWriter writer = getJspContext().getOut();
		writer.println(sb.toString());
		
	}
	
	public void setItems(Map<String, String> items) {
		this.items = items;
	}
	
	public String getSelected() {
		
		if(selected.length() == 0){
			
			Object[] keys = items.keySet().toArray();
			if (isHideFirst && keys.length > 1) {
				selected = keys[1].toString();
			}
			else {
				selected = "";
			}
		}
		return selected;
	}
	
	public void setSelected(String selected) {
		this.selected = selected;
	}
	
	public boolean getIsHideFirst() {
		return isHideFirst;
	}
	
	public void setIsHideFirst(boolean isHideFirst) {
		this.isHideFirst = isHideFirst;
	}

}