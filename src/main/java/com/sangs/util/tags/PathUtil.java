package com.sangs.util.tags;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class PathUtil extends TagSupport {

    private static final long serialVersionUID = 1L;

    private Logger log = LogManager.getLogger(this.getClass());

    private int               count;
    private String            referer;

    public void setReferer(String referer) {
        String server = "http://" + pageContext.getRequest().getServerName() + ((pageContext.getRequest().getServerPort() == 80) ? "" : ":" + pageContext.getRequest().getServerPort());

        this.referer = referer.replace(server, "");
    }

    @SuppressWarnings({"rawtypes"})
    protected List getComMenuLocationList(Map paramMap) throws Exception {
        /*
        List list = AppContextUtil.getSqlSesstion().getMapper(CommonMapper.class.).selectComMenuLocationList(paramMap);
        
        
        return AppContextUtil.getSqlSesstion().getMapper(CommonMapper.class).selectComMenuLocationList(paramMap);
        */

        return null;
    }

    @SuppressWarnings("rawtypes")
    protected String getLocationPath(List comMenuLocationList, String ctx) {
        StringBuilder location = new StringBuilder();

        if (comMenuLocationList == null || comMenuLocationList.size() <= 0) {
            location.append("<div id=\"commonLocationPath\"></div>");
        } else {
            Map data = (Map)comMenuLocationList.get(0);

            //String str = (String)data.get("PATH_MENU_NAME");

            String[] menuName = ((String)data.get("PATH_MENU_NAME")).split("\\|");
            String[] menuLink = ((String)data.get("PATH_LINK")).split("\\|");
            String[] menuTarget = ((String)data.get("PATH_LINKTARGET")).split("\\|");

            location.append("<div id=\"commonLocationPath\">");

            for (int i = 1; i < menuName.length; i++) {
                location.append((i == 1) ? "" : " &gt; ").append("<a href=\"").append(ctx).append(menuLink[i]).append("\" target=\"").append(menuTarget[i]).append("\">").append(menuName[i]).append("</a>");
            }

            location.append("</div>");
        }

        return location.toString();
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    @Override
    public int doStartTag() {
        StringBuilder location = new StringBuilder();

        try {
            String url = (String)pageContext.getRequest().getAttribute("javax.servlet.forward.request_uri");
            String ctx = pageContext.getServletContext().getContextPath();
            String param = (String)pageContext.getRequest().getAttribute("javax.servlet.forward.query_string");

            JspWriter out = pageContext.getOut();

            if (url.indexOf("/mber/login/form.do") > -1) {
                url = url.replace(ctx, "");
            } else {
                url = url.replace(ctx, "") + ((param == null || "".equals(param)) ? "" : "?" + param);
            }

            this.referer = this.referer.replace(ctx, "");


            Map paramMap = new HashMap();
            paramMap.put("url", url);

            count = 0;
            List comMenuLocationList = getComMenuLocationList(paramMap);



            if (comMenuLocationList.size() <= 0) {
                count = 1;
                paramMap.put("url", referer);
                comMenuLocationList = getComMenuLocationList(paramMap);
            }

            location.append(getLocationPath(comMenuLocationList, ctx));

            location.append("\n<div id=\"commonInitUrl\">").append(url).append("</div>");


            out.print(location.toString());

        } catch (Exception e) {
            location.append("<div id=\"commonLocationPath\"></div><div id=\"commonInitUrl\"></div>");

        }

        return SKIP_BODY;
    }
}