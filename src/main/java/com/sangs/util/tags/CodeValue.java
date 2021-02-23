package com.sangs.util.tags;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import com.sangs.support.SangsProperties;

public class CodeValue extends SimpleTagSupport {

    private String name;

    public void doTag() throws JspException, IOException {
        if (name == null) {
            return;
        }
        
        String proPertiesName = SangsProperties.getProperty(name);

        JspWriter writer = getJspContext().getOut();
        writer.println(proPertiesName);

    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
